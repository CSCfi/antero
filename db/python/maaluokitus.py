#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
maaluokitus

todo doc
"""
import sys, os, getopt
import http.client as httplib
import json
from time import localtime, strftime

import dboperator

def show(message):
  print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def makerow():
  return {
    'koodi':None, 'nimi':None, 'nimi_sv':None, 'nimi_en':None, 'alkupvm':None, 'loppupvm':None,
    'maanosatkoodi':None, 'maanosatnimi':None, 'maanosatnimi_sv':None, 'maanosatnimi_en':None,
    'maanosat2koodi':None, 'maanosat2nimi':None, 'maanosat2nimi_sv':None, 'maanosat2nimi_en':None,
    'maanosat3koodi':None, 'maanosat3nimi':None, 'maanosat3nimi_sv':None, 'maanosat3nimi_en':None
  }

# get value from json
def jv(jsondata, key):
  if key in jsondata:
    return jsondata[key]
  return None

def getnimi(i,kieli):
  for m in i["metadata"]:
    if m["kieli"] == kieli:
      return m["nimi"]
  return None

def load(secure,hostname,url,schema,table,codeset,verbose=False):
  if verbose: show("begin")

  row = makerow()
  dboperator.columns(row)

  if verbose: show("empty %s.%s"%(schema,table))
  dboperator.empty(schema,table)

  url = url % codeset # replace placeholder
  if secure:
    httpconn = httplib.HTTPSConnection(hostname)
    show("load securely from "+hostname+url)
  else:
    httpconn = httplib.HTTPConnection(hostname)
    show("load from "+hostname+url)

  reqheaders = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
  httpconn.request('GET', url, headers=reqheaders)
  #httpconn.request('GET', url)
  r = httpconn.getresponse()
  j = json.loads(r.read())
  cnt = 0
  for i in j:
    cnt += 1
    row = makerow()

    row["koodi"] = jv(i,"koodiArvo")
    row["nimi"] = getnimi(i,"FI")
    row["nimi_sv"] = getnimi(i,"SV")
    row["nimi_en"] = getnimi(i,"EN")
    row["alkupvm"] = jv(i,"voimassaAlkuPvm")
    row["loppupvm"] = jv(i,"voimassaLoppuPvm")

    httpconn.request('GET', "/koodisto-service/rest/json/relaatio/sisaltyy-ylakoodit/%s" % i["koodiUri"], headers=reqheaders)
    rr = httpconn.getresponse()
    jj = json.loads(rr.read())
    for ii in jj:
      classification = "maanosat"
      level = ""
      if len(ii["koodiArvo"])==3:
        level = "3"
      elif len(ii["koodiArvo"])==2:
        level = "2"
      # else default
      if ii["koodisto"]["koodistoUri"] == classification:
        row[classification+level+"koodi"] = jv(ii,"koodiArvo")
        row[classification+level+"nimi"] = getnimi(ii,"FI")
        row[classification+level+"nimi_sv"] = getnimi(ii,"SV")
        row[classification+level+"nimi_en"] = getnimi(ii,"EN")

    if verbose: show("%d -- %s"%(cnt,row["koodi"]))
    dboperator.insert(hostname+url,schema,table,row)

  dboperator.close()

  if verbose: show("ready")

def usage():
  print("""
usage: maaluokitus.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] [-c|--codeset <codeset>] [-v|--verbose]

secure defaults to being secure (HTTPS) (so no point in using this argument at all)
hostname defaults to $OPINTOPOLKU then to "virkailija.opintopolku.fi"
url defaults to "/koodisto-service/rest/json/%s/koodi" (do notice the %s in middle which is a placeholder for codeset argument)
schema defaults to $SCHEMA then to "" (for database default if set)
table defaults to $TABLE then to "sa_maaluokitus"
codeset defaults to "maatjavaltiot2" (probably not going to change -- ever)
""")

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
  url = "/koodisto-service/rest/json/%s/koodi" # nb %s
  schema = os.getenv("SCHEMA") or ""
  table = os.getenv("TABLE") or "sa_maaluokitus"
  codeset = "maatjavaltiot2"
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"sH:u:e:t:c:v",["secure","hostname=","url=","schema=","table=","codeset=","verbose"])
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
