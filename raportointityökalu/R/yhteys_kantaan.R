install.packages("RODBC", destdir="C:/Users/pankalai.000/Documents/R/win-library/4.0/")
library(RODBC, lib.loc="C:/Users/pankalai.000/Documents/R/win-library/4.0/")

#yhteys tietokantaan
#conn <- odbcConnect(dsn = "dwitvipusql16")
conn <- odbcDriverConnect("Driver={SQL Server};Server=dwitvipusql16;Database=ANTERO;Trusted_Connection=Yes")

#kysely
# sqlQuery(conn,paste("
#         SELECT *
#         FROM [ANTERO].[dw].[d_amk]
# "))


#sarakkeet
#sqlColumns(conn, schema="dw",sqtable = "d_amk")$COLUMN_NAME
sqlColumns(conn, schema="dw",sqtable = "v_amos_tutkinnot_ja_tutkinnonosat")$COLUMN_NAME
