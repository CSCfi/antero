# -*- coding: utf-8 -*-
"""
Created on Tue Aug 24 15:59:32 2021

@author: vhamalai
"""

#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
load p3
Python 3 version of load.py
todo doc
"""
import sys,os,getopt
import requests
import json
import base64
from time import localtime, strftime

import dboperator

def makerow():
  return {
    'vuosi': None, 'suorituspaiva': None, 'koodi': None, 'kuvaus': None, 'lukumaara': None, 'perustutkOpiskelijat': None,
    'vieraskSuoritukset': None, 'kansainvVaihto': None,'kkYhteistyo': None, 'avoinKK': None, 'erillinenOpintoOikeus': None,
    'ulkomailtaHyvLuet': None, 'db': None, 'oppilaitostunnus': None, 'luoja': None, 'luontipaivamaara': None,
    'maahanmValKoulutus': None, 'koulutustyyppi': None, 'tkiToiminnanLaajuus': None, 'tkiMuutLaajuus': None,
    'tkiHarjoittelunLaajuus': None,'ulkomaaharjoittelu': None, 'erikoistumiskoulutus': None
    }

# get value from json
def jv(jsondata, key):
  if key in jsondata:
    return jsondata[key]
  return None
def show(message):
  print((strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message))

def load(secure,hostname,url,schema,table,postdata,condition,verbose,debug):
  show("begin "+hostname+" "+url+" "+schema+" "+table+" "+(postdata or "No postdata")+" "+(condition or ""))

  address = "http://"+hostname+url
  show("load from "+address)

  reqheaders = {'Content-Type': 'application/json'}
  reqheaders['Caller-Id'] = '1.2.246.562.10.2013112012294919827487.vipunen'

  # api credentials from env vars
  if os.getenv("API_USERNAME"):
    show("using authentication")
    apiuser = os.getenv("API_USERNAME")
    apipass = os.getenv("API_PASSWORD")
    reqheaders['Authorization'] = 'Basic %s' % base64.b64encode(apiuser+":"+apipass)

  # automatic POST with (post)data
  #request = urllib.request.Request(address, data=postdata, headers=reqheaders)
  #time=300
  try:
    response = requests.get(address, headers=reqheaders).json()

  except Exception as e:
    show('HTTP GET failed.')
    show('Reason: %s'%(str(e)))
    sys.exit(2)

  else:
    # everything is fine
    show("api call OK")

  # remove data conditionally, otherwise empty
  # merge operation could be considered here...
  if condition:
    show("remove from %s.%s with condition '%s'"%(schema,table,condition))
    dboperator.execute("DELETE FROM %s.%s WHERE %s"%(schema,table,condition))
  else:
    show("empty %s.%s"%(schema,table))
    dboperator.empty(schema,table)

  show("insert data")
  cnt=0

  for i in response:
    cnt+=1
    row = makerow()
    row["avoinKK"] = jv(i,"avoinKK")
    row["db"] = jv(i,"db")
    row["erikoistumiskoulutus"] = jv(i,"erikoistumiskoulutus")
    row["erillinenOpintoOikeus"] = jv(i,"erillinenOpintoOikeus")
    row["kansainvVaihto"] = jv(i,"kansainvVaihto")
    row["kkYhteistyo"] = jv(i,"kkYhteistyö")
    row["koodi"] = jv(i,"koodi")
    row["koulutustyyppi"] = jv(i,"koulutustyyppi")
    row["kuvaus"] = jv(i,"kuvaus")
    row["lukumaara"] = jv(i,"lukumaara")
    row["luoja"] = jv(i,"luoja")
    row["luontipaivamaara"] = jv(i,"luontipaivamaara")
    row["maahanmValKoulutus"] = jv(i,"maahanmValKoulutus")
    row["oppilaitostunnus"] = jv(i,"oppilaitostunnus")
    row["perustutkOpiskelijat"] = jv(i,"perustutkOpiskelijat")
    row["suorituspaiva"] = jv(i,"suorituspaiva")
    row["tkiHarjoittelunLaajuus"] = jv(i,"tkiHarjoittelunLaajuus")
    row["tkiMuutLaajuus"] = jv(i,"tkiMuutLaajuus")
    row["tkiToiminnanLaajuus"] = jv(i,"tkiToiminnanLaajuus")
    row["ulkomaaharjoittelu"] = jv(i,"ulkomaaharjoittelu")
    row["ulkomailtaHyvLuet"] = jv(i,"ulkomailtaHyvLuet")
    row["vieraskSuoritukset"] = jv(i,"vierasSuoritukset")
    row["vuosi"] = jv(i,"vuosi")


    dboperator.insert(address,schema,table,row,debug)
     # show some sign of being alive
    if cnt%100 == 0:
      sys.stdout.write('.')
      sys.stdout.flush()
    if cnt%1000 == 0:
      show("-- %d" % (cnt))
    if verbose: show("%d -- %s"%(cnt,row))
  show("wrote %d"%(cnt))
  show("ready")



def usage():
  print("""
usage: load.py [-s|--secure] -H|--hostname <hostname> -u|--url <url> -e|--schema <schema> -t|--table <table> [-p|--postdata] [-c|--condition <condition>] [-v|--verbose]
""")

def main(argv):
  # muuttujat jotka kerrotaan argumentein
  secure=False
  hostname,url,schema,table="","","",""
  postdata=None
  condition=None
  verbose = False


  try:
    opts,args=getopt.getopt(argv,"sH:u:e:t:p:c:v",["secure","hostname=","url=","schema=","table=","postdata=","condition=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt,arg in opts:
    if opt in ("-s", "--secure"): secure=True
    elif opt in ("-H", "--hostname"): hostname=arg
    elif opt in ("-u", "--url"): url=arg
    elif opt in ("-e", "--schema"): schema=arg
    elif opt in ("-t", "--table"): table=arg
    elif opt in ("-p", "--postdata"): postdata=arg
    elif opt in ("-c", "--condition"): condition=arg
    elif opt in ("-v", "--verbose"): verbose=True

  if not hostname or not url or not schema or not table:
    usage()
    sys.exit(2)

  load(secure,hostname,url,schema,table,postdata,condition,verbose,debug=False)

  dboperator.close()

if __name__ == "__main__":
    main(sys.argv[1:])
