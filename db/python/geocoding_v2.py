#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
Geocoding

- Give address as an input, and get geo-coordinates as a result
- Requires "requests" package to be installed: pip install requests

returns a dictionary:

IF OK, e.g.
{"STATUS": "OK", "RESULT": {"latitude": 50.15665450000001, "longitude": 34.4720398}}

IF NOT OK, e.g.
{"STATUS": "NOK", "RESULT": "No geo-coordinates found for the given address."}
"""

import os
import sys
import json
import requests
import time


def usage():
    print("Usage: geocoding.py -A|--address <address>, where <address> = Kadunnimi talon_numero [porras asunto], postinumero, kaupunki")


def get_result_dictionary(status_ok, result):
    if status_ok:
        return {"STATUS": "OK", "RESULT": result}
    else:
        return {"STATUS": "NOK", "RESULT": result}


def get_geo_coordinates_from_server(address, postalcode, city):
    """
    Query Nominatim (OpenStreetMap) and return geo-coordinates.
    One initial try + one retry (2 attempts total).
    """

    geocode_server_api_base_url = "https://nominatim.openstreetmap.org/search/?q="
    address_url = address + "+" + postalcode + "+" + city + "+finland"
    complete_url = geocode_server_api_base_url + address_url + "&polygon_geojson=1&format=json&limit=1"

    MAX_TRIES = 2     # first attempt + retry
    attempt = 0

    while attempt < MAX_TRIES:
        attempt += 1

        try:
            r = requests.get(
                complete_url,
                headers={"Accept": "application/json", "User-Agent": "your-app"}
            )
        except requests.exceptions.RequestException as e:
            # network failure — no need to check anything else
            if attempt < MAX_TRIES:
                time.sleep(2)
                continue
            return get_result_dictionary(False, str(e))

        # Try to parse JSON safely
        try:
            result_json = r.json()
        except ValueError:
            if attempt < MAX_TRIES:
                time.sleep(2)
                continue
            return get_result_dictionary(False, "Invalid JSON returned by server.")

        # Check HTTP status
        if r.status_code != 200:
            if attempt < MAX_TRIES:
                time.sleep(2)
                continue
            return get_result_dictionary(False, f"HTTP error code: {r.status_code}")

        # ----- SUCCESSFUL HTTP 200 BUT NO RESULTS -----
        if not result_json:
            if attempt < MAX_TRIES:
                time.sleep(2)
                continue
            return get_result_dictionary(False, "No geo-coordinates found for the given address.")

        # ----- SUCCESSFUL RESULT -----
        result = result_json[0]

        try:
            latitude = float(result["lat"])
            longitude = float(result["lon"])
        except (KeyError, ValueError):
            if attempt < MAX_TRIES:
                time.sleep(2)
                continue
            return get_result_dictionary(False, "Invalid coordinate data returned.")

        return get_result_dictionary(
            True,
            {"latitude": latitude, "longitude": longitude, "confidence": 1}
        )

    # Should never reach here, but kept as fallback
    return get_result_dictionary(False, "Unknown error.")

def parse_url_address(argument_array):
    address_string = ""
    for i in range(1, len(argument_array)):  # first argument not part of address
        address_string += argument_array[i]
        address_string += "+"  # add '+' sign between array cells

    # remove the unnecessary last +-sign
    address_string = address_string[:-1]

    # replace whitespaces in the address with '+' sign
    address_string = address_string.replace(" ", "+")

    """
    address_string, e.g. Mannerheimintie+123+F+63,+00100,+Helsinki or Abraham+Wetterin+tie+123+G+64,+27800,+Uusi+Kaarlepyy
    split address_string using ',' delimeter
    """
    address_array = address_string.split(',')

    if len(address_array) != 3:
        usage()
        sys.exit(4)

    street_name = ""
    house_number = ""
    zip_code = address_array[1]
    city = address_array[2]

    street_name_finished = False
    for i in address_array[0]:
        if not i.isdigit() and not street_name_finished:
            street_name += i
        elif not i.isdigit() and street_name_finished:
            break  # possible "talon porras" skipped
        else:
            street_name_finished = True
            house_number += i

    if zip_code != "" and zip_code[0] == "+":
        zip_code = zip_code[1:]

    # zip-code must be 5 digits, and 00000 is not OK
    if len(zip_code) == 5 and zip_code != "00000":
        for j in range(0, len(zip_code)):
            if not zip_code[j].isdigit():
                print("Error: Postalcode incorrect: " + zip_code)
                sys.exit(5)
    else:
        print("Error: Postalcode incorrect: " + zip_code)
        sys.exit(6)

    if city != "" and city[0] == "+":
        city = city[1:]

    """
    Example:
    street_name: Abraham+Wetterin+tie
    house_number: +123
    zip_code: 27800
    city: Uusi+Kaarlepyy
    """
    address = street_name + house_number

    return {"address": address, "postalcode": zip_code, "city": city}


def main(argv):

    if len(argv) < 2:
        usage()
        sys.exit(2)

    if not(argv[0] == "-A" or argv[0] == "--address"):
        usage()
        sys.exit(3)

    parsed_url = parse_url_address(argv)
    return get_geo_coordinates_from_server(parsed_url["address"], parsed_url["postalcode"], parsed_url["city"])


if __name__ == "__main__":
    main(sys.argv[1:])
