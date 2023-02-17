
if(require("httr") == FALSE){
  install.packages("httr")
  library("httr")
}
if(require("jsonlite") == FALSE){
  install.packages("jsonlite")
  library("jsonlite")
}

CallerId <- "1.2.246.562.10.2013112012294919827487.Vipunen"

tietojoukot <- 
  fromJSON(
    content(
      GET(
        "https://api.vipunen.fi/api/resources", 
        add_headers("Caller-id" = CallerId)), 
      "text"), flatten = "FALSE")

data <- data.frame()

i <- 1

for (t in tietojoukot){
  data[i,1] <- t
  data[i,2] <- as.data.frame(
    fromJSON(
      content(
        GET(
          paste0("https://api.vipunen.fi/api/resources/", t, "/data?limit=1"), 
          add_headers("Caller-id" = CallerId)), 
        "text"), 
      flatten = "TRUE"))["tietojoukkoPaivitettyPvm"]
  data[i,3] <- as.integer(fromJSON(
    content(
      GET(
        paste0("https://api.vipunen.fi/api/resources/", t, "/data/count"), 
        add_headers("Caller-id" = CallerId)), 
      "text"), flatten = "FALSE"))
  i <- i + 1
}

names(data)[1] <- "tietojoukko"
names(data)[3] <- "rivit"

write.csv(data, "D:/pdi_integrations/data/vipunen/api/api_data.csv", row.names = FALSE)

