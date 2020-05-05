
Alku <- Sys.time() #Tallennetaan aloitusaika

#---------------------------#

#        load packages      #

#---------------------------#

library(httr)
library(jsonlite)
library(tidyverse)
library(plyr)
library(purrr)
library(dplyr)
library(tidyr)

#---------------------------#

#        load data          #

#---------------------------#

Sys.setlocale('LC_ALL', 'russian');

# projects 
data = read.csv("http://cordis.europa.eu/data/cordis-h2020projects.csv", header = TRUE, sep = ";", encoding="UTF-8")

# organisations + EC contribution per project
data2 = read.csv("http://cordis.europa.eu/data/cordis-h2020organizations.csv", header = TRUE, sep = ";", encoding="UTF-8")

# country codes
data3 = read.csv("http://cordis.europa.eu/data/reference/cordisref-countries.csv", header = TRUE, sep = ";", encoding="UTF-8")

# organisation type codes
data4 = read.csv("http://cordis.europa.eu/data/reference/cordisref-organizationActivityType.csv", header = TRUE, sep = ";", encoding="UTF-8")

#---------------------------#

#     data pre-processing   #

#---------------------------#

data <- within(data, rm(projectUrl, participants, participantCountries, subjects))
data2 <- within(data2, rm(organizationUrl, contactForm, contactType, contactTitle, contactFirstNames, contactLastNames, contactFunction, contactTelephoneNumber, contactFaxNumber, street, city, postCode, vatNumber))
data2$name[data2$id == 952705871] <- 'INSTITUTE OF MAGNETISM OF THE NATIONAL ACADEMY OF SCIENCE OF UKRAINE AND THE MINISTRY OF EDUCATION AND SCIENCE OF UKRAINE'
data3 <- subset(data3, language == 'en', select=c(X.U.FEFF.euCode,isoCode, name))
data4 <- subset(data4, language == 'en', select=c(Code, Title))



##### Kirjoitetaan csv-tiedostot #####

write.csv2(data,"D:/pdi_integrations/data/horizon/horizon_projects.csv",row.names = FALSE, na="")
write.csv2(data2,"D:/pdi_integrations/data/horizon/horizon_organisations.csv",row.names = FALSE, na="")
write.csv2(data3,"D:/pdi_integrations/data/horizon/horizon_country_codes.csv",row.names = FALSE, na="")
write.csv2(data4,"D:/pdi_integrations/data/horizon/horizon_org_type_codes.csv",row.names = FALSE, na="")

##### Kesto #####

Loppu <- Sys.time() #Tallennetaan aikaa varten lopetusaika
Kesto <- Loppu-Alku
print(paste("Ajaminen kesti ",Kesto))

