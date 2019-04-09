import requests
import os
from pandas.io.json import json_normalize
import base64
##  import API use key, API user and base URL from Jenkins variables
try:
    api_key = os.environ['AUTH_API_KEY']
    api_user = os.environ['AUTH_API_USER']
    base_url = os.environ['BASE_URL']
    env = os.environ['ENV']
except KeyError:
    print("One or more Jenkins variables are missing. Cannot continue ETL-job.")
    exit(1)

vastaukset=[]
urls = []

if env == "prod":
	csv_path = "//dwipvipusql16/csv-data/arvo/vastaukset.csv"
elif env == "test":
   csv_path = "//dwitvipusql16/csv-data/arvo/vastaukset.csv"
else:
    csv_path = "//dwitvipusql16/csv-data/arvo/vastaukset.csv"


url = "https://"+base_url+"/api/export/v1/vastaukset?limit=50000"
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Accept'] = 'application/json'

### encode API user and API key tothe request headers 
tmp = "%s:%s" % (api_user, api_key)
reqheaders['Authorization'] = "Basic %s" % base64.b64encode(tmp.encode('utf-8')).decode('utf-8')

#set username and counter and i value for id column
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
        
        #this is for appending data to csv in the secont for-loop cycle
        # DATA to csv for import to MSSQL - can be used also for BULK inserting
        if i == 1:
            data = json_normalize(vastaukset)
            data.to_csv(path_or_buf=csv_path, sep='|', na_rep='',
                     header=True, index=False, mode='w', encoding='utf-8', quoting=0,
                     quotechar='"', line_terminator='\n' , escapechar='$', columns = ["id",'vastausid',
                    'monivalintavaihtoehto_fi', 'monivalintavaihtoehto_sv','monivalintavaihtoehto_en','vastaajaid','kysymysid',
                    'kyselykertaid','koulutustoimija','numerovalinta','kyselyid','vastaajatunnusid','vapaateksti','loadtime','source',
                    'username','vaihtoehto', 'vastausaika'])
            i+= 1
        #add chunk of vastaus to data and then csv
        else:
            i+= 1
       
    # Write chunk of rows into output csv   
    data = json_normalize(vastaukset)
    data.to_csv(path_or_buf=csv_path, sep='|', na_rep='',
    header=False, index=False, mode='a', encoding='utf-8', quoting=0,
    quotechar='"', line_terminator='\n' , escapechar='$', columns = ["id",'vastausid',
    'monivalintavaihtoehto_fi', 'monivalintavaihtoehto_sv','monivalintavaihtoehto_en','vastaajaid','kysymysid',
    'kyselykertaid','koulutustoimija','numerovalinta','kyselyid','vastaajatunnusid','vapaateksti','loadtime','source',
    'username','vaihtoehto', 'vastausaika'])    
    
    #for debugging
    #print (i-1, " rows exported to csv" )
    
    #reset vastaukset
    vastaukset= [] 
    url = response['pagination']['next_url']
    urls.append(url)
print (i-1, " rows exported to csv" ) 
print ("The End")
'''
#append the rest of vastauset into csv
data = json_normalize(vastaukset)
# DATA to csv for import to MSSQL - can be used also for BULK inserting
data.to_csv(path_or_buf=csv_path, sep='|', na_rep='',
                 header=False, index=False, mode='a', encoding='utf-8', quoting=0,
                 quotechar='"', line_terminator='\n' , escapechar='$', columns = ["id",'vastausid',
                'monivalintavaihtoehto_fi', 'monivalintavaihtoehto_sv','monivalintavaihtoehto_en','vastaajaid','kysymysid',
                'kyselykertaid','koulutustoimija','numerovalinta','kyselyid','vastaajatunnusid','vapaateksti','loadtime','source',
                'username','vaihtoehto', 'vastausaika'])
'''