  IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_keksintoilmoitukset'
  and COLUMN_NAME='d_julkaisutyyppi_id'
)
BEGIN
ALTER TABLE dw.f_yo_keksintoilmoitukset drop column d_julkaisutyyppi_id;
END
