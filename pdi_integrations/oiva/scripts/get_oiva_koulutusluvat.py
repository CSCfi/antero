#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
Simple import script to load data from an API and push to csv
"""

import requests
import os #needed for Jenkisn environment variables
#import json
#import pandas as pd
from pandas.io.json import json_normalize
import datetime

#result = []
koulutusluvat=[]

loadtime=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")
url = 'https://oiva.minedu.fi/api/export/koulutusluvat'
try:
    api_key = os.environ['AUTH_API_KEY']
except KeyError:
    print("API-key missing")
try:
    api_user = os.environ['AUTH_API_USER']
except KeyError:
    print("API-user missing")

reqheaders = {'Content-Type': 'application/json'}
reqheaders['Caller-id'] = '1.2.246.562.10.2013112012294919827487.vipunen'
 
def makerow_koulutusluvat():
  return {
    "id": None,   
	"alkupvm": None,
	"loppupvm": None,
    "asianumero": None,
    "jarjestajaYtunnus": None,
    #"koulutukset": None,
    "koulutustyyppi": None,
    "laajaOppisopimuskoulutus": None,
    "oppilaitostyyppi": None,
	"luoja": None,   # text, optional
    "luontipvm": None,   # timestamp without time zone, optional
    "paivittaja": None,   # text, optional
    "paivityspvm": None,   # timestamp without time zone, optional
    "source":url,
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

# Loading the data into response  list (koulutusluvat) 
response = requests.get(url,  auth=(api_user, api_key)).json()

for i in response:
	row = makerow_koulutusluvat()
	row["id"] = key_check("uuid", i)    
	row["alkupvm"] = key_check("alkupvm", i) 
	row["loppupvm"] = key_check("loppupvm", i)
	row["asianumero"] = key_check("asianumero", i) 
	row["jarjestajaYtunnus"] = key_check("jarjestajaYtunnus", i)
	row["koulutustyyppi"] = key_check("koulutustyyppi", i) 
	row["laajaOppisopimuskoulutus"] = key_check("laajaOppisopimuskoulutus", i) 
	row["oppilaitostyyppi"] = key_check("oppilaitostyyppi", i)
	row["luoja"] = key_check("luoja", i)
	row["luontipvm"] = key_check("luontipvm", i) 
	row["paivittaja"] = key_check("paivittaja", i)
	row["paivityspvm"] = key_check("paivityspvm", i)
	row["loadtime"] = str(loadtime)
	
	koulutusluvat.append(row)
        
koulutusluvat = json_normalize(koulutusluvat)


## Export data to csv's


koulutusluvat.to_csv(path_or_buf='d:\pdi_integrations\data\oiva\oiva_koulutusluvat.csv', sep='|', na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', line_terminator='\n', escapechar='$')



 
