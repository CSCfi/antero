#### Simple script to get some data from Vipunen REST API 
#### VHä 

from datetime import datetime
import requests
import sys, os
#import shutil
from pandas.io.json import json_normalize

data = []

print("Script starting time: ", datetime.now().strftime("%H:%M:%S"),  datetime.now().strftime("%m/%Y"))


## define the download path
#
# Don't forget to create data folders to both test and production environtment!
filepath="D:\\pdi_integrations\\data\\template\\"


## define url with parameter from Jenkins
##try:
url = 'http://ci.vipunen.fi/api/resources'  #os.environ['API_URL']
##except KeyError:
   ## print("Couldn't get url parameter from Jenkins")

## USE variables below if you neeed basic authentication
'''
try:
    api_user = os.environ['AUTH_API_USER']
except KeyError:
    print("API-user missing")

try:
    api_key = os.environ['AUTH_API_KEY']
except KeyError:
    print("API-key missing")   
'''

## Basic API "routines" 
reqheaders = {'Content-Type': 'application/json;charset=UTF-8"'}

# Check if key 'x' is in dictionary 'y' 

def makerow():
  return {
    "row": None,
    "resource": None
  }

## URL Status check function
def url_ok(url):
    r = requests.head(url)
##  use the commented row below if you need basic authentication   
##    r = requests.head(url,  auth=(api_user, api_key))
    return r.status_code == 200

## set http status code  
http_status_code = str(requests.head(url).status_code)    
## use the commented row below if you need basic authentication   
## http_status_code = str(requests.head(url,  auth=(api_user, api_key)).status_code)

##
if url_ok(url):
   print("Vipunen API was available with status code: " +http_status_code) 
else:
   print("Vipunen API was not accessible and returned status code:" + http_status_code)
   exit


## Finally get the data 
response = requests.get(url).json()

## use the commented row below if you need basic authentication
## response = requests.get(url,  auth=(api_user, api_key)).json()
n = 0
for i in response:
    row = makerow()
    row["row"]= n
    row["resource"] = i
    n +=1
    data.append(row)

data = json_normalize(data)
print ("starting to export sample data")

#
# Don't forget to create data folders to both test and production environtment!
#
data.to_csv(path_or_buf= filepath+'template_data.csv', sep='|', na_rep='', 
#data.to_csv(path_or_buf='C:/Documents/ARVO/uraseuranta.csv', sep='|', na_rep='', 
               header=True, index=False, mode='w', encoding='utf-8', 
               quotechar='"', line_terminator='\n', escapechar='$')
   