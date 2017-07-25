IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='yhteisjulkaisuId'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD yhteisjulkaisuId varchar(50) NULL
END
