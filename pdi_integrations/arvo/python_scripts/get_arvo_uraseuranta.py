#import json
import requests
#import os
from pandas.io.json import json_normalize
#import datetime

import os

try:
    api_key = os.environ['AUTH_API_KEY']
except KeyError:
    print("API-key missing")



result = []
good_result=[]
filtered_result=[]
urls = []

url = 'https://arvo.csc.fi/api/vipunen/uraseuranta'
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Authorization'] = api_key
#response = requests.get(url, headers=reqheaders).json()

## Not checking the status just downloading
## GET STATUS
## 
while url != 'null': ## The url is not null
    response = requests.get(url, headers=reqheaders).json()

    for uraseuranta in response['data']:
        result.append(uraseuranta)
        # taustatiedot.append(uraseuranta['taustatiedot'])

    url = response['pagination']['next_url']
    urls.append(url)

## split result into two sets (with&without taustatiedot)

## test first 301 result
## for item in result[0:300]:
for item in result:
    if item.get('taustatiedot') == None:
        filtered_result.append(item)
    else:
        good_result.append(item)

## normalize data from result sets
### if you want to check column names use row below
### data.dtypes.index
data = json_normalize(good_result)
filtered_data = json_normalize(filtered_result)
# print(data[12])
# data['vastaajaid'].head(10)
## data.dtypes


## Export data to csv's


filtered_data.to_csv(path_or_buf='D:/pdi_integrations/data/arvo/uraseuranta_vajaadata.csv', sep='|', na_rep='',
                header=True, index=False, mode='w', encoding='utf-8', quoting=2,
                 quotechar='"', line_terminator='\n', escapechar='$')

data.to_csv(path_or_buf='D:/pdi_integrations/data/arvo/uraseuranta.csv', sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8', quoting=2,
                 quotechar='"', line_terminator='\n' , escapechar='$')

#now = datetime.datetime.now()

#print
#print("Current date and time using str method of datetime object:")
#print(str(now))

## data.vastaajaid.nunique()

