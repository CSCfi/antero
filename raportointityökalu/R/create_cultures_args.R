# List To Cultures Json File Tool 1.0
# Created by Anni Pyysing
# Modified by Juha Helminen and Anssi Pänkäläinen

# input: Excel master with translations
# output: Json cultures file with translations

#install.packages("readr")
#install.packages("readxl")
#install.packages("magrittr")
#install.packages("dplyr")

library(readr)
library(jsonlite)
library(readxl)
library(magrittr)
library(dplyr)
library(utf8)


# Structure of the function below:
# 1) read excel master from file in data frame format
# 2) build a nested list, corresponding to json-cultures format
# 3) fill the nested list by translations from the excel master
# 4) convert the nested list into json and return it

makejson <- function(masterlocation,model_name,targetlocation){
      
    masterlocation <- paste(masterlocation,model_name,sep = "")  
    samplemaster <- read_excel(masterlocation,col_names = TRUE) #%>% filter(keep==1)
    
    samplemasterOrig <- samplemaster
    
    # find all languages and types in the master
    languages <- unique(samplemaster$culture[!is.na(samplemaster$culture)])
    lans <- length(languages)
    
    # make node stucture, begin from top node
    testjson <- list(cultures = "placeholder")
    testjson$cultures <- data.frame(name = languages, translations = rep("placeholder", lans), stringsAsFactors = FALSE)
    
    testjson$cultures$translations <- data.frame(model = c(rep("placeholder", lans)), stringsAsFactors = FALSE)
    
    testjson$cultures$translations$model <- data.frame(name = rep("Model", lans),
                                                       translatedCaption = character(lans),
                                                       translatedDescription = character(lans),
                                                       tables = character(lans),
                                                       stringsAsFactors = FALSE)
    
    # tableelement <- data.frame(name = "Sarakeleveys",
    tableelement <- data.frame(name = "Muuttujat",
                              translatedCaption = "Var",
                              translatedDescription = "",
                              columns = "placeholder",
                              measures = "placeholder",
                              stringsAsFactors = FALSE
                    )
    
    tableNameList<-c("Muuttujat","Variabler","Variables")
    
    tablelist <- list(tableelement)
    
    # make stucture for table
    i <- 1
    while(i <= lans) {
      tableelement$translatedCaption<-tableNameList[i]
      tablelist[[i]] <- tableelement
      i <- i + 1
    }
    
    testjson$cultures$translations$model$tables <- tablelist
    
    # make placeholder structure for actual translations
    i <- 1
    while(i <= lans) {
      
      testjson$cultures$translations$model$tables[[i]]$columns <- list(data.frame(test = "placeholder"))
      
      testjson$cultures$translations$model$tables[[i]]$columns <- list(data.frame(name = "All_original_names_here",
                                                                                  translatedCaption = ".",
                                                                                  translatedDescription = "Description_here",
                                                                                  translatedDisplayFolder = "ø",
                                                                                  stringsAsFactors = FALSE))
      
      testjson$cultures$translations$model$tables[[i]]$measures <- list(data.frame(name = "All_original_measures_here",
                                                                                   translatedCaption = "All_measure_translations",
                                                                                   translatedDisplayFolder = "Measures_folders_here",
                                                                                   stringsAsFactors = FALSE))
      i <- i + 1
    }
    
    # create trashbin for redundant fields within respective cultures
    samplemaster$trashCaption <- "."
    samplemaster$trashFolder <-"ø"
    samplemaster$codeLang <- ""
    # /jhe
    
    # use the above structure to add the translations
    # filter samplemaster to fill one language in one loop
    i = 1
    while(i <= lans) {
    
      #jhe: dispose trashes into bin    
      samplemaster$translatedCaption <- ifelse(samplemasterOrig$culture == languages[i],samplemasterOrig$translatedCaption,samplemaster$trashCaption)
      samplemaster$translatedDisplayFolder <- ifelse(samplemasterOrig$culture == languages[i],samplemasterOrig$translatedDisplayFolder,samplemaster$trashFolder)
      samplemaster$isCurrentLang <- ifelse(samplemasterOrig$culture == languages[i],1,0)
      samplemaster$isCode <- ifelse(samplemaster$type %in% c("code","codes"),1,0)
      samplemaster$codeLang <- samplemaster$isCurrentLang + samplemaster$isCode
      
      # add columns
      fillmaster <- samplemaster %>% filter(type == "column" | codeLang == 2) %>% select(c(name,translatedCaption,translatedDisplayFolder))
      testjson$cultures$translations$model$tables[[i]]$columns[[1]] <- fillmaster
      
      # add measures
      fillmaster <- samplemaster %>% filter(type == "measure" & culture == languages[i]) %>% select(c(name,translatedCaption,translatedDisplayFolder))
      testjson$cultures$translations$model$tables[[i]]$measures[[1]] <- fillmaster
      
      
      i <- i + 1
    }
    
    # convert nested list into json
    testjsonasjson <- toJSON(testjson)
    
    # save as json
    filetime <- format(Sys.time(), "%d-%m-%Y")
    filename <- paste(targetlocation, gsub(".xlsx","",model_name), "_", filetime, ".json", sep = "")
    
    writeLines(testjsonasjson, filename, useBytes=T)
    
    #return(samplemaster)
}
    

sourcepath = "D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/CulturesExcel/"
targetpath = "D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/CulturesJSON/"

args <- commandArgs(trailingOnly = TRUE)   
if (length(args) > 0) {
  sourcepath <- args[1]
  targetpath <- args[2]
}

file.names <- dir(sourcepath, pattern = ".xlsx", full.names = FALSE)
file.names <- file.names[!grepl("vipunen_cultures_pohja.xlsx",file.names)]

# loop files in folder
for(i in 1:length(file.names)){
    makejson(sourcepath,file.names[i],targetpath)
}
    
    
