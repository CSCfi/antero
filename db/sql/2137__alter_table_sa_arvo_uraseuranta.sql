USE ANTERO
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_uraseuranta'
  and COLUMN_NAME ='taustatiedot.kunta'
) BEGIN

ALTER TABLE sa.sa_arvo_uraseuranta ADD "taustatiedot.kunta" nvarchar(500) null
END
