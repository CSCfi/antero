#!/usr/bin/python3
# -*- encoding: utf-8 -*-
# vim: set fileencoding=utf-8 :
"""
organisaatioluokitus - debug version

Fetch first 100 organizations from Organisaatio Service from Opintopolku for debugging.
Prints detailed information for each row, including API calls and geocoding results.
"""
import sys, os
import json
import requests
from time import localtime, strftime
import importlib

importlib.reload(sys)
if sys.version_info < (3,0):
    sys.setdefaultencoding('utf-8')

import dbcommand
import dboperator
import geocoding_v2 as geocoding  # updated geocoding import

EXT_API_QUERY_CONFIDENCE_LIMIT = 0.6
DEBUG_MAX_OIDS = 100  # only process first 100 for debugging
BATCH_SIZE = 50  # smaller batch size for debug

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
    return jsondata.get(key, None)

def show(message):
    print(strftime("%Y-%m-%d %H:%M:%S", localtime())+" "+message)

def check_if_coordinates_in_our_db(osoite, postinumero, postitoimipaikka):
    command = ("SELECT * FROM [ANTERO].[sa].[sa_koordinaatit] WHERE osoite=%s AND postinumero=%s AND postitoimipaikka=%s",
               (osoite, postinumero, postitoimipaikka))
    result = dbcommand.load(command, "*", False)
    if result:
        return {"coordinates_found": True, "latitude": result[0]["latitude"], "longitude": result[0]["longitude"], "confidence": result[0]["confidence"]}
    return {"coordinates_found": False, "latitude": None, "longitude": None, "confidence": None}

def insert_coordinates_to_our_db(osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence):
    command = ("INSERT INTO [ANTERO].[sa].[sa_koordinaatit] (osoite, postinumero, postitoimipaikka, latitude, longitude, confidence) VALUES (%s, %s, %s, %s, %s, %s)",
               (osoite, postinumero, postitoimipaikka, latitude, longitude, api_result_confidence))
    dbcommand.load(command, "", False)

def coordinate_length_ok(latitude, longitude):
    return len(str(latitude)) > 6 and len(str(longitude)) > 6

def get_and_set_coordinates(row):
    osoite_parsed = row["osoite"].split(",")[0] if row["osoite"] else ""
    postinumero = row["postinumero"] or ""
    postitoimipaikka = row["postitoimipaikka"] or ""

    if not (osoite_parsed and postinumero and postitoimipaikka):
        show(f"Skipping OID {row['oid']}: incomplete address")
        return

    check_coordinates = check_if_coordinates_in_our_db(osoite_parsed, postinumero, postitoimipaikka)
    if check_coordinates["coordinates_found"]:
        if float(check_coordinates["confidence"]) >= EXT_API_QUERY_CONFIDENCE_LIMIT and coordinate_length_ok(check_coordinates["latitude"], check_coordinates["longitude"]):
            row["latitude"] = check_coordinates["latitude"]
            row["longitude"] = check_coordinates["longitude"]
            show(f"Coordinates from DB for OID {row['oid']}: {row['latitude']}, {row['longitude']}")
        return

    full_address = f"{osoite_parsed}, {postinumero}, {postitoimipaikka}"
    geo_result = geocoding.main(["-A", full_address])

    if geo_result["STATUS"] == "OK":
        latitude = geo_result["RESULT"]["latitude"]
        longitude = geo_result["RESULT"]["longitude"]
        confidence = geo_result["RESULT"].get("confidence", 1)
        row["latitude"] = latitude
        row["longitude"] = longitude
        show(f"Coordinates fetched for OID {row['oid']}: {latitude}, {longitude}, confidence {confidence}")
        insert_coordinates_to_our_db(osoite_parsed, postinumero, postitoimipaikka, latitude, longitude, confidence)
    else:
        show(f"Failed to get coordinates for OID {row['oid']}: {geo_result['RESULT']}")

def load_debug(secure, hostname, url, schema, table):
    show("Debug load start")

    row = makerow()
    dboperator.columns(row)
    dboperator.empty(schema, table)

    address = ("https://" if secure else "http://") + hostname + url
    show("Fetching OIDs from " + address)

    try:
        liitosresponse = requests.get(address+"v2/liitokset", headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
        response = requests.get(address, headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
    except Exception as e:
        show(f"HTTP GET failed: {e}")
        sys.exit(2)

    liitosmap = {l["organisaatio"]["oid"]: l["kohde"]["oid"] for l in liitosresponse.json()}
    oids = response.json()[:DEBUG_MAX_OIDS]  # only first 100 OIDs
    show(f"Processing first {len(oids)} OIDs for debug")

    batch_rows = []
    for idx, o in enumerate(oids, start=1):
        show(f"Processing OID {o} ({idx}/{len(oids)})")
        try:
            r = requests.get(address+o, headers={'Caller-Id': '1.2.246.562.10.2013112012294919827487.vipunen'})
            i = r.json()
            row = makerow()
            row["oid"] = o
            row["parentoid"] = jv(i,"parentOid")
            row["liitosoid"] = liitosmap.get(o)

            if "tyypit" in i:
                if "Koulutustoimija" in i["tyypit"]:
                    row["tyyppi"] = "Koulutustoimija"
                    row["koodi"] = jv(i,"ytunnus") or jv(i,"virastoTunnus")
                elif "Oppilaitos" in i["tyypit"]:
                    row["tyyppi"] = "Oppilaitos"
                    row["koodi"] = jv(i,"oppilaitosKoodi")
                    if "oppilaitosTyyppiUri" in i and i["oppilaitosTyyppiUri"]:
                        row["oppilaitostyyppi"] = i["oppilaitosTyyppiUri"].replace("oppilaitostyyppi_","").replace("#1","")
                elif "Toimipiste" in i["tyypit"]:
                    row["tyyppi"] = "Toimipiste"
                    row["koodi"] = jv(i,"toimipistekoodi")

            if row["tyyppi"]:
                row["nimi"] = jv(jv(i,"nimi"),"fi") if "nimi" in i else None
                row["nimi_sv"] = jv(jv(i,"nimi"),"sv") if "nimi" in i else None
                row["nimi_en"] = jv(jv(i,"nimi"),"en") if "nimi" in i else None
                row["alkupvm"] = jv(i,"alkuPvm")
                row["loppupvm"] = jv(i,"lakkautusPvm")
                row["kotikunta"] = jv(i,"kotipaikkaUri").replace("kunta_","") if "kotipaikkaUri" in i else None
                row["osoite"] = jv(i,"osoite")
                row["postinumero"] = jv(i,"postinumero")
                row["postitoimipaikka"] = jv(i,"postitoimipaikka")

                get_and_set_coordinates(row)
                batch_rows.append(row)

                if len(batch_rows) >= BATCH_SIZE:
                    dboperator.insertMany("opintopolku", schema, table, batch_rows)
                    show(f"Inserted batch of {len(batch_rows)} rows")
                    batch_rows = []

        except Exception as e:
            show(f"Error processing OID {o}: {e}")

    if batch_rows:
        dboperator.insertMany("opintopolku", schema, table, batch_rows)
        show(f"Inserted final batch of {len(batch_rows)} rows")

    show("Debug load finished")


if __name__ == "__main__":
    # Example call:
    load_debug(secure=True, hostname="organisaatio-service.opintopolku.fi", url="/rest/organisaatiot", schema="opintopolku", table="organisaatioluokitus_debug")
