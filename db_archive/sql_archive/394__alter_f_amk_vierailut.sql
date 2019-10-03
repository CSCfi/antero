IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_amk_opettaja_ja_henkilostoliikkuvuus'
  and COLUMN_NAME='vierailun_kesto'
) BEGIN
ALTER TABLE dw.f_amk_opettaja_ja_henkilostoliikkuvuus DROP COLUMN vierailun_kesto
END