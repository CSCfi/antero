# Alustus -----------------------------------------------------------------

Alku <- Sys.time()


setwd("D:/antero/pdi_integrations/vipunen/R")

if(require("renv") == FALSE) {
  install.packages("renv", version = "1.4.1" ,repos = "http://cran.us.r-project.org")
  library("renv")
}

renv::init(force = TRUE)
renv::restore()

if(require("XML") == FALSE) {
  install.packages("XML", version = "3.99.0.3" ,repos = "http://cran.us.r-project.org")
  library("XML")
}
if(require("xml2") == FALSE) {
  install.packages("xml2", version = "1.3.2" ,repos = "http://cran.us.r-project.org")
  library("xml2")
}
if(require("dplyr") == FALSE) {
  install.packages("dplyr",repos = "http://cran.us.r-project.org")
  library("dplyr")
}
if(require("jsonlite") == FALSE) {
  install.packages("jsonlite", version = "1.6.1" ,repos = "http://cran.us.r-project.org")
  library("jsonlite")
}
if(require("stringr") == FALSE) {
  install.packages("stringr", version = "1.4.1" ,repos = "http://cran.us.r-project.org")
  library("stringr")
}

# Kansiot joissa on tabular projekteja
folders <- c("tabular","tabular j‰‰dytys")

#Alustetaan tietojoukko
data <- data.frame()
source_data <- data.frame()


# For-loop kansioiden l‰pik‰ynti‰ varten -----------------------------------------------------------------
for (f in folders){

  # Kansiopolku
  path <- paste0("D:/git_tabular/", f)
  
  # Kansion kaikki tiedostot
  list <- as.data.frame(list.dirs(path))
  names(list)[1] <- "path"

  # Rajataan tiedostot ainoastaan kansioihin
  folders <- unique(as.data.frame(paste0(path, "/",word(list$path,4,sep = "/"))))
  if(f == "tabular"){
    folders <- as.data.frame(folders[2:(nrow(folders)-1),])
  } else{
    folders <- as.data.frame(folders[2:(nrow(folders)),])
  }
  folders[,1] <- as.character(folders[,1])
  Encoding(folders[,1]) <- "UTF-8"
  
# For-loop alikansioiden l‰pik‰ynti‰ varten -----------------------------------------------------------------
  for (i in folders[,1]){
    
    # Kansion tiedostot
    list2 <- as.data.frame(list.dirs(i))
    names(list2)[1] <- "path"
    
    # Valitaan ainoastaan alikansiossa olevat kansiot
    folders2 <- unique(as.data.frame(paste0(i, "/",word(list2$path,5,sep = "/"))))
    folders2 <- as.data.frame(folders2[2:max(c((nrow(folders2)),2)),])
    folders2[,1] <- as.character(folders2[,1])
    Encoding(folders2[,1]) <- "UTF-8"
    
    # Siirryt‰‰n seuraavaan kansioon, jos kansio on tyhj‰
    if(length((folders2[!is.na(folders2[,1]),])) > 0){
      
# For-loop alikansioiden alikansioiden l‰pik‰ynti‰ varten -----------------------------------------------------------------
      for (j in folders2[,1]){
        
        # Valitaan kansiossa olevat bim-tiedostot
        files <- as.data.frame(list.files(j))
        files[,1] <- as.character(files[,1])
        fileName <- files[endsWith(files[,1], ".bim"),1]
        bimPath <- j
        
        # Jos kansiossa ei ole bim-tiedostoja tarkastetaan viel‰ kansion alikansiot
        if (length(fileName) < 1){
          folders3 <- as.data.frame(list.dirs(j))
          bim_ind <- 0
          for (f2 in unique(folders3[,1])){
            files2 <- as.data.frame(list.files(f2))
            if (length(files2[endsWith(as.character(files2[, 1]), ".bim"),1]) > 0){
              bim_ind <- bim_ind + 1
              fileName[bim_ind] <- files2[endsWith(as.character(files2[, 1]), ".bim"),1]
              bimPath[bim_ind] <- f2
            }
          }
        }
        
        nBim <- 0
        
# For-loop bim-tiedostojen l‰pik‰ynti‰ varten -----------------------------------------------------------------
        for (bims in bimPath){
          
          nBim <- nBim + 1
          n <- str_count(bims, "/") + 1
          
# JSON muotoinen bim-tiedosto -----------------------------------------------------------------          
          # Testastaan onko bim-tiedosto JSON-muodossa
          error <- try(fromJSON(paste0(bims, "/", fileName[nBim]), flatten = TRUE), silent = TRUE)
          
          # Jos tiedosto on JSON muodossa, luetaan sen sis‰ltˆ
          if (class(error) != "try-error" & length(fileName[nBim]) > 0){
            
            # bim-tiedosto
            tabularModel <- fromJSON(paste0(bims, "/", fileName[nBim]), flatten = TRUE)
            
            # Tallennetaan l‰hteet tietojoukkoon 
            partitions <- tabularModel$model$tables$partitions
            for (p in 1:length(partitions)){
                partition <- partitions[[p]]
                for (p2 in 1:nrow(partition)){
                  if (length(partition$source.query[p2]) > 0){
                    source_data[nrow(source_data)+1,1] <- word(bims,n,sep = "/")
                    source <- trimws(str_split(as.character(partition$source.query[p2]), "FROM")[[1]][2])
                    source <- str_split(source, " ")[[1]][1]
                    source_data[nrow(source_data),2] <- source
                    source <- trimws(str_split(as.character(partition$source.query[p2]), "from")[[1]][2])
                    source <- str_split(source, " ")[[1]][1]
                    source_data[nrow(source_data),3] <- source
                  }
                }
            } 
  
            # Alustetaan tietojoukko mittareiden kaavoilla
            f_df <- data.frame()
            
            # Tallennetaan mittareiden nimet ja kaavat tietojoukkoon
            formulas <- tabularModel$model$tables$measures
            for (fo in 1:length(formulas)){
              formula <- formulas[[fo]]$expression
              if(length(formula) > 0){
                for (fo2 in 1:length(formula)){
                  f_df[nrow(f_df)+1,1] <- formulas[[fo]]$name[fo2] 
                  f_df[nrow(f_df),2] <- paste(unlist(formula[fo2][[1]]), collapse =" ")
                  if(length(formulas[[fo]]$isHidden[fo2]) > 0){
                    f_df[nrow(f_df),3] <- formulas[[fo]]$isHidden[fo2]
                  } else {
                    f_df[nrow(f_df),3] <- NA
                  }
                }
              }
            }
            
            # Jos tiedostossa ei ole mittareita, siirryt‰‰n seuraavaan vaiheeseen
            if (ncol(f_df) > 0){
              
              # Lis‰t‰‰n tieto suojatuista mittareista
              f_df[,4] <- grepl("MROUND", toupper(f_df[,2]), fixed = TRUE) | grepl("1-4", f_df[,2], fixed = TRUE) | grepl("1 -4", f_df[,2], fixed = TRUE) | grepl("1- 4", f_df[,2], fixed = TRUE) | grepl("1 - 4", f_df[,2], fixed = TRUE) | grepl("1-4", f_df[,2], fixed = TRUE)
              
              # Aputietojoukko, johon valitaan ainoastaan suojatut mittarit
              f_df2 <- f_df[f_df$V4 == TRUE,]
              
              # Tarkistetaan hyˆdynt‰v‰tkˆ "suojaamattomat mittarit" suojattuja mittareita
              while (nrow(f_df2) > 0){
                for (m in unique(paste0("[",f_df2$V1,"]"))){
                  f_df[grepl(m, f_df$V2, fixed = TRUE),5] <- 1
                }
                
                # Aputietojoukkoon tallennetaan suojatuiksi havaitut mittarit uutta kierrosta varten
                f_df2 <- f_df[f_df$V4 == FALSE & f_df$V5 == 1, c(1:3)]
                f_df2 <- f_df2[!is.na(f_df2[,1]),]
                f_df$V4[f_df$V5 == 1] <- TRUE
              }
              f_df[f_df$V4 == TRUE,5] <- 1
              f_df[f_df$V3 == TRUE & !is.na(f_df$V3),3] <- 1
              f_df[is.na(f_df$V5),5] <- 0
              f_df[is.na(f_df$V3),3] <- 0
              f_df <- f_df[,c(1,5,3)]
              names(f_df) <- c("Nimi", "Suojattu", "Piilotettu")
            }
            
            # Kuution perspektiivit
            perspectives <- tabularModel$model$perspectives$name
            ind = 0
            
# For-loop perspektiivien l‰pik‰ynti‰ varten -----------------------------------------------------------------
            for (k in perspectives){
              ind = ind + 1
              
              # For loop k‰y l‰pi perspektiiviss‰ n‰kyvien taulujen sarakemuuttujat ja mittarit
              for (k2 in 1:nrow(tabularModel$model$perspectives$tables[[ind]])){
                
                # Sarakemuuttujat
                columns <- tabularModel$model$perspectives$tables[[ind]]$columns[[k2]]
                
                # Mittarit
                measures <- tabularModel$model$perspectives$tables[[ind]]$measures[[k2]]
                
                # Tallennetaan sarakemuuttujien tiedot data-tietojoukkoon
                if(length(columns) >= 1){
                  columns[,2] <- word(bims,n,sep = "/")
                  columns[,3] <- k
                  columns[,4] <- "Sarakemuuttuja"
                  columns[,5] <- 0
                  names(columns) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
                  data <- union_all(columns,data)
                }
                # Tallennetaan mittareiden tiedot data-tietojoukkoon ja lis‰t‰‰n tieto suojauksesta
                if(length(measures) >= 1){
                  measures[,2] <- word(bims,n,sep = "/")
                  measures[,3] <- k
                  measures[,4] <- "Mittari"
                  names(measures) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi")
                  measures <- merge(measures, f_df[f_df$Piilotettu == 0,c(1,2)], by.x = "Nimi", by.y = "Nimi")
                  data <- union_all(measures,data)
                }
              }
            }
            
            # Lis‰t‰‰n Model-perspektiivin tiedot
            if(nrow(f_df) > 0){
              measures <- f_df[f_df$Piilotettu == 0, c(1,2)]
              measures[,3] <- word(bims,n,sep = "/")
              measures[,4] <- "Model"
              measures[,5] <- "Mittari"
              measures <- measures[,c(1,3,4,5,2)]
              names(measures) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
              data <- union_all(measures,data)
            }
            columns <- data.frame()
            for (t in tabularModel$model$tables$columns){
              if(is.data.frame(t) & "sourceColumn" %in% colnames(t)){
                if ("isHidden" %in% colnames(t) & length(t[is.na(t$isHidden), 1]) > 0){
                  c <- as.data.frame(t[is.na(t$isHidden), 1])
                  names(c) <- "Nimi"
                  columns <- union_all(c, columns)
                } else {
                  c <- as.data.frame(t[, 1])
                  names(c) <- "Nimi"
                  columns <- union_all(c, columns)
                }
              }
            }
            columns[,2] <- word(bims,n,sep = "/")
            columns[,3] <- "Model"
            columns[,4] <- "Sarakemuuttuja"
            columns[,5] <- 0
            names(columns) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
            if(nrow(columns) > 0){
              data <- union_all(columns,data)
            }
          }
  # XML muotoinen bim-tiedosto -----------------------------------------------------------------
          else if (length(fileName[nBim]) > 0) {
            
            # Testataan onko bim-tiedosto xml muotoinen
            error2 <- try(as_list(read_xml(paste0(bims, "/", fileName[nBim]))), silent = TRUE)
            
            # Jos tiedosto on xml muodossa, luetaan sen sis‰ltˆ
            if(class(error2) != "try-error"){
              
              # bim-tiedosto
              tabularModel <- as_list(read_xml(paste0(bims, "/", fileName[nBim])))
              
              # Tallennetaan l‰hteet tietojoukkoon
              
              MeasureGroups <- tabularModel$Alter$ObjectDefinition$Database$Cubes$Cube$MeasureGroups
              for (MG in 1:length(MeasureGroups)){
                if (length(partition$source.query[p2]) > 0){
                  source_data[nrow(source_data)+1,1] <- word(bims,n,sep = "/")
                  source <- MeasureGroups[MG]$MeasureGroup$Partitions$Partition$Source$QueryDefinition[[1]]
                  source <- trimws(str_split(source, "FROM")[[1]][2])
                  source <- str_split(source, " ")[[1]][1]
                  source_data[nrow(source_data),2] <- source
                  source <- MeasureGroups[MG]$MeasureGroup$Partitions$Partition$Source$QueryDefinition[[1]]
                  source <- trimws(str_split(source, "from")[[1]][2])
                  source <- str_split(source, " ")[[1]][1]
                  source_data[nrow(source_data),3] <- source
                }
              }
              
              # Alustetaan tietojoukko mittareiden kaavoille
              f_df <- data.frame()
              
              # Tallennetaan mittareiden nimet ja kaavat tietojoukkoon
              formulas <- tabularModel$Alter$ObjectDefinition$Database$Cubes$Cube$MdxScripts$MdxScript$Commands
              for (fo in 1:length(formulas)){
                if (length(grepl("CREATE MEASURE", formulas[fo]$Command$Text, fixed = TRUE)) > 0 & grepl("CREATE MEASURE", formulas[fo]$Command$Text, fixed = TRUE)) {
                  formula <- formulas[fo]$Command$Text
                  f_df[nrow(f_df)+1, 1] <- str_extract(formulas[fo]$Command$Text, "(?<=\\[).+?(?=\\])")
                  f_df[nrow(f_df), 2] <- sub(".*?]", "", formulas[fo]$Command$Text)
                }
              }
              for(m in tabularModel$Alter$ObjectDefinition$Database$Cubes$Cube$MdxScripts$MdxScript$CalculationProperties){
                if (length(m$Visible[[1]]) > 0){
                  f_df[f_df$V1 == str_extract(m$CalculationReference[[1]], "(?<=\\[).+?(?=\\])"), 3] <- 1
                } else {
                  f_df[f_df$V1 == str_extract(m$CalculationReference[[1]], "(?<=\\[).+?(?=\\])"), 3] <- 0
                }  
              }
              
              # Jos tiedostossa ei ole mittareita, siirryt‰‰n seuraavaan vaiheeseen
              if (ncol(f_df) > 0){
                
                # Lis‰t‰‰n tieto suojatuista mittareista
                f_df[,4] <- grepl("MROUND", toupper(f_df[,2]), fixed = TRUE) | grepl("1-4", f_df[,2], fixed = TRUE) | grepl("<5", f_df[,2], fixed = TRUE) | grepl("< 5", f_df[,2], fixed = TRUE) | grepl("1 -4", f_df[,2], fixed = TRUE) | grepl("1- 4", f_df[,2], fixed = TRUE) | grepl("1 - 4", f_df[,2], fixed = TRUE) | grepl("1-4", f_df[,2], fixed = TRUE)
                
                # Aputietojoukko, johon valitaan ainoastaan suojatut mittarit
                f_df2 <- f_df[f_df$V4 == TRUE,]
                
                # Tarkistetaan hyˆdynt‰v‰tkˆ "suojaamattomat mittarit" suojattuja mittareita
                while (nrow(f_df2) > 0){
                  for (m in unique(paste0("[",f_df2$V1,"]"))){
                    f_df[grepl(m, f_df$V2, fixed = TRUE),5] <- 1
                  }
                  
                  # Aputietojoukkoon tallennetaan suojatuiksi havaitut mittarit uutta kierrosta varten
                  f_df2 <- f_df[f_df$V4 == FALSE & f_df$V5 == 1, c(1:3)]
                  f_df2 <- f_df2[!is.na(f_df2[,1]),]
                  f_df$V4[f_df$V5 == 1] <- TRUE
                }
                f_df[f_df$V4 == TRUE,5] <- 1
                f_df[is.na(f_df$V5),5] <- 0
                f_df <- f_df[,c(1,5,3)]
                names(f_df) <- c("Nimi", "Suojattu", "Piilotettu")
              }
              
              # Kuution perspektiivit
              perspectives <- tabularModel$Alter$ObjectDefinition$Database$Cubes$Cube$Perspectives
              
# For-loop perspektiivien l‰pik‰ynti‰ varten -----------------------------------------------------------------
              for (k in 1:length(perspectives)){
                perspective <- perspectives[[k]]
                columns_2 <- data.frame()
                if (length(perspective) > 0) {
                  
                  # Tallennetaan sarakemuuttujien tiedot data-tietojoukkoon
                  for (l in 1:length(perspective$Dimensions)){
                    dimensions <- perspective$Dimensions[[l]]
                    attributes <- dimensions$Attributes
                    columns <- as.data.frame(attributes)
                    columns <- as.data.frame(t(columns))
                    columns[,2] <- word(bims,n,sep = "/")
                    columns[,3] <- perspective$Name
                    columns[,4] <- "Sarakemuuttuja"
                    columns[,5] <- 0
                    names(columns) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
                    columns[,1] <- as.character(columns[,1])
                    Encoding(columns[,1]) <- "UTF-8"
                    columns_2 <- union_all(columns, columns_2)
                  }
                  
                  # Tallennetaan mittareiden tiedot data-tietojoukkoon ja lis‰t‰‰n tieto suojauksesta
                  measures <- as.data.frame(perspective$Calculations)
                  if(nrow(measures) > 0){
                    measures <- as.data.frame(t(measures))
                    measures <- as.data.frame(measures[measures$V1 != "Member",])
                    measures[,1] <- gsub("\\[|\\]", "", measures[,1])
                    measures[,1] <- gsub("\\Measures.", "", measures[,1])
                    measures[,2] <- word(bims,n,sep = "/")
                    measures[,3] <- perspective$Name
                    measures[,4] <- "Mittari"
                    names(measures) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi")
                    measures <- merge(measures, f_df[,c(1,2)], by.x = "Nimi", by.y = "Nimi")
                    measures[,1] <- as.character(measures[,1])
                    Encoding(measures[,1]) <- "UTF-8"
                    data <- union_all(measures,data)
                  }
                  if(nrow(columns_2) > 0){
                    data <- union_all(columns_2,data)
                  }
                }
              }
              c_df <- data.frame()
              for (d in tabularModel$Alter$ObjectDefinition$Database$Cubes$Cube$Dimensions){
                for (a in d$Attributes) {
                  if (length(a$AttributeID) > 0){
                    c_df[nrow(c_df)+1, 1] <- a$AttributeID
                    c_df[nrow(c_df), 2] <- word(bims,n,sep = "/")
                    c_df[nrow(c_df), 3] <- "Model"
                    c_df[nrow(c_df), 4] <- "Sarakemuuttuja"
                    c_df[nrow(c_df), 5] <- 0
                    if(length(a$AttributeHierarchyVisible) > 0) {
                      c_df[nrow(c_df), 6] <- 1
                    } else {
                      c_df[nrow(c_df), 6] <- 0
                    }
                  }
                }
              }
              names(c_df) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu", "Piilotettu")
              if(nrow(c_df) > 0){
                data <- union_all(c_df[c_df$Piilotettu == 0, c(1:5)],data)
              }
              if(nrow(f_df) > 0){
                f_df[, 4] <- word(bims,n,sep = "/")
                f_df[, 5] <- "Model"
                f_df[, 6] <- "Mittari"
                f_df <- f_df[f_df$Piilotettu == 0, c(1,4,5,6,2)]
                names(f_df) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
                data <- union_all(f_df,data)
              }
      
            } else {
              next
            }
          }
        }
      }
    }
  }
}

# Datan siistiminen -----------------------------------------------------------------

source_data <- source_data[!grepl("arakeleveys", source_data$V2),]
source_data[is.na(source_data$V2),2] <- source_data[is.na(source_data$V2),3]
source_data[,2] <- gsub('"', '', source_data[,2])
source_data[,2] <- gsub(',', '', source_data[,2])
source_data[,2] <- gsub(')', '', source_data[,2])
source_data <- source_data[source_data$V2 != "",]
source_data <- unique(source_data[,1:2])
names(source_data) <- c("Tabular", "Source")

data <- data[data$Nimi != "Sarakeleveys",]
data <- data[data$Nimi != "leveys",]
data <- data[!grepl("calculated", data$Nimi),]

# Datan tallentaminen -----------------------------------------------------------------

write.csv(data, paste0("D:/pdi_integrations/data/vipunen/kuutiot/muuttujat_ja_mittarit.csv"), row.names = FALSE, fileEncoding = "UTF-8")
write.csv(source_data, paste0("D:/pdi_integrations/data/vipunen/kuutiot/kuutioiden_lahteet.csv"), row.names = FALSE, fileEncoding = "UTF-8")

Loppu <- Sys.time()
Kesto <- Loppu-Alku
print(paste("Ajaminen kesti ",Kesto))
