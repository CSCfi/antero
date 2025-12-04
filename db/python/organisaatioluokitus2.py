#!/usr/bin/python
# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8 :
"""
organisaatioluokitus

Fetch all organizations from Organisaatio Service from Opintopolku.
If organization has predefined matching value in "tyypit" (one of: Koulutustoimija, Oppilaitos or Toimipiste)
then include it in result set and fetch more information for it.

Koodi is in
- ytunnus for Koulutustoimija
- oppilaitosKoodi for Oppilaitos
- toimipistekoodi for Toimipiste.
"""
import sys, os, getopt
import geocoding
import json
import requests
from time import localtime, strftime
#from imp import reload
import importlib

#reload(sys)
importlib.reload(sys)
if sys.version_info < (3,0):
    sys.setdefaultencoding('utf-8')

import dbcommand
import dboperator

EXT_API_QUERY_CONFIDENCE_LIMIT = 0.6  # TODO: this needs more evaluation. What is the minimum acceptable confidence.

def makerow():
  return {
    'oid':None, 'koodi':None, 'nimi':None, 'nimi_sv':None, 'nimi_en':None, 'alkupvm':None, 'loppupvm':None,
    'tyyppi':None, 'parentoid':None, 'liitosoid':None,
    'kotikunta':None, 'oppilaitoksenopetuskieli':None,
    'oppilaitostyyppi':None,
    'osoitetyyppi':None, 'osoite':None, 'postinumero':None, 'postitoimipaikka':None,
    'latitude':None, 'longitude':None
  }

# get value from json
def jv(jsondata, key):
  if key in jsondata:
    return jsondata[key]
  return None
###  if key in jsondata:
###		if jsondata[key]=='':
###       return None
###       else:
###         return jsondata[key]
###     return None


def getmeta(i,tieto,kieli):
  for m in i["metadata"]:
    if m["kieli"] == kieli:
      return m[tieto]
  return None

def show(message):
  print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def get_osoite_array(osoite, postinumero, kunta):
  osoite_array = ["--address"]
  osoite_array.append(osoite + ", " + postinumero + ", " + kunta)
  return osoite_array

def get_kotikunta_by_kuntakoodi(koodi):
  try:
    r = requests.get("https://virkailija.opintopolku.fi/koodisto-service/rest/json/kunta/koodi/arvo/" + str(koodi),
                     headers={"Accept": "application/json", 'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
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

def check_if_coordinates_in_our_db(osoite, postinumero, postitoimipaikka):
  command = ("SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite='" + osoite +
             "' AND postinumero='" + postinumero + "' AND postitoimipaikka='" + postitoimipaikka + "'") \
             .encode('utf-8', 'ignore')  # unknown characters will be lost (ignored)

  result = dbcommand.load(command, "*", False)

  if len(result) > 0:  # the coordinates are found
      latitude = result[0]["latitude"]
      longitude = result[0]["longitude"]
      confidence = result[0]["confidence"]
  else:
      return {"coordinates_found": False, "latitude": None, "longitude": None, "confidence": None}

  return {"coordinates_found": True, "latitude": latitude, "longitude": longitude, "confidence": confidence}

def insert_coordinates_to_our_db(osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence):
  command = ("INSERT INTO [ANTERO].[sa].[sa_koordinaatit] (osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) VALUES ('" +
             osoite + "', '" + postinumero + "', '" + postitoimipaikka + "', '" + str(latitude) + "', '" + str(longitude) + "', '" + \
             str(api_result_confidence) + "')").encode('utf-8', 'ignore')

  dbcommand.load(command, "", False)

def coordinate_length_ok(latitude, longitude):
  """
  A valid coordinate should be a float of certain length (i.e. usually 8-9 characters including the dot).
  E.g. ['60.388098', '25.621308']
  Explicitly check the length of a float and discard clearly invalid coordinates. There seems to be an issue
  with some of the coordinates having a high confidence value, but the coordinate is still clearly wrong (too short).
  """
  if len(str(latitude)) > 6 and len(str(longitude)) > 6:
      return True
  return False

def fetch_coordinates_from_server(osoite_array):
  api_fetch_successful = False
  geocoding_api_answer = None

  try:
    geocoding_api_answer = geocoding.main(osoite_array)
    api_fetch_successful = True
  except Exception as e:
    print("Error: " + str(e))
    print("Osoite: " + ''.join(osoite_array))  # convert osoite_array to string
  except SystemExit:
    pass  # catch the sys.exit from geocoding. It prints the usage().

  return {"OK": api_fetch_successful, "result": geocoding_api_answer}

def get_and_set_coordinates(row):
  """
  nb! coordinates in another process! (see geocoding.py)
  In short:  geocoding.py translates given address to latitude/longitude -coordinates

  Geocoding eats the address in following format: ["--address", "Kadunnimi talon_numero [porras asunto], postinumero, kaupunki"]

  Geocoding returns:
  {'STATUS': 'OK', 'RESULT': {'latitude': 61.246893, 'longitude': 22.33108, 'confidence': 0.8}}

  OR if problems:
  {'STATUS': 'NOK', 'RESULT': "Error message"}

  --

  if there are commas (,) in osoite, use the part before the first comma
  e.g. "Fredrikinkatu 33 A, 2 krs" --> "Fredrikinkatu 33 A"
  """
  osoite_parsed = row["osoite"].split(",")[0]
  osoite_array = get_osoite_array(osoite_parsed, row["postinumero"], row["postitoimipaikka"])

  """
  First check if the coordinates are found in our database.
  """
  check_coordinates = check_if_coordinates_in_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"])
  if check_coordinates["coordinates_found"]:
    if float(check_coordinates["confidence"]) >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(check_coordinates["latitude"], check_coordinates["longitude"]):
      row["latitude"] = check_coordinates["latitude"]
      row["longitude"] = check_coordinates["longitude"]
    else:
        pass  # fetched result has too low confidence to be shown or the coordinate length-check failed

  else:
    """
    Coordinates not found in our database, fetch from external-API. First use "postitoimipaikka",
    if the result-confidence is too low, then use "kotikunta" instead.
    """
    query_result = fetch_coordinates_from_server(osoite_array)
    if query_result["OK"]:
      geocoding_api_answer = query_result["result"]

      if geocoding_api_answer["STATUS"] == "OK":
        api_result_confidence = geocoding_api_answer["RESULT"]["confidence"]

        kotikunta = get_kotikunta_by_kuntakoodi(row["kotikunta"])
        if api_result_confidence < EXT_API_QUERY_CONFIDENCE_LIMIT and kotikunta["OK"]:
          """
          Too low confidence. Fetch again, now with 'kotikunta' instead of 'postitoimipaikka'.
          """
          new_osoite_array = get_osoite_array(osoite_parsed, row["postinumero"], kotikunta["kunta"])
          query_result = fetch_coordinates_from_server(new_osoite_array)

          if query_result["OK"]:
            geocoding_api_answer = query_result["result"]

            if geocoding_api_answer["STATUS"] == "OK":
              api_result_confidence = geocoding_api_answer["RESULT"]["confidence"]
              latitude = geocoding_api_answer["RESULT"]["latitude"]
              longitude = geocoding_api_answer["RESULT"]["longitude"]

              if api_result_confidence >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(latitude, longitude):
                row["latitude"] = latitude
                row["longitude"] = longitude
              else:
                pass  # results not shown further

              insert_coordinates_to_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"], latitude, longitude, api_result_confidence)
            else:  # STATUS == NOK
              print("Error:", geocoding_api_answer["RESULT"].encode('utf-8', 'ignore'))

        else:  # First external-API fetching successful (=high confidence) or we don't have better info (kotikunta is not known!)
          latitude = geocoding_api_answer["RESULT"]["latitude"]
          longitude = geocoding_api_answer["RESULT"]["longitude"]

          if api_result_confidence >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(latitude, longitude):
            row["latitude"] = latitude
            row["longitude"] = longitude
          else:
            pass  # results not shown further

          insert_coordinates_to_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"], latitude, longitude, api_result_confidence)
      else:  # STATUS == NOK
        try:
            geo_error = geocoding_api_answer["RESULT"].encode('utf-8', 'ignore')
            print("Error: ", geo_error)
        except AttributeError as e :
            print ("AttributeError: ", e)

def load(secure,hostname,url,schema,table,verbose=False):
  if verbose: show("begin")

  # make "columnlist" (type has no meaning as we're not creating table)
  row = makerow()
  # setup dboperator so other calls work
  dboperator.columns(row)

  if verbose: show("empty %s.%s"%(schema,table))
  dboperator.empty(schema,table)

  # fetching could be as simple and fast as:
  """
  geturi = "v2/hae?aktiiviset=true&suunnitellut=true&lakkautetut=true&organisaatiotyyppi="
  tyyppis = [
    "Koulutustoimija",
    "Oppilaitos",
    "Toimipiste"
  ]
  cnt = 0
  for tyyppi in tyyppis:
    show("load from "+hostname+url+geturi+tyyppi)

    if secure:
      address = "https://"+hostname+url+geturi+tyyppi
    else:
      address = "http://"+hostname+url+geturi+tyyppi
  """
  # ... but results don't contain address information :(

  if secure:
    address = "https://"+hostname+url
  else:
    address = "http://"+hostname+url
  session = requests.Session()
  session.headers.update({
    'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'
    })
  #""" load from web
  show("load from "+address)

  try:
    # first create a "hash map" of liitokset
    #liitosresponse = requests.get(address+"v2/liitokset", headers = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
    # actual data
    #response = requests.get(address, headers = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
    liitosresponse = session.get(address + "v2/liitokset")
    response = session.get(address)
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
        #r = requests.get(address+o, headers = {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
        r = session.get(address + o)
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
            row["koodi"] = jv(i,"virastoTunnus") # alternatively try virastotunnus if ytunnus is missing
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
        elif "tyypit" in i and "Varhaiskasvatuksen jarjestaja" in i["tyypit"]:
          row["tyyppi"] = "Varhaiskasvatuksen järjestaja"
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
            # fix 7.10.2022 , replacing #1 didn't work anymore
            # if many fix
            uri_cnt=0
            for uri in  i["kieletUris"]:
                uri_cnt=uri_cnt+1

            if uri_cnt>1:
                row["oppilaitoksenopetuskieli"] = "3"
            else:
                kieli_tmp= i["kieletUris"][0].replace("oppilaitoksenopetuskieli_","")
                kieli_tmp=kieli_tmp.split("#")
                row["oppilaitoksenopetuskieli"] = kieli_tmp[0]

            # this is just for debugging with spyder
            # row["oppilaitoksenopetuskieliUris"]=i["kieletUris"]

            #row["oppilaitoksenopetuskieli"] = i["kieletUris"][0].replace("oppilaitoksenopetuskieli_","").replace("#1","")
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

            if (row["osoite"] != None and row["osoite"] != "" and row["postinumero"] != None and row["postinumero"] != ""
                and int(row["postinumero"]) != 0 and row["postitoimipaikka"] != None and row["postitoimipaikka"] != ""):
              get_and_set_coordinates(row)

          if verbose: show(" %5d -- %s %s (%s)"%(cnt,row["tyyppi"],row["koodi"],row["nimi"]))
          dboperator.insert(hostname+url,schema,table,row)
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
  table = os.getenv("TABLE") or "sa_organisaatioluokitus"
  verbose = False

  try:
    opts, args = getopt.getopt(argv,"sH:u:e:t:v",["secure","hostname=","url=","schema=","table=","verbose"])
  except getopt.GetoptError as err:
    print(err)
    usage()
    sys.exit(2)
  for opt, arg in opts:
    if opt in ("-s", "--secure"): secure=True
    elif opt in ("-H", "--hostname"): hostname = arg
    elif opt in ("-u", "--url"): url = arg
    elif opt in ("-e", "--schema"): schema = arg
    elif opt in ("-t", "--table"): table = arg
    elif opt in ("-v", "--verbose"): verbose = True
  if not hostname or not url or not schema or not table:
    usage()
    sys.exit(2)

  load(secure,hostname,url,schema,table,verbose)

if __name__ == "__main__":
  main(sys.argv[1:])
