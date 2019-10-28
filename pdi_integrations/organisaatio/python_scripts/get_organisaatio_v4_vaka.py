import requests
import os, socket
from pandas.io.json import json_normalize
import datetime

oids=[]
organisaatio_v4_data=[]
organisaatio_v4_data2=[]
##  import API use key, API user and base URL from Jenkins variables

try:
    base_url = os.environ['BASE_URL']
except KeyError:
    base_url="virkailija.opintopolku.fi"
    print("Base URL is missing")
#set username
username = os.environ['USERNAME']
#
# Haetaan vain varhaiskasvatuksen toimipaikkojen Oidit
#

url = "https://"+base_url+"/organisaatio-service/rest/organisaatio/hae?aktiiviset=true&suunnitellut=true&lakkautetut=true&organisaatiotyyppi=Varhaiskasvatuksen toimipaikka"
hostname = socket.gethostname()
loadtime=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Accept'] = 'application/json'

def keycheck(x,y):
   if x in y:
      return y[x] 
   else:
      return None
  
def deep_get(data, *args):
    if args and data:
        element  = args[0]
        if element:
            value = data.get(element)
            return value if len(args) == 1 else deep_get(value, *args[1:])

def makerow():
    return {
            "oid" :  None,
            "parentOid":  None,
            "parentOidPath":  None,
            "nimi_fi":  None,
            "nimi_sv":  None,
            "nimi_en":  None,
            "kieletUris": None,
            "kotipaikkaUri": None,
            "maaUri": None,
            "muutKotipaikatUris": None,
            "kayntisoite.osoitetyyppi": None,
            "kayntiosoite.osoite": None,
            "kayntiosoite.postinumero": None,
            "kayntiosoite.postitoimipaikka": None,
            "postiosoite.osoitetyyppi": None,
            "postiosoite.osoite": None,
            "postiosoite.postinumero": None,
            "postiosoite.postitoimipaikka": None,
            "status":  None,
            "alkupvm": None,
            "kasvatusopillinenJarjestelma":  None,
            "paikkojenLukumaara":  None,
            "toimintamuoto":  None,
            "source": base_url+"/organisaatio-service/rest/organisaatio/v4/", 
            "loadtime": loadtime, 
            "username": username

		}
def makerow_2():
    return {
        "oid":  None,

        "varhaiskasvatuksenJarjestamismuodot":  None,
        "varhaiskasvatuksenKielipainotukset":  None,
        "varhaiskasvatuksenToiminnallinenpainotukset":  None,
        "source": base_url+"/organisaatio-service/rest/organisaatio/v4/", 
        "loadtime": loadtime, 
        "username": username

		}
response = requests.get(url, headers=reqheaders).json()
#insert results into list
    
for j in response["organisaatiot"]: #[20:100]: #debug/test purposes
    oid = j["oid"]
    oids.append(oid)         

for o in oids: # oids: 
    
    url2 = "https://"+base_url+"/organisaatio-service/rest/organisaatio/v4/"+o
    response2 = requests.get(url2, headers=reqheaders).json()
    row = makerow()
    row["oid"] = keycheck("oid", response2)
    row["parentOid"] = keycheck("parentOid", response2)
    row["parentOidPath"] = keycheck("parentOidPath", response2)
    row["nimi_fi"] = keycheck("fi", response2["nimi"])
    row["nimi_sv"] = keycheck("sv", response2["nimi"])
    row["nimi_en"] = keycheck("en", response2["nimi"])
    row["kieletUris"] = keycheck("kieletUris", response2)
    row["kotipaikkaUri"] = keycheck("kotipaikkaUri", response2)
    row["maaUri"] = keycheck("maaUri", response2)
    row["muutKotipaikatUris"] = keycheck("muutKotipaikatUris", response2)
    row["kayntisoite.osoitetyyppi"] = keycheck("osoiteTyyppi", response2["kayntiosoite"])
    row["kayntiosoite.osoite"] = keycheck("osoite", response2["kayntiosoite"])
    row["kayntiosoite.postinumero"] = keycheck("postinumeroUri", response2["kayntiosoite"])
    row["kayntiosoite.postitoimipaikka"] = keycheck("postitoimipaikka", response2["kayntiosoite"])
    row["postiosoite.osoitetyyppi"] = keycheck("osoiteTyyppi", response2["postiosoite"])
    row["postiosoite.osoite"] = keycheck("osoite", response2["postiosoite"])
    row["postiosoite.postinumero"] = keycheck("postinumeroUri", response2["postiosoite"])
    row["postiosoite.postitoimipaikka"] = keycheck("postitoimipaikka", response2["postiosoite"])
    row["status"] = keycheck("status", response2)
    row["alkupvm"] = keycheck("alkuPvm", response2)
    if "varhaiskasvatuksenToimipaikkaTiedot" in response2:
        row["paikkojenLukumaara"] = keycheck("paikkojenLukumaara", response2["varhaiskasvatuksenToimipaikkaTiedot"]) 
        row["toimintamuoto"] = keycheck("toimintamuoto", response2["varhaiskasvatuksenToimipaikkaTiedot"]) 
        row["kasvatusopillinenJarjestelma"] = keycheck("kasvatusopillinenJarjestelma", response2["varhaiskasvatuksenToimipaikkaTiedot"]) 
       
    organisaatio_v4_data.append(row) #row)
    #get VAKA data only when it exist in organisaatio_v4 organisation object
    if "varhaiskasvatuksenToimipaikkaTiedot" in response2:
        row2 = makerow_2()
        row2["oid"] = keycheck("oid", response2) 
        row2["varhaiskasvatuksenJarjestamismuodot"] = keycheck("varhaiskasvatuksenJarjestamismuodot", response2["varhaiskasvatuksenToimipaikkaTiedot"]) 
        row2["varhaiskasvatuksenKielipainotukset"] = keycheck("varhaiskasvatuksenKielipainotukset", response2["varhaiskasvatuksenToimipaikkaTiedot"]) 
        row2["varhaiskasvatuksenToiminnallinenpainotukset"] = keycheck("varhaiskasvatuksenToiminnallinenpainotukset", response2["varhaiskasvatuksenToimipaikkaTiedot"]) 
#row["alkuPvm"] = keycheck("alkuPvm", response2)
        organisaatio_v4_data2.append(row2) #row)

data = json_normalize(organisaatio_v4_data)
data2 = json_normalize(organisaatio_v4_data2)
# DATA to csv for import to MSSQL - can be used also for BULK inserting

data.to_csv(path_or_buf='D:/pdi_integrations/data/organisaatio/v4_data.csv', sep=';', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')
data2.to_csv(path_or_buf='D:/pdi_integrations/data/organisaatio/v4_data_vaka.csv', sep=';', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')