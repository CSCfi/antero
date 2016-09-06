#!/usr/bin/python

from time import localtime, strftime

import psycopg2
import sys

import http.client
opintopolkuuri = "virkailija.opintopolku.fi"
httpconn = http.client.HTTPSConnection(opintopolkuuri)

import json

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

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" tyhjennetaan sa_oppilaitosluokitus").encode('utf-8')
    cur.execute("DELETE FROM sa_oppilaitosluokitus")
    conn.commit()

    linkit = [
        "/organisaatio-service/rest/organisaatio/v2/hierarkia/hae?organisaatiotyyppi=Koulutustoimija&aktiiviset=true&suunnitellut=true&lakkautetut=false",
        "/organisaatio-service/rest/organisaatio/v2/hierarkia/hae?organisaatiotyyppi=Koulutustoimija&aktiiviset=false&suunnitellut=false&lakkautetut=true"
    ]
    for url in linkit:
        print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" haetaan opintopolusta -- "+url).encode('utf-8')
        httpconn.request('GET', url)
        r = httpconn.getresponse()
        j = json.loads(r.read())
        lkm = 0
        for i in j["organisaatiot"]:
            jarjestajaoid = i["oid"]
            jarjestajakoodi = None if "ytunnus" not in i else i["ytunnus"] # voi olla None
            jarjestajanimi = None if "fi" not in i["nimi"] else i["nimi"]["fi"]
            jarjestajanimi_sv = None if "sv" not in i["nimi"] else i["nimi"]["sv"]
            jarjestajanimi_en = None if "en" not in i["nimi"] else i["nimi"]["en"]

            for o in i["children"]:
                if "oppilaitosKoodi" in o:
                    lkm += 1
                    # sarakkeet
                    oid = ""
                    koodi = ""
                    nimi = ""
                    nimi_sv = None
                    nimi_en = None
                    alkupvm = ""
                    loppupvm = None
                    #jarjestajaoid = None
                    #jarjestajakoodi = None
                    #jarjestajanimi = None
                    #jarjestajanimi_sv = None
                    #jarjestajanimi_en = None
                    kuntakoodi = None # nimet erikseen
                    oppilaitostyyppikoodi = None # nimet erikseen
                    
                    oid = o["oid"]
                    koodi = o["oppilaitosKoodi"]
                    nimi = None if "fi" not in o["nimi"] else o["nimi"]["fi"]
                    nimi_sv = None if "sv" not in o["nimi"] else o["nimi"]["sv"]
                    nimi_en = None if "en" not in o["nimi"] else o["nimi"]["en"]
                    alkupvm = "1900-1-1" if "alkuPvm" not in o or o["alkuPvm"]<0 else strftime("%Y-%m-%d",localtime(o["alkuPvm"]/1000))
                    loppupvm = None if "lakkautusPvm" not in o else strftime("%Y-%m-%d",localtime(o["lakkautusPvm"]/1000))
                    
                    kuntakoodi = o["kotipaikkaUri"].replace("kunta_","")
                    # => nimitiedot erikseen
                    oppilaitostyyppikoodi = o["oppilaitostyyppi"].replace("oppilaitostyyppi_","").replace("#1","")
                    # => nimitiedot erikseen
            
                    #print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %d -- (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)" % (lkm,oid,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm,kuntakoodi,oppilaitostyyppikoodi,jarjestajaoid,jarjestajakoodi,jarjestajanimi,jarjestajanimi_sv,jarjestajanimi_en)).encode('utf-8')
                    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %d -- %s" % (lkm,koodi)).encode('utf-8')
                    cur.execute("""INSERT INTO sa_oppilaitosluokitus (oid,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm,kuntakoodi,oppilaitostyyppikoodi,jarjestajaoid,jarjestajakoodi,jarjestajanimi,jarjestajanimi_sv,jarjestajanimi_en) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""", (oid,koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm,kuntakoodi,oppilaitostyyppikoodi,jarjestajaoid,jarjestajakoodi,jarjestajanimi,jarjestajanimi_sv,jarjestajanimi_en))
                    conn.commit()

    cur.close()
    conn.close()
    
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" valmis").encode('utf-8')
    
if __name__ == "__main__":
    main()
