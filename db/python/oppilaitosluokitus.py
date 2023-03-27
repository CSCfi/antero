#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
oppilaitosluokitus

todo doc
"""
import sys, os, getopt
import http.client as httplib
import json
from time import localtime, strftime

import dboperator

def makerow():
  return {
    'oid':None, 'koodi':None, 'nimi':None, 'nimi_sv':None, 'nimi_en':None, 'alkupvm':None, 'loppupvm':None,
    'kuntakoodi':None, 'oppilaitostyyppikoodi':None,
    'jarjestajaoid':None, 'jarjestajakoodi':None, 'jarjestajanimi':None, 'jarjestajanimi_sv':None, 'jarjestajanimi_en':None,
    'osoite':None, 'postinumero':None, 'postitoimipaikka':None, 'latitude':None, 'longitude':None
  }

def load(secure,hostname,url,schema,table,codeset,verbose=False,debug=False):
  if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" begin")

  # make "columnlist" (type has no meaning as we're not creating table)
  row = makerow()
  # setup dboperator so other calls work
  dboperator.columns(row,debug)

  if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" empty %s.%s"%(schema,table))
  dboperator.empty(schema,table,debug)

  reqheaders = {'Content-Type': 'application/json'}
  reqheaders['Caller-Id'] = '1.2.246.562.10.2013112012294919827487.vipunen'

  url = "" # replace with hardcoded values below
  if secure:
    httpconn = httplib.HTTPSConnection(hostname)
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" load securely from "+hostname+url)
  else:
    httpconn = httplib.HTTPConnection(hostname)
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" load from "+hostname+url)

  links = [
      "/organisaatio-service/rest/organisaatio/v2/hierarkia/hae?organisaatiotyyppi=Koulutustoimija&aktiiviset=true&suunnitellut=true&lakkautetut=false",
      "/organisaatio-service/rest/organisaatio/v2/hierarkia/hae?organisaatiotyyppi=Koulutustoimija&aktiiviset=false&suunnitellut=false&lakkautetut=true"
  ]
  for url in links:
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" load from "+hostname+url)
    httpconn.request('GET', url, headers=reqheaders)
    #httpconn.request('GET', url)
    r = httpconn.getresponse()
    j = json.loads(r.read())
    cnt = 0
    for i in j["organisaatiot"]:
      # make "row" (clear values)
      row = makerow()

      row["jarjestajaoid"] = i["oid"]
      row["jarjestajakoodi"] = None if "ytunnus" not in i else i["ytunnus"] # may be None
      row["jarjestajanimi"] = None if "fi" not in i["nimi"] else i["nimi"]["fi"]
      row["jarjestajanimi_sv"] = None if "sv" not in i["nimi"] else i["nimi"]["sv"]
      row["jarjestajanimi_en"] = None if "en" not in i["nimi"] else i["nimi"]["en"]

      for o in i["children"]:
        if "oppilaitosKoodi" in o:
          cnt += 1
          # sarakkeet
          row["oid"] = o["oid"]
          row["koodi"] = o["oppilaitosKoodi"]
          row["nimi"] = None if "fi" not in o["nimi"] else o["nimi"]["fi"]
          row["nimi_sv"] = None if "sv" not in o["nimi"] else o["nimi"]["sv"]
          row["nimi_en"] = None if "en" not in o["nimi"] else o["nimi"]["en"]
          row["alkupvm"] = "1900-1-1" if "alkuPvm" not in o or o["alkuPvm"]<0 else strftime("%Y-%m-%d",localtime(o["alkuPvm"]/1000))
          row["loppupvm"] = None if "lakkautusPvm" not in o else strftime("%Y-%m-%d",localtime(o["lakkautusPvm"]/1000))

          row["kuntakoodi"] = o["kotipaikkaUri"].replace("kunta_","")
          # => text values separately
          if "oppilaitostyyppi" in o:
              row["oppilaitostyyppikoodi"] = o["oppilaitostyyppi"].replace("oppilaitostyyppi_","").replace("#1","")
    
          # => text values separately

          # get address

          #httpconn.request('GET', "/organisaatio-service/rest/organisaatio/"+row["oid"]reqheaders)
          httpconn.request('GET', "/organisaatio-service/rest/organisaatio/"+row["oid"], headers=reqheaders)
          rr = httpconn.getresponse()
          jj = json.loads(rr.read())
          if jj["kayntiosoite"]:
            row["osoite"] = jj["kayntiosoite"]["osoite"]
            row["postinumero"] = None if "postinumeroUri" not in jj["kayntiosoite"] else jj["kayntiosoite"]["postinumeroUri"].replace("posti_","")
            if "postitoimipaikka" in jj["kayntiosoite"]:
                row["postitoimipaikka"] = jj["kayntiosoite"]["postitoimipaikka"]
            elif "postitoimipaikka" in jj["postiosoite"]:
                row["postitoimipaikka"] = jj["postiosoite"]["postitoimipaikka"]
            else:
                row["postitoimipaikka"] = None

          elif jj["postiosoite"]:
            row["osoite"] = jj["postiosoite"]["osoite"]
            if jj["postiosoite"]["postinumeroUri"]:
              row["postinumero"] = jj["postiosoite"]["postinumeroUri"].replace("posti_","")
            row["postitoimipaikka"] = jj["postiosoite"]["postitoimipaikka"]

          # todo get coordinates (see geocoding.py)


          if verbose: print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" %d -- %s"%(cnt,row["koodi"]))
          dboperator.insert(hostname+url,schema,table,row,debug)

  dboperator.close(debug)

  if verbose: print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" ready")

def usage():
  print("""
usage: oppilaitosluokitus.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] -c|--codeset <codeset> [-v|--verbose] [-d|--debug]

secure defaults to being secure (HTTPS) (so no point in using this argument at all)
hostname defaults to $OPINTOPOLKU then to "virkailija.testiopintopolku.fi"
url not used
schema defaults to $SCHEMA then to "" (for database default if set)
table defaults to $TABLE then to "sa_oppilaitosluokitus"
codeset not used
""")

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.testiopintopolku.fi"
  url = "N/A" # nb argument not used!
  schema = os.getenv("SCHEMA") or ""
  table = os.getenv("TABLE") or "sa_oppilaitosluokitus"
  codeset = "N/A" # nb argument not used!
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
