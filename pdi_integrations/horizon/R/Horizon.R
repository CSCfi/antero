
Alku <- Sys.time() #Tallennetaan aloitusaika

#---------------------------#

#        load packages      #

#---------------------------#

if(require("httr") == FALSE){
  install.packages("httr")
  library("httr")
}
if(require("jsonlite") == FALSE){
  install.packages("jsonlite")
  library("jsonlite")
}
if(require("plyr") == FALSE){
  install.packages("plyr")
  library("plyr")
}
if(require("purrr") == FALSE){
  install.packages("purrr")
  library("purrr")
}
if(require("tidyr") == FALSE){
  install.packages("tidyr")
  library("tidyr")
}


#---------------------------#

#        load data          #

#---------------------------#

# projects 
tf3 <- tempfile()
td3 <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-h2020projects-csv.zip",tf3, mode = "wb")
file.names <- unzip(tf3, exdir = td3)
data = read.csv(file.names[4], header = TRUE, sep = ";", encoding="UTF-8")
names(data)[19] <- "projectRcn"

# organisations + EC contribution per project

data2 = read.csv(file.names[3], header = TRUE, sep = ";", encoding="UTF-8")

# country codes
data3 = read.csv("http://cordis.europa.eu/data/reference/cordisref-countries.csv", header = TRUE, sep = ";", encoding="UTF-8")

# organisation type codes
data4 = read.csv("http://cordis.europa.eu/data/reference/cordisref-organizationActivityType.csv", header = TRUE, sep = ";", encoding="UTF-8")


# programmes
tf <- tempfile()
td <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020programmes-csv.zip",tf, mode = "wb")
file.names <- unzip(tf, exdir = td)
data5 = read.csv(file.names, header = TRUE, sep = ";", encoding="UTF-8")

# topics
tf2 <- tempfile()
td2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020topics-csv.zip",tf2, mode = "wb")
file.names <- unzip(tf2, exdir = td2)
data6 = read.csv(file.names, header = TRUE, sep = ";", encoding="UTF-8")

#funding schemes
data7 <- read.csv("https://cordis.europa.eu/data/reference/cordisref-projectFundingSchemeCategory.csv", header = TRUE, sep = ";", encoding="UTF-8")


#---------------------------#

#     data pre-processing   #

#---------------------------#

data3 <- subset(data3, language == 'en', select=names(data3))
data4 <- subset(data4, language == 'en', select=names(data4))
data5 <- subset(data5, language == 'en', select=names(data5))
data6 <- subset(data6, language == 'en', select=names(data6))
data7 <- subset(data7, language == 'en', select=names(data7))

##### Kirjoitetaan csv-tiedostot #####

options(scipen = 999)

write.csv2(data,"D:/pdi_integrations/data/horizon/horizon_projects.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(data2,"D:/pdi_integrations/data/horizon/horizon_organisations.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(data3,"D:/pdi_integrations/data/horizon/horizon_country_codes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(data4,"D:/pdi_integrations/data/horizon/horizon_org_type_codes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(data5,"D:/pdi_integrations/data/horizon/horizon_programmes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(data6,"D:/pdi_integrations/data/horizon/horizon_topics.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(data7,"D:/pdi_integrations/data/horizon/horizon_funding_schemes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")


##### Varmuuskopioidaan datat #####

write.csv2(data,paste("D:/pdi_integrations/data/horizon/Varmuuskopiot/horizon_projects_", Sys.Date(),".csv", sep=""),row.names = FALSE, na="", fileEncoding = "UTF-8")

write.csv2(data2,paste("D:/pdi_integrations/data/horizon/Varmuuskopiot/horizon_organisations_", Sys.Date(),".csv", sep=""),row.names = FALSE, na="", fileEncoding = "UTF-8")


##### Kesto #####

Loppu <- Sys.time() #Tallennetaan aikaa varten lopetusaika
Kesto <- Loppu-Alku
print(paste("Ajaminen kesti ",Kesto))
