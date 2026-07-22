
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

#        Functions          #

#---------------------------#

fix_row <- function(row_vals) {
  date_regex <- "^\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}$"
  row_vals <- as.character(row_vals)
  n <- length(row_vals)
  is_date <- grepl(date_regex, row_vals)
  
  date_after17 <- which(is_date & seq_len(n) > 17)
  
  if (length(date_after17) > 0) {
    date_pos <- date_after17[1]
    tail_vals <- row_vals[date_pos:n]
    new_vals <- row_vals
    end_pos <- 17 + length(tail_vals) - 1
    new_vals[17:min(end_pos, n)] <- tail_vals[1:min(length(tail_vals), n - 17 + 1)]
    if (end_pos < n) new_vals[(end_pos + 1):n] <- NA
    row_vals <- new_vals
    
  } else if (isTRUE(is_date[17])) {
    non_empty <- which(!is.na(row_vals) & row_vals != "")
    trailing <- non_empty[non_empty > 17]
    
    if (length(trailing) > 0) {
      last_idx <- max(trailing)          
      row_vals[22] <- row_vals[last_idx]
      row_vals[21] <- row_vals[last_idx - 1] 
      row_vals[23:n] <- NA
    }
  }
  
  row_vals[1:22]
}

repair_quotes <- function(line) {
  chars <- strsplit(line, "")[[1]]
  n <- length(chars)
  quote_pos <- which(chars == '"')
  for (p in quote_pos) {
    prev_c <- if (p > 1) chars[p - 1] else NA
    next_c <- if (p < n) chars[p + 1] else NA
    is_delim <- (is.na(prev_c) || prev_c == ";") || (is.na(next_c) || next_c == ";")
    if (!is_delim) chars[p] <- '""'
  }
  paste(chars, collapse = "")
}

split_csv_line <- function(line, sep = ";", quote = '"') {
  chars <- strsplit(line, "")[[1]]
  n <- length(chars)
  fields <- character(0)
  buf <- character(0)
  in_quotes <- FALSE
  i <- 1
  while (i <= n) {
    c <- chars[i]
    if (in_quotes) {
      if (c == quote) {
        if (i < n && chars[i + 1] == quote) {
          buf <- c(buf, quote); i <- i + 2
        } else {
          in_quotes <- FALSE; i <- i + 1
        }
      } else {
        buf <- c(buf, c); i <- i + 1
      }
    } else {
      if (c == quote) {
        in_quotes <- TRUE; i <- i + 1
      } else if (c == sep) {
        fields <- c(fields, paste(buf, collapse = "")); buf <- character(0); i <- i + 1
      } else {
        buf <- c(buf, c); i <- i + 1
      }
    }
  }
  fields <- c(fields, paste(buf, collapse = ""))
  fields
}

normalize_row <- function(f, n_expected, n_prefix = 7, n_suffix = 5) {
  n <- length(f)
  if (n == n_expected) return(f)
  if (n > n_expected) {
    prefix <- f[1:n_prefix]
    suffix <- f[(n - n_suffix + 1):n]
    middle <- paste(f[(n_prefix + 1):(n - n_suffix)], collapse = ";")
    return(c(prefix, middle, suffix))
  }
  c(f, rep(NA_character_, n_expected - n))   # pad short rows
}

#---------------------------#

#        load data          #

#---------------------------#

## Horizon 2020

# Projects 
tf3 <- tempfile()
td3 <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-h2020projects-csv.zip",tf3, mode = "wb", method = "libcurl")
file.names <- unzip(tf3, exdir = td3)
Projects <- read.csv(file.names[which(unlist(gregexpr('project.csv', file.names)) > 0)],header = FALSE, sep = ";", encoding = "UTF-8", quote = "\"", colClasses = rep("character", 34))
names(Projects)[1:22] <- Projects[1,1:22]
names(Projects)[23:34] <- 23:34
Projects_mat <- t(apply(Projects, 1, fix_row))
Projects <- as.data.frame(Projects_mat, stringsAsFactors = FALSE)
names(Projects)[1:22] <- Projects[1,1:22]
Projects <- Projects[2:nrow(Projects),]
names(Projects)[names(Projects) == "rcn"] <- "projectRcn"
rm(Projects_mat)

# topics
Topics = read.csv(file.names[grepl("topics", file.names)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

# Organisations and EC contribution

Orgs <- read.csv(file.names[grepl("organization", file.names)], header = TRUE, sep = ";", encoding = "UTF-8", quote = "\"")

# country codes
Country = read.csv("http://cordis.europa.eu/data/reference/cordisref-countries.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

# organisation type codes
oTypes = read.csv("http://cordis.europa.eu/data/reference/cordisref-organizationActivityType.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

# programmes
tf <- tempfile()
td <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-H2020programmes-csv.zip",tf, mode = "wb", method = "libcurl")
file.names <- unzip(tf, exdir = td)
Progs_lines <- readLines(file.names[which(unlist(gregexpr('programme.csv', file.names)) > 0)], encoding = "UTF-8", warn = FALSE)
Progs_fixed_lines <- vapply(Progs_lines, repair_quotes, character(1), USE.NAMES = FALSE)
Progs_parsed <- lapply(Progs_fixed_lines, split_csv_line)
Progs_header <- Progs_parsed[[1]]
n_expected <- length(Progs_header)
Progs_parsed <- Progs_parsed[-1]
Progs_normalized <- lapply(Progs_parsed, normalize_row, n_expected = n_expected)
Progs <- as.data.frame(do.call(rbind, Progs_normalized), stringsAsFactors = FALSE)
names(Progs) <- Progs_header
rm(Progs_normalized, Progs_parsed, Progs_lines, Progs_fixed_lines) 

#funding schemes
fSchemes <- read.csv("https://cordis.europa.eu/data/reference/cordisref-projectFundingSchemeCategory.csv", header = TRUE, sep = ";", encoding="UTF-8", quote = "\"")

## Horizon europe
tfHE <- tempfile()
tdHE <- tempdir()
download.file("https://cordis.europa.eu/data/cordis-HORIZONprojects-csv.zip",tfHE, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE, exdir = tdHE)
ProjectsHE <- read.csv(file.names[which(unlist(gregexpr('project', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", colClasses = rep("character", 34))
names(ProjectsHE)[1:22] <- Projects[1,1:22]
names(ProjectsHE)[23:34] <- 23:34
ProjectsHE_mat <- t(apply(ProjectsHE, 1, fix_row))
ProjectsHE <- as.data.frame(ProjectsHE_mat, stringsAsFactors = FALSE)
names(ProjectsHE)[1:22] <- names(Projects)[1:22]
rm(ProjectsHE_mat)

OrgsHE <- read.csv(file.names[which(unlist(gregexpr('organization', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)
LegalBasisHE <- read.csv(file.names[which(unlist(gregexpr('legalBasis', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)
TopicsHE <- read.csv(file.names[which(unlist(gregexpr('topics', file.names)) > 0)], header = TRUE, sep = ";", encoding="UTF-8", quote = "\"", row.names = NULL)

tfHE2 <- tempfile()
tdHE2 <- tempdir()
download.file("https://cordis.europa.eu/data/reference/cordisref-HORIZONprogrammes-csv.zip",tfHE2, mode = "wb", method = "libcurl")
file.names <- unzip(tfHE2, exdir = tdHE2)
ProgsHE_lines <- readLines(file.names[which(unlist(gregexpr('programme.csv', file.names)) > 0)], encoding = "UTF-8", warn = FALSE)
ProgsHE_fixed_lines <- vapply(ProgsHE_lines, repair_quotes, character(1), USE.NAMES = FALSE)
ProgsHE_parsed <- lapply(ProgsHE_fixed_lines, split_csv_line)
ProgsHE_header <- ProgsHE_parsed[[1]]
n_expected <- length(ProgsHE_header)
ProgsHE_parsed <- ProgsHE_parsed[-1]
ProgsHE_normalized <- lapply(ProgsHE_parsed, normalize_row, n_expected = n_expected)
ProgsHE <- as.data.frame(do.call(rbind, ProgsHE_normalized), stringsAsFactors = FALSE)
names(ProgsHE) <- ProgsHE_header
rm(ProgsHE_normalized, ProgsHE_parsed, ProgsHE_lines, ProgsHE_fixed_lines) 
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
fSchemes <- subset(fSchemes, Available.languages == 'en', select=names(fSchemes))

LegalBasisHE$projectID[is.na(LegalBasisHE$projectID)] <- LegalBasisHE$uniqueProgrammePart[is.na(LegalBasisHE$projectID)]
ProjectsHE <- merge(ProjectsHE, LegalBasisHE[,c(1,4)], by.x = "id", by.y = "projectID")

ProjectsHE$legalBasis <- as.character(ProjectsHE$legalBasis.x)
idx <- is.na(ProjectsHE$legalBasis) | ProjectsHE$legalBasis == ""
ProjectsHE$legalBasis[idx] <- ProjectsHE$legalBasis.y[idx]
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

Topics$id <- paste0("H2022_", Topics$topic)
TopicsHE$id <- paste0("HORIZON_", TopicsHE$topic)


# Horizon 2020 and Horizon Europe data is combined and columns are selected and sorted

Projects <- union_all(Projects[,c(1:14,16:20,22)], ProjectsHE[,c(1:14,16:20,22)])
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
Topics <- unique(Topics[c(1,2,4)])
Topics[c("language","startDate","endDate","shortTitle","objective","keywords","frameworkProgramme","parentProgramme","legalBasis","call","contentUpdateDate","rcn")] <- NA
names(Topics)[c(1,2)] <- c("code", "title")
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
