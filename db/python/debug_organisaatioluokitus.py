import requests, json
import sys, os, socket, getopt
from time import localtime, strftime
from imp import reload

import dbcommand
import dboperator
oids=[]
organisaatio_data=[]
organisaatio_data2=[]
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Accept'] = 'application/json'
reqheaders['Caller-Id']= '1.2.246.562.10.2013112012294919827487.vipunen'

def show(message):
  print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def jv(jsondata, key):
  if key in jsondata:
    return jsondata[key]
  return None

def makerow():
  return {
    'oid':None, 'koodi':None, 'nimi':None, 'nimi_sv':None, 'nimi_en':None, 'alkupvm':None, 'loppupvm':None,
    'tyyppi':None, 'parentoid':None, 'liitosoid':None,
    'kotikunta':None, 'oppilaitoksenopetuskieli':None,
    'oppilaitostyyppi':None,
    'osoitetyyppi':None, 'osoite':None, 'postinumero':None, 'postitoimipaikka':None
  }

def get_osoite_array(osoite, postinumero, kunta):
  osoite_array = ["--address"]
  osoite_array.append(osoite + ", " + postinumero + ", " + kunta)
  return osoite_array

def get_kotikunta_by_kuntakoodi(koodi):
  try:
    r = requests.get("https://virkailija.opintopolku.fi/koodisto-service/rest/json/kunta/koodi/arvo/" + str(koodi),
                     headers = reqheaders)
  except requests.exceptions.RequestException as e:
    print("Error: virkailija.opintopolku.fi, no kunta for koodi: " + str(koodi))

  try:
    result_json = json.loads(r.text)
  except ValueError as e:
    print("Error: virkailija.opintopolku.fi, " + str(e))

  if r.status_code == 200:
    for i in result_json[0]["metadata"]:
        if i["kieli"] == "FI":
          return {"OK": True, "kunta": i["nimi"]}
    return {"OK": True, "kunta": result_json[0]["metadata"][0]["nimi"]}  # If FI was not found
  else:
    print("Error! virkailija.opintopolku.fi, code: " + str(r.status_code))
  return {"OK": False, "kunta": None}



def load(hostname,url,schema,table,verbose=False):
  if verbose: show("begin")

  # make "columnlist" (type has no meaning as we're not creating table)
  row = makerow()
  # setup dboperator so other calls work
  dboperator.columns(row)

  if verbose: show("empty %s.%s"%(schema,table))
  dboperator.empty(schema,table)


  address = "https://"+hostname+url

  #""" load from web
  show("load from "+address)

  try:
    # first create a "hash map" of liitokset
    liitosresponse = requests.get(address+"v2/liitokset", headers = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
    # actual data
    response = requests.get(address, headers = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
  except Exception as e:
    show('HTTP GET failed.')
    show('Reason: %s'%(str(e)))
    sys.exit(2)
  else:
    # everything is fine
    show("api call OK")
  #"""

  # liitokset
  liitosmap = dict()
  for l in liitosresponse.json():
    liitosmap[l["organisaatio"]["oid"]] = l["kohde"]["oid"]
  liitosresponse = None

  oids = response.json()
  cnt = 0
  for o in oids:
    cnt+=1
    # show some sign of being alive
    if cnt%100 == 0:
      sys.stdout.write('.')
      sys.stdout.flush()
    if cnt%1000 == 0:
      show("-- %d" % (cnt))
    if verbose: show("%d -- %s"%(cnt,row))

    # make another requets to actual organization data
    try:
        r = requests.get(address+o, headers = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
        i = r.json()

        # make "row" (clear values)
        row = makerow()

        row["oid"] = o
        row["parentoid"] = jv(i,"parentOid")
        # liitokset
        row["liitosoid"] = liitosmap[o] if o in liitosmap else None

        # TODO does the order here matter? if multiple tyyppi's, what to do?
        if "tyypit" in i and "Koulutustoimija" in i["tyypit"]:
          row["tyyppi"] = "Koulutustoimija"
          row["koodi"] = jv(i,"ytunnus")
          if not row["koodi"]:
            row["koodi"] = jv(i,"virastotunnus") # alternatively try virastotunnus if ytunnus is missing
          if not row["koodi"]:
            row["tyyppi"] = None # cancel this organization from loading
        elif "tyypit" in i and "Oppilaitos" in i["tyypit"]:
          row["tyyppi"] = "Oppilaitos"
          row["koodi"] = jv(i,"oppilaitosKoodi")
          if "oppilaitosTyyppiUri" in i and i["oppilaitosTyyppiUri"]:
            row["oppilaitostyyppi"] = i["oppilaitosTyyppiUri"].replace("oppilaitostyyppi_","").replace("#1","")
            # => just code, text values separately
        elif "tyypit" in i and "Toimipiste" in i["tyypit"]:
          row["tyyppi"] = "Toimipiste"
          row["koodi"] = jv(i,"toimipistekoodi")
        elif "tyypit" in i and "Oppisopimustoimipiste" in i["tyypit"]:
          row["tyyppi"] = "Oppisopimustoimipiste"
          row["koodi"] = jv(i,"toimipistekoodi")
        elif "tyypit" in i and "Varhaiskasvatuksen toimipaikka" in i["tyypit"]:
          row["tyyppi"] = "Varhaiskasvatuksen toimipaikka"
          row["koodi"] = jv(i,"toimipistekoodi")
        # was current organization of type of interest
        if row["tyyppi"]:

          if "nimi" in i and i["nimi"]:
            row["nimi"] = jv(jv(i,"nimi"),"fi")
            row["nimi_sv"] = jv(jv(i,"nimi"),"sv")
            row["nimi_en"] = jv(jv(i,"nimi"),"en")
          row["alkupvm"] = jv(i,"alkuPvm")
          row["loppupvm"] = jv(i,"lakkautusPvm")

          if "kotipaikkaUri" in i and i["kotipaikkaUri"]:
            row["kotikunta"] = jv(i,"kotipaikkaUri").replace("kunta_","")
            # => just code, text values separately

          if "kieletUris" in i and i["kieletUris"]:
            # todo what if many?
            row["oppilaitoksenopetuskieli"] = i["kieletUris"][0].replace("oppilaitoksenopetuskieli_","").replace("#1","")
            # => just code, text values separately

          # address, first kayntiosoite and if not exists then postiosoite
          josoite = None
          if "kayntiosoite" in i:
            josoite = jv(i,"kayntiosoite")
            row["osoitetyyppi"] = "kayntiosoite"
          elif "postiosoite" in i:
            josoite = jv(i,"postiosoite")
            row["osoitetyyppi"] = "postiosoite"
          if josoite:
            row["osoite"] = jv(josoite,"osoite")
            row["postinumero"] = josoite["postinumeroUri"].replace("posti_","") if "postinumeroUri" in josoite and josoite["postinumeroUri"] else None
            row["postitoimipaikka"] = jv(josoite,"postitoimipaikka")


          if verbose: show(" %5d -- %s %s (%s)"%(cnt,row["tyyppi"],row["koodi"],row["nimi"]))
          dboperator.insert(hostname+url,schema,table,row)
          organisaatio_data.append(row)
    except ValueError as ve:
        print("ValueError: " + str(ve))
        print("vika: " + str(address) + " oid:" + str(o))

  dboperator.close()

  if verbose: show("ready")

def usage():
  print("""
usage: organisaatioluokitus.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] [-v|--verbose]

secure defaults to secure, so no actual use here!
hostname defaults to $OPINTOPOLKU then to "virkailija.opintopolku.fi"
url defaults to "/organisaatio-service/rest/organisaatio/"
schema defaults to $SCHEMA then to "sa"
table defaults to $TABLE then to "sa_organisaatioluokitus"
""")

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
  url = "/organisaatio-service/rest/organisaatio/"
  schema = os.getenv("SCHEMA") or "sa"
  table = os.getenv("TABLE") or "sa_organisaatioluokitus_light_test"
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"sH:u:e:t:v",["secure","hostname=","url=","schema=","table=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in  ("-H", "--hostname"): hostname = arg
    elif opt in ("-u", "--url"): url = arg
    elif opt in ("-e", "--schema"): schema = arg
    elif opt in ("-t", "--table"): table = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not hostname or not url or not schema or not table:
    usage()
    sys.exit(2)

  load(hostname,url,schema,table,verbose)

if __name__ == "__main__":
  main(sys.argv[1:])
