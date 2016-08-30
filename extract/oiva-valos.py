#!/usr/bin/python

from time import localtime, strftime

import psycopg2
import sys

import requests
import json

def main():
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" alkaa").encode('utf-8')

    kone = "localhost"
    kanta = "antero"
    tunnus = "antero"
    salasana = "antero"
    
    taulu = "sa_valos"
    url = "https://amkoutetestapp.csc.fi/api/public/reporting"

    conn_string = "host='%s' dbname='%s' user='%s' password='%s'" % (kone,kanta,tunnus,salasana)
    print ("Connecting to database")
    conn = psycopg2.connect(conn_string)
    cur = conn.cursor()

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" tyhjennetaan %s"%(taulu)).encode('utf-8')
    cur.execute("DELETE FROM %s"%(taulu))
    conn.commit()

    cur.execute("SELECT * FROM %s LIMIT 0"%(taulu))
    sarakelist = [desc[0] for desc in cur.description]
    sarakelist.remove('id')
    sarakelist.remove('luotuaika')
    sarakestr = ",".join(sarakelist)
    paikanpitajat = ','.join(['%s' for s in sarakelist])

    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" haetaan -- "+url).encode('utf-8')
    r = requests.get(url, verify=False)
    j = r.json()
    lkm = 0
    for i in j:
        lkm += 1
        print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" %s -- %s"%(lkm,i["ytunnus"])).encode('utf-8')
        statement = "INSERT INTO %s (%s) VALUES (%s);" % (taulu,sarakestr,paikanpitajat)
        cur.execute(statement,([i[s] for s in sarakelist]))
        conn.commit()
        
    cur.close()
    conn.close()
    
    print (strftime("%Y-%m-%d %H:%M:%S", localtime())+" valmis").encode('utf-8')
    
if __name__ == "__main__":
    main()
