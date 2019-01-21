import requests
import os
from pandas.io.json import json_normalize
import base64
##  import API use key, API user and base URL from Jenkins variables
try:
    api_key = os.environ['AUTH_API_KEY']
except KeyError:
    print("API-key is missing")
    exit(1)
try:
    api_user = os.environ['AUTH_API_USER']
except KeyError:
    print("API-user is missing")
    exit(1)
try:
    base_url = os.environ['BASE_URL']
except KeyError:
    print("Base URL is missing")
    exit(1)

vastaukset=[]
urls = []
url = "https://"+base_url+"/api/export/v1/vastaukset"
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Accept'] = 'application/json'

### encode API user and API key tothe request headers 
tmp = "%s:%s" % (api_user, api_key)
reqheaders['Authorization'] = "Basic %s" % base64.b64encode(tmp.encode('utf-8')).decode('utf-8')

#set username and countter value "i"  for id column
username = os.environ['USERNAME']
i = 1

def keycheck(x,y):
   if x in y:
      return y[x] 
   else:
      return None
  
def makerow_vastaukset():
    return {
       "id":None,     
		"vastausid": None,
		"monivalintavaihtoehto_fi": None,
		"monivalintavaihtoehto_sv": None,
		"monivalintavaihtoehto_en": None,
		"vastaajaid": None, 
		"kysymysid": None,
		"kyselykertaid": None,
		"koulutustoimija": None,
		"numerovalinta": None,
		"kyselyid": None,
		"vastaajatunnusid": None,
		"vapaateksti": None,
		"vaihtoehto": None,
		"vastausaika": None,
		"source": url,
       "loadtime": None,
       "username": username
		}
while url != None: ## The url is not null
    response = requests.get(url, headers=reqheaders).json()
    for vastaus in response['data']:
        row = makerow_vastaukset()
        row["id"] = i
        row["vastausid"] = keycheck("vastausid",vastaus)
        row["monivalintavaihtoehto_fi"] = keycheck("monivalintavaihtoehto_fi",vastaus)
        row["monivalintavaihtoehto_sv"] = keycheck("monivalintavaihtoehto_sv",vastaus)
        row["monivalintavaihtoehto_en"] = keycheck("monivalintavaihtoehto_en",vastaus)
        row["vastaajaid"] = keycheck("vastaajaid",vastaus)
        row["kysymysid"] = keycheck("kysymysid",vastaus)
        row["kyselykertaid"] = keycheck("kyselykertaid",vastaus)
        row["koulutustoimija"] = keycheck("koulutustoimija",vastaus)
        #row["numerovalinta"] = keycheck("numerovalinta",vastaus)
        if "numerovalinta" in vastaus: 
            if vastaus["numerovalinta"] == None:
                row["numerovalinta"] = -1
            else:
                row["numerovalinta"] = vastaus["numerovalinta"]
        else:
            row["numerovalinta"] = -1
        row["kyselyid"] = keycheck("kyselyid",vastaus)
        row["vastaajatunnusid"] = keycheck("vastaajatunnusid",vastaus)
        row["vapaateksti"] = keycheck("vapaateksti",vastaus)
        row["vaihtoehto"] = keycheck("vaihtoehto",vastaus)
        row["vastausaika"] = keycheck("vastausaika",vastaus)
        vastaukset.append(row)
        i+= 1
    url = response['pagination']['next_url']
    urls.append(url)

data = json_normalize(vastaukset)

#SET csv filepath for bul insert phase

try:
    env = os.environ['ENV']
    if env == "prod":
        csv_path = "//dwipvipusql16/csv-data/arvo/vastaukset.csv"
    else:
        csv_path = "//dwitvipusql16/csv-data/arvo/vastaukset.csv"

except KeyError:
    print("Couldn't set correct csv filepath")
    exit(1)

# DATA to csv for import to MSSQL - can be used also for BULK inserting
data.to_csv(path_or_buf=csv_path, sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8', quoting=0,
                 quotechar='"', line_terminator='\n' , escapechar='$', columns = ["id",'vastausid',
                'monivalintavaihtoehto_fi', 'monivalintavaihtoehto_sv','monivalintavaihtoehto_en','vastaajaid','kysymysid',
                'kyselykertaid','koulutustoimija','numerovalinta','kyselyid','vastaajatunnusid','vapaateksti','loadtime','source',
                'username','vaihtoehto', 'vastausaika'])