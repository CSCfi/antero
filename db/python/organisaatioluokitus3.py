#!/usr/bin/python3
# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8 :

"""
organisaatioluokitus - batch insert version using new /api/ endpoints

Fetch all organizations from the Organisaatio Service API.
Uses /api/oids, /api/liitokset, /api/{oid}.
Addresses: uses kayntiosoite if available, else falls back to yhteystiedot[kaynti].
"""

import sys, os , getopt
import requests
from time import localtime, strftime
import argparse

import dbcommand
import dboperator
import geocoding_v2 as geocoding

EXT_API_QUERY_CONFIDENCE_LIMIT = 0.6
BATCH_SIZE = 1000

def makerow():
    return {
        'oid': None, 'koodi': None, 'nimi': None, 'nimi_sv': None, 'nimi_en': None,
        'alkupvm': None, 'loppupvm': None,
        'tyyppi': None, 'parentoid': None, 'liitosoid': None,
        'kotikunta': None, 'oppilaitoksenopetuskieli': None,
        'oppilaitostyyppi': None,
        'osoitetyyppi': None, 'osoite': None, 'postinumero': None, 'postitoimipaikka': None,
        'latitude': None, 'longitude': None
    }

def jv(jsondata, key):
    return jsondata.get(key)

def show(message):
    print(strftime("%Y-%m-%d %H:%M:%S", localtime()) + " " + message)

def get_and_set_coordinates(row):
    osoite_parsed = row["osoite"].split(",")[0] if row["osoite"] else ""
    postinumero = row["postinumero"] or ""
    postitoimipaikka = row["postitoimipaikka"] or ""

    if not (osoite_parsed and postinumero and postitoimipaikka):
        return

    # Check cache DB
    command = (
        "SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite=%s AND postinumero=%s AND postitoimipaikka=%s",
        (osoite_parsed, postinumero, postitoimipaikka)
    )
    result = dbcommand.load(command, "*", False)

    if result:
        lat = result[0]["latitude"]
        lon = result[0]["longitude"]
        conf = result[0]["confidence"]
        if float(conf) >= EXT_API_QUERY_CONFIDENCE_LIMIT:
            row["latitude"] = lat
            row["longitude"] = lon
        return

    # External geocoding
    full_address = f"{osoite_parsed}, {postinumero}, {postitoimipaikka}"
    try:
        geo = geocoding.main(["-A", full_address])
        if geo["STATUS"] == "OK":
            lat = geo["RESULT"]["latitude"]
            lon = geo["RESULT"]["longitude"]
            conf = geo["RESULT"].get("confidence", 1)
            if conf >= EXT_API_QUERY_CONFIDENCE_LIMIT:
                row["latitude"] = lat
                row["longitude"] = lon
            # Save to DB
            command = (
                "INSERT INTO [ANTERO].[sa].[sa_koordinaatit] "
                "(osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) "
                "VALUES (%s, %s, %s, %s, %s, %s)",
                (osoite_parsed, postinumero, postitoimipaikka, lat, lon, conf)
            )
            dbcommand.load(command, "", False)
    except Exception as e:
        show(f"Geocoding failed for {full_address}: {e}")

def extract_address(org_json):
    osoite = postinumero = postitoimipaikka = osoitetyyppi = None

    # 1. Kayntiosoite
    kaynti = org_json.get("kayntiosoite")
    if kaynti:
        osoite = kaynti.get("osoite")
        postinumero = kaynti.get("postinumero", "").split("_")[-1] if kaynti.get("postinumero") else None
        postitoimipaikka = kaynti.get("postitoimipaikka")
        osoitetyyppi = kaynti.get("osoitetyyppi")
        return osoite, postinumero, postitoimipaikka, osoitetyyppi

    # 2. Yhteystiedot kaynti
    for y in org_json.get("yhteystiedot", []):
        if y.get("osoitetyyppi") == "kaynti":
            osoite = y.get("osoite")
            postinumero = y.get("postinumero", "").split("_")[-1] if y.get("postinumero") else None
            postitoimipaikka = y.get("postitoimipaikka")
            osoitetyyppi = y.get("osoitetyyppi")
            return osoite, postinumero, postitoimipaikka, osoitetyyppi

    # 3. Yhteystiedot posti
    for y in org_json.get("yhteystiedot", []):
        if y.get("osoitetyyppi") == "posti":
            osoite = y.get("osoite")
            postinumero = y.get("postinumero", "").split("_")[-1] if y.get("postinumero") else None
            postitoimipaikka = y.get("postitoimipaikka")
            osoitetyyppi = y.get("osoitetyyppi")
            return osoite, postinumero, postitoimipaikka, osoitetyyppi

    return osoite, postinumero, postitoimipaikka, osoitetyyppi

def load(secure, hostname, baseurl, schema, table, verbose=False):
    protocol = "https://"
    root = protocol + hostname + baseurl

    # --- 1. All OIDs ---
    show("Fetching OIDs…")
    oids = requests.get(root + "oids",
                        headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}).json()

    # --- 2. Liitokset ---
    show("Fetching liitokset…")
    try:
        liitokset_resp = requests.get(root + "liitokset",
                                     headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
        liitokset_data = liitokset_resp.json()
        if isinstance(liitokset_data, dict) and "liitokset" in liitokset_data:
            liitokset_raw = liitokset_data["liitokset"]
        elif isinstance(liitokset_data, list):
            liitokset_raw = liitokset_data
        else:
            show(f"WARNING: Unknown liitokset format, setting all liitosoid=None")
            liitokset_raw = []
    except Exception as e:
        show(f"WARNING: Liitokset fetch failed ({e}), setting all liitosoid=None")
        liitokset_raw = []

    liitosmap = {}
    for l in liitokset_raw:
        oid_a = l.get("organisaatioOid") or l.get("organisaatio", {}).get("oid")
        oid_b = l.get("kohdeOid") or l.get("kohde", {}).get("oid")
        if oid_a and oid_b:
            liitosmap[oid_a] = oid_b

    # --- Prepare table ---
    row = makerow()
    dboperator.columns(row)
    dboperator.empty(schema, table)

    batch_rows = []
    cnt = 0

    # --- 3. Process each OID ---
    for oid in oids:
        cnt += 1
        if cnt % 100 == 0:
            sys.stdout.write('.')
            sys.stdout.flush()

        try:
            r = requests.get(root + oid,
                             headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
            i = r.json()

            row = makerow()
            row["oid"] = oid
            row["parentoid"] = jv(i, "parentOid")
            row["liitosoid"] = liitosmap.get(oid)

            # types
            tyypit = jv(i, "tyypit") or []

            if "Koulutustoimija" in tyypit:
                row["tyyppi"] = "Koulutustoimija"
                row["koodi"] = jv(i, "ytunnus") or jv(i, "virastoTunnus")
            elif "Oppilaitos" in tyypit:
                row["tyyppi"] = "Oppilaitos"
                row["koodi"] = jv(i, "oppilaitosKoodi")
                if "oppilaitosTyyppi" in i:
                    row["oppilaitostyyppi"] = i["oppilaitosTyyppi"]
            elif "Toimipiste" in tyypit:
                row["tyyppi"] = "Toimipiste"
                row["koodi"] = jv(i, "toimipistekoodi")
            if not row["tyyppi"]:
                continue

            # Names
            if "nimi" in i:
                row["nimi"] = i["nimi"].get("fi")
                row["nimi_sv"] = i["nimi"].get("sv")
                row["nimi_en"] = i["nimi"].get("en")

            row["alkupvm"] = jv(i, "alkuPvm")
            row["loppupvm"] = jv(i, "lakkautusPvm")
            row["kotikunta"] = jv(i, "kotipaikka")
            if "opetuskielet" in i:
                row["oppilaitoksenopetuskieli"] = ",".join(i["opetuskielet"])

            # Address extraction
            osoite, postinumero, postitoimipaikka, tyyppi = extract_address(i)
            row["osoite"] = osoite
            row["postinumero"] = postinumero
            row["postitoimipaikka"] = postitoimipaikka
            row["osoitetyyppi"] = tyyppi

            # Coordinates
            get_and_set_coordinates(row)

            batch_rows.append(row)

            if len(batch_rows) >= BATCH_SIZE:
                dboperator.insertMany("opintopolku", schema, table, batch_rows)
                batch_rows = []

        except Exception as e:
            show(f"Error processing {oid}: {e}")

    # Insert remaining
    if batch_rows:
        dboperator.insertMany("opintopolku", schema, table, batch_rows)

    show("DONE.")

def main(argv):
  # variables from arguments with possible defaults
  secure = True # default secure, so always secure!
  hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
  url = "/organisaatio-service/api/"
  schema = os.getenv("SCHEMA") or "sa"
  table = os.getenv("TABLE") or "sa_organisaatioluokitus_phase1"
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
