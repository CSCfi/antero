import datetime
import requests
import sys
import urllib.request
import shutil


yearMax = datetime.datetime.now().year+1

## set starting year 
year=2015

## define download path
filepath="D:\\pdi_integrations\\data\\ytl\\"
## define base url
url_base = 'http://www.ylioppilastutkinto.fi/ext/data/'

## set season  KD = spring SD = Autumn
season = 'SD'

while year < yearMax:
    filename = 'FT'+str(year)+season+'3001.csv'
    url = url_base+filename
    csvfile = filepath+filename
    try:
        h = requests.head(url, allow_redirects=True)
        header = h.headers
        content_type = header.get('content-type')
        #print(content_type)
        if 'octet-stream' in content_type.lower():
            with urllib.request.urlopen(url) as response, open(csvfile, 'wb') as out_file:
                shutil.copyfileobj(response, out_file)
            
        else:
            print (filename + ' was not found (yet).')
            #break
        if season == 'KD':
            season= 'SD'
        else:
            season='KD'
            year=year+1
    except requests.exceptions.HTTPError as err:
        print (err)
        sys.exit(1)

    
