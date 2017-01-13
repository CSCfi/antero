#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
codes

todo doc
"""
import sys, os, getopt
import httplib
import json
from time import localtime, strftime

import dboperator

def getnimi(i,kieli):
  for m in i["metadata"]:
    if m["kieli"] == kieli:
      return m["nimi"]
  return None

def show(message):
  print strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message

def load(secure,hostname,url,schema,table,codeset,verbose=False):
  if verbose: show("begin")

  # make "columnlist" separately (type has no meaning as we're not creating table)
  row = {'koodisto':None,'koodi':None,'nimi':None,'nimi_sv':None,'nimi_en':None,'alkupvm':None,'loppupvm':None}
  # setup dboperator variables so insert works
  dboperator.columns(row)

  #show("empty sa_koodistot")
  #dboperator.empty("sa_koodistot")

  url = url % codeset
  address = hostname+url
  if secure:
    show("load securely from "+address)
    httpconn = httplib.HTTPSConnection(hostname)
  else:
    show("load from "+address)
    httpconn = httplib.HTTPConnection(hostname)

  httpconn.request('GET', url)
  r = httpconn.getresponse()
  j = json.loads(r.read())
  cnt = 0
  if verbose: show("delete from %s.%s where koodisto=%s"%(schema,table,codeset))
  dboperator.remove(schema,table,"koodisto",codeset)
  for i in j:
    cnt += 1
    # make "row"
    row["koodisto"] = codeset
    # columns
    row["koodi"] = i["koodiArvo"]
    row["nimi"] = getnimi(i,"FI")
    row["nimi_sv"] = getnimi(i,"SV")
    row["nimi_en"] = getnimi(i,"EN")
    row["alkupvm"] = i["voimassaAlkuPvm"]
    row["loppupvm"] = i["voimassaLoppuPvm"]

    if verbose: show("-- %s -- %d -- %s"%(codeset,cnt,row["koodi"]))
    dboperator.insert(address,schema,table,row)

  dboperator.close()

  if verbose: show("ready")

def usage():
  print """
usage: codes.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] -c|--codeset <codeset> [-v|--verbose]

secure defaults to being secure (HTTPS) (so no point in using this argument at all)
hostname defaults to $OPINTOPOLKU then to "testi.virkailija.opintopolku.fi"
url defaults to "/koodisto-service/rest/json/%s/koodi" (do notice the %s in middle which is a placeholder for codeset argument)
schema defaults to "dbo"
table defaults to "sa_koodistot"
codeset is the only mandatory argument. No default. Name of the "koodisto" to be loaded.
"""

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "testi.virkailija.opintopolku.fi"
  url = "/koodisto-service/rest/json/%s/koodi"
  schema = "dbo"
  table = "sa_koodistot"
  codeset = ""
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"sH:u:e:t:c:vd",["secure","hostname=","url=","schema=","table=","codeset=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-s", "--secure"): secure = True
    elif opt in ("-H", "--hostname"): hostname = arg
    elif opt in ("-u", "--url"): url = arg
    elif opt in ("-e", "--schema"): schema = arg
    elif opt in ("-t", "--table"): table = arg
    elif opt in ("-c", "--codeset"): codeset = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not hostname or not url or not schema or not table or not codeset:
    usage()
    sys.exit(2)

  load(secure,hostname,url,schema,table,codeset,verbose)

if __name__ == "__main__":
  main(sys.argv[1:])
