#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
Simple import script to load data from an API and push to csv
"""

import requests
import os #needed for Jenkisn environment variables
#import json
import pandas as pd
from pandas.io.json import json_normalize
import datetime

result = []
jarjestysluvat = []
oiva_maaraykset=[]
maaraykset=[]
lupa_data= []
loadtime=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")
url = 'https://oiva.minedu.fi/api/export/jarjestysluvat'
try:
    api_key = os.environ['AUTH_API_KEY']
except KeyError:
    print("API-key missing")
try:
    api_user = os.environ['AUTH_API_USER']
except KeyError:
    print("API-user missing")

reqheaders = {'Content-Type': 'application/json'}

#reqheaders['Authorization'] = 'oiva '

def makerow_jarjestysluvat():
  return {
    "id": None,     # bigint	pk	
    "edellinen_lupa_id": None,     # bigint,	optional
    "paatoskierros_id": None,     # bigint	not null
    "lupatila_id": None,     # bigint	not null
    "asiatyyppi_id": None,     # bigint	not null
    "diaarinumero": None,     # character varying(20)	not null
    "jarjestajaYtunnus": None,     # character varying(10)	not null
    "jarjestajaOid": None,     # character varying(255)	not null
    "alkupvm": None,     # date	not null
    "loppupvm": None,     # date, optional
    "meta.kirje": None,
    "meta.ministeri": None,
    "meta.ministeri_nimike": None,
    "meta.esittelija": None,
    "meta.esittelija_nimike": None,
    "meta.paatos_old_id": None,
    "meta.koulutustehtava_old_id": None,
    "maksu": None,     # boolean, optional
    "luoja": None,     # text, optional	
    "luontipvm": None,     # timestamp without time zone, optional	
    "paivittaja": None,     # text, optional
    "paivityspvm": None,     # timestamp without time zone, optional
    "source": None,
    "loadtime": None
    }
def makerow_maaraykset():
  return {
    "id": None,
    "lupaid": None,   # bigint not null	
    "kohde.tunniste": None,  
    "koodisto": None,   # character varying(255)
    "arvo": None,   # text, optional
    "koodiarvo": None,   # character varying(255), optional
    "maaraystyyppi.tunniste": None,
    #"meta": None,   # jsonb , optional
    "luoja": None,   # text, optional
    "luontipvm": None,   # timestamp without time zone, optional
    "paivittaja": None,   # text, optional
    "paivityspvm": None,   # timestamp without time zone, optional
    "source": None,
    "loadtime": None
  }
# URL Status check
def url_ok(url):
    r = requests.head(url,  auth=(api_user, api_key))
    return r.status_code == 200
# http status code  
http_status_code = str(requests.head(url,  auth=(api_user, api_key)).status_code)

# Check if key 'x' is in dictionary 'y' 
def key_check(x,y):
   if x in y:
      return y[x] 
   else:
      return None

if url_ok(url):
   print("OIVA API was available with status code: " +http_status_code) 
else:
   print("OIVA API was not accessible and returned status code:" + http_status_code)
   exit

# Loading the data into response  list (jarjestysluvat) 
response = requests.get(url,  auth=(api_user, api_key)).json()
  
# select jarjestysluvat
for i in response:
    row = makerow_jarjestysluvat()
    row["id"] = i["maaraykset"][0]["lupaId"]
    row["edellinen_lupa_id"] =key_check("paatoskierros_id", i) 
    row["lupatila_id"] = key_check("lupatila_id", i) 
    row["asiatyyppi_id"] = key_check("asiatyyppi_id", i) 
    row["diaarinumero"] = key_check("diaarinumero", i)
    row["jarjestajaYtunnus"] = key_check("jarjestajaYtunnus", i)
    row["jarjestajaOid"] = key_check("jarjestajaOid", i) 
    row["alkupvm"] = key_check("alkupvm", i) 
    row["loppupvm"] = key_check("loppupvm", i)
    row["meta.kirje"] = key_check("kirje", i["meta"])
    row["meta.ministeri"] = key_check("ministeri", i["meta"])
    row["meta.ministeri_nimike"] = key_check("ministeri_nimike", i["meta"])
    row["meta.esittelija"] = key_check("esittelija", i["meta"])
    row["meta.esittelija_nimike"] = key_check("esittelija_nimike", i["meta"])
    row["meta.paatos_old_id"] = key_check("paatos_old_id", i["meta"]) 
    row["meta.koulutustehtava_old_id"] = key_check("koulutustehtava_old_id", i["meta"])
    row["maksu"] = key_check("maksu", i) 
    row["luoja"] = key_check("luoja", i)
    row["luontipvm"] = key_check("luontipvm", i) 
    row["paivittaja"] = key_check("paivittaja", i)
    row["paivityspvm"] = key_check("paivityspvm", i)
    row["source"] = "arvo.csc.fi/api/vipunen/uraseuranta"
    row["loadtime"] = str(loadtime)

    lupa_data.append(row)
#   split maaraykset into own list from respone
    #maarays=i["maaraykset"]
    maaraykset.append(i["maaraykset"])

# select maaraykset
for k in maaraykset:
    for m in k:
        row = makerow_maaraykset()
        row["id"] = key_check("id", m)
        row["lupaId"] = key_check("lupaId", m)
        row["kohde.tunniste"] = key_check("tunniste", m["kohde"])
        row["koodisto"] = key_check("koodisto", m)
        row["koodiarvo"] = key_check("koodiarvo", m)
        row["arvo"] = key_check("arvo", m)
        row["maaraystyyppi.tunniste"] =  key_check("tunniste", m["maaraystyyppi"])
        #row["meta"] = m["meta"]	 if "meta" in m else  None
        row["luoja"] = key_check("luoja", m)
        row["luontipvm"] = key_check("luontipvm", m)
        row["paivittaja"] = key_check("paivittaja", m)
        row["paivityspvm"] = key_check("paivityspvm", m)
        row["source"] = "arvo.csc.fi/api/vipunen/uraseuranta"
        row["loadtime"] = str(loadtime)
        
        oiva_maaraykset.append(row)
        
jarjestysluvat = json_normalize(lupa_data)
oivamaaraykset = json_normalize(oiva_maaraykset)

## Export data to csv's


jarjestysluvat.to_csv(path_or_buf='d:/pdi_integrations/data/oiva/oiva_jarjestysluvat.csv', sep='|', na_rep='', 
#data.to_csv(path_or_buf='C:/Documents/ARVO/uraseuranta.csv', sep='|', na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', line_terminator='\n', escapechar='$')
oivamaaraykset.to_csv(path_or_buf='d:/pdi_integrations/data/oiva/oiva_maaraykset.csv', sep='|', na_rep='', 
#data.to_csv(path_or_buf='C:/Documents/ARVO/uraseuranta.csv', sep='|', na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', line_terminator='\n', escapechar='$')


 
