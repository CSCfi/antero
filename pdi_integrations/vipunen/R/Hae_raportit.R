
# Funktio ----------------------------------------------------------------------

hae_raportit <- function(kieli) {
  
  # Tarkistaa haetaanko raportit oikealla kielella. Funktio hyvaksyy suomen (fi), ruotsin (sv) ja englannin (en)
  if ((kieli %in% c('en','sv','fi')) == TRUE) {
    
    # Funktio maarittaa muuttujille arvot valitun kielen mukaan
    if (kieli == "fi") {
      kieli_viittaus <- "fi-fi"
      sivu = "Sivut"
      nimi = "Raportit"
      nimiV <- "app.powerbi.com"
    }
    if (kieli == "sv") {
      kieli_viittaus <- "sv-fi"
      sivu = "Sidor"
      nimi = "Rapporter"
      nimiV <- "app.powerbi.com"
    }
    if (kieli == "en") {
      kieli_viittaus <- "en-gb"
      sivu = "Pages"
      nimi = "Reports"
      nimiV <- "app.powerbi.com"
    }
    
    # Etusivun lahdekoodi
    vipunenrL <- readLines(paste0('https://vipunen.fi/', kieli_viittaus), encoding = "UTF-8")
    
    # Haetaan etusivulta paaosiot
    osiot <- data.frame(strsplit(vipunenrL[which(str_detect(vipunenrL, 'zz2_RootAspMenu'))+1], paste0('/', kieli_viittaus)))
    osiot <- data.frame(sub(">.*", "", osiot[3:nrow(osiot),1]), stringsAsFactors = FALSE)
    osiot <- data.frame(substr(osiot[,1], 1,nchar(osiot[,1])-1), stringsAsFactors = FALSE)
    Encoding(osiot[[1]]) <- "UTF-8"
    
    # Luodaan tyhja dataframet
    raportit <- as.data.frame(matrix(ncol = 3))
    names(raportit) <- c("Raportti","Osio", "Alaosio")
    visualisoinnit <- as.data.frame(matrix(ncol = 3))
    names(visualisoinnit) <- c("Url", "Osio", "Alaosio")
    
    # For-looppi kay lapi kaikki paaosiot
    for (i in 1:nrow(osiot)) {
      osoite <- readLines(textConnection(paste0('https://vipunen.fi/', kieli_viittaus, osiot[i,1])))
      Encoding(osoite) <- "UTF-8"
      
      # Haetaan paaosioiden alasivut paaosion lahdekoodista
      osiorL <- readLines(osoite)
      alaosiot <- data.frame(strsplit(osiorL[which(str_detect(osiorL, 'zz4_RootAspMenu'))+1], paste0('/', kieli_viittaus)))
      alaosiot <- data.frame(sub(">.*", "", alaosiot[2:nrow(alaosiot),1]), stringsAsFactors = FALSE)
      alaosiot <- data.frame(substr(alaosiot[,1], 1,nchar(alaosiot[,1])-1), stringsAsFactors = FALSE)
      
      # Piilotetut sivut, jotka eivät nay lahdekoodissa
      if (kieli == "fi" & i == 3){
        alaosiot[nrow(alaosiot)+1,1] <- "/perus/Sivut/Ainevalinnat-2000-2019.aspx"
        alaosiot[nrow(alaosiot)+1,1] <- "/perus/Sivut/Perusopetuksen-lisäopetuksen-päättäneiden-sijoittuminen-2009-2018.aspx"
      }
      else if (kieli == "fi" & i == 4){
        alaosiot[nrow(alaosiot)+1,1] <- "/lukio/Sivut/Ainevalinnat-2010-2017.aspx"
      }
      else if (kieli == "fi" & i == 6){
        alaosiot[nrow(alaosiot)+1,1] <- "/amk/Sivut/taloustiedot-2014-2018.aspx"
      }
      else if (kieli == "fi" & i == 7) {
        alaosiot[nrow(alaosiot)+1,1] <- "/yliopisto/Sivut/Taloustiedot-2012-2018.aspx"
      }
      else if (kieli == "sv" & i == 3) {
        alaosiot[nrow(alaosiot)+1,1] <- "/grundlaggande/Sidor/Ainevalinnat-2000-2019.aspx"
      }
      
      Encoding(alaosiot[,1]) <- "UTF-8"
      
      # For-looppi kay lapi kaikki alasivut
      for (j in 1:nrow(alaosiot)){
        
        # Alasivun lahdekoodi
        osoite <- readLines(textConnection(gsub(" ", "%20", paste0('https://vipunen.fi/', kieli_viittaus, alaosiot[j,1]))))
        Encoding(osoite) <- "UTF-8"
        alaosiorL <- readLines(osoite)
        
        # Valitaan lahdekoodista ne rivit joissa on viittaus raporttiin
        raportit_rivit <- alaosiorL[which(str_detect(alaosiorL, nimi))]
        
        # For-looppi kay lapi kaikki valitut rivit
        for (k in 1:length(raportit_rivit)){
          
          # Lisataan raportit-dataframeen, alasivun lahdekoodissa nakyvat raportit
          rivi <- data.frame(strsplit(raportit_rivit[k], paste0('/',kieli_viittaus,'/')))
          if (nrow(rivi) > 0){
            rivi[,2] <- osiot[i,1]
            rivi[,3] <- alaosiot[j,1]
            rivi[,4] <- rm_between(rivi[,1], '>', '</span>', extract=TRUE)[[1]][1]
            names(rivi)[1] <- "Raportti"
            names(rivi)[2] <- "Osio"
            names(rivi)[3] <- "Alaosio"
            raportit <- union_all(rivi[,1:3], raportit)
            raportit <- raportit[!is.na(raportit$Raportti),]
          }
        }
        
        # Valitaan lahdekoodista ne rivit joissa on viittaus visualisointiin
        visualisoinnit_rivit <- alaosiorL[which(str_detect(alaosiorL, nimiV))]
        
        # For-looppi kay lapi kaikki valitut rivit
        for (k in 1:length(visualisoinnit_rivit)){
          
          # Lisataan visualisoinnit-dataframeen, alasivun lahdekoodissa nakyvat visualisoinnit
          rivi <- data.frame(strsplit(visualisoinnit_rivit[k], nimiV))
          if (nrow(rivi) > 0){
            rivi[,2] <- osiot[i,1]
            rivi[,3] <- alaosiot[j,1]
            names(rivi)[1] <- "Url"
            names(rivi)[2] <- "Osio"
            names(rivi)[3] <- "Alaosio"
            visualisoinnit <- union_all(rivi[,1:3], visualisoinnit)
            visualisoinnit <- visualisoinnit[!is.na(visualisoinnit$Url),]
          }
        }
      }
    }
    
    # Poistetaan duplikaattiraportit ja -visualisoinnit
    raportit <- unique(raportit)
    
    # Selvitetaan ja siistitaan raporttien ja visualisointien nakokulmat
    for (n in 1:nrow(raportit)){
      raportit[n,4] <- rm_between(raportit[n,1], '>', '</a>', extract=TRUE)[[1]][1]
    }
    raportit[,4] <- sub('.*">', '', raportit[,4])
    raportit[,4] <- sub('<.*', '', raportit[,4])
    names(raportit)[4] <- "Näkökulma"
    Encoding(raportit[,4]) <- "UTF-8"
    
    raportit[,4] <- str_replace_all(raportit[,4], "&#160;", " ")
    raportit[,4] <- str_replace_all(raportit[,4], "&quot;", "")
    
    visualisoinnit <- visualisoinnit[substr(visualisoinnit$Url,2, 5) == "view", ]
    for (n in 1:nrow(visualisoinnit)){
      visualisoinnit[n,4] <- rm_between(visualisoinnit[n,1], '>', '</a>', extract=TRUE)[[1]][1]
    }
    visualisoinnit[,4] <- sub('.*">', '', visualisoinnit[,4])
    visualisoinnit[,5] <- sub('.*>', '', visualisoinnit[,4])
    visualisoinnit[visualisoinnit[,5] == "",5] <- visualisoinnit[visualisoinnit[,5] == "",4]
    visualisoinnit <- visualisoinnit[,c(1:3,5)]
    visualisoinnit[,4] <- sub('<.*', '', visualisoinnit[,4])
    names(visualisoinnit)[4] <- "Nimi portaalissa"
    Encoding(visualisoinnit[,4]) <- "UTF-8"
    visualisoinnit[,4] <- str_replace_all(visualisoinnit[,4], "&#160;", " ")
    
    # Poistetaan turhat rivit ja muotoillaan yhdenmukaisiksi
    raportit <- raportit[substr(raportit[,1],1,nchar(nimi)) == nimi,]
    raportit$Raportti <- gsub("web", "Web", raportit$Raportti)
    visualisoinnit[,1] <- paste0(nimiV,visualisoinnit$Url)
    visualisoinnit[,1] <- sub('".*', '', visualisoinnit[,1])
    visualisoinnit[,1] <- sub('&.*', '', visualisoinnit[,1])
    
    # Jaetaan raportit kahteen osaan: ("?Web=1" ja "")
    raportit1 <- raportit[grep("Web", raportit$Raportti) ,]
    raportit2 <- raportit[!grepl("Web", raportit$Raportti),]
    raportit1[,1] <- sub("Web.*", "", raportit1[,1])
    
    Vipunen_raportit <- raportit1
    
    # Jatetaan toiseen dataframeen vain excel-tiedostot
    
    raportit2 <- raportit2[grepl("xls", raportit2$Raportti),]
    raportit2 <- raportit2[grepl(nimi , raportit2$Raportti),]
    raportit2 <- raportit2[!grepl("admintest", raportit2$Raportti),]
    
    # Muotoillaan raporttien nimet
    if(nrow(raportit2) > 0){
      raportit2$Raportti <- sub("xlsb.*", "", raportit2$Raportti[1:nrow(raportit2)])
      raportit2[substr(raportit2$Raportti, nchar(raportit2$Raportti), nchar(raportit2$Raportti)) == "." , 1] <- paste0(raportit2[substr(raportit2$Raportti, nchar(raportit2$Raportti), nchar(raportit2$Raportti)) == "." , 1], "xlsb")
      raportit2$Raportti <- sub("xlsx.*", "", raportit2$Raportti[1:nrow(raportit2)])
      raportit2[substr(raportit2$Raportti, nchar(raportit2$Raportti), nchar(raportit2$Raportti)) == "." , 1] <- paste0(raportit2[substr(raportit2$Raportti, nchar(raportit2$Raportti), nchar(raportit2$Raportti)) == "." , 1], "xlsx")
      for (i in 1:nrow(raportit2)){
        raportit2$Raportti[i] <- strsplit(raportit2$Raportti, '/')[[i]][2]
      }
    }
    
    # Muotoillaan raporttien nimet ja liitetaan dataframeen raportit2-dataframe
    Vipunen_raportit$Raportti <- sub("Web.*", "", Vipunen_raportit$Raportti[1:nrow(Vipunen_raportit)])
    Vipunen_raportit$Raportti <- substr(Vipunen_raportit$Raportti, nchar(nimi) + 2 ,nchar(Vipunen_raportit$Raportti)-1)
    Vipunen_raportit$Raportti[substr(Vipunen_raportit$Raportti,1,1) == "/"] <- str_sub(Vipunen_raportit$Raportti[substr(Vipunen_raportit$Raportti,1,1) == "/"], 2, -2)
    Vipunen_raportit <- Vipunen_raportit[!grepl(".pdf", Vipunen_raportit$Raportti),]
    if (nrow(raportit2) > 0){
      Vipunen_raportit <- union_all(Vipunen_raportit, raportit2)
    }
    
    # Muotoillaan raporttien ja osioiden nimia
    Vipunen_raportit$Raportti <- gsub("%20", " ", Vipunen_raportit$Raportti)
    Vipunen_raportit$Raportti <- gsub("%C3%A4", "ä", Vipunen_raportit$Raportti)
    Vipunen_raportit$Raportti <- gsub("%C3%B6", "ö", Vipunen_raportit$Raportti)
    Vipunen_raportit$Raportti <- gsub("%C3%B6", "ö", Vipunen_raportit$Raportti)
    Vipunen_raportit$Raportti <- gsub("%28", "(", Vipunen_raportit$Raportti)
    Vipunen_raportit$Raportti <- gsub("%29", ")", Vipunen_raportit$Raportti)
    Vipunen_raportit$Osio <- substr(Vipunen_raportit$Osio, 2,nchar(Vipunen_raportit$Osio))
    Vipunen_raportit$Alaosio <- gsub(".aspx", "", Vipunen_raportit$Alaosio)
    Vipunen_raportit$Alaosio <- substr(Vipunen_raportit$Alaosio, str_locate(Vipunen_raportit$Alaosio, sivu)+6, nchar(Vipunen_raportit$Alaosio))
    visualisoinnit$Osio <- substr(visualisoinnit$Osio, 2,nchar(visualisoinnit$Osio))
    visualisoinnit$Alaosio <- gsub(".aspx", "", visualisoinnit$Alaosio)
    visualisoinnit$Alaosio <- substr(visualisoinnit$Alaosio, str_locate(visualisoinnit$Alaosio, sivu)+6, nchar(visualisoinnit$Alaosio))
    
    
    # Poistetaan duplikaattiraportit
    Nakokulmat <- Vipunen_raportit[!is.na(Vipunen_raportit[,4]) & Vipunen_raportit[,4] != "",]
    Vipunen_raportit <- unique(Vipunen_raportit[,1:3])
    Nakokulmat[,5] <- paste0(Nakokulmat$Raportti,Nakokulmat$Osio, Nakokulmat$Alaosio)
    Nakokulmat <- Nakokulmat[, 4:5]
    Vipunen_raportit[,4] <- paste0(Vipunen_raportit$Raportti,Vipunen_raportit$Osio, Vipunen_raportit$Alaosio)
    names(Vipunen_raportit)[4] <- "Avain"
    names(Nakokulmat)[2] <- "Avain"
    Vipunen_raportit <- merge(Vipunen_raportit, Nakokulmat, by.x = "Avain" , by.y = "Avain", all.x = TRUE)
    Vipunen_raportit <- Vipunen_raportit[,c(2:5)]
    Encoding(Vipunen_raportit$Osio) <- "unknown"
    Encoding(Vipunen_raportit$Alaosio) <- "unknown"
    visualisoinnit <- unique(visualisoinnit)
    Encoding(visualisoinnit$Osio) <- "unknown"
    Encoding(visualisoinnit$Alaosio) <- "unknown"
    
    # Tallennetaan tiedot exceliin
    write.csv2(Vipunen_raportit[,c(1:4)], paste0("D:/pdi_integrations/data/vipunen/raportit/Raportit_", kieli, ".csv"), row.names = FALSE)
    write.csv2(visualisoinnit[,c(1:4)], paste0("D:/pdi_integrations/data/vipunen/raportit/Visualisoinnit_", kieli, ".csv"), row.names = FALSE)
    return(Vipunen_raportit)
  }
  else {
    return(0)
  }
}

# Ajo ----------------------------------------------------------------------

Alku <- Sys.time()

if(require("stringr") == FALSE) {
  install.packages("stringr", repos = "http://cran.us.r-project.org")
  library("stringr")
}
if(require("dplyr") == FALSE) {
 install.packages("dplyr", repos = "http://cran.us.r-project.org")
 library("dplyr")
}

if(require("BBmisc") == FALSE) {
  install.packages("BBmisc", repos = "http://cran.us.r-project.org")
  library("BBmisc")
}
if(require("qdapRegex") == FALSE) {
  install.packages("qdapRegex", repos = "http://cran.us.r-project.org")
  library("qdapRegex")
}



raportit_fi <- hae_raportit("fi")

raportit_sv <- hae_raportit("sv")

raportit_en <-hae_raportit("en")

Loppu <- Sys.time()
Kesto <- Loppu-Alku
print(paste("Ajaminen kesti ",Kesto))

