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
    
vastaajat=[]
urls = []
api_key = "6K;2=Uqi-W"
api_user = "vipunen"
base_url = "arvo.csc.fi"
url = "https://"+base_url+"/api/export/v1/vastaajat"
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

def makerow_vastaajat():
    return {
        "vastaajaid": None,     # bigint	pk	
        "vastaajatunnusid": None,     # bigint,	optional
        "vastaajatunnus": None,     # text, optional	
        "vastaajatunnus_alkupvm": None,     # date	not null
        "vastaajatunnus_loppupvm": None,     # date, optiona
        "oppilaitos": None,
        "suorituskieli": None,
        "taustatiedot": None,   
        "taustatiedot.aidinkieli": None,
        "taustatiedot.arvosana": None,
        "taustatiedot.asteikko": None,
        "taustatiedot.asuinkunta_koodi": None,
        "taustatiedot.hankintakoulutuksen_toteuttaja": None,
        "taustatiedot.haun_numero": None,
        "taustatiedot.henkilonumero": None,
        "taustatiedot.ika_valmistuessa": None,
        "taustatiedot.kansalaisuus": None,
        "taustatiedot.kieli": None,
        "taustatiedot.kirjoilla_olo_kuukausia": None,
        "taustatiedot.koulutusalakoodi": None,
        "taustatiedot.koulutusmuoto": None,
        "taustatiedot.kunta": None,
        "taustatiedot.laajuus": None,
        "taustatiedot.lasnaolo_lukukausia": None,
        "taustatiedot.paaaine": None,
        "taustatiedot.sukupuoli": None,
        "taustatiedot.toimipaikka": None,
        "taustatiedot.tutkinnon_taso": None,
        "taustatiedot.tutkinto": None,
        "taustatiedot.tutkintomuoto": None,
        "taustatiedot.valintavuosi": None,
        "taustatiedot.valmistumisajankohta": None,
        "taustatiedot.valmistumisvuosi": None,
        "source": None,
        "loadtime": None
      
    }
## Not checking the status just downloading
## GET STATUS
## 
while url != None: ## The url is not null
    
    response = requests.get(url, headers=reqheaders).json()
    
    for vastaaja in response ['data']:
        if vastaaja["taustatiedot"] != None:
            row = makerow_vastaajat()
            row["vastaajaid"] = keycheck("vastaajaid",vastaaja)
            row["vastaajatunnusid"] = keycheck("vastaajatunnusid",vastaaja)
            row["vastaajatunnus"] = keycheck("vastaajatunnus",vastaaja)
            row["vastaajatunnus_alkupvm"] = keycheck("vastaajatunnus_alkupvm",vastaaja)
            row["vastaajatunnus_loppupvm"] = keycheck("vastaajatunnus_loppupvm",vastaaja)
            row["oppilaitos"] = keycheck("oppilaitos",vastaaja)
            row["suorituskieli"] = keycheck("suorituskieli",vastaaja)
            row["taustatiedot"] =  vastaaja["taustatiedot"]
            row["taustatiedot.aidinkieli"] = keycheck("taustatiedot.aidinkieli",vastaaja["taustatiedot"])
            row["taustatiedot.arvosana"] = keycheck("taustatiedot.arvosana",vastaaja["taustatiedot"])
            row["taustatiedot.asteikko"] = keycheck("taustatiedot.asteikko",vastaaja["taustatiedot"])
            row["taustatiedot.asuinkunta_koodi"] = keycheck("taustatiedot.asuinkunta_koodi",vastaaja["taustatiedot"])
            row["taustatiedot.hankintakoulutuksen_toteuttaja"] = keycheck("taustatiedot.hankintakoulutuksen_toteuttaja",vastaaja["taustatiedot"])
            row["taustatiedot.haun_numero"] = keycheck("taustatiedot.haun_numero",vastaaja["taustatiedot"])
            row["taustatiedot.henkilonumero"] = keycheck("taustatiedot.henkilonumero",vastaaja["taustatiedot"])
            row["taustatiedot.ika_valmistuessa"] = keycheck("taustatiedot.ika_valmistuessa",vastaaja["taustatiedot"])
            row["taustatiedot.kansalaisuus"] = keycheck("taustatiedot.kansalaisuus",vastaaja["taustatiedot"])
            row["taustatiedot.kieli"] = keycheck("taustatiedot.kieli",vastaaja["taustatiedot"])
            row["taustatiedot.kirjoilla_olo_kuukausia"] = keycheck("taustatiedot.kirjoilla_olo_kuukausia",vastaaja["taustatiedot"])
            row["taustatiedot.koulutusalakoodi"] = keycheck("taustatiedot.koulutusalakoodi",vastaaja["taustatiedot"])
            row["taustatiedot.koulutusmuoto"] = keycheck("taustatiedot.koulutusmuoto",vastaaja["taustatiedot"])
            row["taustatiedot.kunta"] = keycheck("taustatiedot.kunta",vastaaja["taustatiedot"])
            row["taustatiedot.laajuus"] = keycheck("taustatiedot.laajuus",vastaaja["taustatiedot"])
            row["taustatiedot.lasnaolo_lukukausia"] = keycheck("taustatiedot.lasnaolo_lukukausia",vastaaja["taustatiedot"])
            row["taustatiedot.paaaine"] = keycheck("taustatiedot.paaaine",vastaaja["taustatiedot"])
            row["taustatiedot.sukupuoli"] = keycheck("taustatiedot.sukupuoli",vastaaja["taustatiedot"])
            row["taustatiedot.toimipaikka"] = keycheck("taustatiedot.toimipaikka",vastaaja["taustatiedot"])
            row["taustatiedot.tutkinnon_taso"] = keycheck("taustatiedot.tutkinnon_taso",vastaaja["taustatiedot"])
            row["taustatiedot.tutkinto"] = keycheck("taustatiedot.tutkinto",vastaaja["taustatiedot"])
            row["taustatiedot.tutkintomuoto"] = keycheck("taustatiedot.tutkintomuoto",vastaaja["taustatiedot"])
            row["taustatiedot.valintavuosi"] = keycheck("taustatiedot.valintavuosi",vastaaja["taustatiedot"])
            row["taustatiedot.valmistumisajankohta"] = keycheck("taustatiedot.valmistumisajankohta",vastaaja["taustatiedot"])
            row["taustatiedot.valmistumisvuosi"] = keycheck("taustatiedot.valmistumisvuosi",vastaaja["taustatiedot"])
            row["source"] = url
            row["loadtime"] = str(loadtime)
            vastaajat.append(row) 
        else:
            row = makerow_vastaajat()
            row["vastaajaid"] = keycheck("vastaajaid",vastaaja)
            row["vastaajatunnusid"] = keycheck("vastaajatunnusid",vastaaja)
            row["vastaajatunnus"] = keycheck("vastaajatunnus",vastaaja)
            row["vastaajatunnus_alkupvm"] = keycheck("vastaajatunnus_alkupvm",vastaaja)
            row["vastaajatunnus_loppupvm"] = keycheck("vastaajatunnus_loppupvm",vastaaja)
            row["source"] = url
            row["loadtime"] = str(loadtime)
            vastaajat.append(row)  
    url = response['pagination']['next_url']
    urls.append(url)

data = json_normalize(vastaajat)

# DATA to csv for import to MSSQL - can be used also for BULK inserting
data.to_csv(path_or_buf='D:/pdi_integrations/data/arvo/vastaajat.csv', sep=';', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')