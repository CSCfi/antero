USE ARVO_SA

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_kohteet'
  AND COLUMN_NAME='taustatiedot.rahoitusryhma' AND DATA_TYPE='varchar'
)

BEGIN
  ALTER TABLE sa.sa_arvo_kohteet ADD [taustatiedot.rahoitusryhma] VARCHAR(100) NULL
END

USE ANTERO
