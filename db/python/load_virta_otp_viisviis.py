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
        'edellinenSyysolo': None, 'hetu': None, 'ika': None, 'kevat': None, 'loAloituspvm': None, 'olok': None,
        'olos': None, 'ooAloituspvm': None, 'opSummaKunOtePankista': None, 'opiskelijaavain': None, 'opiskeluoikeusavain': None,
        'opiskeluoikeusid': None, 'oppilaitos': None, 'oppilaitostunnus': None, 'pankkiKumuEnnen55': None, 'pankkiSaldo55': None,
        'regDatum': None, 'sukupuoli': None, 'summa': None, 'suorittanut27': None, 'suorittanut55ilmanPankkia': None,
        'suorittanut55pankinAvulla': None, 'syys': None, 'tkoodi': None, 'uusiOpisk': None, 'uusiOpiskKevat': None,
        'uuttaPankkiin': None, 'vuosi': None
    }

# get value from json
def jv(jsondata, key):
  if key in jsondata:
    return jsondata[key]
  return None
def show(message):
  print((strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message))

def load(secure,hostname,url,schema,table,postdata,condition,verbose):
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
    # make "columnlist" (type has no meaning as we're not creating table)
    row = makerow()
    # setup dboperator so other calls work
    dboperator.columns(row)
    row=["edellinenSyysolo"] = jv(i,"edellinenSyysolo")
    row=["hetu"] = jv(i,"hetu")
    row=["ika"] = jv(i,"ika")
    row=["kevat"] = jv(i,"kevat")
    row=["loAloituspvm"] = jv(i,"loAloituspvm")
    row=["olok"] = jv(i,"olok")
    row=["olos"] = jv(i,"olos")
    row=["ooAloituspvm"] = jv(i,"ooAloituspvm")
    row=["opSummaKunOtePankista"] = jv(i,"opSummaKunOtePankista")
    row=["opiskelijaavain"] = jv(i,"opiskelijaavain")
    row=["opiskeluoikeusavain"] = jv(i,"opiskeluoikeusavain")
    row=["opiskeluoikeusid"] = jv(i,"opiskeluoikeusid")
    row=["oppilaitos"] = jv(i,"oppilaitos")
    row=["oppilaitostunnus"] = jv(i,"oppilaitostunnus")
    row=["pankkiKumuEnnen55"] = jv(i,"pankkiKumuEnnen55")
    row=["pankkiSaldo55"] = jv(i,"pankkiSaldo55")
    row=["regDatum"] = jv(i,"regDatum")
    row=["sukupuoli"] = jv(i,"sukupuoli")
    row=["summa"] = jv(i,"summa")
    row=["suorittanut27"] = jv(i,"suorittanut27")
    row=["suorittanut55ilmanPankkia"] = jv(i,"suorittanut55ilmanPankkia")
    row=["suorittanut55pankinAvulla"] = jv(i,"suorittanut55pankinAvulla")
    row=["syys"] = jv(i,"syys")
    row=["tkoodi"] = jv(i,"tkoodi")
    row=["uusiOpisk"] = jv(i,"uusiOpisk")
    row=["uusiOpiskKevat"] = jv(i,"uusiOpiskKevat")
    row=["uuttaPankkiin"] = jv(i,"uuttaPankkiin")
    row=["vuosi"] = jv(i,"vuosi")
    dboperator.insert(hostname+url,schema,table,row)
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

  load(secure,hostname,url,schema,table,postdata,condition,verbose)

  dboperator.close()

if __name__ == "__main__":
    main(sys.argv[1:])
