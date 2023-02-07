library(jsonlite)
library(readxl)
library(dplyr)
library(stringr)

jsonasdataframe <- fromJSON("D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/Model.bim",simplifyVector = FALSE)

#jsonasdataframe$model$tables[[1]]["columns"]

cultures_excel <- read_excel("D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/CulturesExcel/tabular_cultures_translate_testi.xlsx", col_names = TRUE)
#cultures_excel

check_sort_existence <- function(field) {
  r <- cultures_excel %>% filter(type == "sort" & name == paste("jarjestys_",field, sep = "")) 
  return(nrow(r))
}


for(i in 1:length(jsonasdataframe$model$tables[[1]]$columns)) {
    #jsonasdataframe$model$tables[[1]]$columns[[i]]$sortByColumn = NULL
    if (is.null(jsonasdataframe$model$tables[[1]]$columns[[i]]$sortByColumn)) {
      
        field_name <- jsonasdataframe$model$tables[[1]]$columns[[i]]$name
        field_name <- str_replace(field_name,"_fi|_sv|_en","")

        if (check_sort_existence(field_name)==1) {jsonasdataframe$model$tables[[1]]$columns[[i]]$sortByColumn = paste("jarjestys_",field_name, sep = "")}

    }

}
  
# back to json
jsonasjson <- toJSON(jsonasdataframe,auto_unbox = TRUE)

# save
targetlocation = "D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/bim/"
filename <- paste(targetlocation, "Model.bim", sep = "")
writeLines(jsonasjson, filename, useBytes=T)




