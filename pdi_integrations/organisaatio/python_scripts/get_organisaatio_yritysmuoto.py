import requests
import os, socket
from pandas.io.json import json_normalize
import datetime

oids=[]
organisaatio_v3_data=[]

##  import API use key, API user and base URL from Jenkins variables

try:
    base_url = os.environ['BASE_URL']
except KeyError:
    base_url="virkailija.opintopolku.fi"
    print("Base URL is missing")
#set username
username = os.environ['USERNAME']
url = "https://"+base_url+"/organisaatio-service/rest/organisaatio"
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
            "parentoid":  None,
            "ytunnus":  None,
            "nimi_fi":  None,
            "nimi_sv":  None,
            "nimi_en":  None,
            "yritysmuoto":  None,
            "tyypit":  None,
            "status":  None,
            "ytjpaivitysPvm":  None,
            "source": url, 
            "loadtime": loadtime, 
            "username": username
		}
response = requests.get(url, headers=reqheaders).json()
#insert results into list
    
'''for j in response["organisaatiot"]:
    oid = j["oid"]
    oids.append(oid)    '''         
    
for o in response: # oids: 
    url = "https://"+base_url+"/organisaatio-service/rest/organisaatio/v3/"+o
    response2 = requests.get(url, headers=reqheaders).json()
    row = makerow()
    row["oid"] = keycheck("oid", response2)
    row["parentoid"] = keycheck("parentOid", response2)
    row["ytunnus"] = keycheck("ytunnus", response2)
    row["nimi_fi"] = keycheck("fi", response2["nimi"])
    row["nimi_sv"] = keycheck("sv", response2["nimi"])
    row["nimi_en"] = keycheck("en", response2["nimi"])
    row["yritysmuoto"] = keycheck("yritysmuoto", response2)
    row["tyypit"] = keycheck("tyypit", response2)
    row["status"] = keycheck("status", response2)
    row["ytjpaivitysPvm"] = keycheck("ytjpaivitysPvm", response2)
    organisaatio_v3_data.append(row)

data = json_normalize(organisaatio_v3_data)

# DATA to csv for import to MSSQL - can be used also for BULK inserting

data.to_csv(path_or_buf='D:/pdi_integrations/data/organisaatio/v3_data.csv', sep=';', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')