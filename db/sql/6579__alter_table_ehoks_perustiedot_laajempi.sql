USE ANTERO
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_ehoks_perustiedot_laajempi'
  AND COLUMN_NAME='poistettu' AND DATA_TYPE='datetime'
)

BEGIN
  ALTER TABLE sa.sa_ehoks_perustiedot_laajempi ADD [poistettu] [datetime] NULL
END
