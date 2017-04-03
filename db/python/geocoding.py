#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
Geocoding

- Give address as an input, and get geo-coordinates as a result
- Requires "requests" package to be installed: pip install requests
- Requires a valid API-key (taken from environment variable: GEO_COORDINATES_API_KEY)

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


def usage():
    print "Usage: geocoding.py -A|--address <address>, where <address> = Kadunnimi talon_numero [porras asunto], postinumero, kaupunki"


def get_result_dictionary(status_ok, result):
    if status_ok:
        return {"STATUS": "OK", "RESULT": result}
    else:
        return {"STATUS": "NOK", "RESULT": result}


def get_geo_coordinates_from_server(url_address):

    try:
        api_key = os.environ['GEO_COORDINATES_API_KEY']
    except KeyError:
        return get_result_dictionary(False, "API-key missing")

    google_geocode_api_base_url = "https://maps.googleapis.com/maps/api/geocode/json?address="
    complete_url = google_geocode_api_base_url + url_address + "&key=" + api_key

    try:
        r = requests.get(complete_url)
    except requests.exceptions.RequestException as e:
        return get_result_dictionary(False, e)

    if r.status_code != 200:
        return get_result_dictionary(False, "Service down. Please try later again.")

    result_json = json.loads(r.text)
    coordinate_results = {}

    if result_json[u'status'] == "ZERO_RESULTS":
        return get_result_dictionary(False, "No geo-coordinates found for the given address.")
    elif result_json[u'status'] == "OVER_QUERY_LIMIT":
        return get_result_dictionary(False, "You are over your quota.")
    elif result_json[u'status'] == "REQUEST_DENIED":
        return get_result_dictionary(False, "Your request was denied.")
    elif result_json[u'status'] == "INVALID_REQUEST":
        return get_result_dictionary(False, "The query is missing.")
    elif result_json[u'status'] == "UNKNOWN_ERROR":
        return get_result_dictionary(False, "Request could not be processed due to a server error. The request may succeed if you try again.")
    elif result_json[u'status'] == "ERROR":
        return get_result_dictionary(False, "Request timed out or there was a problem contacting the Google servers. The request may succeed if you try again.")
    elif result_json[u'status'] == "OK":
        results = result_json[u'results'][0]
        coordinate_results["latitude"] = results[u'geometry'][u'location'][u'lat']
        coordinate_results["longitude"] = results[u'geometry'][u'location'][u'lng']

    return get_result_dictionary(True, coordinate_results)


def parse_url_address(argument_array):
    address_string = ""
    for i in range(1, len(argument_array)):  # first argument not part of address
        address_string += argument_array[i]
        address_string += "+"  # replace spaces in the address with '+' sign

    # remove the unnecessary last +-sign
    address_string = address_string[:-1]

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

    # remove the unnecessary last +-sign
    street_name = street_name[:-1]
    # add space (+-sign) to the beginning of house_number
    house_number = '+' + house_number

    # trivial length checkings
    if len(street_name) == 0 or len(zip_code) == 0 or len(city) == 0:
        usage()
        sys.exit(5)

    for j in range(1, len(zip_code)):  # exclude first character ('+')
        if not zip_code[j].isdigit():
            usage()
            sys.exit(6)

    for k in city:
        if k.isdigit():
            usage()
            sys.exit(7)

    """
    Example:
    street_name: Abraham+Wetterin+tie
    house_number: +123
    zip_code: +27800
    city: +Uusi+Kaarlepyy
    """

    url_address = street_name + house_number + "," + zip_code + "," + city

    """
    Example:
    url_address: Abraham+Wetterin+tie+123,+27800,+Uusi+Kaarlepyy
    """
    return url_address


def main(argv):

    if len(argv) < 2:
        usage()
        sys.exit(2)

    if not(argv[0] == "-A" or argv[0] == "--address"):
        usage()
        sys.exit(3)

    url_address = parse_url_address(argv)

    return get_geo_coordinates_from_server(url_address)


if __name__ == "__main__":
    main(sys.argv[1:])
