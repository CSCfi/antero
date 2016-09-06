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

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" tyhjennetaan sa_koulutusluokitus").encode('utf-8')
    cur.execute("DELETE FROM sa_koulutusluokitus")
    conn.commit()

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" haetaan opintopolusta").encode('utf-8')
    url = "/koodisto-service/rest/json/koulutus/koodi"
    httpconn.request('GET', url)
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
        koulutusaste2002koodi = None
        koulutusaste2002nimi = None
        koulutusaste2002nimi_sv = None
        koulutusaste2002nimi_en = None
        koulutusala2002koodi = None
        koulutusala2002nimi = None
        koulutusala2002nimi_sv = None
        koulutusala2002nimi_en = None
        opintoala2002koodi = None
        opintoala2002nimi = None
        opintoala2002nimi_sv = None
        opintoala2002nimi_en = None
        koulutusaste1995koodi = None
        koulutusaste1995nimi = None
        koulutusaste1995nimi_sv = None
        koulutusaste1995nimi_en = None
        koulutusala1995koodi = None
        koulutusala1995nimi = None
        koulutusala1995nimi_sv = None
        koulutusala1995nimi_en = None
        opintoala1995koodi = None
        opintoala1995nimi = None
        opintoala1995nimi_sv = None
        opintoala1995nimi_en = None
        tutkintokoodi = None
        tutkintonimi = None
        tutkintonimi_sv = None
        tutkintonimi_en = None
        tutkintotyyppikoodi = None
        tutkintotyyppinimi = None
        tutkintotyyppinimi_sv = None
        tutkintotyyppinimi_en = None
        koulutustyyppikoodi = None
        koulutustyyppinimi = None
        koulutustyyppinimi_sv = None
        koulutustyyppinimi_en = None
        isced2011koulutusastekoodi = None
        isced2011koulutusastenimi = None
        isced2011koulutusastenimi_sv = None
        isced2011koulutusastenimi_en = None
        isced2011koulutusastetaso1koodi = None
        isced2011koulutusastetaso1nimi = None
        isced2011koulutusastetaso1nimi_sv = None
        isced2011koulutusastetaso1nimi_en = None
        isced2011koulutusastetaso2koodi = None
        isced2011koulutusastetaso2nimi = None
        isced2011koulutusastetaso2nimi_sv = None
        isced2011koulutusastetaso2nimi_en = None
        isced2011koulutusalataso1koodi = None
        isced2011koulutusalataso1nimi = None
        isced2011koulutusalataso1nimi_sv = None
        isced2011koulutusalataso1nimi_en = None
        isced2011koulutusalataso2koodi = None
        isced2011koulutusalataso2nimi = None
        isced2011koulutusalataso2nimi_sv = None
        isced2011koulutusalataso2nimi_en = None
        isced2011koulutusalataso3koodi = None
        isced2011koulutusalataso3nimi = None
        isced2011koulutusalataso3nimi_sv = None
        isced2011koulutusalataso3nimi_en = None
        
        koodi = i["koodiArvo"]
        nimi = haenimi(i,"FI")
        nimi_sv = haenimi(i,"SV")
        nimi_en = haenimi(i,"FI")
        alkupvm = i["voimassaAlkuPvm"]
        loppupvm = i["voimassaLoppuPvm"]

        # luokitukset
        httpconn.request('GET', "/koodisto-service/rest/json/relaatio/sisaltyy-alakoodit/%s" % i["koodiUri"])
        rr = httpconn.getresponse()
        jj = json.loads(rr.read())
        ss = ""
        for ii in jj:
            if ii["koodisto"]["koodistoUri"] == "koulutusasteoph2002":
                koulutusaste2002koodi = ii["koodiArvo"]
                koulutusaste2002nimi = haenimi(ii,"FI")
                koulutusaste2002nimi_sv = haenimi(ii,"SV")
                koulutusaste2002nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "koulutusalaoph2002":
                koulutusala2002koodi = ii["koodiArvo"]
                koulutusala2002nimi = haenimi(ii,"FI")
                koulutusala2002nimi_sv = haenimi(ii,"SV")
                koulutusala2002nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "opintoalaoph2002":
                opintoala2002koodi = ii["koodiArvo"]
                opintoala2002nimi = haenimi(ii,"FI")
                opintoala2002nimi_sv = haenimi(ii,"SV")
                opintoala2002nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "koulutusasteoph1995":
                koulutusaste1995koodi = ii["koodiArvo"]
                koulutusaste1995nimi = haenimi(ii,"FI")
                koulutusaste1995nimi_sv = haenimi(ii,"SV")
                koulutusaste1995nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "koulutusalaoph1995":
                koulutusala1995koodi = ii["koodiArvo"]
                koulutusala1995nimi = haenimi(ii,"FI")
                koulutusala1995nimi_sv = haenimi(ii,"SV")
                koulutusala1995nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "opintoalaoph1995":
                opintoala1995koodi = ii["koodiArvo"]
                opintoala1995nimi = haenimi(ii,"FI")
                opintoala1995nimi_sv = haenimi(ii,"SV")
                opintoala1995nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "tutkinto":
                tutkintokoodi = ii["koodiArvo"]
                tutkintonimi = haenimi(ii,"FI")
                tutkintonimi_sv = haenimi(ii,"SV")
                tutkintonimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "tutkintotyyppi":
                tutkintotyyppikoodi = ii["koodiArvo"]
                tutkintotyyppinimi = haenimi(ii,"FI")
                tutkintotyyppinimi_sv = haenimi(ii,"SV")
                tutkintotyyppinimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "koulutustyyppi":
                koulutustyyppikoodi = ii["koodiArvo"]
                koulutustyyppinimi = haenimi(ii,"FI")
                koulutustyyppinimi_sv = haenimi(ii,"SV")
                koulutustyyppinimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "isced2011koulutusaste":
                isced2011koulutusastekoodi = ii["koodiArvo"]
                isced2011koulutusastenimi = haenimi(ii,"FI")
                isced2011koulutusastenimi_sv = haenimi(ii,"SV")
                isced2011koulutusastenimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "isced2011koulutusastetaso1":
                isced2011koulutusastetaso1koodi = ii["koodiArvo"]
                isced2011koulutusastetaso1nimi = haenimi(ii,"FI")
                isced2011koulutusastetaso1nimi_sv = haenimi(ii,"SV")
                isced2011koulutusastetaso1nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "isced2011koulutusastetaso2":
                isced2011koulutusastetaso2koodi = ii["koodiArvo"]
                isced2011koulutusastetaso2nimi = haenimi(ii,"FI")
                isced2011koulutusastetaso2nimi_sv = haenimi(ii,"SV")
                isced2011koulutusastetaso2nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso1":
                isced2011koulutusalataso1koodi = ii["koodiArvo"]
                isced2011koulutusalataso1nimi = haenimi(ii,"FI")
                isced2011koulutusalataso1nimi_sv = haenimi(ii,"SV")
                isced2011koulutusalataso1nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso2":
                isced2011koulutusalataso2koodi = ii["koodiArvo"]
                isced2011koulutusalataso2nimi = haenimi(ii,"FI")
                isced2011koulutusalataso2nimi_sv = haenimi(ii,"SV")
                isced2011koulutusalataso2nimi_en = haenimi(ii,"EN")
            if ii["koodisto"]["koodistoUri"] == "isced2011koulutusalataso3":
                isced2011koulutusalataso3koodi = ii["koodiArvo"]
                isced2011koulutusalataso3nimi = haenimi(ii,"FI")
                isced2011koulutusalataso3nimi_sv = haenimi(ii,"SV")
                isced2011koulutusalataso3nimi_en = haenimi(ii,"EN")
        
        #print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- (%s,%s,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s ,%s,%s,%s,%s )" % (koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm ,koulutusaste2002koodi,koulutusaste2002nimi,koulutusaste2002nimi_sv,koulutusaste2002nimi_en ,koulutusala2002koodi,koulutusala2002nimi,koulutusala2002nimi_sv,koulutusala2002nimi_en ,opintoala2002koodi,opintoala2002nimi,opintoala2002nimi_sv,opintoala2002nimi_en ,koulutusaste1995koodi,koulutusaste1995nimi,koulutusaste1995nimi_sv,koulutusaste1995nimi_en ,koulutusala1995koodi,koulutusala1995nimi,koulutusala1995nimi_sv,koulutusala1995nimi_en ,opintoala1995koodi,opintoala1995nimi,opintoala1995nimi_sv,opintoala1995nimi_en ,tutkintokoodi,tutkintonimi,tutkintonimi_sv,tutkintonimi_en ,tutkintotyyppikoodi,tutkintotyyppinimi,tutkintotyyppinimi_sv,tutkintotyyppinimi_en ,koulutustyyppikoodi,koulutustyyppinimi,koulutustyyppinimi_sv,koulutustyyppinimi_en ,isced2011koulutusastekoodi,isced2011koulutusastenimi,isced2011koulutusastenimi_sv,isced2011koulutusastenimi_en ,isced2011koulutusastetaso1koodi,isced2011koulutusastetaso1nimi,isced2011koulutusastetaso1nimi_sv,isced2011koulutusastetaso1nimi_en ,isced2011koulutusastetaso2koodi,isced2011koulutusastetaso2nimi,isced2011koulutusastetaso2nimi_sv,isced2011koulutusastetaso2nimi_en ,isced2011koulutusalataso1koodi,isced2011koulutusalataso1nimi,isced2011koulutusalataso1nimi_sv,isced2011koulutusalataso1nimi_en ,isced2011koulutusalataso2koodi,isced2011koulutusalataso2nimi,isced2011koulutusalataso2nimi_sv,isced2011koulutusalataso2nimi_en ,isced2011koulutusalataso3koodi,isced2011koulutusalataso3nimi,isced2011koulutusalataso3nimi_sv,isced2011koulutusalataso3nimi_en)).encode('utf-8')
        print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" -- %d -- %s" % (lkm,koodi)).encode('utf-8')
        cur.execute("""INSERT INTO sa_koulutusluokitus (koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm ,koulutusaste2002koodi,koulutusaste2002nimi,koulutusaste2002nimi_sv,koulutusaste2002nimi_en ,koulutusala2002koodi,koulutusala2002nimi,koulutusala2002nimi_sv,koulutusala2002nimi_en ,opintoala2002koodi,opintoala2002nimi,opintoala2002nimi_sv,opintoala2002nimi_en ,koulutusaste1995koodi,koulutusaste1995nimi,koulutusaste1995nimi_sv,koulutusaste1995nimi_en ,koulutusala1995koodi,koulutusala1995nimi,koulutusala1995nimi_sv,koulutusala1995nimi_en ,opintoala1995koodi,opintoala1995nimi,opintoala1995nimi_sv,opintoala1995nimi_en ,tutkintokoodi,tutkintonimi,tutkintonimi_sv,tutkintonimi_en ,tutkintotyyppikoodi,tutkintotyyppinimi,tutkintotyyppinimi_sv,tutkintotyyppinimi_en ,koulutustyyppikoodi,koulutustyyppinimi,koulutustyyppinimi_sv,koulutustyyppinimi_en ,isced2011koulutusastekoodi,isced2011koulutusastenimi,isced2011koulutusastenimi_sv,isced2011koulutusastenimi_en ,isced2011koulutusastetaso1koodi,isced2011koulutusastetaso1nimi,isced2011koulutusastetaso1nimi_sv,isced2011koulutusastetaso1nimi_en ,isced2011koulutusastetaso2koodi,isced2011koulutusastetaso2nimi,isced2011koulutusastetaso2nimi_sv,isced2011koulutusastetaso2nimi_en ,isced2011koulutusalataso1koodi,isced2011koulutusalataso1nimi,isced2011koulutusalataso1nimi_sv,isced2011koulutusalataso1nimi_en ,isced2011koulutusalataso2koodi,isced2011koulutusalataso2nimi,isced2011koulutusalataso2nimi_sv,isced2011koulutusalataso2nimi_en ,isced2011koulutusalataso3koodi,isced2011koulutusalataso3nimi,isced2011koulutusalataso3nimi_sv,isced2011koulutusalataso3nimi_en) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)""", (koodi,nimi,nimi_sv,nimi_en,alkupvm,loppupvm ,koulutusaste2002koodi,koulutusaste2002nimi,koulutusaste2002nimi_sv,koulutusaste2002nimi_en ,koulutusala2002koodi,koulutusala2002nimi,koulutusala2002nimi_sv,koulutusala2002nimi_en ,opintoala2002koodi,opintoala2002nimi,opintoala2002nimi_sv,opintoala2002nimi_en ,koulutusaste1995koodi,koulutusaste1995nimi,koulutusaste1995nimi_sv,koulutusaste1995nimi_en ,koulutusala1995koodi,koulutusala1995nimi,koulutusala1995nimi_sv,koulutusala1995nimi_en ,opintoala1995koodi,opintoala1995nimi,opintoala1995nimi_sv,opintoala1995nimi_en ,tutkintokoodi,tutkintonimi,tutkintonimi_sv,tutkintonimi_en ,tutkintotyyppikoodi,tutkintotyyppinimi,tutkintotyyppinimi_sv,tutkintotyyppinimi_en ,koulutustyyppikoodi,koulutustyyppinimi,koulutustyyppinimi_sv,koulutustyyppinimi_en ,isced2011koulutusastekoodi,isced2011koulutusastenimi,isced2011koulutusastenimi_sv,isced2011koulutusastenimi_en ,isced2011koulutusastetaso1koodi,isced2011koulutusastetaso1nimi,isced2011koulutusastetaso1nimi_sv,isced2011koulutusastetaso1nimi_en ,isced2011koulutusastetaso2koodi,isced2011koulutusastetaso2nimi,isced2011koulutusastetaso2nimi_sv,isced2011koulutusastetaso2nimi_en ,isced2011koulutusalataso1koodi,isced2011koulutusalataso1nimi,isced2011koulutusalataso1nimi_sv,isced2011koulutusalataso1nimi_en ,isced2011koulutusalataso2koodi,isced2011koulutusalataso2nimi,isced2011koulutusalataso2nimi_sv,isced2011koulutusalataso2nimi_en ,isced2011koulutusalataso3koodi,isced2011koulutusalataso3nimi,isced2011koulutusalataso3nimi_sv,isced2011koulutusalataso3nimi_en))
        conn.commit()

    cur.close()
    conn.close()
    
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" valmis").encode('utf-8')
    
if __name__ == "__main__":
    main()
