import requests
import os
from pandas.io.json import json_normalize
import datetime
import base64


##  import API use key, API user and base URL from Jenkins variables

try:
    api_key = os.environ['AUTH_API_KEY']
except KeyError:
    print("API-key is missing")
try:
    api_user = os.environ['AUTH_API_USER']
except KeyError:
    print("API-user is missing")
try:
    base_url = os.environ['BASE_URL']
except KeyError:
    print("Base URL is missing")
    
kysymykset=[]
url = "https://"+base_url+"/api/export/v1/kysymykset"
loadtime=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S.%f")
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Accept'] = 'application/json'

### encode API user and API key tothe request headers 
tmp = "%s:%s" % (api_user, api_key)
reqheaders['Authorization'] = "Basic %s" % base64.b64encode(tmp.encode('utf-8')).decode('utf-8')



def keycheck(x,y):
   if x in y:
      return y[x] 
   else:
      return None

def makerow_kysymykset():
    return {
        "kysymys_en": None,
        "kysymysryhma_en": None,
        "kysymysryhma_sv": None,
        "jatkokysymys": None,
        "kysymysryhma_fi": None,
        "kategoria": None,
        "kategoria.rahoitusmallikysymys": None,
        "kategoria.taustakysymyksen_tyyppi": None,
        "jatkokysymys_kysymysid": None,
        "kysymysryhmaid": None,
        "kysymysid": None,
        "vastaustyyppi": None,
        "kysymys_sv": None,
        "valtakunnallinen": None,
        "kysymys_fi": None,
        "loadtime": None,
        "source": None
      
    }
## Not checking the status just downloading
## 
## 

response = requests.get(url, headers=reqheaders).json()

for kysymys in response ['data']:
    if kysymys["kategoria"] != None:
        row = makerow_kysymykset()
        row["kysymys_en"] = keycheck("kysymys_en",kysymys)
        row["kysymysryhma_en"] = keycheck("kysymysryhma_en",kysymys)
        row["kysymysryhma_sv"] = keycheck("kysymysryhma_sv",kysymys)
        row["jatkokysymys"] = keycheck("jatkokysymys",kysymys)
        row["kysymysryhma_fi"] = keycheck("kysymysryhma_fi",kysymys)
        row["kategoria"] = keycheck("kategoria",kysymys)
        row["kategoria.rahoitusmallikysymys"] = keycheck("rahoitusmallikysymys",kysymys["kategoria"])
        row["kategoria.taustakysymyksen_tyyppi"] = keycheck("taustakysymyksen_tyyppi",kysymys["kategoria"])
        row["jatkokysymys_kysymysid"] = keycheck("jatkokysymys_kysymysid",kysymys)
        row["kysymysryhmaid"] = keycheck("kysymysryhmaid",kysymys)
        row["kysymysid"] = keycheck("kysymysid",kysymys)
        row["vastaustyyppi"] = keycheck("vastaustyyppi",kysymys)
        row["kysymys_sv"] = keycheck("kysymys_sv",kysymys)
        row["valtakunnallinen"] = keycheck("valtakunnallinen",kysymys)
        row["kysymys_fi"] = keycheck("kysymys_fi",kysymys)
        row["source"] = url
        row["loadtime"] = str(loadtime)
        kysymykset.append(row) 
    else:
        row = makerow_kysymykset()
        row["kysymys_en"] = keycheck("kysymys_en",kysymys)
        row["kysymysryhma_en"] = keycheck("kysymysryhma_en",kysymys)
        row["kysymysryhma_sv"] = keycheck("kysymysryhma_sv",kysymys)
        row["jatkokysymys"] = keycheck("jatkokysymys",kysymys)
        row["kysymysryhma_fi"] = keycheck("kysymysryhma_fi",kysymys)
        row["jatkokysymys_kysymysid"] = keycheck("jatkokysymys_kysymysid",kysymys)
        row["kysymysryhmaid"] = keycheck("kysymysryhmaid",kysymys)
        row["kysymysid"] = keycheck("kysymysid",kysymys)
        row["vastaustyyppi"] = keycheck("vastaustyyppi",kysymys)
        row["kysymys_sv"] = keycheck("kysymys_sv",kysymys)
        row["valtakunnallinen"] = keycheck("valtakunnallinen",kysymys)
        row["kysymys_fi"] = keycheck("kysymys_fi",kysymys)
        row["source"] = url
        row["loadtime"] = str(loadtime)
        kysymykset.append(row)  
data = json_normalize(kysymykset)

# DATA to csv for import to MSSQL - can be used also for BULK inserting
data.to_csv(path_or_buf='D:/pdi_integrations/data/arvo/kysymykset.csv', sep=';', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')