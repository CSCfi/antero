IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_julkaisufoorumitaso_vanha_id'
) BEGIN
ALTER TABLE dw.f_virta_jtp_tilasto ADD d_julkaisufoorumitaso_vanha_id int NULL
END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_virta_jtp_tilasto'
  and COLUMN_NAME='d_julkaisufoorumitaso_uusi_id'
) BEGIN
ALTER TABLE dw.f_virta_jtp_tilasto ADD d_julkaisufoorumitaso_uusi_id int NULL
END
