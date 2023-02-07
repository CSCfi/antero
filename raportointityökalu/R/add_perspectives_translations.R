library(jsonlite)

jsonasdataframe <- fromJSON("D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/Model.bim",simplifyVector = FALSE)

#jsonasdataframe$model$perspectives
#jsonasdataframe$model$perspectives[2]
#unlist(jsonasdataframe$model$perspectives,recursive = FALSE)["name"]
#jsonasdataframe$model$perspectives[[1]]["name"]
#jsonasdataframe$model$perspectives[[1]]$tables[[1]]$columns[[1]]$name

## 1) Etsi suomenkieliset perspektiivit
## 2) Katso löytyykö sv/en vastine
## 3) Jos ei löydy, kopioi fi perspektiivi
## 4) Korvaa sarakkeiden päätteet
## 5) Lisää perspektiivi


translate_perspective <- function(perspective,target_lang) {

    new_persp <- perspective
    
    new_persp[[1]]$name <- sub("FI$",target_lang,new_persp[[1]]$name)

    for(l in 1:length(new_persp[[1]]$tables[[1]]$columns)) {
        new_persp[[1]]$tables[[1]]$columns[[l]]$name <- gsub("FI$",lapply(target_lang, tolower), new_persp[[1]]$tables[[1]]$columns[[l]]$name,ignore.case = TRUE)
    }

    return(new_persp)

}

lang <- c("SV","EN")

for (i in 1:length(jsonasdataframe$model$perspectives)) {
    
    if (grepl("FI$",jsonasdataframe$model$perspectives[[i]]["name"])>0) {
      
    persp <- sub("FI$","",jsonasdataframe$model$perspectives[[i]]["name"])
    flag <- c(0,0)
    
        for(j in 1:length(lang)) {
          
            for (k in 1:length(jsonasdataframe$model$perspectives)) {
                
                if (length(grep(pattern = paste(persp,lang[j],"$",sep = ""),jsonasdataframe$model$perspectives[[k]]["name"], ignore.case = TRUE, value = TRUE)) > 0) {
                    flag[j] <- 1
                } 
            }
        }
    if (flag[1]==0) {
        n_persp <- translate_perspective(jsonasdataframe$model$perspectives[i],lang[1])
        p <- length(jsonasdataframe$model$perspectives)
        jsonasdataframe$model$perspectives[p+1] <- n_persp  
    } 
    if (flag[2]==0) {
        n_persp <- translate_perspective(jsonasdataframe$model$perspectives[i],lang[2])
        p <- length(jsonasdataframe$model$perspectives)
        jsonasdataframe$model$perspectives[p+1] <- n_persp 
    }
    }
}

# back to json
jsonasjson <- toJSON(jsonasdataframe,auto_unbox = TRUE)

# save
targetlocation = "D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/bim/"
filename <- paste(targetlocation, "Model.bim", sep = "")
writeLines(jsonasjson, filename, useBytes=T)

