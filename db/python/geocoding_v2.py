#!/usr/bin/python3
# -*- encoding: utf-8 -*-
"""
Geocoding

- Give address as input, get geo-coordinates as result
- Requires "requests" package: pip install requests

Returns dictionary:

IF OK:
{"STATUS": "OK", "RESULT": {"latitude": 50.1566545, "longitude": 34.4720398}}

IF NOT OK:
{"STATUS": "NOK", "RESULT": "No geo-coordinates found for the given address."}
"""

import sys
import json
import time
import re
import requests
from urllib.parse import quote_plus
from requests.adapters import HTTPAdapter, Retry

def usage():
    print("Usage: geocoding.py -A|--address <address>, where <address> = Street Number, PostalCode, City")

def get_result_dictionary(status_ok, result):
    return {"STATUS": "OK" if status_ok else "NOK", "RESULT": result}

def get_geo_coordinates_from_server(address, postalcode, city, retries=5):
    base_url = "https://nominatim.openstreetmap.org/search/?q="
    query = quote_plus(f"{address} {postalcode} {city} Finland")
    url = f"{base_url}{query}&format=json&limit=1"

    session = requests.Session()
    retry_strategy = Retry(total=retries, backoff_factor=1, status_forcelist=[429, 500, 502, 503, 504])
    adapter = HTTPAdapter(max_retries=retry_strategy)
    session.mount("https://", adapter)
    session.mount("http://", adapter)

    try:
        r = session.get(url, headers={"Accept": "application/json"})
        r.raise_for_status()
        data = r.json()
        if not data:
            return get_result_dictionary(False, "No geo-coordinates found for the given address.")

        result = data[0]
        coordinates = {
            "latitude": float(result["lat"]),
            "longitude": float(result["lon"]),
            "confidence": 1
        }
        return get_result_dictionary(True, coordinates)

    except requests.RequestException as e:
        return get_result_dictionary(False, str(e))
    except (ValueError, KeyError, IndexError) as e:
        return get_result_dictionary(False, f"Invalid response: {e}")

def parse_address(arg_array):
    if len(arg_array) < 3:
        usage()
