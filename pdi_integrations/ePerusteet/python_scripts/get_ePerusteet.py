# Import the necessary libraries
import requests
#from pandas.io.json import json_normalize
import pandas as pd
import os
from time import gmtime, strftime

# Set URL
url="https://eperusteet.opintopolku.fi/eperusteet-service/api/external/perusteet/?tulevat=true&voimassa=true&poistuneet=true&siirtyma=true&sivukoko=1500" #?sivu=14" #?tuleva=true&siirtyma=true&voimassaolo=true&poistunut=true&koulutustyyppi=koulutustyyppi_1&koulutustyyppi=koulutustyyppi_4&koulutustyyppi=koulutustyyppi_11&koulutustyyppi=koulutustyyppi_12&koulutustyyppi=koulutustyyppi_13&koulutustyyppi=koulutustyyppi_18&koulutustyyppi=koulutustyyppi_19&koulutustyyppi=koulutustyyppi_26"
reqheaders = {'Content-Type': 'application/json'}
reqheaders['Accept'] = 'application/json'
reqheaders['Caller-Id'] = '1.2.246.562.10.2013112012294919827487.vipunen'
#set username
username = "vhamalai" #os.environ['USERNAME']

# Get the number of pages and the current page

# An empty list to collect the results 
result = []
id_list=[]
eperusteet_all = []
osaamisalat = []
suoritustavat = []
tutkinnonosaviitteet = []
tutkinnonosat = []
# for generating timestams during etl
def getTime():
    return strftime("%Y-%m-%d %H:%M:%S", gmtime())
#return None value (NULL) if JSON key doesn't exist
def keycheck(x,y):
   if x in y:
      return y[x] 
   else:
      return None
#return 0 value (NULL) if integer JSON key doesn't exist
def intcheck(x,y):
   if x in y:
      return y[x] 
   else:
      return 0
  
def deep_get(data, *args):
    if args and data:
        element  = args[0]
        if element:
            value = data.get(element)
            return value if len(args) == 1 else deep_get(value, *args[1:])

def makerow_eperusteet():
    return {
        "diaarinumero": None, "id": None, "koulutukset": None, "koulutustyyppi": None, "tutkintokoodi": None,
        "koulutusvienti": None, "luotu": None, "muokattu": None, "nimi_id": None, "nimi_tunniste": None,
        "nimi_en": None, "nimi_fi": None, "nimi_sv": None, "paatospvm": None, "siirtymaPaattyy": None,
        "tila": None, "tyyppi": None, "voimassaoloAlkaa": None, "voimassaoloLoppuu":  None,
        "source": url, "loadtime": loadtime, "username": username
		}
    
def makerow_osaamisalat():
    return {
        "ePerusteId": None, "nimi_fi": None, "nimi_sv": None, "nimi_en": None,
        "osaamisala_koodi": None, "versio": None, "source": url, "loadtime": loadtime, "username": username
		}
    
def makerow_suoritustavat():
    return {
        "ePerusteId": ePeruste, "suoritustapakoodi": None, "laajuusYksikko": None, "kuvaus": None,
        "pakollinen": None, "minimilaajuus": None, "maksimilaajuus": None, "osaamisalakoodi": None, 
        "tunniste": None, "source": url2, "loadtime": loadtime, "username": username, "taso": 0
		 }
    
def makerow_t1():
    return {
        
        "tutkinnonosa_fi_t1": None, "tutkinnonosa_sv_t1": None,  "osaamisalakoodi_t1": None,
        "minimilaajuus_t1": None, "maksimilaajuus_t1": None, "minimikoko_t1": None, "maksimikoko_t1": None,  
        "pakollinen_t1": None, "tunniste": tunniste, "osan_tunniste_t1": None, "taso": 1 }

def makerow_t2():
    return {
        "tutkinnonosa_fi_t2": None, "osaamisalakoodi_t2": None, "tutkinnonosa_sv_t2": None, "minimilaajuus_t2": None,
        "maksimilaajuus_t2": None, "minimikoko_t2": None, "maksimikoko_t2": None, "pakollinen_t2": None,
        "tutkinnonosa_viite_t2": None, "osan_tunniste_t1": osan_tunniste_t1, "osan_tunniste_t2": None, "taso": 2
        }
def makerow_t3():
    return {"tutkinnonosa_fi_t3": None, "tutkinnonosa_sv_t3": None, "minimilaajuus_t3": None, "maksimilaajuus_t3": None, 
            "minimikoko_t3": None, "maksimikoko_t3": None, "osaamisalakoodi_t3": None, "pakollinen_t3": None,
            "tutkinnonosa_viite_t3": None, "osan_tunniste_t2": osan_tunniste_t2, "osan_tunniste_t3": None, "taso": 3
            }
    
def makerow_t4():
    return {"tutkinnonosa_fi_t4": None, "tutkinnonosa_sv_t4": None,"osaamisalakoodi_t4": None, "minimilaajuus_t4": None,
        "maksimilaajuus_t4": None, "minimikoko_t4": None, "maksimikoko_t4": None, "pakollinen_t4": None, 
        "tutkinnonosa_viite_t4": None, "osan_tunniste_t3": None, "osan_tunniste_t4": None, "taso": 4
        }
def makerow_st_all():
    return{"ePerusteId": ePeruste }   
    
def makerow_tutkinnonosaviitteet():
    return {"id": None, "ePerusteId": ePeruste, "laajuus": None, "tutkinnonosaid": None, "source": url2,
            "loadtime": loadtime,"username": username}

def makerow_tutkinnonosat():
    
    return{"ePerusteId": ePeruste, "id": None, "tila": None, "osantyyppi": None, "nimi_fi": None, "nimi_sv": None,
           "arvo": None, "uri": None, "koodisto": None, "versio": None, "koodiuri": None, "koodiarvo": None, "tyyppi": None,
           "valmatelmasisalto": None, "source": url2, "loadtime": loadtime, "username": username}
# Get the response

response = requests.get(url, headers=reqheaders).json()
page =  response['sivu']
pages = response['sivuja']
loadtime = getTime()
# While loop calls through all pages        
while page < pages: ## While there are pages left    
    # iterate through the data object
    for i in response['data']:
        id_key= keycheck("id", i)
        id_list.append(id_key) ##used later to get additional data in nested objects
        row = makerow_eperusteet()
        url_id = "https://eperusteet.opintopolku.fi/eperusteet-service/api/perusteet/"+str(id_key)
        try: 
            response_id = requests.get(url_id, headers=reqheaders).json()
            row["koulutusvienti"] = keycheck("koulutusvienti", response_id)
            row["tila"] = keycheck("tila", response_id)
        except:
            continue     
            
        row["diaarinumero"] = keycheck("diaarinumero", i)
        row["id"] = id_key
        row["koulutukset"] = keycheck("koulutukset", i)
        try:
            row["tutkintokoodi"] = i["koulutukset"][0]["koulutuskoodiArvo"]
        except IndexError:
            row["tutkintokoodi"] = None
        except KeyError:
            row["tutkintokoodi"] = None
        
        row["koulutustyyppi"] = keycheck("koulutustyyppi", i)
        

        row["luotu"] = keycheck("luotu", i)
        row["muokattu"] = keycheck("muokattu", i)
        #for nimi in i:
        row["nimi_id"] = keycheck("_id", i["nimi"])
        row["nimi_fi"] = deep_get(i, "nimi","fi")
        row["nimi_sv"] = deep_get(i, "nimi","sv")
        row["nimi_en"] = deep_get(i, "nimi","en")
        row["nimi_tunniste"] = keycheck("_tunniste", i["nimi"])
        
        row["paatospvm"] = keycheck("paatospvm", i)
        row["siirtymaPaattyy"] = intcheck("siirtymaPaattyy", i)
        row["tyyppi"] = keycheck("tyyppi", i)
        row["voimassaoloAlkaa"] = intcheck("voimassaoloAlkaa", i)
        row["voimassaoloLoppuu"] = intcheck("voimassaoloLoppuu", i)
        eperusteet_all.append(row)
        
        for osaamisala in i["osaamisalat"]:
            row_oa = makerow_osaamisalat()
            row_oa["ePerusteId"] = id_key
            row_oa["nimi_fi"] = keycheck("fi", osaamisala["nimi"])
            row_oa["nimi_sv"] = keycheck("sv", osaamisala["nimi"])
            row_oa["nimi_en"] = keycheck("en", osaamisala["nimi"])
            row_oa["osaamisala_koodi"]= keycheck("arvo", osaamisala)
            row_oa["versio"]= keycheck("versio", osaamisala)
            osaamisalat.append(row_oa)
    page += 1
    url_sivutus= url + "&sivu=" + str(page)
    response = requests.get(url_sivutus,headers=reqheaders).json()
    

# First loop to get ePErusteet values
#  id_list.append(229220)
loadtime = getTime()
 #suoritustavat = []
for ePeruste in id_list:     
    #used in nested loops
    url2 = "https://eperusteet.opintopolku.fi/eperusteet-service/api/perusteet/%s/kaikki" % ePeruste
    response2 = requests.get(url2,headers=reqheaders).json()   
   
    if "suoritustavat" in response2:
        for st in response2["suoritustavat"]:
            row_st = makerow_suoritustavat()
            #correct ePeruste is automativally inserted here
            try:
                t1=0 #helping iterating through the for-loops in the nested objects 
                t2=0
                t3=0
                t4=0
                row_st["suoritustapakoodi"]= deep_get(st,  "suoritustapakoodi")
                row_st["laajuusYksikko"]= deep_get(st,  "laajuusYksikko")
                #row_st["kuvaus"]= deep_get(st, "rakenne", "kuvaus", "fi")
                row_st["tutkinto_fi"]= deep_get(st, "rakenne", "nimi", "fi")
                row_st["pakollinen"]= deep_get(st, "rakenne", "pakollinen")
                row_st["minimilaajuus"]= deep_get(st, "rakenne", "muodostumisSaanto", "laajuus", "minimi")
                row_st["maksimilaajuus"]=  deep_get(st, "rakenne", "muodostumisSaanto", "laajuus", "maksimi")
                row_st["tunniste"] =  deep_get(st, "rakenne", "tunniste")
                tunniste = deep_get(st, "rakenne", "tunniste")
                
                if "osat" in st["rakenne"]:
                    
                    row_st_t1 = makerow_t1()
                    for osa_t1 in st["rakenne"]["osat"]:
                        t1=1
                        #t2=0  # IF "empty" hierarchy rows which does have OSAT subobjects 
                        #t3=0  # are not needed in data, THEN remove activte these set variable rows
                        #t4=0  # Also repeat in every sub-level and comment some rows that are marked
                        row_st_t1 = makerow_t1()
                        row_st_t1["tutkinnonosa_fi_t1"] = deep_get(osa_t1, "nimi", "fi")
                        row_st_t1["tutkinnonosa_sv_t1"] = deep_get(osa_t1, "nimi", "sv")
                        row_st_t1["minimilaajuus_t1"] = deep_get(osa_t1, "muodostumisSaanto", "laajuus", "minimi")
                        row_st_t1["maksimilaajuus_t1"] = deep_get(osa_t1, "muodostumisSaanto", "laajuus", "maksimi")
                        row_st_t1["minimikoko_t1"] = deep_get(osa_t1, "muodostumisSaanto", "koko", "minimi")
                        row_st_t1["maksimikoko_t1"] = deep_get(osa_t1, "muodostumisSaanto", "koko", "maksimi")
                        row_st_t1["osaamisalakoodi"] = deep_get(osa_t1, "osaamisala", "osaamisalakoodiArvo")
                        row_st_t1["pakollinen_t1"] = deep_get(osa_t1, "pakollinen")
                        osan_tunniste_t1 = deep_get(osa_t1, "tunniste")
                        row_st_t1["osan_tunniste_t1"] = osan_tunniste_t1
                        
                        if "osat" in osa_t1:
                            
                            row_st_t2 = makerow_t2()
                            for osa_t2 in osa_t1["osat"]:
                                t2=1
                                #t3=0  
                                #t4=0
                                row_st_t2 = makerow_t2()
                                row_st_t2["tutkinnonosa_fi_t2"] = deep_get(osa_t2, "nimi", "fi")
                                row_st_t2["tutkinnonosa_sv_t2"] = deep_get(osa_t2, "nimi", "sv")
                                row_st_t2["minimilaajuus_t2"] = deep_get(osa_t2, "muodostumisSaanto", "laajuus", "minimi")
                                row_st_t2["maksimilaajuus_t2"] = deep_get(osa_t2, "muodostumisSaanto", "laajuus", "maksimi")
                                row_st_t2["minimikoko_t2"] = deep_get(osa_t2, "muodostumisSaanto", "koko", "minimi")
                                row_st_t2["maksimikoko_t2"] = deep_get(osa_t2, "muodostumisSaanto", "koko", "maksimi")
                                row_st_t2["osaamisalakoodi_t2"] = deep_get(osa_t2, "osaamisala", "osaamisalakoodiArvo")
                                row_st_t2["pakollinen_t2"] = deep_get(osa_t2, "pakollinen")
                                row_st_t2["tutkinnonosa_viite_t2"] = deep_get(osa_t2, "_tutkinnonOsaViite")
                                osan_tunniste_t2 = deep_get(osa_t2, "tunniste")
                                row_st_t2["osan_tunniste_t2"] = osan_tunniste_t2
                                             
                                if "osat" in osa_t2:
                                    
                                    for osa_t3 in osa_t2["osat"]:
                                        t3=1
                                        #t4=0
                                        row_st_t3 = makerow_t3()
                                        row_st_t3["tutkinnonosa_fi_t3"] = deep_get(osa_t3, "nimi", "fi")
                                        row_st_t3["tutkinnonosa_sv_t3"] = deep_get(osa_t3, "nimi", "sv")
                                        row_st_t3["minimilaajuus_t3"] = deep_get(osa_t3, "muodostumisSaanto", "laajuus", "minimi")
                                        row_st_t3["maksimilaajuus_t3"] = deep_get(osa_t3, "muodostumisSaanto", "laajuus", "maksimi")
                                        row_st_t3["minimikoko_t3"] = deep_get(osa_t3, "muodostumisSaanto", "koko", "minimi")
                                        row_st_t3["maksimikoko_t3"] = deep_get(osa_t3, "muodostumisSaanto", "koko", "maksimi")
                                        row_st_t3["osaamisalakoodi_t3"] = deep_get(osa_t3, "osaamisala", "osaamisalakoodiArvo")
                                        row_st_t3["pakollinen_t3"] = deep_get(osa_t3, "pakollinen")
                                        row_st_t3["tutkinnonosa_viite_t3"] = deep_get(osa_t3, "_tutkinnonOsaViite")
                                        osan_tunniste_t3 = deep_get(osa_t3, "tunniste")
                                        row_st_t3["osan_tunniste_t3"] = osan_tunniste_t3
                                                
                                        if "osat" in osa_t3:
                                            for osa_t4 in osa_t3["osat"]:
                                                t4=1
                                                row_st_t4 = makerow_t4()
                                                row_st_t4["tutkinnonosa_fi_t4"] = deep_get(osa_t4, "nimi", "fi")
                                                row_st_t4["tutkinnonosa_sv_t4"] = deep_get(osa_t4, "nimi", "sv")
                                                row_st_t4["minimilaajuus_t4"] = deep_get(osa_t4, "muodostumisSaanto", "laajuus", "minimi")
                                                row_st_t4["maksimilaajuus_t4"] = deep_get(osa_t4, "muodostumisSaanto", "laajuus", "maksimi")
                                                row_st_t4["minimikoko_t4"] = deep_get(osa_t4, "muodostumisSaanto", "koko", "minimi")
                                                row_st_t4["maksimikoko_t4"] = deep_get(osa_t4, "muodostumisSaanto", "koko", "maksimi")
                                                row_st_t4["osaamisalakoodi_t4"] = deep_get(osa_t4, "osaamisala", "osaamisalakoodiArvo")
                                                row_st_t4["pakollinen_t4"] = deep_get(osa_t4, "pakollinen")
                                                row_st_t4["tutkinnonosa_viite_t4"] = deep_get(osa_t4, "_tutkinnonOsaViite")
                                                row_st_t4["osan_tunniste_t4"] = deep_get(osa_t4, "tunniste")
                                                row_st_all4 = makerow_st_all()
                                                row_st_all4.update(row_st)
                                                row_st_all4.update(row_st_t1)
                                                row_st_all4.update(row_st_t2)
                                                row_st_all4.update(row_st_t3)
                                                row_st_all4.update(row_st_t4)
                                                suoritustavat.append(row_st_all4)
                                                t4=0  #Mark this row as a comment if removing certain hierarchy rows from data
                                            
                                        if t3==1 and t4==0:
                                            row_st_all3= makerow_st_all()
                                            row_st_all3.update(row_st)
                                            row_st_all3.update(row_st_t1)
                                            row_st_all3.update(row_st_t2)
                                            row_st_all3.update(row_st_t3)
                                            suoritustavat.append(row_st_all3)
                                            t3=0 #Mark this row as a comment if removing certain hierarchy rows from data
                                            
                                if t2==1 and t3==0:            
                                    row_st_all2= makerow_st_all()
                                    row_st_all2.update(row_st)
                                    row_st_all2.update(row_st_t1)
                                    row_st_all2.update(row_st_t2)
                                    suoritustavat.append(row_st_all2)
                                    t2=0       #Mark this row as a comment if removing certain hierarchy rows from data  
                                    
                        if t1==1 and t2==0:            
                            row_st_all1= makerow_st_all()
                            row_st_all1.update(row_st)
                            row_st_all1.update(row_st_t1)
                            suoritustavat.append(row_st_all1)           
                            t1=0 #Mark this row as a comment if removing certain hierarchy rows from data
  
            except KeyError:
                suoritustavat.append(row_st)
    
        
        #tutkinnonOsaViitteet = []
            row_v = makerow_tutkinnonosaviitteet()
            if "tutkinnonOsaViitteet" in st:
                for viite in st["tutkinnonOsaViitteet"]:
                    row_v = makerow_tutkinnonosaviitteet()
                    row_v["id"] = deep_get(viite, "id")
                    row_v["laajuus"] = deep_get(viite,"laajuus")
                    row_v["tutkinnonosaid"] = deep_get(viite, "_tutkinnonOsa")
                    tutkinnonosaviitteet.append(row_v)
            else:
                 tutkinnonosaviitteet.append(row_v)
    else:
        row_st= makerow_suoritustavat()
        row_v = makerow_tutkinnonosaviitteet()
        tutkinnonosaviitteet.append(row_v)
        suoritustavat.append(row_st)
    
    if "tutkinnonOsat" in response2: 
        for to in response2["tutkinnonOsat"]:
            row_to = makerow_tutkinnonosat()
            row_to["id"] = deep_get(to,  "id")
            row_to["tila"] = deep_get(to,  "tila")
            row_to["osantyyppi"] = deep_get(to,  "osanTyyppi")
            row_to["nimi_fi"] = deep_get(to,  "koodi", "nimi", "fi")
            row_to["nimi_sv"] = deep_get(to,  "koodi", "nimi", "sv")
            row_to["arvo"] = deep_get(to,  "koodi",  "arvo")
            row_to["uri"] = deep_get(to,  "koodi",  "uri")
            row_to["koodisto"] = deep_get(to,  "koodi",  "koodisto")
            row_to["versio"] = deep_get(to,  "koodi", "versio")
            row_to["koodiuri"] = deep_get(to,   "koodiUri")
            row_to["koodiarvo"] = deep_get(to,   "koodiArvo")
            row_to["tyyppi"] = deep_get(to,  "tyyppi")
            row_to["valmatelmasisalto"] = deep_get(to,  "valmaTelmaSisalto")
            tutkinnonosat.append(row_to)
    else:
        row_to = makerow_tutkinnonosat()
        tutkinnonosat.append(row_to)

 
 # Normalise the json data list tutkinnonosaviitteet = []
# Suoritustavat - this is a plural dataset, ie. many "suoritustavat" per one row of data    
data = pd.json_normalize(eperusteet_all)
data2 = pd.json_normalize(osaamisalat)
data3 = pd.json_normalize(suoritustavat)
data4 = pd.json_normalize(tutkinnonosaviitteet)
data5 = pd.json_normalize(tutkinnonosat)
# Write the csv path, change to the folder in use    
data.to_csv(path_or_buf='d:/pdi_integrations/data/ePerusteet/eperusteet.csv', sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"'  , escapechar='$',
                 columns = ["diaarinumero","id","tutkintokoodi","koulutustyyppi","koulutusvienti","luotu",
                            "muokattu","nimi_id","nimi_tunniste","nimi_fi","nimi_sv","nimi_en",
                            "paatospvm","siirtymaPaattyy","tila","tyyppi",
                            "voimassaoloAlkaa","voimassaoloLoppuu","source","loadtime","username","koulutukset"])

data2.to_csv(path_or_buf='d:/pdi_integrations/data/ePerusteet/osaamisalat.csv', sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"'  , escapechar='$',
                 columns = ["ePerusteId","nimi_fi","nimi_sv","nimi_en","osaamisala_koodi",
                            "versio","source","loadtime","username"]
                 )
data3.to_csv(path_or_buf='d:/pdi_integrations/data/ePerusteet/suoritustavat.csv', sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"'  , escapechar='$'
                )
data4.to_csv(path_or_buf='d:/pdi_integrations/data/ePerusteet/tutkinnonosaviitteet.csv', sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"'  , escapechar='$'
                )
data5.to_csv(path_or_buf='d:/pdi_integrations/data/ePerusteet/tutkinnonosat.csv', sep='|', na_rep='',
                 header=True, index=False, mode='w', encoding='utf-8-sig', quoting=2,
                 quotechar='"'  , escapechar='$'
                )
    