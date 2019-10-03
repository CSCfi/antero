
IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_ohjauksenala_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_ohjauksenala_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_koulutusala95_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_koulutusala95_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_koulutusala02_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_koulutusala02_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_yhteisjulkaisuSHPKytkin_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_yhteisjulkaisuSHPKytkin_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_yhteisjulkaisuTutkimuslaitosKytkin_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_yhteisjulkaisuTutkimuslaitosKytkin_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_yhteisjulkaisuMuuKytkin_id'
) BEGIN
  ALTER TABLE dw.f_virta_jtp_tilasto ADD d_yhteisjulkaisuMuuKytkin_id int NULL
END