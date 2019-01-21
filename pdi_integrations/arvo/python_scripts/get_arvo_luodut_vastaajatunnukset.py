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
result = []
luodut_tunnukset=[]
urls = []
url = "https://"+base_url+"/api/export/v1/luodut_tunnukset"

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

def makerow_lt():
    return {
        "kyselykertaid": None,     # bigint	pk	
        "oppilaitoskoodi": None,     # bigint,	optional
        "tutkintotunnus": None,     # text, optional	
        "kuukausi": None,
        "tunnuksia": None,     # date	not null
        "vastauskertoja": None,
        "source": None,
        "loadtime": None
        }
     
response = requests.get(url, headers=reqheaders).json()
    
for i in response ['data']:
    row = makerow_lt()
    row["kyselykertaid"] = keycheck("kyselykertaid",i)
    row["oppilaitoskoodi"] = keycheck("oppilaitoskoodi",i)
    row["tutkintotunnus"] = keycheck("tutkintotunnus",i)
    row["tunnuksia"] = keycheck("tunnuksia",i)
    row["kuukausi"] = keycheck("kuukausi",i)
    row["vastauskertoja"] = keycheck("vastauskertoja",i)
    row["source"] = url
    row["loadtime"] = str(loadtime)
    luodut_tunnukset.append(row)
       

data = json_normalize(luodut_tunnukset)

# DATA to csv for import to MSSQL - can be used also for BULK inserting
data.to_csv(path_or_buf='D:/pdi_integrations/data/arvo/luodut_vastaajatunnukset.csv', sep=';', na_rep='',
                 header=True, index=False, mode='w', encoding='UTF-8-sig', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')