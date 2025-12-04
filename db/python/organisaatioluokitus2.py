#!/usr/bin/python3
# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8 :
"""
organisaatioluokitus - batch insert version

Fetch all organizations from Organisaatio Service from Opintopolku.
If organization has predefined matching value in "tyypit" (one of: Koulutustoimija, Oppilaitos or Toimipiste)
then include it in result set and fetch more information for it.

All rows are collected in memory first and inserted in batch for performance.
"""

import sys, os
import json
import requests
from time import localtime, strftime
import importlib
import getopt

importlib.reload(sys)
if sys.version_info < (3,0):
    sys.setdefaultencoding('utf-8')

import dbcommand
import dboperator
import geocoding_v2 as geocoding  # updated geocoding import

EXT_API_QUERY_CONFIDENCE_LIMIT = 0.6  # minimum acceptable confidence for coordinates
BATCH_SIZE = 1000  # insert in batches


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


def show(message):
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)


def get_osoite_array(osoite, postinumero, kunta):
    return ["--address", osoite + ", " + postinumero + ", " + kunta]


def get_kotikunta_by_kuntakoodi(koodi):
    try:
        r = requests.get(
            "https://virkailija.opintopolku.fi/koodisto-service/rest/json/kunta/koodi/arvo/" + str(koodi),
            headers={"Accept": "application/json",
                     'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
        )
        result_json = r.json()
        if r.status_code == 200 and result_json:
            for i in result_json[0]["metadata"]:
                if i["kieli"] == "FI":
                    return {"OK": True, "kunta": i["nimi"]}
            return {"OK": True, "kunta": result_json[0]["metadata"][0]["nimi"]}
        else:
            return {"OK": False, "kunta": None}
    except Exception as e:
        print(f"Error fetching kotikunta: {e}")
        return {"OK": False, "kunta": None}


def check_if_coordinates_in_our_db(osoite, postinumero, postitoimipaikka):
    command = (
        "SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite=%s AND postinumero=%s AND postitoimipaikka=%s",
        (osoite, postinumero, postitoimipaikka)
    )
    result = dbcommand.load(command, "*", False)
    if result:
        return {
            "coordinates_found": True,
            "latitude": result[0]["latitude"],
            "longitude": result[0]["longitude"],
            "confidence": result[0]["confidence"]
        }
    return {"coordinates_found": False, "latitude": None, "longitude": None, "confidence": None}


def insert_coordinates_to_our_db(osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence):
    command = (
        "INSERT INTO [ANTERO].[sa].[sa_koordinaatit] (osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) "
        "VALUES (%s, %s, %s, %s, %s, %s)",
        (osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence)
    )
    dbcommand.load(command, "", False)


def coordinate_length_ok(latitude, longitude):
    return len(str(latitude)) > 6 and len(str(longitude)) > 6


def get_and_set_coordinates(row):
    osoite_parsed = row["osoite"].split(",")[0] if row["osoite"] else ""
    postinumero = row["postinumero"] or ""
    postitoimipaikka = row["postitoimipaikka"] or ""

    if not (osoite_parsed and postinumero and postitoimipaikka):
        return

    check_coordinates = check_if_coordinates_in_our_db(osoite_parsed, postinumero, postitoimipaikka)
    if check_coordinates["coordinates_found"]:
        if (float(check_coordinates["confidence"]) >= EXT_API_QUERY_CONFIDENCE_LIMIT and
                coordinate_length_ok(check_coordinates["latitude"], check_coordinates["longitude"])):
            row["latitude"] = check_coordinates["latitude"]
            row["longitude"] = check_coordinates["longitude"]
        return

    full_address = f"{osoite_parsed}, {postinumero}, {postitoimipaikka}"
    geo_result = geocoding.main(["-A", full_address])

    if geo_result["STATUS"] == "OK":
        latitude = geo_result["RESULT"]["latitude"]
        longitude = geo_result["RESULT"]["longitude"]
        confidence = geo_result["RESULT"].get("confidence", 1)

        if confidence >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(latitude, longitude):
            row["latitude"] = latitude
            row["longitude"] = longitude

        insert_coordinates_to_our_db(
            osoite_parsed, postinumero, postitoimipaikka,
            latitude, longitude, confidence
        )


def load(secure, hostname, url, schema, table, verbose=False):
    if verbose:
        show("begin")

    row = makerow()
    dboperator.columns(row)
    dboperator.empty(schema, table)

    address = ("https://" if secure else "http://") + hostname + url
    show("load from " + address)

    try:
        liitosresponse = requests.get(
            address + "v2/liitokset",
            headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
        )
        response = requests.get(
            address,
            headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
        )
    except Exception as e:
        show('HTTP GET failed. Reason: %s' % (str(e)))
        sys.exit(2)

    show("api call OK")

    liitosmap = {l["organisaatio"]["oid"]: l["kohde"]["oid"] for l in liitosresponse.json()}
    oids = response.json()

    all_rows = []
    batch_rows = []

    cnt = 0
    for o in oids:
        cnt += 1
        if cnt % 100 == 0:
            sys.stdout.write('.')
            sys.stdout.flush()
        if cnt % 1000 == 0:
            show("-- %d" % (cnt))

        try:
            r = requests.get(
                address + o,
                headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'}
            )
            i = r.json()
            row = makerow()
            row["oid"] = o
            row["parentoid"] = jv(i, "parentOid")
            row["liitosoid"] = liitosmap[o] if o in liitosmap else None

            if "tyypit" in i:
                if "Koulutustoimija" in i["tyypit"]:
                    row["tyyppi"] = "Koulutustoimija"
                    row["koodi"] = jv(i, "ytunnus") or jv(i, "virastoTunnus")
                elif "Oppilaitos" in i["tyypit"]:
                    row["tyyppi"] = "Oppilaitos"
                    row["koodi"] = jv(i, "oppilaitosKoodi")
                    if "oppilaitosTyyppiUri" in i and i["oppilaitosTyyppiUri"]:
                        row["oppilaitostyyppi"] = (
                            i["oppilaitosTyyppiUri"]
                            .replace("oppilaitostyyppi_", "")
                            .replace("#1", "")
                        )
                elif "Toimipiste" in i["tyypit"]:
                    row["tyyppi"] = "Toimipiste"
                    row["koodi"] = jv(i, "toimipistekoodi")

            if row["tyyppi"]:
                if "nimi" in i and i["nimi"]:
                    row["nimi"] = jv(jv(i, "nimi"), "fi")
                    row["nimi_sv"] = jv(jv(i, "nimi"), "sv")
                    row["nimi_en"] = jv(jv(i, "nimi"), "en")

                row["alkupvm"] = jv(i, "alkuPvm")
                row["loppupvm"] = jv(i, "lakkautusPvm")
                row["kotikunta"] = jv(i, "kotipaikkaUri").replace("kunta_", "") if "kotipaikkaUri" in i else None
                row["osoite"] = jv(i, "osoite")
                row["postinumero"] = jv(i, "postinumero")
                row["postitoimipaikka"] = jv(i, "postitoimipaikka")

                get_and_set_coordinates(row)

                batch_rows.append(row)

                if len(batch_rows) >= BATCH_SIZE:
                    dboperator.insertMany("opintopolku", schema, table, batch_rows)
                    batch_rows = []

        except Exception as e:
            show(f"Error processing OID {o}: {e}")

    if batch_rows:
        dboperator.insertMany("opintopolku", schema, table, batch_rows)

    show("load finished")


def usage():
    print("usage: organisaatioluokitus.py [-s] [-H hostname] [-u url] [-e schema] [-t table] [-v]")
    sys.exit(2)


def main(argv):
    secure = True
    hostname = os.getenv("OPINTOPOLKU") or "virkailija.opintopolku.fi"
    url = "/organisaatio-service/rest/organisaatio/"
    schema = os.getenv("SCHEMA") or "sa"
    table = os.getenv("TABLE") or "sa_organisaatioluokitus_phase1"
    verbose = False

    try:
        opts, args = getopt.getopt(
            argv,
            "sH:u:e:t:v",
            ["secure", "hostname=", "url=", "schema=", "table=", "verbose"]
        )
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
