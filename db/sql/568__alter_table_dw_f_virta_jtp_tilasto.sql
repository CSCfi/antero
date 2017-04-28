
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_yhteisjulkaisuYritysKytkin_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_yhteisjulkaisuYritysKytkin_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_rinnakkaistallennusKytkin_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_rinnakkaistallennusKytkin_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_avoinSaatavuus_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_avoinSaatavuus_id int NULL
END

