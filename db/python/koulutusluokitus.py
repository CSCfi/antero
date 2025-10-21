#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
koulutusluokitus

todo doc
"""
import sys, os, getopt
import http.client as httplib
import json
from time import localtime, strftime

import dboperator

def makerow():
  return {
    'koodi':"", 'nimi':"", 'nimi_sv':None, 'nimi_en':None, 'alkupvm':"", 'loppupvm':None,
    'koulutusaste2002koodi':None, 'koulutusaste2002nimi':None, 'koulutusaste2002nimi_sv':None, 'koulutusaste2002nimi_en':None,
    'koulutusala2002koodi':None, 'koulutusala2002nimi':None, 'koulutusala2002nimi_sv':None, 'koulutusala2002nimi_en':None,
    'opintoala2002koodi':None, 'opintoala2002nimi':None, 'opintoala2002nimi_sv':None, 'opintoala2002nimi_en':None,
    'koulutusaste1995koodi':None, 'koulutusaste1995nimi':None, 'koulutusaste1995nimi_sv':None, 'koulutusaste1995nimi_en':None,
    'koulutusala1995koodi':None, 'koulutusala1995nimi':None, 'koulutusala1995nimi_sv':None, 'koulutusala1995nimi_en':None,
    'opintoala1995koodi':None, 'opintoala1995nimi':None, 'opintoala1995nimi_sv':None, 'opintoala1995nimi_en':None,
    'tutkintokoodi':None, 'tutkintonimi':None, 'tutkintonimi_sv':None, 'tutkintonimi_en':None,
    'tutkintotyyppikoodi':None, 'tutkintotyyppinimi':None, 'tutkintotyyppinimi_sv':None, 'tutkintotyyppinimi_en':None,
    'koulutustyyppikoodi':None, 'koulutustyyppinimi':None, 'koulutustyyppinimi_sv':None, 'koulutustyyppinimi_en':None,
    'isced2011koulutusastekoodi':None, 'isced2011koulutusastenimi':None, 'isced2011koulutusastenimi_sv':None, 'isced2011koulutusastenimi_en':None,
    'isced2011koulutusastetaso1koodi':None, 'isced2011koulutusastetaso1nimi':None, 'isced2011koulutusastetaso1nimi_sv':None, 'isced2011koulutusastetaso1nimi_en':None,
    'koulutusluokitus2016koulutusastetaso1koodi':None, 'koulutusluokitus2016koulutusastetaso1nimi':None, 'koulutusluokitus2016koulutusastetaso1nimi_sv':None, 'koulutusluokitus2016koulutusastetaso1nimi_en':None,
	'isced2011koulutusastetaso2koodi':None, 'isced2011koulutusastetaso2nimi':None, 'isced2011koulutusastetaso2nimi_sv':None, 'isced2011koulutusastetaso2nimi_en':None,
    'koulutusluokitus2016koulutusastetaso2koodi':None, 'koulutusluokitus2016koulutusastetaso2nimi':None, 'koulutusluokitus2016koulutusastetaso2nimi_sv':None, 'koulutusluokitus2016koulutusastetaso2nimi_en':None,
    'isced2011koulutusalataso1koodi':None, 'isced2011koulutusalataso1nimi':None, 'isced2011koulutusalataso1nimi_sv':None, 'isced2011koulutusalataso1nimi_en':None,
    'koulutusluokitus2016koulutusalataso1koodi':None, 'koulutusluokitus2016koulutusalataso1nimi':None, 'koulutusluokitus2016koulutusalataso1nimi_sv':None, 'koulutusluokitus2016koulutusalataso1nimi_en':None,
    'isced2011koulutusalataso2koodi':None, 'isced2011koulutusalataso2nimi':None, 'isced2011koulutusalataso2nimi_sv':None, 'isced2011koulutusalataso2nimi_en':None,
    'koulutusluokitus2016koulutusalataso2koodi':None, 'koulutusluokitus2016koulutusalataso2nimi':None, 'koulutusluokitus2016koulutusalataso2nimi_sv':None, 'koulutusluokitus2016koulutusalataso2nimi_en':None,
    'isced2011koulutusalataso3koodi':None, 'isced2011koulutusalataso3nimi':None, 'isced2011koulutusalataso3nimi_sv':None, 'isced2011koulutusalataso3nimi_en':None,
    'koulutusluokitus2016koulutusalataso3koodi':None, 'koulutusluokitus2016koulutusalataso3nimi':None, 'koulutusluokitus2016koulutusalataso3nimi_sv':None, 'koulutusluokitus2016koulutusalataso3nimi_en':None,
    'okmohjauksenalakoodi':None, 'okmohjauksenalanimi':None, 'okmohjauksenalanimi_sv':None, 'okmohjauksenalanimi_en':None

  }

def getnimi(i,kieli):
  for m in i["metadata"]:
    if m["kieli"] == kieli:
      return m["nimi"]
  return None

def load(secure,hostname,url,schema,table,codeset,verbose=False,debug=False):
  if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" begin")

  row = makerow()
  dboperator.columns(row,debug)

  if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" empty %s.%s"%(schema,table))
  dboperator.empty(schema,table,debug)

  url = url % codeset # korvaa placeholder
  if secure:
    httpconn = httplib.HTTPSConnection(hostname)
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" load securely from "+hostname+url)
  else:
    httpconn = httplib.HTTPConnection(hostname)
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" load from "+hostname+url)

  reqheaders = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
  httpconn.request('GET', url, headers=reqheaders)
  #httpconn.request('GET', url)
  r = httpconn.getresponse()
  j = json.loads(r.read())
  cnt = 0
  for i in j:
    cnt += 1
    row = makerow()

    row["koodi"] = i["koodiArvo"]
    row["nimi"] = getnimi(i,"FI")
    row["nimi_sv"] = getnimi(i,"SV")
    row["nimi_en"] = getnimi(i,"EN")
    row["alkupvm"] = i["voimassaAlkuPvm"]
    row["loppupvm"] = i["voimassaLoppuPvm"]
    try:
        httpconn.request('GET', "/koodisto-service/rest/json/relaatio/sisaltyy-alakoodit/%s" % i["koodiUri"], headers=reqheaders)
        rr = httpconn.getresponse()
        jj = json.loads(rr.read())
        for ii in jj:
          if ii["koodisto"]["koodistoUri"] == "koulutusasteoph2002":
            row["koulutusaste2002koodi"] = ii["koodiArvo"]
            row["koulutusaste2002nimi"] = getnimi(ii,"FI")
            row["koulutusaste2002nimi_sv"] = getnimi(ii,"SV")
            row["koulutusaste2002nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "koulutusalaoph2002":
            row["koulutusala2002koodi"] = ii["koodiArvo"]
            row["koulutusala2002nimi"] = getnimi(ii,"FI")
            row["koulutusala2002nimi_sv"] = getnimi(ii,"SV")
            row["koulutusala2002nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "opintoalaoph2002":
            row["opintoala2002koodi"] = ii["koodiArvo"]
            row["opintoala2002nimi"] = getnimi(ii,"FI")
            row["opintoala2002nimi_sv"] = getnimi(ii,"SV")
            row["opintoala2002nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "koulutusasteoph1995":
            row["koulutusaste1995koodi"] = ii["koodiArvo"]
            row["koulutusaste1995nimi"] = getnimi(ii,"FI")
            row["koulutusaste1995nimi_sv"] = getnimi(ii,"SV")
            row["koulutusaste1995nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "koulutusalaoph1995":
            row["koulutusala1995koodi"] = ii["koodiArvo"]
            row["koulutusala1995nimi"] = getnimi(ii,"FI")
            row["koulutusala1995nimi_sv"] = getnimi(ii,"SV")
            row["koulutusala1995nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "opintoalaoph1995":
            row["opintoala1995koodi"] = ii["koodiArvo"]
            row["opintoala1995nimi"] = getnimi(ii,"FI")
            row["opintoala1995nimi_sv"] = getnimi(ii,"SV")
            row["opintoala1995nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "tutkinto":
            row["tutkintokoodi"] = ii["koodiArvo"]
            row["tutkintonimi"] = getnimi(ii,"FI")
            row["tutkintonimi_sv"] = getnimi(ii,"SV")
            row["tutkintonimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "tutkintotyyppi":
            row["tutkintotyyppikoodi"] = ii["koodiArvo"]
            row["tutkintotyyppinimi"] = getnimi(ii,"FI")
            row["tutkintotyyppinimi_sv"] = getnimi(ii,"SV")
            row["tutkintotyyppinimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "koulutustyyppi":
            row["koulutustyyppikoodi"] = ii["koodiArvo"]
            row["koulutustyyppinimi"] = getnimi(ii,"FI")
            row["koulutustyyppinimi_sv"] = getnimi(ii,"SV")
            row["koulutustyyppinimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "isced2011koulutusaste":
            row["isced2011koulutusastekoodi"] = ii["koodiArvo"]
            row["isced2011koulutusastenimi"] = getnimi(ii,"FI")
            row["isced2011koulutusastenimi_sv"] = getnimi(ii,"SV")
            row["isced2011koulutusastenimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "isced2011koulutusastetaso1":
            row["isced2011koulutusastetaso1koodi"] = ii["koodiArvo"]
            row["isced2011koulutusastetaso1nimi"] = getnimi(ii,"FI")
            row["isced2011koulutusastetaso1nimi_sv"] = getnimi(ii,"SV")
            row["isced2011koulutusastetaso1nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "isced2011koulutusastetaso2":
            row["isced2011koulutusastetaso2koodi"] = ii["koodiArvo"]
            row["isced2011koulutusastetaso2nimi"] = getnimi(ii,"FI")
            row["isced2011koulutusastetaso2nimi_sv"] = getnimi(ii,"SV")
            row["isced2011koulutusastetaso2nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "kansallinenkoulutusluokitus2016koulutusastetaso1":
            row["koulutusluokitus2016koulutusastetaso1koodi"] = ii["koodiArvo"]
            row["koulutusluokitus2016koulutusastetaso1nimi"] = getnimi(ii,"FI")
            row["koulutusluokitus2016koulutusastetaso1nimi_sv"] = getnimi(ii,"SV")
            row["koulutusluokitus2016koulutusastetaso1nimi_en"] = getnimi(ii,"EN")
          # huom! https://www.stat.fi/meta/luokitukset/koulutus/001-2016/kuvaus.html
          # kansallinenkoulutusluokitus2016koulutusastetaso2 -> isced2011koulutusastetaso2
          if ii["koodisto"]["koodistoUri"] == "kansallinenkoulutusluokitus2016koulutusastetaso2":
            row["koulutusluokitus2016koulutusastetaso2koodi"] = ii["koodiArvo"]
            row["koulutusluokitus2016koulutusastetaso2nimi"] = getnimi(ii,"FI")
            row["koulutusluokitus2016koulutusastetaso2nimi_sv"] = getnimi(ii,"SV")
            row["koulutusluokitus2016koulutusastetaso2nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso1":
            row["isced2011koulutusalataso1koodi"] = ii["koodiArvo"]
            row["isced2011koulutusalataso1nimi"] = getnimi(ii,"FI")
            row["isced2011koulutusalataso1nimi_sv"] = getnimi(ii,"SV")
            row["isced2011koulutusalataso1nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "kansallinenkoulutusluokitus2016koulutusalataso1":
            row["koulutusluokitus2016koulutusalataso1koodi"] = ii["koodiArvo"]
            row["koulutusluokitus2016koulutusalataso1nimi"] = getnimi(ii,"FI")
            row["koulutusluokitus2016koulutusalataso1nimi_sv"] = getnimi(ii,"SV")
            row["koulutusluokitus2016koulutusalataso1nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso2":
            row["isced2011koulutusalataso2koodi"] = ii["koodiArvo"]
            row["isced2011koulutusalataso2nimi"] = getnimi(ii,"FI")
            row["isced2011koulutusalataso2nimi_sv"] = getnimi(ii,"SV")
            row["isced2011koulutusalataso2nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "kansallinenkoulutusluokitus2016koulutusalataso2":
            row["koulutusluokitus2016koulutusalataso2koodi"] = ii["koodiArvo"]
            row["koulutusluokitus2016koulutusalataso2nimi"] = getnimi(ii,"FI")
            row["koulutusluokitus2016koulutusalataso2nimi_sv"] = getnimi(ii,"SV")
            row["koulutusluokitus2016koulutusalataso2nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso3":
            row["isced2011koulutusalataso3koodi"] = ii["koodiArvo"]
            row["isced2011koulutusalataso3nimi"] = getnimi(ii,"FI")
            row["isced2011koulutusalataso3nimi_sv"] = getnimi(ii,"SV")
            row["isced2011koulutusalataso3nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "kansallinenkoulutusluokitus2016koulutusalataso3":
            row["koulutusluokitus2016koulutusalataso3koodi"] = ii["koodiArvo"]
            row["koulutusluokitus2016koulutusalataso3nimi"] = getnimi(ii,"FI")
            row["koulutusluokitus2016koulutusalataso3nimi_sv"] = getnimi(ii,"SV")
            row["koulutusluokitus2016koulutusalataso3nimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "okmohjauksenala":
            row["okmohjauksenalakoodi"] = ii["koodiArvo"]
            row["okmohjauksenalanimi"] = getnimi(ii,"FI")
            row["okmohjauksenalanimi_sv"] = getnimi(ii,"SV")
            row["okmohjauksenalanimi_en"] = getnimi(ii,"EN")
          if ii["koodisto"]["koodistoUri"] == "tutkintonimikkeet":
            row["tutkintonimikekoodi"] = ii["koodiArvo"]
            row["tutkintonimike"] = getnimi(ii,"FI")
            row["tutkintonimike_sv"] = getnimi(ii,"SV")
            row["tutkintonimike_en"] = getnimi(ii,"EN")
    except Exception as e:
        print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" %d -- %s"%(cnt,row["koodi"]), e)
    if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" %d -- %s"%(cnt,row["koodi"]))
    dboperator.insert(hostname+url,schema,table,row,debug)

  dboperator.close(debug)

  if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" ready")

def usage():
  print("""
usage: koulutusluokitus.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] -c|--codeset <codeset> [-v|--verbose] [-d|--debug]

secure defaults to being secure (HTTPS) (so no point in using this argument at all)
hostname defaults to "virkailija.testiopintopolku.fi"
url defaults to "/koodisto-service/rest/json/%s/koodi" (do notice the %s in middle which is a placeholder for codeset argument)
schema defaults to $SCHEMA then to "" (for database default if set)
table defaults to $TABLE then to "sa_koulutusluokitus"
codeset defaults to "koulutus" (probably not going to change -- ever)
""")

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.testiopintopolku.fi"
  url = "/koodisto-service/rest/json/%s/koodi" # nb %s
  schema = os.getenv("SCHEMA") or ""
  table = os.getenv("TABLE") or "sa_koulutusluokitus"
  codeset = "koulutus"
  verbose,debug = False,False

  try:
    opts, args = getopt.getopt(argv,"sH:u:e:t:c:vd",["secure","hostname=","url=","schema=","table=","codeset=","verbose","debug"])
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
    elif opt in ("-d", "--debug"): debug = True
  if not hostname or not url or not schema or not table or not codeset:
    usage()
    sys.exit(2)

  if debug: print("debugging")

  load(secure,hostname,url,schema,table,codeset,verbose,debug)

if __name__ == "__main__":
  main(sys.argv[1:])
