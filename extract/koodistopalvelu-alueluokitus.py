#!/usr/bin/python

from time import localtime, strftime

import psycopg2
import sys

import http.client
opintopolkuuri = "virkailija.opintopolku.fi"
httpconn = http.client.HTTPSConnection(opintopolkuuri)

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

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" tyhjennetaan sa_alueluokitus").encode('utf-8')
    cur.execute("DELETE FROM sa_alueluokitus")
    conn.commit()

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" haetaan opintopolusta").encode('utf-8')
    httpconn.request('GET', "/koodisto-service/rest/json/kunta/koodi")
    r = httpconn.getresponse()
    j = json.loads(r.read())
    lkm = 0
    for i in j:
        lkm += 1
        # sarakkeet
        koodi = ""
        nimi = ""
        nimi_sv = None
        nimi_en = None
        alkupvm = ""
        loppupvm = None
        maakuntakoodi = None
        maakuntanimi = None
        maakuntanimi_sv = None
        maakuntanimi_en = None
        avikoodi = None
        avinimi = None
        avinimi_sv = None
        avinimi_en = None
        elykoodi = None
        elynimi = None
        elynimi_sv = None
        elynimi_en = None
        kielisuhdekoodi = None
        kielisuhdenimi = None
        kielisuhdenimi_sv = None
        kielisuhdenimi_en = None
        seutukuntakoodi = None
        seutukuntanimi = None
        seutukuntanimi_sv = None
        seutukuntanimi_en = None
        laanikoodi = None
        laaninimi = None
        laaninimi_sv = None
        laaninimi_en = None
        kuntaryhmakoodi = None
        kuntaryhmanimi = None
        kuntaryhmanimi_sv = None
        kuntaryhmanimi_en = None
        
        koodi = i["koodiArvo"]
        nimi = haenimi(i,"FI")
        nimi_sv = haenimi(i,"SV")
        nimi_en = haenimi(i,"FI")
        alkupvm = i["voimassaAlkuPvm"]
        loppupvm = i["voimassaLoppuPvm"]

        # luokitukset (nb! avi loytyy eri suunnasta!)
        httpconn.request('GET', "/koodisto-service/rest/json/relaatio/sisaltyy-ylakoodit/%s" % i["koodiUri"])
        rr = httpconn.getresponse()
        jj = json.loads(rr.read())
        ss = ""
        for ii in jj:
            if ii["koodisto"]["koodistoUri"] == "aluehallintovirasto":
                avikoodi = ii["koodiArvo"]
                avinimi = haenimi(ii,"FI")
                avinimi_sv = haenimi(ii,"SV")
                avinimi_en = haenimi(ii,"EN")
        # muut luokitukset
        httpconn.request('GET', "/koodisto-service/rest/json/relaatio/sisaltyy-alakoodit/%s" % i["koodiUri"])
        rr = httpconn.getresponse()
        jj = json.loads(rr.read())
        ss = ""
        for ii in jj:
            if ii["koodisto"]["koodistoUri"] == "maakunta":
                maakuntakoodi = ii["koodiArvo"]
                maakuntanimi = haenimi(ii,"FI")
                maakuntanimi_sv = haenimi(ii,"SV")
                maakuntanimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "elykeskus":
                elykoodi = ii["koodiArvo"]
                elynimi = haenimi(ii,"FI")
                elynimi_sv = haenimi(ii,"SV")
                elynimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "kielisuhde":
                kielisuhdekoodi = ii["koodiArvo"]
                kielisuhdenimi = haenimi(ii,"FI")
                kielisuhdenimi_sv = haenimi(ii,"SV")
                kielisuhdenimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "seutukunta":
                seutukuntakoodi = ii["koodiArvo"]
                seutukuntanimi = haenimi(ii,"FI")
                seutukuntanimi_sv = haenimi(ii,"SV")
                seutukuntanimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "laani":
                laanikoodi = ii["koodiArvo"]
                laaninimi = haenimi(ii,"FI")
                laaninimi_sv = haenimi(ii,"SV")
                laaninimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "kuntaryhma":
                kuntaryhmakoodi = ii["koodiArvo"]
                kuntaryhmanimi = haenimi(ii,"FI")
                kuntaryhmanimi_sv = haenimi(ii,"SV")
                kuntaryhmanimi_en = haenimi(ii,"EN")
        
        #print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %d -- (%s,%s,%s,%s, %s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s)" % (lkm, koodi,nimi,nimi_sv,nimi_en, alkupvm,loppupvm, maakuntakoodi,maakuntanimi,maakuntanimi_sv,maakuntanimi_en, avikoodi,avinimi,avinimi_sv,avinimi_en, elykoodi,elynimi,elynimi_sv,elynimi_en, kielisuhdekoodi,kielisuhdenimi,kielisuhdenimi_sv,kielisuhdenimi_en, seutukuntakoodi,seutukuntanimi,seutukuntanimi_sv,seutukuntanimi_en, laanikoodi,laaninimi,laaninimi_sv,laaninimi_en, kuntaryhmakoodi,kuntaryhmanimi,kuntaryhmanimi_sv,kuntaryhmanimi_en)).encode('utf-8')
        print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %d -- %s" % (lkm,koodi)).encode('utf-8')
        cur.execute("""INSERT INTO sa_alueluokitus (koodi,nimi,nimi_sv,nimi_en, alkupvm,loppupvm, maakuntakoodi,maakuntanimi,maakuntanimi_sv,maakuntanimi_en, avikoodi,avinimi,avinimi_sv,avinimi_en, elykoodi,elynimi,elynimi_sv,elynimi_en, kielisuhdekoodi,kielisuhdenimi,kielisuhdenimi_sv,kielisuhdenimi_en, seutukuntakoodi,seutukuntanimi,seutukuntanimi_sv,seutukuntanimi_en, laanikoodi,laaninimi,laaninimi_sv,laaninimi_en, kuntaryhmakoodi,kuntaryhmanimi,kuntaryhmanimi_sv,kuntaryhmanimi_en) VALUES (%s,%s,%s,%s, %s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s, %s,%s,%s,%s)""", (koodi,nimi,nimi_sv,nimi_en, alkupvm,loppupvm, maakuntakoodi,maakuntanimi,maakuntanimi_sv,maakuntanimi_en, avikoodi,avinimi,avinimi_sv,avinimi_en, elykoodi,elynimi,elynimi_sv,elynimi_en, kielisuhdekoodi,kielisuhdenimi,kielisuhdenimi_sv,kielisuhdenimi_en, seutukuntakoodi,seutukuntanimi,seutukuntanimi_sv,seutukuntanimi_en, laanikoodi,laaninimi,laaninimi_sv,laaninimi_en, kuntaryhmakoodi,kuntaryhmanimi,kuntaryhmanimi_sv,kuntaryhmanimi_en))
        conn.commit()

    cur.close()
    conn.close()
    
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" valmis").encode('utf-8')
    
if __name__ == "__main__":
    main()
