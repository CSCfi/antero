
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
download.file("https://cordis.europa.eu/data/cordis-h2020projects-csv.zip",tf3, mode = "wb", method = "libcurl")
file.names <- unzip(tf3, exdir = td3)
Projects <- read.csv(file.names[which(unlist(gregexpr('project.csv', file.names)) > 0)],header = FALSE, sep = ";", encoding = "UTF-8", quote = "\"")
names(Projects)[1:20] <- Projects[1,1:20]
Projects <- Projects[2:nrow(Projects),]
names(Projects)[19] <- "projectRcn"

# Organisations and EC contribution

Orgs = read.csv(file.names[which(unlist(gregexpr('organization', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

# country codes
Country = read.csv("http://cordis.europa.eu/data/reference/cordisref-countries.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

# organisation type codes
oTypes = read.csv("http://cordis.europa.eu/data/reference/cordisref-organizationActivityType.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")


# programmes
tf <- tempfile()
td <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020programmes-csv.zip",tf, mode = "wb", method = "libcurl")
file.names <- unzip(tf, exdir = td)
Progs_raw <- readLines(file.names)
 
# topics
tf2 <- tempfile()
td2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020topics-csv.zip",tf2, mode = "wb", method = "libcurl")
file.names <- unzip(tf2, exdir = td2)
Topics = read.csv(file.names, header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

#funding schemes
fSchemes <- read.csv("https://cordis.europa.eu/data/reference/cordisref-projectFundingSchemeCategory.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

## Horizon europe
tfHE <- tempfile()
tdHE <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-HORIZONprojects-csv.zip",tfHE, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE, exdir = tdHE)

ProjectsHE <- read.csv(file.names[which(unlist(gregexpr('project', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)
OrgsHE <- read.csv(file.names[which(unlist(gregexpr('organization', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)
LegalBasisHE <- read.csv(file.names[which(unlist(gregexpr('legalBasis', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)

tfHE2 <- tempfile()
tdHE2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONprogrammes-csv.zip",tfHE2, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE2, exdir = tdHE2)
ProgsHE <- read.csv(file.names, header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)

tfHE3 <- tempfile()
tdHE3 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONtopics-csv.zip",tfHE3, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE3, exdir = tdHE3)
TopicsHE <- read.csv(file.names, header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)

#---------------------------#

#     data pre-processing   #

#---------------------------#

Progs <- as.data.frame(Progs_raw)
Progs$Progs_raw <- gsub('"', "", Progs$Progs_raw)
Progs <- cSplit(Progs, "Progs_raw", sep = ";", direction = "wide")
Progs <- Progs[,1:7]
colnames(Progs) <- as.character(Progs[1, ]) 
Progs <- Progs[-1, ] 

Projects <- Projects[Projects$projectRcn != "",]
Projects$contentUpdateDate[is.na(as.integer(Projects$projectRcn))] <- NA
Projects$grantDoi[is.na(as.integer(Projects$projectRcn))] <- NA
Projects$projectRcn[is.na(as.integer(Projects$projectRcn))] <- NA
Projects <- Projects[,1:20]

Country <- subset(Country, language == 'en', select=names(Country))
oTypes <- subset(oTypes, language == 'en', select=names(oTypes))
Progs <- subset(Progs, language == 'en', select=names(Progs))
Topics <- subset(Topics, language == 'en', select=names(Topics))
fSchemes <- subset(fSchemes, Available.languages == 'en', select=names(fSchemes))

if(ncol(ProjectsHE) > 20){
  name_list <- names(ProjectsHE)[2:ncol(ProjectsHE)]
  ProjectsHE <- ProjectsHE[,1:ncol(ProjectsHE)-1]
  names(ProjectsHE) <- name_list
}
ProjectsHE <- merge(ProjectsHE, LegalBasisHE[,1:2], by.x = "id", by.y = "projectID")
ProjectsHE$legalBasis <-  as.character(ProjectsHE$legalBasis.x)
ProjectsHE$legalBasis[ProjectsHE$legalBasis == ""] <-  as.character(ProjectsHE$legalBasis.y[ProjectsHE$legalBasis == ""])
ProjectsHE = ProjectsHE[,!(names(ProjectsHE) %in% c("legalBasis.y", "legalBasis.x"))]
names(ProjectsHE)[names(ProjectsHE) == "rcn"] <- "projectRcn"
names(Projects)[names(Projects) == "projectRcn"] <- "grantDoi"
names(Projects)[names(Projects) == "rcn"] <- "projectRcn"
ProjectsHE <- ProjectsHE[, c(1:8,20,9:19)]
ProjectsHE$contentUpdateDate[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
ProjectsHE$grantDoi[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
ProjectsHE$projectRcn[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
OrgsHE <- OrgsHE[OrgsHE$projectID != "projectID",]
OrgsHE$projectID <- as.integer(OrgsHE$projectID)
OrgsHE$organisationID <- as.integer(OrgsHE$organisationID)
OrgsHE$rcn <- as.integer(OrgsHE$rcn)
OrgsHE$order <- as.integer(OrgsHE$order)
OrgsHE$ecContribution <- as.double(OrgsHE$ecContribution)
OrgsHE$netEcContribution <- as.double(OrgsHE$netEcContribution)
OrgsHE$activityType <- substr(OrgsHE$activityType,1,3)
Orgs$activityType <- substr(Orgs$activityType,1,3)
ProgsHE <- ProgsHE[,1:7]
OrgsHE$country <- substr(OrgsHE$country,0,2)

# Horizon 2020 and Horizon Europe data is combined 

Projects <- union_all(Projects, ProjectsHE)
Orgs <- union_all(Orgs, OrgsHE)
Progs <- union_all(Progs, ProgsHE)
Topics <- union_all(Topics, TopicsHE)

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
