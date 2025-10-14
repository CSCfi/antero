
Alku <- Sys.time() # Start time

#---------------------------#

#        load packages      #

#---------------------------#

if(require("httr") == FALSE){
  install.packages("httr", repos = "http://cran.us.r-project.org")
  library("httr")
}
if(require("jsonlite") == FALSE){
  install.packages("jsonlite", repos = "http://cran.us.r-project.org")
  library("jsonlite")
}
if(require("plyr") == FALSE){
  install.packages("plyr", repos = "http://cran.us.r-project.org")
  library("plyr")
}
if(require("purrr") == FALSE){
  install.packages("purrr", repos = "http://cran.us.r-project.org")
  library("purrr")
}
if(require("tidyr") == FALSE){
  install.packages("tidyr", repos = "http://cran.us.r-project.org")
  library("tidyr")
}
if(require("dplyr") == FALSE){
  install.packages("dplyr", repos = "http://cran.us.r-project.org")
  library("dplyr")
}
if(require("data.table") == FALSE){
  install.packages("data.table", repos = "http://cran.us.r-project.org")
  library("data.table")
}
if(require("splitstackshape") == FALSE){
  install.packages("splitstackshape", repos = "http://cran.us.r-project.org")
  library("splitstackshape")
}

# Set max timeout time

options(timeout = max(5000, getOption("timeout")))

#---------------------------#

#        load data          #

#---------------------------#

## Horizon 2020

# Projects 
tf3 <- tempfile()
td3 <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-h2020projects-json.zip",tf3, mode = "wb", method = "libcurl")
file.names <- unzip(tf3, exdir = td3)
txt <- readLines(file.names[1], warn = FALSE, encoding = "UTF-8")
txt <- sub("^\ufeff", "", txt)  # remove BOM if present
Projects <- fromJSON(paste(txt, collapse = "\n"), flatten = TRUE)
names(Projects)[names(Projects) == "rcn"] <- "projectRcn"

# Organisations and EC contribution

Orgs <- fromJSON(file.names[which(unlist(gregexpr('organization', file.names)) > 0)], flatten = TRUE)


# country codes
Country = read.csv("http://cordis.europa.eu/data/reference/cordisref-countries.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

# organisation type codes
oTypes = read.csv("http://cordis.europa.eu/data/reference/cordisref-organizationActivityType.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")


# programmes
tf <- tempfile()
td <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020programmes-json.zip",tf, mode = "wb", method = "libcurl")
file.names <- unzip(tf, exdir = td)
Progs <- fromJSON(file.names[grepl("json", file.names)], flatten = TRUE)
 
# topics
tf2 <- tempfile()
td2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020topics-json.zip",tf2, mode = "wb", method = "libcurl")
file.names <- unzip(tf2, exdir = td2)
Topics <- fromJSON(file.names[grepl("json", file.names)], flatten = TRUE)

#funding schemes
fSchemes <- read.csv("https://cordis.europa.eu/data/reference/cordisref-projectFundingSchemeCategory.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

## Horizon europe
tfHE <- tempfile()
tdHE <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-HORIZONprojects-json.zip",tfHE, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE, exdir = tdHE)
txt <- readLines(file.names[1], warn = FALSE, encoding = "UTF-8")
txt <- sub("^\ufeff", "", txt)  # remove BOM if present
ProjectsHE <- fromJSON(paste(txt, collapse = "\n"), flatten = TRUE)

OrgsHE <- fromJSON(file.names[which(unlist(gregexpr('organization', file.names)) > 0)], flatten = TRUE)
LegalBasisHE <- fromJSON(file.names[which(unlist(gregexpr('legalBasis', file.names)) > 0)], flatten = TRUE)

tfHE2 <- tempfile()
tdHE2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONprogrammes-json.zip",tfHE2, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE2, exdir = tdHE2)
ProgsHE <- fromJSON(file.names[grepl("json", file.names)], flatten = TRUE)

tfHE3 <- tempfile()
tdHE3 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONtopics-json.zip",tfHE3, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE3, exdir = tdHE3)
TopicsHE <- fromJSON(file.names[grepl("json", file.names)], flatten = TRUE)


#---------------------------#

#     data pre-processing   #

#---------------------------#


Projects <- Projects[Projects$projectRcn != "",]
Projects$contentUpdateDate[is.na(as.integer(Projects$projectRcn))] <- NA
Projects$grantDoi[is.na(as.integer(Projects$projectRcn))] <- NA
Projects$projectRcn[is.na(as.integer(Projects$projectRcn))] <- NA

Country <- subset(Country, language == 'en', select=names(Country))
oTypes <- subset(oTypes, language == 'en', select=names(oTypes))
Progs <- subset(Progs, language == 'en', select=names(Progs))
Topics <- subset(Topics, language == 'en', select=names(Topics))
fSchemes <- subset(fSchemes, Available.languages == 'en', select=names(fSchemes))

ProjectsHE <- merge(ProjectsHE, LegalBasisHE[,c(1,3)], by.x = "id", by.y = "projectID")
ProjectsHE$legalBasis <-  as.character(ProjectsHE$legalBasis.x)
ProjectsHE$legalBasis[ProjectsHE$legalBasis == ""] <-  as.character(ProjectsHE$legalBasis.y[ProjectsHE$legalBasis == ""])
ProjectsHE = ProjectsHE[,!(names(ProjectsHE) %in% c("legalBasis.y", "legalBasis.x"))]
names(ProjectsHE)[names(ProjectsHE) == "rcn"] <- "projectRcn"

ProjectsHE$contentUpdateDate[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
ProjectsHE$grantDoi[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
ProjectsHE$projectRcn[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
Projects$totalCost <- as.numeric(Projects$totalCost)
ProjectsHE$totalCost <- as.numeric(ProjectsHE$totalCost)
Projects$ecMaxContribution <- as.numeric(Projects$ecMaxContribution)
ProjectsHE$ecMaxContribution <- as.numeric(ProjectsHE$ecMaxContribution)

OrgsHE <- OrgsHE[OrgsHE$projectID != "projectID",]
OrgsHE$projectID <- as.integer(OrgsHE$projectID)
OrgsHE$organisationID <- as.integer(OrgsHE$organisationID)
OrgsHE$rcn <- as.integer(OrgsHE$rcn)
OrgsHE$order <- as.integer(OrgsHE$order)
OrgsHE$ecContribution <- as.double(OrgsHE$ecContribution)
OrgsHE$netEcContribution <- as.double(OrgsHE$netEcContribution)
Orgs$totalCost <- as.numeric(Orgs$totalCost)
OrgsHE$totalCost <- as.numeric(OrgsHE$totalCost)
Orgs$netEcContribution <- as.numeric(Orgs$netEcContribution)
Orgs$ecContribution <- as.numeric(Orgs$ecContribution)
Orgs$order <- as.numeric(Orgs$order)
OrgsHE$activityType <- substr(OrgsHE$activityType,1,3)
Orgs$activityType <- substr(Orgs$activityType,1,3)
OrgsHE$country <- substr(OrgsHE$country,0,2)

# Horizon 2020 and Horizon Europe data is combined and columns are selected and sorted

Projects <- union_all(Projects, ProjectsHE)
ProjectsColumns <- c("id","acronym","status","title","startDate","endDate","totalCost","ecMaxContribution","legalBasis","topics","ecSignatureDate","frameworkProgramme","masterCall","subCall","fundingScheme","objective","contentUpdateDate","projectRcn","grantDoi","keywords")
Projects <- Projects[ , names(Projects) %in% ProjectsColumns]
Projects <- Projects[ , ProjectsColumns]

Orgs <- union_all(Orgs, OrgsHE)
OrgsColumns <- c("projectID","projectAcronym","organisationID","vatNumber","name","shortName","SME","activityType","street","postCode","city","country","nutsCode","geolocation","organizationURL","contactForm","contentUpdateDate","rcn","order","role","ecContribution","netEcContribution","totalCost","endOfParticipation")
Orgs <- Orgs[ , names(Orgs) %in% OrgsColumns]
Orgs <- Orgs[ , OrgsColumns]

Progs <- union_all(Progs, ProgsHE)
ProgsColumns <- c("id","language","code","startDate","endDate","title","shortTitle")
Progs <- Progs[ , names(Progs) %in% ProgsColumns]
Progs <- Progs[ , ProgsColumns]

Topics <- union_all(Topics, TopicsHE)
TopicsColumns <- c("id","language","code","startDate","endDate","title","shortTitle","objective","keywords","frameworkProgramme","parentProgramme","legalBasis","call","contentUpdateDate","rcn")
Topics <- Topics[ , names(Topics) %in% TopicsColumns]
Topics <- Topics[ , TopicsColumns]

##### Write csv files #####

options(scipen = 999)

write.csv2(Projects,"D:/pdi_integrations/data/horizon/horizon_projects.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(Orgs,"D:/pdi_integrations/data/horizon/horizon_organisations.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(Country,"D:/pdi_integrations/data/horizon/horizon_country_codes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(oTypes,"D:/pdi_integrations/data/horizon/horizon_org_type_codes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(Progs,"D:/pdi_integrations/data/horizon/horizon_programmes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(Topics,"D:/pdi_integrations/data/horizon/horizon_topics.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")
write.csv2(fSchemes,"D:/pdi_integrations/data/horizon/horizon_funding_schemes.csv",row.names = FALSE, na="", fileEncoding = "UTF-8")

##### Data is saved to other folder #####

write.csv2(Projects,paste("D:/pdi_integrations/data/horizon/Varmuuskopiot/horizon_projects_", Sys.Date(),".csv", sep=""),row.names = FALSE, na="", fileEncoding = "UTF-8")

write.csv2(Orgs,paste("D:/pdi_integrations/data/horizon/Varmuuskopiot/horizon_organisations_", Sys.Date(),".csv", sep=""),row.names = FALSE, na="", fileEncoding = "UTF-8")


##### Duration #####

Loppu <- Sys.time() # End time 
Kesto <- Loppu-Alku
print(paste("Ajaminen kesti ",Kesto))
