#!/usr/bin/python

# -*- encoding: utf-8 -*-

# vim: set fileencoding=utf-8 :

"""
organisaatioluokitus

Fetch all organizations from Organisaatio Service from Opintopolku.
If organization has predefined matching value in "tyypit" (one of: Koulutustoimija, Oppilaitos or Toimipiste)
then include it in result set and fetch more information for it.

Optimized with:

* Session reuse
* Parallel geocoding
* Batch inserts
  """
import sys, os, getopt
import geocoding
import json
import requests
from time import localtime, strftime
import importlib
from concurrent.futures import ThreadPoolExecutor

import dbcommand
import dboperator

EXT_API_QUERY_CONFIDENCE_LIMIT = 0.6  # minimum acceptable confidence

def makerow():
return {
'oid':None, 'koodi':None, 'nimi':None, 'nimi_sv':None, 'nimi_en':None, 'alkupvm':None, 'loppupvm':None,
'tyyppi':None, 'parentoid':None, 'liitosoid':None,
'kotikunta':None, 'oppilaitoksenopetuskieli':None,
'oppilaitostyyppi':None,
'osoitetyyppi':None, 'osoite':None, 'postinumero':None, 'postitoimipaikka':None,
'latitude':None, 'longitude':None
}

def jv(jsondata, key):
if key in jsondata:
return jsondata[key]
return None

def getmeta(i,tieto,kieli):
for m in i["metadata"]:
if m["kieli"] == kieli:
return m[tieto]
return None

def show(message):
print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def get_osoite_array(osoite, postinumero, kunta):
return ["--address", osoite + ", " + postinumero + ", " + kunta]

def get_kotikunta_by_kuntakoodi(koodi):
try:
r = requests.get(
f"[https://virkailija.opintopolku.fi/koodisto-service/rest/json/kunta/koodi/arvo/{koodi}](https://virkailija.opintopolku.fi/koodisto-service/rest/json/kunta/koodi/arvo/{koodi})",
headers={"Accept": "application/json", 'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
)
result_json = r.json()
except Exception as e:
print(f"Error fetching kotikunta for koodi {koodi}: {e}")
return {"OK": False, "kunta": None}

```
if r.status_code == 200:
    for i in result_json[0]["metadata"]:
        if i["kieli"] == "FI":
            return {"OK": True, "kunta": i["nimi"]}
    return {"OK": True, "kunta": result_json[0]["metadata"][0]["nimi"]}
return {"OK": False, "kunta": None}
```

def check_if_coordinates_in_our_db(osoite, postinumero, postitoimipaikka):
command = ("SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite='" + osoite +
"' AND postinumero='" + postinumero + "' AND postitoimipaikka='" + postitoimipaikka + "'").encode('utf-8', 'ignore')
result = dbcommand.load(command, "*", False)
if result:
return {"coordinates_found": True, "latitude": result[0]["latitude"], "longitude": result[0]["longitude"], "confidence": result[0]["confidence"]}
return {"coordinates_found": False, "latitude": None, "longitude": None, "confidence": None}

def insert_coordinates_to_our_db(osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence):
command = ("INSERT INTO [ANTERO].[sa].[sa_koordinaatit] (osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) VALUES ('" +
osoite + "', '" + postinumero + "', '" + postitoimipaikka + "', '" + str(latitude) + "', '" + str(longitude) + "', '" +
str(api_result_confidence) + "')").encode('utf-8', 'ignore')
dbcommand.load(command, "", False)

def coordinate_length_ok(latitude, longitude):
return len(str(latitude)) > 6 and len(str(longitude)) > 6

def fetch_coordinates_from_server(osoite_array):
try:
result = geocoding.main(osoite_array)
return {"OK": True, "result": result}
except Exception as e:
print(f"Error: {e}, address: {''.join(osoite_array)}")
return {"OK": False, "result": None}
except SystemExit:
return {"OK": False, "result": None}

def get_and_set_coordinates_parallel(row):
osoite_parsed = row["osoite"].split(",")[0]
osoite_array = get_osoite_array(osoite_parsed, row["postinumero"], row["postitoimipaikka"])

```
check_coordinates = check_if_coordinates_in_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"])
if check_coordinates["coordinates_found"]:
    if float(check_coordinates["confidence"]) >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(check_coordinates["latitude"], check_coordinates["longitude"]):
        row["latitude"] = check_coordinates["latitude"]
        row["longitude"] = check_coordinates["longitude"]
    return row

# first try with postitoimipaikka
result = fetch_coordinates_from_server(osoite_array)
if result["OK"] and result["result"]["STATUS"] == "OK":
    res = result["result"]["RESULT"]
    api_conf = res["confidence"]
    lat = res["latitude"]
    lon = res["longitude"]
    if api_conf >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(lat, lon):
        row["latitude"] = lat
        row["longitude"] = lon
    insert_coordinates_to_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"], lat, lon, api_conf)
    if api_conf >= EXT_API_QUERY_CONFIDENCE_LIMIT:
        return row

kotikunta_info = get_kotikunta_by_kuntakoodi(row["kotikunta"])
if kotikunta_info["OK"]:
    new_osoite_array = get_osoite_array(osoite_parsed, row["postinumero"], kotikunta_info["kunta"])
    result = fetch_coordinates_from_server(new_osoite_array)
    if result["OK"] and result["result"]["STATUS"] == "OK":
        res = result["result"]["RESULT"]
        api_conf = res["confidence"]
        lat = res["latitude"]
        lon = res["longitude"]
        if api_conf >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(lat, lon):
            row["latitude"] = lat
            row["longitude"] = lon
        insert_coordinates_to_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"], lat, lon, api_conf)
return row
```

def load(secure,hostname,url,schema,table,verbose=False):
if verbose: show("begin")
row = makerow()
dboperator.columns(row)
if verbose: show(f"empty {schema}.{table}")
dboperator.empty(schema,table)

```
address = f"https://{hostname}{url}" if secure else f"http://{hostname}{url}"
session = requests.Session()
session.headers.update({'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
show("load from "+address)

try:
    liitosresponse = session.get(address + "v2/liitokset")
    response = session.get(address)
except Exception as e:
    show('HTTP GET failed.')
    show('Reason: %s'%(str(e)))
    sys.exit(2)
else:
    show("api call OK")

liitosmap = {l["organisaatio"]["oid"]: l["kohde"]["oid"] for l in liitosresponse.json()}

oids = response.json()
rows_to_insert = []
cnt = 0
for o in oids:
    cnt += 1
    if cnt % 100 == 0:
        sys.stdout.write('.')
        sys.stdout.flush()
    if cnt % 1000 == 0:
        show("-- %d" % (cnt))

    try:
        r = session.get(address + o)
        i = r.json()
        row = makerow()
        row["oid"] = o
        row["parentoid"] = jv(i,"parentOid")
        row["liitosoid"] = liitosmap[o] if o in liitosmap else None

        if "tyypit" in i and "Koulutustoimija" in i["tyypit"]:
            row["tyyppi"] = "Koulutustoimija"
            row["koodi"] = jv(i,"ytunnus") or jv(i,"virastoTunnus")
            if not row["koodi"]: row["tyyppi"] = None
        elif "tyypit" in i and "Oppilaitos" in i["tyypit"]:
            row["tyyppi"] = "Oppilaitos"
            row["koodi"] = jv(i,"oppilaitosKoodi")
            if "oppilaitosTyyppiUri" in i and i["oppilaitosTyyppiUri"]:
                row["oppilaitostyyppi"] = i["oppilaitosTyyppiUri"].replace("oppilaitostyyppi_","").replace("#1","")
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

        if row["tyyppi"]:
            if "nimi" in i and i["nimi"]:
                row["nimi"] = jv(jv(i,"nimi"),"fi")
                row["nimi_sv"] = jv(jv(i,"nimi"),"sv")
                row["nimi_en"] = jv(jv(i,"nimi"),"en")
            row["alkupvm"] = jv(i,"alkuPvm")
            row["loppupvm"] = jv(i,"lakkautusPvm")
            if "kotipaikkaUri" in i and i["kotipaikkaUri"]:
                row["kotikunta"] = jv(i,"kotipaikkaUri").replace("kunta_","")
            if "kieletUris" in i and i["kieletUris"]:
                row["oppilaitoksenopetuskieli"] = "3" if len(i["kieletUris"])>1 else i["kieletUris"][0].replace("oppilaitoksenopetuskieli_","").split("#")[0]

            josoite = jv(i,"kayntiosoite") if "kayntiosoite" in i else jv(i,"postiosoite") if "postiosoite" in i else None
            if josoite:
                row["osoitetyyppi"] = "kayntiosoite" if "kayntiosoite" in i else "postiosoite"
                row["osoite"] = jv(josoite,"osoite")
                row["postinumero"] = josoite["postinumeroUri"].replace("posti_","") if "postinumeroUri" in josoite and josoite["postinumeroUri"] else None
                row["postitoimipaikka"] = jv(josoite,"postitoimipaikka")
            rows_to_insert.append(row)

    except ValueError as ve:
        print("ValueError: " + str(ve))
        print("OID: " + str(o))

# --- parallel geocoding ---
def geocode_row(row):
    if row.get("osoite") and row.get("postinumero") and row.get("postitoimipaikka"):
        return get_and_set_coordinates_parallel(row)
    return row

with ThreadPoolExecutor(max_workers=10) as executor:
    geocoded_rows = list(executor.map(geocode_row, rows_to_insert))

# batch insert
dboperator.insertMany(hostname+url, schema, table, geocoded_rows)
dboperator.close()
show("ready")
```

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
secure = True
hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
url = "/organisaatio-service/rest/organisaatio/"
schema = os.getenv("SCHEMA") or "sa"
table = os.getenv("TABLE") or "sa_organisaatioluokitus"
verbose = False

```
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
```

if **name** == "**main**":
main(sys.argv[1:])
