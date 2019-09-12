

Loopin_alku <- Sys.time() #Tallennetaan aloitusaika

#---------------------------#

#        load packages      #

#---------------------------#

library(httr)

library(jsonlite)

library(tidyverse)
library(reshape)
library(plyr)
library(purrr)
library(dplyr)
library(tidyr)

#---------------------------#

#            Login          #

#---------------------------#



cred <- '{ 

"email": "kristian.raitio@csc.fi",

"password": "eterkokeilu"

}'



url_login <- "https://www.eter-project.com/api/3.0/users/login"

result_login <- POST(url_login, body = cred, content_type_json())



# translate Unicode into text

login_raw <- rawToChar(result_login$content)



# transform json into workable format for R

mylogin <- fromJSON(login_raw, flatten = TRUE)

mytoken <- mylogin$token



#---------------------------#

##  get all data at once  ##

url <- "https://www.eter-project.com/api/3.0/HEIs/full"



# request for all data

raw_result <- GET(url, add_headers(Authorization = paste("Bearer ", mytoken)))



#---------------------------#

#       data processing     #

#---------------------------#

# check the status code ("200" for all HEIs and "201" for POST request should be the output)

raw_result$status_code

# translate unicode into text

this.raw.content <- rawToChar(raw_result$content)

# encoding to UTF-8

Encoding(this.raw.content) <- "UTF-8"

# transform JSON into workable format for R

mydata <- fromJSON(this.raw.content, flatten = TRUE)



#---------------------------#

#       check data          #

#---------------------------#




# check if mydata is a dataframe

class(mydata)

# check column names

colnames(mydata)

#check number of rows and columns

dim(mydata)

# replace \" by nothing (run each row 2x to replace everything)

mydata$BAS.INSTNAME.v <- str_replace(mydata$BAS.INSTNAME.v, '[\"]', '')

mydata$BAS.INSTNAME.v <- str_replace(mydata$BAS.INSTNAME.v, '[\"]', '')

mydata$BAS.INSTNAMEENGL.v <- str_replace(mydata$BAS.INSTNAMEENGL.v, '[\"]', '')

mydata$BAS.INSTNAMEENGL.v <- str_replace(mydata$BAS.INSTNAMEENGL.v, '[\"]', '')


#---------------------------#

#      data manipulation    #

#---------------------------#

# drop all columns with suffix ".r" in the column name

##mydata <- mydata[, !grepl(".r", colnames(mydata))]




# separate data into ".code" and ".v" (== the numeric dataset)

data <- mydata[, !grepl(".v", colnames(mydata))]


data_numeric <- mydata[, !grepl((".code|.r"), colnames(mydata))]



# delete ".code" and ".v" from variable names

#names(data) <- gsub(pattern = ".code", replacement = "", x = names(data))

#names(data_numeric) <- gsub(pattern = ".v", replacement = "", x = names(data_numeric))



# add second "data_numeric" dataset for merging, since we need to convert

# numeric to character before merging into each other

data_numeric2 <- data_numeric

options(scipen = 999)

# before merging, column classes must be the same

data_numeric2 <- data_numeric2 %>%
  
  mutate_all(as.character)

data_numeric2[data_numeric2 == "m" | data_numeric2 == "a" | data_numeric2 == "x" | data_numeric2 == "" | data_numeric2 == "xr" |    data_numeric2 == "xc" | data_numeric2 == "x " | data_numeric2 == "m "] <- NA

# merge "data" and "data_numeric2" in "data" where NAs should vanish

data <- list(data, data_numeric2) %>%
  
  transpose(union(names(data), names(data_numeric2))) %>%
  
  map_dfc(. %>% compact %>% invoke(coalesce, .))



# add "data" to "data_numeric" also in order to add variables, where only codes

# are included

data2 <- data



# convert "m", "a", "x", "xc", "xr" etc. into NA






data_numeric <- merge(data_numeric2, data2, all.x = TRUE)



# data with only NA are of type character and thus cannot be used for

# calculations -> find and convert to numeric

colAllNA <- sapply(data, function(x) all(is.na(x)))

colnamesNA <- names(data)[colAllNA == TRUE]

data[, colnamesNA] <- apply(data_numeric[, colnamesNA], 2, function(x) as.numeric(x))





fulleter_df <- data_numeric %>% as.matrix() %>% as.data.frame() 

##### Luetaan eri osa-alueet omiin dataframeihin. #####
#ID toimii aineistojen v‰lill‰ avaimena. Vastaa eteridyear kentt‰‰. 

bas <- fulleter_df %>% select(.,starts_with('_id'),starts_with('BAS.'))
geo <- fulleter_df %>% select(.,starts_with('_id'),starts_with('GEO.'))
exp <- fulleter_df %>% select(.,starts_with('_id'),starts_with('EXP.'))
rev <- fulleter_df %>% select(.,starts_with('_id'),starts_with('REV.'))
sta <- fulleter_df %>% select(.,starts_with('_id'),starts_with('STA.'))
stud <- fulleter_df %>% select(.,starts_with('_id'),starts_with('STUD.'))
grad <- fulleter_df %>% select(.,starts_with('_id'),starts_with('GRAD.'))
res <- fulleter_df %>% select(.,starts_with('_id'),starts_with('RES.'))
ind <- fulleter_df %>% select(.,starts_with('_id'),starts_with('IND.'))
demo <- fulleter_df %>% select(.,starts_with('_id'),starts_with('DEMO.'))
era <- fulleter_df %>% select(.,starts_with('_id'),starts_with('ERA.'))

##### Kirjoitetaan csv-tiedostot #####
write.csv2(bas,"D:/pdi_integrations/data/eter/eter_bas.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_bas.csv")
write.csv2(geo,"D:/pdi_integrations/data/eter/eter_geo.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_geo.csv")
write.csv2(exp,"D:/pdi_integrations/data/eter/eter_exp.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_exp.csv")
write.csv2(rev,"D:/pdi_integrations/data/eter/eter_rev.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_rev.csv")
write.csv2(sta,"D:/pdi_integrations/data/eter/eter_sta.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_sta.csv")
write.csv2(stud,"D:/pdi_integrations/data/eter/eter_stud.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_stud.csv")
write.csv2(grad,"D:/pdi_integrations/data/eter/eter_grad.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_grad.csv")
write.csv2(res,"D:/pdi_integrations/data/eter/eter_res.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_res.csv")
write.csv2(ind,"D:/pdi_integrations/data/eter/eter_ind.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_ind.csv")
write.csv2(demo,"D:/pdi_integrations/data/eter/eter_demo.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_demo.csv")
write.csv2(era,"D:/pdi_integrations/data/eter/eter_era.csv",row.names = FALSE, na="")
print("Kirjoitettu eter_era.csv")


##### field list #####
#Luetaan kenttien kuvailutiedot, jossa my√∂s selitteet koodeille. Kirjoitetaan niist√§ csv:t

All_fields <- fromJSON("https://www.eter-project.com/api/3.0/field-groups/find/all-fields")

df <- All_fields[[2]] %>%select(.,c(fieldIds,groupName,description,fields))
bas_descriptions <- df %>% filter(description=="BAS") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
demo_descriptions <- df %>% filter(description=="DEMO") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
era_descriptions <- df %>% filter(description=="ERA") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
exp_descriptions <- df %>% filter(description=="EXP") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
geo_descriptions <- df %>% filter(description=="GEO") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
grad_descriptions <- df %>% filter(description=="GRAD") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
ind_descriptions <- df %>% filter(description=="IND") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
res_descriptions <- df %>% filter(description=="RES") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
rev_descriptions <- df %>% filter(description=="REV") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
sta_descriptions <- df %>% filter(description=="STA") %>% flatten() %>% as.data.frame %>% .[2:length(.)]
stud_descriptions <- df %>% filter(description=="STUD") %>% flatten() %>% as.data.frame %>% .[2:length(.)]

descriptions <- c(bas_descriptions,demo_descriptions,era_descriptions,exp_descriptions,
                  geo_descriptions,grad_descriptions,ind_descriptions,res_descriptions,
                  rev_descriptions,sta_descriptions,stud_descriptions)
Allfield_descriptions <- rbind.fill(bas_descriptions,demo_descriptions,era_descriptions,exp_descriptions,
                                    geo_descriptions,grad_descriptions,ind_descriptions,res_descriptions,
                                    rev_descriptions,sta_descriptions,stud_descriptions)

write.csv2(Allfield_descriptions,"D:/pdi_integrations/data/eter/eter_allfields.csv",row.names = FALSE)

##### Eter field codes #####
All_fieldcodes <- fromJSON("https://www.eter-project.com/api/3.0/codes")

codes <- data.frame(matrix(ncol=3,nrow=0))
nimet <- c("name","code","value")
colnames(codes) <- nimet
lista <- list()

vc=names(All_fieldcodes$codes$VC)

for (i in 1:length(vc)){
  pi <- All_fieldcodes$codes$VC[i]
  afc <- pi %>% flatten() %>% as.data.frame()
  colnames(afc) <- gsub("values.","",colnames(afc))
  afc <- afc %>% melt(., id="name")
  colnames(afc) <- gsub("variable","code",colnames(afc))
  nimi <- as.character(afc$name[1])
  lista[[nimi]]<-afc
}
sc <- All_fieldcodes$codes$SC %>% flatten() %>% as.data.frame()
colnames(sc) <- gsub("values.","",colnames(sc))
sc <- sc %>% melt(., id="name")
colnames(sc) <- gsub("variable","code",colnames(sc))
nimi <- as.character(sc$name[1])
lista[[nimi]]<-sc

df <- All_fieldcodes$codes$DF %>% flatten() %>% as.data.frame()
colnames(df) <- gsub("values.","",colnames(df))
df <- df %>% melt(., id="name")
colnames(df) <- gsub("variable","code",colnames(df))
nimi <- as.character(df$name[1])
lista[[nimi]]<-df

codes <- rbind_list(lista)
write.csv2(codes,"D:/pdi_integrations/data/eter/eter_allfieldcodes.csv",row.names = FALSE)


##### Kesto #####
Loopin_loppu <- Sys.time() #Tallennetaan aikaa varten lopetusaika
Kesto <- Loopin_loppu-Loopin_alku
print(paste("Ajaminen kesti ",Kesto))

