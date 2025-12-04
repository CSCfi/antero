#!/usr/bin/python3
# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8 :
"""
organisaatioluokitus_batch

Fetch all organizations from Organisaatio Service from Opintopolku.
Includes batch inserts to handle large datasets safely.

Optimized with:
- Session reuse
- Parallel geocoding
- Batch inserts every 1000 rows
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
BATCH_SIZE = 1000  # number of rows per DB insert


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
    command = ("SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite='" + osoite +
               "' AND postinumero='" + postinumero + "' AND postitoimipaikka='" + postitoimipaikka + "'").encode('utf-8', 'ignore')
    result = dbcommand.load(command, "*", False)
    if result:
        return {"coordinates_found": True, "latitude": result[0]["latitude"], "longitude": result[0]["longitude"],
                "confidence": result[0]["confidence"]}
    return {"coordinates_found": False, "latitude": None, "longitude": None, "confidence": None}


def insert_coordinates_to_our_db(osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence):
    command = ("INSERT INTO [ANTERO].[sa].[sa_koordinaatit] (osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) VALUES ('" +
               osoite + "', '" + postinumero + "', '" + postitoimipaikka + "', '" + str(latitude) + "', '" + str(
                   longitude) + "', '" +
               str(api_result_confidence) + "')").encode('utf-8', 'ignore')
    dbcommand.load(command, "", False)


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
            insert_coordinates_to_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"], lat, lon,
                                         api_conf)
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
                insert_coordinates_to_our_db(osoite_parsed, row["postinumero"], row["postitoimipaikka"], lat, lon,
                                             api_conf)
    except Exception as e:
        print(f"Error in get_and_set_coordinates_parallel for row {row['oid']}: {e}")
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
    session.headers.update(
        {'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
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

    batch_rows = []

    for cnt, o in enumerate(oids, 1):
        if cnt % 100 == 0:
            sys.stdout.write('.')
            sys.stdout.flush()
        if cnt % 1000 == 0:
            show(f"-- {cnt}")

        try:
            r = session.get(address + o)
            i = r.json()
            row = makerow()
            row["oid"] = o
            row["parentoid"] = jv(i, "parentOid")
            row["liitosoid"] = liitosmap.get(o)

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
                elif "Toimipiste" in i["tyypit"]:
                    row["tyyppi"] = "Toimipiste"
                    row["koodi"] = jv(i, "toimipistekoodi")
                elif "Oppisopimustoimipiste" in i["tyypit"]:
                    row["tyyppi"] = "Oppisopimustoimipiste"
                    row["koodi"] = jv(i, "toimipistekoodi")
                elif "Varhaiskasvatuksen toimipaikka" in i["tyypit"]:
                    row["tyyppi"] = "Varhaiskasvatuksen toimipaikka"
                    row["koodi"] = jv(i, "toimipistekoodi")
                elif "Varhaiskasvatuksen jarjestaja" in i["tyypit"]:
                    row["tyyppi"] = "Varhaiskasvatuksen järjestaja"
                    row["koodi"] = jv(i, "toimipistekoodi")

            if row["tyyppi"]:
                if "nimi" in i and i["nimi"]:
                    row["nimi"] = jv(i["nimi"], "fi")
                    row["nimi_sv"] = jv(i["nimi"], "sv")
                    row["nimi_en"] = jv(i["nimi"], "en")
                row["alkupvm"] = jv(i, "alkuPvm")
                row["loppupvm"] = jv(i, "lakkautusPvm")
                if "kotipaikkaUri" in i and i["kotipaikkaUri"]:
                    row["kotikunta"] = jv(i, "kotipaikkaUri").replace("kunta_", "")
                if "kieletUris" in i and i["kieletUris"]:
                    row["oppilaitoksenopetuskieli"] = "3" if len(i["kieletUris"]) > 1 else i["kieletUris"][0].replace(
                        "oppilaitoksenopetuskieli_", "").split("#")[0]

                josoite = jv(i, "kayntiosoite") if "kayntiosoite" in i else jv(i, "postiosoite") if "postiosoite" in i else None
                if josoite:
                    row["osoitetyyppi"] = "kayntiosoite" if "kayntiosoite" in i else "postiosoite"
                    row["osoite"] = jv(josoite, "osoite")
                    row["postinumero"] = josoite["postinumeroUri"].replace("posti_", "") if "postinumeroUri" in josoite and josoite["postinumeroUri"] else None
                    row["postitoimipaikka"] = jv(josoite, "postitoimipaikka")

                batch_rows.append(row)

            # Batch insert
            if len(batch_rows) >= BATCH_SIZE:
                with ThreadPoolExecutor(max_workers=10) as executor:
                    geocoded_rows = list(executor.map(lambda r: get_and_set_coordinates_parallel(r) if r.get("osoite") else r, batch_rows))
                dboperator.insertMany(hostname + url, schema, table, geocoded_rows)
                batch_rows = []

        except Exception as ve:
            print(f"Error processing OID {o}: {ve}")

    # Insert remaining rows
    if batch_rows:
        with ThreadPoolExecutor(max_workers=10) as executor:
            geocoded_rows = list(executor.map(lambda r: get_and_set_coordinates_parallel(r) if r.get("osoite") else r, batch_rows))
        dboperator.insertMany(hostname + url, schema, table, geocoded_rows)

    dboperator.close()
    show("ready")


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

    try:
        opts, args = getopt.getopt(argv, "sH:u:e:t:v",
                                   ["secure", "hostname=", "url=", "schema=", "table=", "verbose"])
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

    if not hostname or not url or not schema or not table:
        usage()
        sys.exit(2)

    load(secure, hostname, url, schema, table, verbose)


if __name__ == "__main__":
    main(sys.argv[1:])
