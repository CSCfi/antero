#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
load

todo doc
"""
import sys,os,getopt
import httplib,ssl,base64
import json
from time import localtime, strftime

import dboperator

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def load(secure,hostname,url,schema,table,postdata,condition,verbose):
  show("begin "+hostname+" "+url+" "+schema+" "+table+" "+postdata+" "+condition)
  address=hostname+url
  if secure:
    show("load securely from "+address)
    httpconn=httplib.HTTPSConnection(hostname, context=ssl._create_unverified_context())
  else:
    show("load from "+address)
    httpconn=httplib.HTTPConnection(hostname)

  # data for post operation determines to use post, otherwise get
  if postdata:
    headers=""
    # api credentials from env vars
    if os.getenv("API_USERNAME"):
      apiuser = os.getenv("API_USERNAME")
      apipass = os.getenv("API_PASSWORD")
      headers={'Content-Type': 'application/json', 'Authorization': 'Basic %s' % base64.b64encode(apiuser+":"+apipass)}
    httpconn.request('POST', url, postdata, headers)
  else:
    httpconn.request('GET', url)

  r=httpconn.getresponse()
  j=json.loads(r.read())
  show("api returned %d objects"%(len(j)))

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
  for row in j:
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

    for col in row:
      if type(row[col]) is list:
        row[col] = str(row[col])
    dboperator.insert(address,schema,table,row)

  show("wrote %d"%(cnt))
  dboperator.close()

  show("ready")

def usage():
  print """
usage: load.py [-s|--secure] -H|--hostname <hostname> -u|--url <url> -e|--schema <schema> -t|--table <table> [-p|--postdata] [-c|--condition <condition>] [-v|--verbose]
"""

def main(argv):
  # muuttujat jotka kerrotaan argumentein
  secure=False
  hostname,url,schema,table="","","",""
  postdata=""
  condition=""
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

if __name__ == "__main__":
    main(sys.argv[1:])
