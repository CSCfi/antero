USE ANTERO
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_arvo_uraseuranta'
  and COLUMN_NAME ='taustatiedot.kieli'
) BEGIN

ALTER TABLE sa.sa_arvo_uraseuranta ADD "taustatiedot.kieli" nvarchar(500) null
END
