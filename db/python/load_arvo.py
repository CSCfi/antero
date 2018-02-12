#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
This load function is primarily for fetching data from ARVO API, and inserting it to Vipunen (Antero DB).

todo doc
"""

import base64
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
    Results from ARVO-API can come in multiple pages. If that's the case,
    we need to make multiple requests to the ARVO API, using the "next_url" parameter.
    """

    FIRST_LOOP = True  # This is used to make possible DELETE operation (due to condition) only once.

    while True:
        show("begin " + url + " " + schema + " " + table + " " + (condition or ""))
        show("load from " + url)

        reqheaders = {'Content-Type': 'application/json'}
        # api credentials from env vars
        if os.getenv("API_USERNAME"):
            show("using authentication")
            apiuser = os.getenv("API_USERNAME")
            apipass = os.getenv("API_PASSWORD")
            reqheaders['Authorization'] = 'Basic %s' % base64.b64encode(apiuser + ":" + apipass)

        try:
            r = requests.get(url, headers=reqheaders)
        except requests.exceptions.RequestException as e:
            print e
            sys.exit(1)

        if r.status_code != 200:
            print "Error! HTTP status code: " + str(r.status_code)
            sys.exit(2)

        try:
            result = json.loads(r.content)
        except ValueError as e:
            print e
            sys.exit(3)

        if "pagination" not in result or "data" not in result:
            print "Error! Received JSON-data not valid."
            sys.exit(4)

        # everything is fine
        show("api call OK")

        """
          Received data e.g.

            {
              "data": [
                {
                  "taustakysymykset": true,
                  "koulutustoimija": "xxxx",
                  "vastausid": 1111,
                  "kyselykertaid": 123,
                  "kysely_alkupvm": "2016-11-29T22:00:00Z",
                  "suorituskieli": "fi",
                  "tutkinto_fi": "xxxx",
                  "opintoala_en": "xxxx",
                  "valmistavan_koulutuksen_jarjestaja_en": "xxxx",
                  "kysymys_en": "xxxx",
                  "koulutustoimija_en": "xxxx",
                  "tutkintotunnus": "xxxx",
                  "numerovalinta": 2,
                  "valmistavan_koulutuksen_oppilaitos_sv": "xxxx",
                  "kysymys_sv": "xxxx",
                  "kysymysjarjestys": 0,
                  "opintoala_sv": "xxxx",
                  "monivalintavaihtoehto": "xxxx",
                  "kysymysid": 1234,
                  "valmistavan_koulutuksen_oppilaitos_fi": "xxxx",
                  "kysely_en": "xxxx",
                  "vastaustyyppi": "xxxx",
                  "kysymysryhma": "xxxx",
                  "tutkinto_en": null,
                  "kunta": null,
                  "kysymysryhmaid": 110,
                  "kysymysryhmajarjestys": 0,
                  "vaihtoehto": null,
                  "opintoala_fi": "xxxx",
                  "kysymys_fi": "Ik",
                  "vastaajaid": 123,
                  "kyselyid": 111,
                  "valmistavan_koulutuksen_jarjestaja_fi": "xxxx",
                  "kysymysryhma_en": "xxxx",
                  "kysely_sv": "xxxx",
                  "kysymysryhma_fi": "xxxx",
                  "opintoalatunnus": "xxxx",
                  "valmistavan_koulutuksen_jarjestaja_sv": "xxxx",
                  "vastausaika": "2017-02-05T22:00:00Z",
                  "tunnus": "xxxx",
                  "valmistavan_koulutuksen_jarjestaja": "xxxx",
                  "koulutustoimija_fi": "xxxx",
                  "kysely_loppupvm": null,
                  "koulutusmuoto": null,
                  "kyselykerta": "xxxx",
                  "valmistavan_koulutuksen_oppilaitos_en": "xxxx",
                  "valtakunnallinen": true,
                  "tutkinto_sv": null,
                  "koulutustoimija_sv": "xxxx",
                  "valmistavan_koulutuksen_oppilaitos": "xxxx",
                  "kysely_fi": "xxxx",
                  "kysymysryhma_sv": "xxxx"
                }
              ],
              "pagination": {
                "next_url": "null"
              }
            }

        """

        address = url.split("?")[0]  # Save in DB only the part before ?-mark: https://arvo.csc.fi/api/vipunen?alkupvm=2018-01-01&loppupvm=2018-02-01

        # remove data conditionally, otherwise empty
        # merge operation could be considered here...
        if FIRST_LOOP:  # This is done only on the first go (no matter if Arvo returns one or multiple pages)
            if condition:
                show("remove from %s.%s with condition '%s'" % (schema, table, condition))
                dboperator.execute("DELETE FROM %s.%s WHERE %s" % (schema, table, condition))
            else:
                show("empty %s.%s" % (schema, table))
                dboperator.empty(schema, table)

        show("insert data")
        cnt = 0
        for row in result["data"]:
            cnt += 1
            # show some sign of being alive
            if cnt % 100 == 0:
                sys.stdout.write('.')
                sys.stdout.flush()
            if cnt % 1000 == 0:
                show("-- %d" % (cnt))

            # find out which columns to use on insert
            dboperator.resetcolumns(row)

            # flatten arrays/lists
            for col in row:
                if type(row[col]) is list:
                    row[col] = ''.join(map(str, json.dumps(row[col])))

            dboperator.insert(address, schema, table, row)

        show("wrote %d" % (cnt))
        show("ready")

        if result["pagination"]["next_url"] == "null":
            break  # exit while-loop. We are done.
        else:
            url = result["pagination"]["next_url"]
            FIRST_LOOP = False  # Do not make the possible DELETE-operation anymore!


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
