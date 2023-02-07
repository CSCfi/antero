library(jsonlite)
jsonasdataframe <- fromJSON("D:/Vipunen/ReportCreator2016/pankalai/Käännöstyökalu/Model.bim",simplifyVector = FALSE)


jsonasdataframe$model$tables[[6]]$name
jsonasdataframe$model$tables[[6]]$columns
jsonasdataframe$model$tables[[6]]$columns[[1]]$name
jsonasdataframe$model$tables[[6]]$columns[[1]]$isHidden


for(i in 1:length(jsonasdataframe$model$tables)) {
    if (jsonasdataframe$model$tables[[i]]$name != "Sarakeleveys") {
        for (j in 1:length(jsonasdataframe$model$tables[[i]]$columns)) {
            if (!identical(jsonasdataframe$model$tables[[i]]$columns[[j]]$isHidden,TRUE)) {
                print(paste(jsonasdataframe$model$tables[[i]]$name,"sarake:",jsonasdataframe$model$tables[[i]]$columns[[j]]$name))
                #print("asdas")
            }
        }
    }
}