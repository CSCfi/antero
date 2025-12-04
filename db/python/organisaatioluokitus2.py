#!/usr/bin/python3
# -*- coding: utf-8 -*-
"""
organisaatioluokitus2.py

Fetch all organizations from Organisaatio Service from Opintopolku.
Optimized for:
- Batch inserts
- Safe SQL string handling
- Parallel geocoding
- Session reuse
"""
import sys
import os
import getopt
import requests
from time import localtime, strftime
from concurrent.futures import ThreadPoolExecutor

import geocoding
import dbcommand
import dboperator

EXT_API_QUERY_CONFIDENCE_LIMIT = 0.6  # minimum acceptable confidence
BATCH_SIZE = 100  # smaller batch for safe testing


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
    return jsondata.get(key) if jsondata else None


def show(message):
    print(strftime("%Y-%m-%d %H:%M:%S", localtime()) + " " + message)


def get_osoite_array(osoite, postinumero, kunta):
    return ["--address", f"{osoite}, {postinumero}, {kunta}"]


def get_kotikunta_by_kuntakoodi(koodi):
    try:
        r = requests.get(
            f"https://virkailija.opintopolku.fi/koodisto-service/rest/json/kunta/koodi/arvo/{koodi}",
            headers={"Accept": "application/json",
                     'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
        )
        result_json = r.json()
        if r.status_code == 200 and result_json:
            for m in result_json[0].get("metadata", []):
                if m.get("kieli") == "FI":
                    return {"OK": True, "kunta": m.get("nimi")}
            return {"OK": True, "kunta": result_json[0]["metadata"][0].get("nimi")}
    except Exception as e:
        print(f"Error fetching kotikunta for koodi {koodi}: {e}")
    return {"OK": False, "kunta": None}


def check_if_coordinates_in_our_db(osoite, postinumero, postitoimipaikka):
    safe_osoite = osoite.replace("'", "''")
    command = f"SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite='{safe_osoite}' AND postinumero='{postinumero}' AND postitoimipaikka='{postitoimipaikka}'"
    result = dbcommand.load(command.encode('utf-8', 'ignore'), "*", False)
    if result:
        return {"coordinates_found": True, "latitude": result[0]["latitude"], "longitude": result[0]["longitude"],
                "confidence": result[0]["confidence"]}
    return {"coordinates_found": False, "latitude": None, "longitude": None, "confidence": None}


def insert_coordinates_to_our_db(osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence):
    safe_osoite = osoite.replace("'", "''")
    command = f"INSERT INTO [ANTERO].[sa].[sa_koordinaatit] (osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) VALUES ('{safe_osoite}', '{postinumero}', '{postitoimipaikka}', {latitude}, {longitude}, {api_result_confidence})"
    dbcommand.load(command.encode('utf-8', 'ignore'), "", False)


def coordinate_length_ok(latitude, longitude):
    return len(str(latitude)) > 6 and len(str(longitude)) > 6


def fetch_coordinates_from_server(osoite_array):
    try:
        result = geocoding.main(osoite_array)
        return {"OK": True, "result": result}
    except Exception as e:
        print(f"Error geocoding address {''.join(osoite_array)}: {e}")
    return {"OK": False, "result": None}


def get_and_set_coordinates_parallel(row):
    try:
        osoite_parsed = row["osoite"].split(",")[0]
        osoite_array = get_osoite_array(osoite_parsed, row["postinumero"], row["postitoimipaikka"])
        check_coordinates = check_if_coordinates_in_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"])
        if check_coordinates["coordinates_found"]:
            if float(check_coordinates["confidence"]) >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(
                    check_coordinates["latitude"], check_coordinates["longitude"]):
                row["latitude"] = check_coordinates["latitude"]
                row["longitude"] = check_coordinates["longitude"]
            return row
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
    except Exception as e:
        print(f"Error in get_and_set_coordinates_parallel for row {row.get('oid', '')}: {e}")
    return row


def load(secure, hostname, url, schema, table, verbose=False):
    if verbose:
        show("begin")

    row = makerow()
    dboperator.columns(row)
    if verbose:
        show(f"empty {schema}.{table}")
    dboperator.empty(schema, table)

    address = f"https://{hostname}{url}" if secure else f"http://{hostname}{url}"
    session = requests.Session()
    session.headers.update({'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
    show("load from " + address)

    try:
        liitosresponse = session.get(address + "v2/liitokset")
        response = session.get(address)
    except Exception as e:
        show('HTTP GET failed: ' + str(e))
        sys.exit(2)
    else:
        show("API call OK")

    liitosmap = {l["organisaatio"]["oid"]: l["kohde"]["oid"] for l in liitosresponse.json()}
    oids = response.json()

    rows_to_insert = []
    for cnt, o in enumerate(oids, 1):
        if cnt % 100 == 0:
            sys.stdout.write('.')
            sys.stdout.flush()
        if cnt % 1000 == 0:
            show(f"-- {cnt}")
        try:
            i = session.get(address + o).json()
            row = makerow()
            row["oid"] = o
            row["parentoid"] = jv(i, "parentOid")
            row["liitosoid"] = liitosmap.get(o)
            # determine type
            if "tyypit" in i:
                if "Koulutustoimija" in i["tyypit"]:
                    row["tyyppi"] = "Koulutustoimija"
                    row["koodi"] = jv(i, "ytunnus") or jv(i, "virastoTunnus")
                    if not row["koodi"]:
                        row["tyyppi"] = None
                elif "Oppilaitos" in i["tyypit"]:
                    row["tyyppi"] = "Oppilaitos"
                    row["koodi"] = jv(i, "oppilaitosKoodi")
                    if i.get("oppilaitosTyyppiUri"):
                        row["oppilaitostyyppi"] = i["oppilaitosTyyppiUri"].replace("oppilaitostyyppi_", "").replace("#1", "")
            if row["tyyppi"]:
                if "nimi" in i and i["nimi"]:
                    row["nimi"] = jv(i["nimi"], "fi")
                    row["nimi_sv"] = jv(i["nimi"], "sv")
                    row["nimi_en"] = jv(i["nimi"], "en")
                row["alkupvm"] = jv(i, "alkuPvm")
                row["loppupvm"] = jv(i, "lakkautusPvm")
                if "kotipaikkaUri" in i and i["kotipaikkaUri"]:
                    row["kotikunta"] = jv(i, "kotipaikkaUri").replace("kunta_", "")
                rows_to_insert.append(row)
        except Exception as ve:
            print(f"Error processing OID {o}: {ve}")

    # --- parallel geocoding ---
    def geocode_row(row):
        if row.get("osoite") and row.get("postinumero") and row.get("postitoimipaikka"):
            return get_and_set_coordinates_parallel(row)
        return row

    with ThreadPoolExecutor(max_workers=10) as executor:
        geocoded_rows = list(executor.map(geocode_row, rows_to_insert))

    # batch insert
    for i in range(0, len(geocoded_rows), BATCH_SIZE):
        batch = geocoded_rows[i:i + BATCH_SIZE]
        dboperator.insertMany(hostname + url, schema, table, batch)
    dboperator.close()
    show("ready")


def usage():
    print("""
usage: organisaatioluokitus.py [-s|--secure] [-H|--hostname <hostname>] [-u|--url <url>] [-e|--schema <schema>] [-t|--table <table>] [-v|--verbose]
""")


def main(argv):
    secure = True
    hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
    url = "/organisaatio-service/rest/organisaatio/"
    schema = os.getenv("SCHEMA") or "sa"
    table = os.getenv("TABLE") or "sa_organisaatioluokitus"
    verbose = False

    try:
        opts, args = getopt.getopt(argv, "sH:u:e:t:v", ["secure", "hostname=", "url=", "schema=", "table=", "verbose"])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)

    for opt, arg in opts:
        if opt in ("-s", "--secure"):
            secure = True
        elif opt in ("-H", "--hostname"):
            hostname = arg
        elif opt in ("-u", "--url"):
            url = arg
        elif opt in ("-e", "--schema"):
            schema = arg
        elif opt in ("-t", "--table"):
            table = arg
        elif opt in ("-v", "--verbose"):
            verbose = True

    load(secure, hostname, url, schema, table, verbose)


if __name__ == "__main__":
    main(sys.argv[1:])
