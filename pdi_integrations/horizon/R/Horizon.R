# Start time
start_time <- Sys.time()

#------------------------------#
#      Load required libraries #
#------------------------------#

required_packages <- c("httr", "jsonlite", "plyr", "purrr", "tidyr", "dplyr", "data.table", "splitstackshape")

# Install and load any missing packages
lapply(required_packages, function(pkg) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg, repos = "http://cran.us.r-project.org")
    library(pkg, character.only = TRUE)
  }
})

# Increase download timeout in case of slow connections
options(timeout = max(5000, getOption("timeout")))

#------------------------------#
#        Horizon 2020 Data     #
#------------------------------#

# Download and unzip project data
tf3 <- tempfile()
td3 <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-h2020projects-csv.zip", tf3, mode = "wb", method = "libcurl")
file_names <- unzip(tf3, exdir = td3)

# Read projects CSV (header row is first data row)
Projects <- read.csv(file_names[grepl("project.csv", file_names)],
                     header = FALSE, sep = ";", encoding = "UTF-8", quote = "\"")
names(Projects)[1:20] <- Projects[1, 1:20]
Projects <- Projects[-1, ]
names(Projects)[19] <- "projectRcn"

# Read organization contributions
Orgs <- read.csv(file_names[grepl("organization", file_names)],
                 header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

# Read reference tables for countries and organization types
Country <- read.csv("http://cordis.europa.eu/data/reference/cordisref-countries.csv",
                    header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")
oTypes <- read.csv("http://cordis.europa.eu/data/reference/cordisref-organizationActivityType.csv",
                   header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

# Download and parse programme list (raw lines)
tf <- tempfile(); td <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020programmes-csv.zip",
              tf, mode = "wb", method = "libcurl")
file_names <- unzip(tf, exdir = td)
Progs_raw <- readLines(file_names)

# Read topic categories
tf2 <- tempfile(); td2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020topics-csv.zip",
              tf2, mode = "wb", method = "libcurl")
file_names <- unzip(tf2, exdir = td2)
Topics <- read.csv(file_names,
                   header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

# Read funding scheme categories
fSchemes <- read.csv("https://cordis.europa.eu/data/reference/cordisref-projectFundingSchemeCategory.csv",
                     header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

#------------------------------#
#        Horizon Europe Data   #
#------------------------------#

# Download and unzip Horizon Europe datasets
tfHE <- tempfile(); tdHE <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-HORIZONprojects-csv.zip",
              tfHE, mode = "wb", method = "libcurl")
file_names <- unzip(tfHE, exdir = tdHE)

ProjectsHE    <- read.csv(file_names[grepl("project", file_names)],
                          header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")
OrgsHE        <- read.csv(file_names[grepl("organization", file_names)],
                          header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")
LegalBasisHE  <- read.csv(file_names[grepl("legalBasis", file_names)],
                          header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

# Download and read Horizon Europe programmes
tfHE2 <- tempfile(); tdHE2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONprogrammes-csv.zip",
              tfHE2, mode = "wb", method = "libcurl")
file_names <- unzip(tfHE2, exdir = tdHE2)
ProgsHE <- read.csv(file_names,
                    header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

# Download and read Horizon Europe topics
tfHE3 <- tempfile(); tdHE3 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONtopics-csv.zip",
              tfHE3, mode = "wb", method = "libcurl")
file_names <- unzip(tfHE3, exdir = tdHE3)
TopicsHE <- read.csv(file_names,
                     header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

#------------------------------#
#        Data Pre-processing   #
#------------------------------#

# Clean and reshape programme list
Progs <- as.data.frame(Progs_raw)
Progs$Progs_raw <- gsub('"', "", Progs$Progs_raw)
Progs <- cSplit(Progs, "Progs_raw", sep = ";", direction = "wide")[, 1:7]
colnames(Progs) <- as.character(Progs[1, ])
Progs <- Progs[-1, ]

# Filter and clean Horizon 2020 projects
Projects <- Projects[Projects$projectRcn != "", ]
Projects$contentUpdateDate[is.na(as.integer(Projects$projectRcn))] <- NA
Projects$grantDoi[is.na(as.integer(Projects$projectRcn))] <- NA
Projects$projectRcn[is.na(as.integer(Projects$projectRcn))] <- NA
Projects <- Projects[, 1:20]

# Keep only English entries in reference tables
Country  <- subset(Country,  language == 'en')
oTypes   <- subset(oTypes,   language == 'en')
Progs    <- subset(Progs,    language == 'en')
Topics   <- subset(Topics,   language == 'en')
fSchemes <- subset(fSchemes, Available.languages == 'en')

# Fix Horizon Europe project columns to match H2020
if (ncol(ProjectsHE) > 20) {
  name_list <- names(ProjectsHE)[2:ncol(ProjectsHE)]
  ProjectsHE <- ProjectsHE[, 1:(ncol(ProjectsHE) - 1)]
  names(ProjectsHE) <- name_list
}
ProjectsHE <- merge(ProjectsHE, LegalBasisHE[, 1:2],
                    by.x = "id", by.y = "projectID")

# Consolidate legal basis columns
ProjectsHE$legalBasis <- ProjectsHE$legalBasis.x
ProjectsHE$legalBasis.x[ProjectsHE$legalBasis.x == ""] <-
ProjectsHE$legalBasis.y[ProjectsHE$legalBasis.x == ""]
ProjectsHE <- ProjectsHE[, !names(ProjectsHE) %in% c("legalBasis.x", "legalBasis.y")]
names(ProjectsHE)[names(ProjectsHE) == "rcn"] <- "projectRcn"
ProjectsHE <- ProjectsHE[, names(Projects)]
ProjectsHE$contentUpdateDate[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
ProjectsHE$grantDoi[is.na(as.integer(ProjectsHE$projectRcn))] <- NA
ProjectsHE$projectRcn[is.na(as.integer(ProjectsHE$projectRcn))] <- NA

# Clean Horizon Europe organization data
OrgsHE <- OrgsHE[OrgsHE$projectID != "projectID", ]
OrgsHE <- transform(OrgsHE,
                    projectID = as.integer(projectID),
                    organisationID = as.integer(organisationID),
                    rcn = as.integer(rcn),
                    order = as.integer(order),
                    ecContribution = as.double(ecContribution),
                    netEcContribution = as.double(netEcContribution),
                    activityType = substr(activityType, 1, 3)
)
# Truncate original activityType for H2020 data as well
Orgs$activityType <- substr(Orgs$activityType, 1, 3)

# Keep only English programmes in HE
ProgsHE <- ProgsHE[ProgsHE$language == "en", 1:7]
ProjectsHE <- unique(ProjectsHE)

#------------------------------#
#     Combine all datasets     #
#------------------------------#

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

end_time <- Sys.time() # End time 
duration <- end_time-start_time
print(paste("Ajaminen kesti",round(duration, digits=2), "minuuttia"))