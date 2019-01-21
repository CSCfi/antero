##### Luetaan ja aktivoidaan r-paketit #####
#install.packages("tidyverse", dependencies = T)
#library(tidyverse)
#install.packages("plyr")
#install.packages("purrr")
library(jsonlite)
library(plyr)
library(purrr)
library(dplyr)


##### ETER FULL DOWNLOAD R3.5.2 ja uusin jsonlite #####
Loopin_alku <- Sys.time() #Tallennetaan aloitusaika

FullEter <- fromJSON("http://www.eter-project.com/api/3.0/HEIs/full") #Ladataan koko eter aineisto
#write_json(FullEter, "D:/pdi_integrations/data/eter/FullEter.json") #Kirjoitetaan json talteen

#paa10 <- head(FullEter,1000) %>% as.matrix() %>% as.data.frame() #Testausta varten head

fulleter_df <- FullEter %>% as.matrix() %>% as.data.frame() 

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
write.csv2(bas,"D:/pdi_integrations/data/eter/eter_bas.csv",row.names = FALSE)
print("Kirjoitettu eter_bas.csv")
write.csv2(geo,"D:/pdi_integrations/data/eter/eter_geo.csv",row.names = FALSE)
print("Kirjoitettu eter_geo.csv")
write.csv2(exp,"D:/pdi_integrations/data/eter/eter_exp.csv",row.names = FALSE)
print("Kirjoitettu eter_exp.csv")
write.csv2(rev,"D:/pdi_integrations/data/eter/eter_rev.csv",row.names = FALSE)
print("Kirjoitettu eter_rev.csv")
write.csv2(sta,"D:/pdi_integrations/data/eter/eter_sta.csv",row.names = FALSE)
print("Kirjoitettu eter_sta.csv")
write.csv2(stud,"D:/pdi_integrations/data/eter/eter_stud.csv",row.names = FALSE)
print("Kirjoitettu eter_stud.csv")
write.csv2(grad,"D:/pdi_integrations/data/eter/eter_grad.csv",row.names = FALSE)
print("Kirjoitettu eter_grad.csv")
write.csv2(res,"D:/pdi_integrations/data/eter/eter_res.csv",row.names = FALSE)
print("Kirjoitettu eter_res.csv")
write.csv2(ind,"D:/pdi_integrations/data/eter/eter_ind.csv",row.names = FALSE)
print("Kirjoitettu eter_ind.csv")
write.csv2(demo,"D:/pdi_integrations/data/eter/eter_demo.csv",row.names = FALSE)
print("Kirjoitettu eter_demo.csv")
write.csv2(era,"D:/pdi_integrations/data/eter/eter_era.csv",row.names = FALSE)
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


##### Kesto #####
Loopin_loppu <- Sys.time() #Tallennetaan aikaa varten lopetusaika
Kesto <- Loopin_loppu-Loopin_alku
print(paste("Ajaminen kesti ",Kesto))