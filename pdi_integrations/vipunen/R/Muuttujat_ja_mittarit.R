# Alustus -----------------------------------------------------------------

Alku <- Sys.time()

if(require("dplyr") == FALSE) {
  install.packages("dplyr", repos = "http://cran.us.r-project.org")
  library("dplyr")
}
if(require("jsonlite") == FALSE) {
  install.packages("jsonlite", repos = "http://cran.us.r-project.org")
  library("jsonlite")
}
if(require("stringr") == FALSE) {
  install.packages("stringr", repos = "http://cran.us.r-project.org")
  library("stringr")
}

# Kansiot joissa on tabular projekteja
folders <- c("tabular","tabular jäädytys")

#Alustetaan tietojoukko
data <- as.data.frame(matrix(ncol = 5))
names(data) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
source_data <- data.frame()


# For-loop kansioiden lapikayntia varten -----------------------------------------------------------------
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
  
  # For-loop alikansioiden lapikayntia varten -----------------------------------------------------------------
  for (i in folders[,1]){
    
    # Kansion tiedostot
    list2 <- as.data.frame(list.dirs(i))
    names(list2)[1] <- "path"
    
    # Valitaan ainoastaan alikansiossa olevat kansiot
    folders2 <- unique(as.data.frame(paste0(i, "/",word(list2$path,5,sep = "/"))))
    folders2 <- as.data.frame(folders2[2:max(c((nrow(folders2)),2)),])
    folders2[,1] <- as.character(folders2[,1])
    Encoding(folders2[,1]) <- "UTF-8"
    
    # Siirrytaan seuraavaan kansioon, jos kansio on tyhja
    if(length((folders2[!is.na(folders2[,1]),])) > 0){
      
      # For-loop alikansioiden alikansioiden lapikayntia varten -----------------------------------------------------------------
      for (j in folders2[,1]){
        
        # Valitaan kansiossa olevat bim-tiedostot
        files <- as.data.frame(list.files(j))
        files[,1] <- as.character(files[,1])
        fileName <- files[endsWith(files[,1], ".bim"),1]
        bimPath <- j
        
        # Jos kansiossa ei ole bim-tiedostoja tarkastetaan viela kansion alikansiot
        if (length(fileName) < 1){
          folders3 <- as.data.frame(list.dirs(j))
          bim_ind <- 0
          for (f2 in unique(folders3[,1])){
            files2 <- as.data.frame(list.files(as.character(f2)))
            if (length(files2[endsWith(as.character(files2[, 1]), ".bim"),1]) > 0){
              bim_ind <- bim_ind + 1
              fileName[bim_ind] <- as.character(files2[endsWith(as.character(files2[, 1]), ".bim"),1])
              bimPath[bim_ind] <- as.character(f2)
            }
          }
        }
        
        nBim <- 0
        
        # For-loop bim-tiedostojen lapikayntia varten -----------------------------------------------------------------
        for (bims in bimPath){
          
          nBim <- nBim + 1
          n <- str_count(bims, "/") + 1
          
          # JSON muotoinen bim-tiedosto -----------------------------------------------------------------          
          # Testastaan onko bim-tiedosto JSON-muodossa
          error <- try(fromJSON(paste0(bims, "/", fileName[nBim]), flatten = TRUE), silent = TRUE)
          
          # Jos tiedosto on JSON muodossa, luetaan sen sisalto
          if (class(error) != "try-error" & length(fileName[nBim]) > 0){
            
            # bim-tiedosto
            tabularModel <- fromJSON(paste0(bims, "/", fileName[nBim]), flatten = TRUE)
            
            # Tallennetaan lahteet tietojoukkoon 
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
            
            # Jos tiedostossa ei ole mittareita, siirrytaan seuraavaan vaiheeseen
            if (ncol(f_df) > 0){
              
              # Lisataan tieto suojatuista mittareista
              f_df[,4] <- grepl("MROUND", toupper(f_df[,2]), fixed = TRUE) | grepl("1-4", f_df[,2], fixed = TRUE) | grepl("1 -4", f_df[,2], fixed = TRUE) | grepl("1- 4", f_df[,2], fixed = TRUE) | grepl("1 - 4", f_df[,2], fixed = TRUE) | grepl("1-4", f_df[,2], fixed = TRUE)
              
              # Aputietojoukko, johon valitaan ainoastaan suojatut mittarit
              f_df2 <- f_df[f_df$V4 == TRUE,]
              
              # Tarkistetaan hyodyntavatko "suojaamattomat mittarit" suojattuja mittareita
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
            
            # For-loop perspektiivien lapikayntia varten -----------------------------------------------------------------
            for (k in perspectives){
              ind = ind + 1
              
              # For loop kay lapi perspektiivissa nakyvien taulujen sarakemuuttujat ja mittarit
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
                # Tallennetaan mittareiden tiedot data-tietojoukkoon ja lisataan tieto suojauksesta
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
            
            # Lisataan Model-perspektiivin tiedot
            if(nrow(f_df) > 0){
              measures <- f_df[f_df$Piilotettu == 0, c(1,2)]
              measures[,3] <- word(bims,n,sep = "/")
              measures[,4] <- "Model"
              measures[,5] <- "Mittari"
              measures <- measures[,c(1,3,4,5,2)]
              names(measures) <- c("Nimi", "Kuutio", "Perspektiivi", "Tyyppi", "Suojattu")
              data <- union_all(measures,data)
            }
            columns <- as.data.frame(matrix(ncol = 1))
            names(columns) <- "Nimi"
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
data <- data[!is.na(data$Nimi),]

# Datan tallentaminen -----------------------------------------------------------------

write.csv(data, paste0("D:/pdi_integrations/data/vipunen/kuutiot/muuttujat_ja_mittarit.csv"), row.names = FALSE, fileEncoding = "UTF-8")
write.csv(source_data, paste0("D:/pdi_integrations/data/vipunen/kuutiot/kuutioiden_lahteet.csv"), row.names = FALSE, fileEncoding = "UTF-8")

Loppu <- Sys.time()
Kesto <- Loppu-Alku
print(paste("Ajaminen kesti ",Kesto))
