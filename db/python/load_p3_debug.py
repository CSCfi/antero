#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
load p3
Python 3 version of load.py
todo doc
"""
import sys,os,getopt
import requests
import urllib.request, urllib.error, urllib.parse, base64, http.client
import ijson.backends.yajl2_cffi as ijson
import json
from time import localtime, strftime

import dboperator

def show(message):
  print((strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message))

def load(secure,hostname,url,schema,table,postdata,condition,verbose):
  show("begin "+hostname+" "+url+" "+schema+" "+table+" "+(postdata or "")+" "+(condition or ""))
  if secure:
    address = "https://"+hostname+url
  else:
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
    #response = urllib.request.urlopen(request, timeout=time)
    response = requests.get(address, headers=reqheaders)#.json()
  #turha?
  except HTTPError as e:
    show('The server couldn\'t fulfill the request.')
    show('Error code: %d'%(e.code))
    sys.exit(2)
  #except http.client.IncompleteRead as e:
    #show('IncompleteRead exception.')
    #show('Received: %d'%(e.partial))
    #sys.exit(2)
  #except urllib.error.HTTPError as e:
    #show('The server couldn\'t fulfill the request.')
    #show('Error code: %d'%(e.code))
    #sys.exit(2)
  #except urllib.error.URLError as e:
    #show('We failed to reach a server.')
    #show('Reason: %s'%(e.reason))
    #sys.exit(2)
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

  for row in ijson.items(response,'item'):
    cnt+=1
    # show some sign of being alive
    if cnt%100 == 0:
      sys.stdout.write('.')
      sys.stdout.flush()
    if cnt%1000 == 0:
      show("-- %d" % (cnt))
    if verbose: show("%d -- %s"%(cnt,row))

    # find out which columns to use on insert
    dboperator.resetcolumns(row)

    # flatten arrays/lists
    for col in row:
      if type(row[col]) is list:
        row[col] = ''.join(map(str,json.dumps(row[col])))

    dboperator.insert(address,schema,table,row)

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
  verbose=False

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
