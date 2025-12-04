#!/usr/bin/python3
# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8 :

"""
organisaatioluokitus - batch insert version using new /api/ endpoints with dynamic muutetut fetching
Optimized liitokset fetching: only include relevant OIDs to minimize processing.
"""

import sys, os, getopt
import requests
from time import localtime, strftime

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

    sql = "SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite=%s AND postinumero=%s AND postitoimipaikka=%s"
    params = (osoite_parsed, postinumero, postitoimipaikka)
    result = dbcommand.load(sql, params)

    if result:
        lat = result[0]["latitude"]
        lon = result[0]["longitude"]
        conf = result[0]["confidence"]
        if float(conf) >= EXT_API_QUERY_CONFIDENCE_LIMIT:
            row["latitude"] = lat
            row["longitude"] = lon
        return

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
            sql_insert = (
                "INSERT INTO [ANTERO].[sa].[sa_koordinaatit] "
                "(osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) "
                "VALUES (%s, %s, %s, %s, %s, %s)"
            )
            params_insert = (osoite_parsed, postinumero, postitoimipaikka, lat, lon, conf)
            dbcommand.execute(sql_insert, params_insert)
    except Exception as e:
        show(f"Geocoding failed for {full_address}: {e}")

def extract_address(org_json):
    osoite = postinumero = postitoimipaikka = osoitetyyppi = None

    kaynti = org_json.get("kayntiosoite")
    if kaynti:
        osoite = kaynti.get("osoite")
        postinumero = kaynti.get("postinumero", "").split("_")[-1] if kaynti.get("postinumero") else None
        postitoimipaikka = kaynti.get("postitoimipaikka")
        osoitetyyppi = kaynti.get("osoitetyyppi")
        return osoite, postinumero, postitoimipaikka, osoitetyyppi

    for y in org_json.get("yhteystiedot", []):
        if y.get("osoitetyyppi") == "kaynti":
            osoite = y.get("osoite")
            postinumero = y.get("postinumero", "").split("_")[-1] if y.get("postinumero") else None
            postitoimipaikka = y.get("postitoimipaikka")
            osoitetyyppi = y.get("osoitetyyppi")
            return osoite, postinumero, postitoimipaikka, osoitetyyppi

    kaynti = org_json.get("postiosoite")
    if kaynti:
        osoite = kaynti.get("osoite")
        postinumero = kaynti.get("postinumero", "").split("_")[-1] if kaynti.get("postinumero") else None
        postitoimipaikka = kaynti.get("postitoimipaikka")
        osoitetyyppi = kaynti.get("osoitetyyppi")
        return osoite, postinumero, postitoimipaikka, osoitetyyppi

    for y in org_json.get("yhteystiedot", []):
        if y.get("osoitetyyppi") == "posti":
            osoite = y.get("osoite")
            postinumero = y.get("postinumero", "").split("_")[-1] if y.get("postinumero") else None
            postitoimipaikka = y.get("postitoimipaikka")
            osoitetyyppi = y.get("osoitetyyppi")
            return osoite, postinumero, postitoimipaikka, osoitetyyppi

    return osoite, postinumero, postitoimipaikka, osoitetyyppi

def load(secure, hostname, baseurl, schema, table):
    protocol = "https://"
    root = protocol + hostname + baseurl
    print(root)
    try:
        sql = "SELECT CONVERT(varchar(10), DATEADD(day,-2,MAX(loadtime)),120) AS lastdate FROM sa.sa_organisaatioluokitus"
        print(sql)
        result = dbcommand.load(sql)
        print(result)
        lastdate = str(result[0]["lastdate"]) if result and result[0].get("lastdate") else "2025-12-01"
        if not lastdate:
            lastdate = "2025-12-01"
    except Exception as e:
        show(f"ERROR: Could not get last load date, szet defaul '2025-12-01'")
        lastdate="2025-12-01"

    with requests.Session() as session:
        session.headers.update({
            'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'
        })

        show(f"Fetching changed OIDs since {lastdate}…")
        muutetut_url = f"{root}muutetut?lastModifiedSince={lastdate}&includeImage=false&excludeDiscontinued=false"
        try:
            response = session.get(muutetut_url, timeout=10)
            response.raise_for_status()
            muutetut_data = response.json()
            oids = [org["oid"] for org in muutetut_data.get("organisaatiot", [])]
        except Exception as e:
            show(f"ERROR: Could not fetch changed OIDs ({e})")
            sys.exit(1)

        if not oids:
            show("No updated organizations to process. Exiting.")
            return

        show("Fetching relevant liitokset…")
        liitokset_url = root + "liitokset"
        try:
            liitokset_resp = session.get(liitokset_url, timeout=10)
            liitokset_data = liitokset_resp.json()
            if isinstance(liitokset_data, dict) and "liitokset" in liitokset_data:
                liitokset_raw = liitokset_data["liitokset"]
            elif isinstance(liitokset_data, list):
                liitokset_raw = liitokset_data
            else:
                show("WARNING: Unknown liitokset format, setting all liitosoid=None")
                liitokset_raw = []
        except Exception as e:
            show(f"WARNING: Liitokset fetch failed ({e}), setting all liitosoid=None")
            liitokset_raw = []

        liitosmap = {}
        for l in liitokset_raw:
            oid_a = l.get("organisaatioOid") or l.get("organisaatio", {}).get("oid")
            oid_b = l.get("kohdeOid") or l.get("kohde", {}).get("oid")
            if oid_a in oids and oid_b:
                liitosmap[oid_a] = oid_b

        row = makerow()
        dboperator.columns(row)
        dboperator.empty(schema, table)

        batch_rows = []
        cnt = 0

        for oid in oids:
            cnt += 1
            if cnt % 100 == 0:
                sys.stdout.write('.')
                sys.stdout.flush()

            try:
                r = session.get(root + oid, timeout=10)
                i = r.json()

                row = makerow()
                row["oid"] = oid
                row["parentoid"] = jv(i, "parentOid")
                row["liitosoid"] = liitosmap.get(oid)

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

                if "nimi" in i:
                    row["nimi"] = i["nimi"].get("fi")
                    row["nimi_sv"] = i["nimi"].get("sv")
                    row["nimi_en"] = i["nimi"].get("en")

                row["alkupvm"] = jv(i, "alkuPvm")
                row["loppupvm"] = jv(i, "lakkautusPvm")
                row["kotikunta"] = jv(i, "kotipaikka")
                if "opetuskielet" in i:
                    row["oppilaitoksenopetuskieli"] = ",".join(i["opetuskielet"])

                osoite, postinumero, postitoimipaikka, tyyppi = extract_address(i)
                row["osoite"] = osoite
                row["postinumero"] = postinumero
                row["postitoimipaikka"] = postitoimipaikka
                row["osoitetyyppi"] = tyyppi

                get_and_set_coordinates(row)

                batch_rows.append(row)

                if len(batch_rows) >= BATCH_SIZE:
                    dboperator.insertMany("opintopolku", schema, table, batch_rows)
                    batch_rows = []

            except Exception as e:
                show(f"Error processing {oid}: {e}")

        if batch_rows:
            dboperator.insertMany("opintopolku", schema, table, batch_rows)

        show("DONE.")

def usage():
    print("Usage: python3 script.py [-s] [-H hostname] [-u url] [-e schema] [-t table] [-v]")
    print("  -s, --secure     Use HTTPS (default)")
    print("  -H, --hostname   API hostname")
    print("  -u, --url        Base API path (e.g., /organisaatio-service/api/)")
    print("  -e, --schema     Database schema")
    print("  -t, --table      Database table")
    print("  -v, --verbose    Verbose mode")

def main(argv):
    secure = True
    hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
    url = "/organisaatio-service/api/"
    schema = os.getenv("SCHEMA") or "sa"
    table = os.getenv("TABLE") or "sa_organisaatioluokitus"

    try:
        opts, args = getopt.getopt(argv,"sH:u:e:t:v",["secure","hostname=","url=","schema=","table=","verbose"])
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

    load(secure, hostname, url, schema, table)

if __name__ == "__main__":
    main(sys.argv[1:])
