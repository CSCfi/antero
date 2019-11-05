#!/usr/bin/python
# -*- coding: utf-8 -*-
# vim: set fileencoding=UTF-8 :
"""
loadcsv

todo doc
"""
import sys,os,getopt
import requests
#import csv, codecs
import ucsv as csv
import tempfile
import codecs
from time import localtime, strftime

import dboperator

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def load(secure,hostname,url,schema,table,verbose):
  show("begin "+hostname+" "+url+" "+schema+" "+table)
  if secure:
    address = "https://"+hostname+url
  else:
    address = "http://"+hostname+url

  #""" load from web
  reqheaders = {'Caller-Id' = '1.2.246.562.10.2013112012294919827487.vipunen'}
  show("load from "+address)
  try:
    response = requests.get(address, headers=reqheaders)
    #response = requests.get(address)
  except e:
    show('HTTP GET failed.')
    show('Reason: %s'%(e.reason))
    sys.exit(2)
  else:
    # everything is fine
    show("api call OK")

  # read the data.
  # all of it. this is dangerous for big datasets!
  # convert to utf-8 on-the-fly if it's not
  data = response.text.encode('utf-8')
  #"""

  # create temporary file (remove at the end)
  f = tempfile.NamedTemporaryFile() #defaults: mode='w+b', delete=True)
  show("using tempfile: %s"%(f.name))
  f.write(data)

  # start using data, go to start
  f.seek(0)
  # remove BOM if exists
  if f.read(3)!=codecs.BOM_UTF8: f.seek(0)

  # make csv dictionary (first row must have column names)
  csvdata = csv.DictReader(f, delimiter=";")

  # discover columns and their types (read through entirely!)
  show("discover table structure")
  cnt=0
  for row in csvdata:
    cnt+=1
    if verbose: print cnt,row
    if verbose:
      for col in row:
        print cnt,col,row[col]
    dboperator.columns(row)

  # start operating with database
  # drop table
  show("drop %s.%s"%(schema,table))
  dboperator.drop(schema,table)

  # create table
  show("create %s.%s"%(schema,table))
  dboperator.create(schema,table)

  show("insert data")
  # reset csvdata!
  f.seek(0)
  # remove BOM
  if f.read(3)!=codecs.BOM_UTF8: f.seek(0)
  csvdata = csv.DictReader(f, delimiter=";")

  cnt=0
  for row in csvdata:
    cnt+=1
    # show some sign of being alive
    if cnt%100 == 0:
      sys.stdout.write('.')
      sys.stdout.flush()
    if cnt%1000 == 0:
      show("-- %d" % (cnt))
    dboperator.insert(address,schema,table,row)

  show("wrote %d"%(cnt))
  dboperator.close()

  # close (and delete) file
  f.close()

  show("ready")

def usage():
  print """
usage: loadcsv.py [-s|--secure] -H|--hostname <hostname> -u|--url <url> -e|--schema <schema> -t|--table <table> [-v|--verbose]
"""

def main(argv):
  # muuttujat jotka kerrotaan argumentein
  secure=False
  hostname,url,schema,table="","","",""
  verbose=False

  try:
    opts,args=getopt.getopt(argv,"sH:u:e:t:v",["secure","hostname=","url=","schema=","table=","verbose"])
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
    elif opt in ("-v", "--verbose"): verbose=True
  if not hostname or not url or not schema or not table:
    usage()
    sys.exit(2)

  load(secure,hostname,url,schema,table,verbose)

if __name__ == "__main__":
    main(sys.argv[1:])
