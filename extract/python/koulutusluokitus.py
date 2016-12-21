#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
koulutusluokitus

todo doc
"""
import sys, os, getopt
import httplib
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
    'isced2011koulutusastetaso2koodi':None, 'isced2011koulutusastetaso2nimi':None, 'isced2011koulutusastetaso2nimi_sv':None, 'isced2011koulutusastetaso2nimi_en':None,
    'isced2011koulutusalataso1koodi':None, 'isced2011koulutusalataso1nimi':None, 'isced2011koulutusalataso1nimi_sv':None, 'isced2011koulutusalataso1nimi_en':None,
    'isced2011koulutusalataso2koodi':None, 'isced2011koulutusalataso2nimi':None, 'isced2011koulutusalataso2nimi_sv':None, 'isced2011koulutusalataso2nimi_en':None,
    'isced2011koulutusalataso3koodi':None, 'isced2011koulutusalataso3nimi':None, 'isced2011koulutusalataso3nimi_sv':None, 'isced2011koulutusalataso3nimi_en':None,
    'okmohjauksenalakoodi':None, 'okmohjauksenalanimi':None, 'okmohjauksenalanimi_sv':None, 'okmohjauksenalanimi_en':None
  }

def getnimi(i,kieli):
  for m in i["metadata"]:
    if m["kieli"] == kieli:
      return m["nimi"]
  return None

def load(secure,hostname,url,table,codeset,verbose=False,debug=False):
  if verbose: print strftime("%Y-%m-%d %H:%M:%S", localtime())+" begin"

  row = makerow()
  dboperator.columns(row,debug)
  
  if verbose: print strftime("%Y-%m-%d %H:%M:%S", localtime())+" empty %s"%(table)
  dboperator.empty(table,debug)

  url = url % codeset # korvaa placeholder
  if secure:
    httpconn = httplib.HTTPSConnection(hostname)
    print strftime("%Y-%m-%d %H:%M:%S", localtime())+" load securely from "+hostname+url
  else:
    httpconn = httplib.HTTPConnection(hostname)
    print strftime("%Y-%m-%d %H:%M:%S", localtime())+" load from "+hostname+url

  httpconn.request('GET', url)
  r = httpconn.getresponse()
  j = json.loads(r.read())
  cnt = 0
  for i in j:
    cnt += 1
    row = makerow()

    row["koodi"] = i["koodiArvo"]
    row["nimi"] = getnimi(i,"FI")
    row["nimi_sv"] = getnimi(i,"SV")
    row["nimi_en"] = getnimi(i,"FI")
    row["alkupvm"] = i["voimassaAlkuPvm"]
    row["loppupvm"] = i["voimassaLoppuPvm"]

    httpconn.request('GET', "/koodisto-service/rest/json/relaatio/sisaltyy-alakoodit/%s" % i["koodiUri"])
    rr = httpconn.getresponse()
    jj = json.loads(rr.read())
    ss = ""
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
      if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso1":
        row["isced2011koulutusalataso1koodi"] = ii["koodiArvo"]
        row["isced2011koulutusalataso1nimi"] = getnimi(ii,"FI")
        row["isced2011koulutusalataso1nimi_sv"] = getnimi(ii,"SV")
        row["isced2011koulutusalataso1nimi_en"] = getnimi(ii,"EN")
      if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso2":
        row["isced2011koulutusalataso2koodi"] = ii["koodiArvo"]
        row["isced2011koulutusalataso2nimi"] = getnimi(ii,"FI")
        row["isced2011koulutusalataso2nimi_sv"] = getnimi(ii,"SV")
        row["isced2011koulutusalataso2nimi_en"] = getnimi(ii,"EN")
      if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso3":
        row["isced2011koulutusalataso3koodi"] = ii["koodiArvo"]
        row["isced2011koulutusalataso3nimi"] = getnimi(ii,"FI")
        row["isced2011koulutusalataso3nimi_sv"] = getnimi(ii,"SV")
        row["isced2011koulutusalataso3nimi_en"] = getnimi(ii,"EN")
      if ii["koodisto"]["koodistoUri"] == "okmohjauksenala":
        row["okmohjauksenalakoodi"] = ii["koodiArvo"]
        row["okmohjauksenalanimi"] = getnimi(ii,"FI")
        row["okmohjauksenalanimi_sv"] = getnimi(ii,"SV")
        row["okmohjauksenalanimi_en"] = getnimi(ii,"EN")

    if verbose: print strftime("%Y-%m-%d %H:%M:%S", localtime())+" %d -- %s"%(cnt,row["koodi"])
    dboperator.insert(hostname+url,table,row,debug)

  dboperator.close(debug)

  if verbose: print strftime("%Y-%m-%d %H:%M:%S", localtime())+" ready"

def usage():
  print """
usage: koulutusluokitus.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-t|--table <table>] -c|--codeset <codeset> [-v|--verbose] [-d|--debug]

secure defaults to being secure (HTTPS) (so no point in using this argument at all)
hostname defaults to "testi.virkailija.opintopolku.fi"
url defaults to "/koodisto-service/rest/json/%s/koodi" (do notice the %s in middle which is a placeholder for codeset argument)
table defaults to "sa_koulutusluokitus"
codeset defaults to "koulutus"
"""

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "testi.virkailija.opintopolku.fi"
  url = "/koodisto-service/rest/json/%s/koodi" # nb %s
  table = "sa_koulutusluokitus"
  codeset = "koulutus"
  verbose,debug = False,False
  
  try:
    opts, args = getopt.getopt(argv,"sH:u:t:c:vd",["secure","hostname=","url=","table=","codeset=","verbose","debug"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-s", "--secure"): secure = True
    elif opt in ("-H", "--hostname"): hostname = arg
    elif opt in ("-u", "--url"): url = arg
    elif opt in ("-t", "--table"): table = arg
    elif opt in ("-c", "--codeset"): codeset = arg
    elif opt in ("-v", "--verbose"): verbose = True
    elif opt in ("-d", "--debug"): debug = True
  if not hostname or not url or not table or not codeset:
    usage()
    sys.exit(2)

  if debug: print "debugging"

  load(secure,hostname,url,table,codeset,verbose,debug)

if __name__ == "__main__":
  main(sys.argv[1:])
