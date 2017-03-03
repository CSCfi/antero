#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
load

todo doc
"""
import sys,os,getopt
import urllib2, base64
import ijson
from time import localtime, strftime

import dboperator

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def load(secure,hostname,url,schema,table,postdata,condition,verbose):
  show("begin "+hostname+" "+url+" "+schema+" "+table+" "+(postdata or "")+" "+(condition or ""))
  if secure:
    address = "https://"+hostname+url
  else:
    address = "http://"+hostname+url
  show("load from "+address)
  
  reqheaders = {'Content-Type': 'application/json'}
  # api credentials from env vars
  if os.getenv("API_USERNAME"):
    show("using authentication")
    apiuser = os.getenv("API_USERNAME")
    apipass = os.getenv("API_PASSWORD")
    reqheaders['Authorization'] = 'Basic %s' % base64.b64encode(apiuser+":"+apipass)

  # automatic POST with (post)data
  request = urllib2.Request(address, data=postdata, headers=reqheaders)
  try:
    response = urllib2.urlopen(request)
  except urllib2.HTTPError, e:
    show('The server couldn\'t fulfill the request.')
    show('Error code: %d'%(e.code))
    sys.exit(2)
  except urllib2.URLError, e:
    show('We failed to reach a server.')
    show('Reason: %s'%(e.reason))
    sys.exit(2)
  else:
    # everything is fine
    show("api call OK")

  parser = ijson.parse(response)
  
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
  row={}
  for prefix, event, value in parser:
    #print prefix, event, value
    if event=='start_map':
      cnt+=1
      row={}
    
    if event in {'string','number'}:
      row[prefix.split('.')[1]]=value
    elif event=='string':
      row[prefix.split('.')[1]]=value
    elif event=='number':
      row[prefix.split('.')[1]]=float(value) if '.' in value else int(value)
    elif event=='end_map':
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

if __name__ == "__main__":
    main(sys.argv[1:])
