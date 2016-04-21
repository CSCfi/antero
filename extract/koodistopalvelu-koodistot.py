#!/usr/bin/python

from time import localtime, strftime

import psycopg2
import sys

import requests
import json

def haenimi(i,kieli):
    for m in i["metadata"]:
        if m["kieli"] == kieli:
            return m["nimi"]
    return None

def main():
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" alkaa").encode('utf-8')

    kone = "localhost"
    kanta = "oiva"
    tunnus = "oiva"
    salasana = "oiva"
    
    conn_string = "host='%s' dbname='%s' user='%s' password='%s'" % (kone,kanta,tunnus,salasana)
    print ("Connecting to database\n ->%s" % (conn_string)).encode('utf-8')
    conn = psycopg2.connect(conn_string)
    cur = conn.cursor()

    # sarakkeet + koodisto!
    koodi = ""
    nimi = ""
    nimi_sv = None
    nimi_en = None
    alkupvm = ""
    loppupvm = None
    
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" tyhjennetaan sa_koodistot").encode('utf-8')
    cur.execute("DELETE FROM sa_koodistot")
    conn.commit()

    koodistouri = "http://virkailija.opintopolku.fi/koodisto-service/rest/json/%s/koodi"
    koodistot = [
        "sukupuoli"
        # alue
        ,"kunta"
        ,"maakunta"
        ,"aluehallintovirasto"
        ,"elykeskus"
        ,"laani"
        ,"seutukunta"
        ,"kuntaryhma"
        ,"kielisuhde"
        # koulutus
        ,"koulutus"
        ,"koulutusasteoph2002"
        ,"koulutusalaoph2002"
        ,"opintoalaoph2002"
        ,"koulutusasteoph1995"
        ,"koulutusalaoph1995"
        ,"opintoalaoph1995"
        ,"tutkinto"
        ,"tutkintotyyppi"
        ,"koulutustyyppi"
        ,"isced2011koulutusaste"
        ,"isced2011koulutusastetaso1"
        ,"isced2011koulutusastetaso2"
        ,"isced2011koulutusalataso1"
        ,"isced2011koulutusalataso2"
        ,"isced2011koulutusalataso3"
        # oppilaitos
        ,"oppilaitosnumero"
        ,"oppilaitostyyppi"
        ,"koulutustoimija"
    ]
    for koodisto in koodistot:
        url = koodistouri % koodisto
        print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" haetaan opintopolusta -- "+url).encode('utf-8')
        r = requests.get(url, verify=False)
        j = r.json()
        lkm = 0
        for i in j:
            lkm += 1
            koodi = i["koodiArvo"]
            nimi = haenimi(i,"FI")
            nimi_sv = haenimi(i,"SV")
            nimi_en = haenimi(i,"EN")
            alkupvm = i["voimassaAlkuPvm"]
            loppupvm = i["voimassaLoppuPvm"]
            
            #print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %s -- %d -- (%s,%s,%s,%s,%s,%s)" % (koodisto,lkm,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm)).encode('utf-8')
            print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %s -- %d -- %s" % (koodisto,lkm,koodi)).encode('utf-8')
            cur.execute("""INSERT INTO sa_koodistot (koodisto,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm) VALUES (%s,%s,%s,%s,%s,%s,%s)""", (koodisto,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm))
            conn.commit()

    cur.close()
    conn.close()
    
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" valmis").encode('utf-8')
    
if __name__ == "__main__":
    main()
