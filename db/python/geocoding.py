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


def get_geo_coordinates_from_server(address, postalcode, city):
    try:
        api_key = os.environ['GEO_COORDINATES_API_KEY']
    except KeyError:
        return get_result_dictionary(False, "API-key missing")

    geocode_server_api_base_url = "https://search.mapzen.com/v1/search/structured?"
    address_url = "address=" + address + "&postalcode=" + postalcode + "&locality=" + city + "&country=finland"
    complete_url = geocode_server_api_base_url + address_url + "&api_key=" + api_key + "&size=1"  # limit the query size to only one top-result

    try:
        r = requests.get(complete_url, headers={"Accept": "application/json"})
    except requests.exceptions.RequestException as e:
        return get_result_dictionary(False, e)

    # GET-request sent successfully to server, and a reply was received.
    try:
        result_json = json.loads(r.text)
    except ValueError, e:
        return get_result_dictionary(False, "Invalid JSON from server.")

    # Check HTTP error codes
    if r.status_code == 400:
        return get_result_dictionary(False, result_json)  # Bad Request: An input parameter was invalid. An error message is included in the response body with more details.

    elif r.status_code == 404:
        return get_result_dictionary(False, "Not Found: The URL is invalid or the path is no longer valid.")

    elif r.status_code == 408:
        return get_result_dictionary(False, "Request Timeout: The Elasticsearch cluster took too long to respond.")

    elif r.status_code == 500:
        return get_result_dictionary(False, "Internal Server Error: Generic fatal error.")

    elif r.status_code == 502:
        return get_result_dictionary(False, "Bad Gateway: Connection was lost to the Elasticsearch cluster.")

    elif r.status_code == 200:
        coordinate_results = {}
        results = result_json[u'features'][0][u'geometry'][u'coordinates']
        coordinate_results["latitude"] = results[1]
        coordinate_results["longitude"] = results[0]
        coordinate_results["confidence"] = result_json[u'features'][0][u'properties'][u'confidence']
        return get_result_dictionary(True, coordinate_results)
    else:
        return get_result_dictionary(False, "Unknown HTTP-error code: " + str(r.status_code))


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
                print "Error: Postalcode incorrect: " + zip_code
                sys.exit(5)
    else:
        print "Error: Postalcode incorrect: " + zip_code
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
