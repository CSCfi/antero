#!/usr/bin/python
# vim: set fileencoding=UTF-8 :
"""
Simple import script to load data from an API and push to csv
"""
import truststore
truststore.inject_into_ssl()

import requests
import os #needed for Jenkisn environment variables
#import json
import pandas as pd
#from pandas.io.json import json_normalize
import datetime

jarjestysluvat = []
oiva_maaraykset=[]
oiva_alimaaraykset=[]
maaraykset=[]
alimaaraykset=[]
lupa_data= []

loadtime=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")
url = 'https://oiva.okm.fi/api/export/jarjestysluvat'
url_paalupa_alku = 'https://oiva.okm.fi/api/luvat/'
url_paalupa_loppu = '/paaluvat/nykyinen'
ca_bundle_path = 'D:\\antero\pdi_integrations\oiva\scripts\oiva-okm-fi-chain.pem'  # Replace with the actual path to your CA bundle

try:
    api_key = os.environ['AUTH_API_KEY']
    api_user = os.environ['AUTH_API_USER']
except:
    print("Error getting parameters from Jenkins")
	
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Caller-id'] = '1.2.246.562.10.2013112012294919827487.vipunen'


def makerow_jarjestysluvat():
  return {
    "id": None,     # bigint	pk	
    "edellinen_lupa_id": None,     # bigint,	optional
    "lupatila_id": None,     # bigint	not null
    "asiatyyppi_id": None,     # bigint	not null
    "diaarinumero": None,     # character varying(20)	not null
    "jarjestajaYtunnus": None,     # character varying(10)	not null
    "jarjestajaOid": None,     # character varying(255)	not null
    "alkupvm": None,     # date	not null
    "loppupvm": None,     # date, optional
    "paatospvm": None,   
    "koulutustyyppi": None,
    "paalupa_id": None,
    "meta": None,
    "koulutusmuodonPaasivunOtsikko": None,
    "kirje": None,
    "ministeri": None,
    "ministeri_nimike": None,
    "esittelija": None,
    "esittelija_nimike": None,
    "paatos_old_id": None,
    "koulutustehtava_old_id": None,
    "maksu": None,     # boolean, optional
    "luoja": None,     # text, optional	
    "luontipvm": None,     # timestamp without time zone, optional	
    "paivittaja": None,     # text, optional
    "paivityspvm": None,     # timestamp without time zone, optional
    "source": url,
    "loadtime": None
    }
	
def makerow_maaraykset():
  return {
    "id": None,
    "lupaid": None,   # bigint not null	
    "kohde_tunniste": None,  
    "koodisto": None,   # character varying(255)
    "arvo": None,   # text, optional
    "koodiarvo": None,   # character varying(255), optional
    "maaraystyyppi_tunniste": None,
    "orgOid": None,
    "meta": None,   # jsonb , optional
    "luoja": None,   # text, optional
    "luontipvm": None,   # timestamp without time zone, optional
    "paivittaja": None,   # text, optional
    "paivityspvm": None,   # timestamp without time zone, optional
    "source":url,
    "loadtime": None
  }
  
def makerow_alimaaraykset():
  return {
    "id": None,
    "maaraysid": None,   # bigint not null	
    "kohde_tunniste": None,  
    "koodisto": None,   # character varying(255)
    "koodiarvo": None,   # character varying(255), optional
    "arvo": None,
    "maaraystyyppi_tunniste": None,
    "kohde_tunniste": None,
	"orgOid": None,
	"ylempi_alimaaraysId": None,
    "luoja": None,   # text, optional
    "luontipvm": None,   # timestamp without time zone, optional
    "paivittaja": None,   # text, optional
    "paivityspvm": None,   # timestamp without time zone, optional
    "source":url,
    "loadtime": None,
    "meta.alkupvm": None,
    "meta.loppupvm": None
  } 
  


# Check if key 'x' is in dictionary 'y' 
def key_check(x,y):
   if x in y:
      return y[x] 
   else:
      return None

# Loading the data into response  list (jarjestysluvat) 
#response = requests.get(url,  auth=(api_user, api_key), verify=ca_bundle_path).json()
response = requests.get(url,  auth=(api_user, api_key)).json()

for i in response:
    row = makerow_jarjestysluvat()
    row["id"] = key_check("uuid",i)
    row["lupa_uuid"] = key_check("uuid",i)
    row["edellinen_lupa_id"] = key_check("edellinen_lupa_id", i) 
    # row["paatoskierros_id"] = key_check("paatoskierros_id", i) 
    row["lupatila_id"] = key_check("lupatila_id", i) 
    row["asiatyyppi_id"] = key_check("asiatyyppi_id", i) 
    row["diaarinumero"] = key_check("diaarinumero", i)
    row["jarjestajaYtunnus"] = key_check("jarjestajaYtunnus", i)
    row["jarjestajaOid"] = key_check("jarjestajaOid", i) 
    #row["nimi"] = key_check("nimi", i) 
    row["alkupvm"] = key_check("alkupvm", i) 
    row["loppupvm"] = key_check("loppupvm", i)
    row["paatospvm"] = key_check("paatospvm", i)
    row["koulutustyyppi"] = key_check("koulutustyyppi", i) 
    #row["meta"] = i["meta"]
    if "koulutusmuodonPaasivunOtsikko" in i["meta"]:
        row["koulutusmuodonPaasivunOtsikko"] = key_check("koulutusmuodonPaasivunOtsikko", i["meta"])
    row["kirje"] = key_check("kirje", i["meta"])
    row["ministeri"] = key_check("ministeri", i["meta"])
    row["ministeri_nimike"] = key_check("ministeri_nimike", i["meta"])
    row["esittelija"] = key_check("esittelija", i["meta"])
    row["esittelija_nimike"] = key_check("esittelija_nimike", i["meta"])
    row["paatos_old_id"] = key_check("paatos_old_id", i["meta"]) 
    row["koulutustehtava_old_id"] = key_check("koulutustehtava_old_id", i["meta"])
    row["maksu"] = key_check("maksu", i) 
    row["luoja"] = key_check("luoja", i)
    row["luontipvm"] = key_check("luontipvm", i) 
    row["paivittaja"] = key_check("paivittaja", i)
    row["paivityspvm"] = key_check("paivityspvm", i)
    row["loadtime"] = str(loadtime)

    # tuva-luville pääluvan uuid 
    if row["koulutustyyppi"] == "5":
        url_paalupa = 	url_paalupa_alku + row["id"] + url_paalupa_loppu
        response2 = requests.get(url_paalupa, verify=ca_bundle_path)
        try:
            response2 = response2.json()
            row["paalupa_id"] = response2["uuid"]
        except:
            pass

    lupa_data.append(row)
	
#   split maaraykset into own list from response lupa, uuid key included for every maarays 
    temp=i["maaraykset"]
    temp3=[]
    for z in temp:
        temp2=dict()
        temp2=z
        temp2.update({"lupa_uuid":key_check("uuid",i)})
        temp3.append(temp2)
    maaraykset.append(temp3)   
 
    
# select maaraykset
for k in maaraykset:
	for m in k:
		row = makerow_maaraykset()
		row["id"] = key_check("uuid", m)    
		row["lupaid"] = m["lupa_uuid"]
		if "kohde" in m:
			row["kohde_tunniste"] = key_check("tunniste", m["kohde"])
		else:
			row["kohde_tunniste"] = None
		row["koodisto"] = key_check("koodisto", m)
		row["koodiarvo"] = key_check("koodiarvo", m)
		row["arvo"] = key_check("arvo", m)
		if "maaraystyyppi" in m:
			row["maaraystyyppi_tunniste"] =  key_check("tunniste", m["maaraystyyppi"])
		else:
			row["maaraystyyppi_tunniste"] = None
		row["orgOid"] = key_check("orgOid", m)
		row["meta"] = key_check("meta", m)
		row["luoja"] = key_check("luoja", m)
		row["luontipvm"] = key_check("luontipvm", m)
		row["paivittaja"] = key_check("paivittaja", m)
		row["paivityspvm"] = key_check("paivityspvm", m)
		row["loadtime"] = str(loadtime)

		oiva_maaraykset.append(row)

		#split alimaaraykset into own list from maaraykset, uuid key included for every alimaarays 	
		if "aliMaaraykset" in m:
			tempA=m["aliMaaraykset"]
			tempA3=[]
			for zA in tempA:
				tempA2=dict()
				tempA2=zA
				tempA2.update({"maaraysid": key_check("uuid",m)})
				tempA3.append(tempA2)
			alimaaraykset.append(tempA3)  
			# select alimaaraykset
			
for j in alimaaraykset:
	for a in j:
		row = makerow_alimaaraykset()
		row["id"] = key_check("uuid", a)  
		row["maaraysid"] = key_check("maaraysid", a)  
		row["koodisto"] = key_check("koodisto", a)
		row["koodiarvo"] = key_check("koodiarvo", a)
		row["arvo"] = key_check("arvo", a)
		if "maaraystyyppi" in a:
			row["maaraystyyppi_tunniste"] =  key_check("tunniste", a["maaraystyyppi"])
		else:
			row["maaraystyyppi_tunniste"] = None
		if "kohde" in a:
			row["kohde_tunniste"] =  key_check("tunniste", a["kohde"])
		else:
			row["kohde_tunniste"] = None
		row["orgOid"] = key_check("orgOid", a)
		row["ylempi_alimaaraysId"] = key_check("ylempi_alimaaraysId", a)
		if "meta" in a:
			if a["meta"] !=None:
				row["meta.alkupvm"] = key_check("alkupvm", a["meta"])
				row["meta.loppupvm"] = key_check("loppupvm", a["meta"])
		row["meta"] = key_check("meta", a)
		row["luoja"] = key_check("luoja", a)
		row["luontipvm"] = key_check("luontipvm", a)
		row["paivittaja"] = key_check("paivittaja", a)
		row["paivityspvm"] = key_check("paivityspvm", a)
		row["loadtime"] = str(loadtime)		

		oiva_alimaaraykset.append(row)
		
		#alimääräysten alimääräykset
		b = a
		while "aliMaaraykset" in b:
			tempA=b["aliMaaraykset"]
			tempA3=[]
			for zA in tempA:
				tempA2=dict()
				tempA2=zA
				tempA2.update({"ylempi_alimaaraysId": key_check("uuid", b)})
				tempA2.update({"maaraysid": key_check("maaraysid", b)})
				tempA3.append(tempA2)
			alimaaraykset.append(tempA3)
			b = tempA
		

jarjestysluvat = pd.json_normalize(lupa_data)
oivamaaraykset = pd.json_normalize(oiva_maaraykset)
# Muutettu json_normalize DataFrameksi, koska meta-tiedot voi sotkea tiedoston
# Puretaan meta-tiedot tarvittaessa load-vaiheessa PDI:ssä  /VHä 14.6.2022
oiva_alimaaraykset = pd.DataFrame(oiva_alimaaraykset)

## Export data to csv's

jarjestysluvat.to_csv(path_or_buf='d:\pdi_integrations\data\oiva\oiva_jarjestysluvat.csv', sep='|', na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', escapechar='$')
oivamaaraykset.to_csv(path_or_buf='d:\pdi_integrations\data\oiva\oiva_maaraykset.csv', sep='|', na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', escapechar='$')
#Nimetty tiedostoon vietävt kentät /VHä 14.6.2022
oiva_alimaaraykset.to_csv(path_or_buf='d:\pdi_integrations\data\oiva\oiva_alimaaraykset.csv', sep='|',
                          columns=['arvo','id','kohde_tunniste','koodiarvo','koodisto','loadtime',
                                    'luoja','luontipvm','maaraysid','maaraystyyppi_tunniste','meta','meta.alkupvm',
                                    'meta.loppupvm', 'orgOid','paivittaja','paivityspvm','source','ylempi_alimaaraysId'], na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', escapechar='$')


 
