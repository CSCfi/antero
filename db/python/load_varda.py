#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
This load function is primarily for fetching data from VARDA API, and inserting it to Vipunen (Antero DB).

todo doc
"""

import getopt
import json
import os
import requests
import sys

from time import localtime, strftime

import dboperator


def show(message):
    print strftime("%Y-%m-%d %H:%M:%S", localtime()) + " " + message


def load(url, schema, table, condition):
    """
    Results from VARDA-API can come in multiple pages. If that's the case,
    we need to make multiple requests to the VARDA API, using the "next" parameter.
    """

    # First delete all from TABLE -> Start from scratch. TODO: Delete based on condition.
    dboperator.execute("DELETE FROM %s.%s" % (schema, table))

    while True:
        show("begin " + url + " " + schema + " " + table + " " + (condition or ""))
        show("load from " + url)

        reqheaders = {'Content-Type': 'application/json'}
        # api credentials from env vars
        if os.getenv("VARDA_API_KEY"):
            show("using authentication")
            api_key = os.getenv("VARDA_API_KEY")
            reqheaders['Authorization'] = 'Token %s' % api_key

        try:
            r = requests.get(url, headers=reqheaders)
        except requests.exceptions.RequestException as e:
            print e
            sys.exit(1)

        if r.status_code != 200:
            print "Error! HTTP status code: " + str(r.status_code)
            sys.exit(2)

        try:
            data = json.loads(r.content)
        except ValueError as e:
            print e
            sys.exit(3)

        # everything is fine
        show("api call OK")

        # Parse URL
        # From https://varda.oso-pilot.csc.fi/api/v1/toimipisteet/ save in DB https://varda.oso-pilot.csc.fi
        n = url.find("/", url.find("/") + 2)  # find 3rd occurance of "/"
        address = url[:n]

        show("insert data")
        cnt = 0
        for row in data["results"]:
            cnt += 1
            # show some sign of being alive
            if cnt % 100 == 0:
                sys.stdout.write('.')
                sys.stdout.flush()
            if cnt % 1000 == 0:
                show("-- %d" % (cnt))

            # Explicitly remove the keys from dict (row) that are not saved in Antero DB
            del row['johtaja']
            del row['url']
            del row['muutos_pvm']
            del row['vaka_jarjestaja']
            del row['toimipaikat']

            # find out which columns to use on insert
            dboperator.resetcolumns(row)

            # flatten arrays/lists
            for col in row:
                if type(row[col]) is list:
                    row[col] = ''.join(map(str, json.dumps(row[col])))

            dboperator.insert(address, schema, table, row)

        show("wrote %d" % (cnt))
        show("ready")

        if data["next"] is None:
            break  # exit while-loop. We are done.
        else:
            url = data["next"]


def usage():
    print "usage: load.py -u|--url <url> -e|--schema <schema> -t|--table <table> [-c|--condition <condition>]"


def main(argv):
    # muuttujat jotka kerrotaan argumentein
    url = ""
    schema = ""
    table = ""
    condition = None

    try:
        opts, args = getopt.getopt(argv, "u:e:t:c", ["url=", "schema=", "table=", "condition="])
    except getopt.GetoptError as err:
        print(err)
        usage()
        sys.exit(2)
    for opt, arg in opts:
        if opt in ("-u", "--url"):
            url = arg
        elif opt in ("-e", "--schema"):
            schema = arg
        elif opt in ("-t", "--table"):
            table = arg
        elif opt in ("-c", "--condition"):
            condition = arg
    if not url or not schema or not table:
        usage()
        sys.exit(2)

    load(url, schema, table, condition)
    dboperator.close()


if __name__ == "__main__":
    main(sys.argv[1:])
