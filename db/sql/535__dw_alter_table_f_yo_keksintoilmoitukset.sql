IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_keksintoilmoitukset'
  and COLUMN_NAME='julkaisutyyppi'
)
BEGIN
ALTER TABLE dw.f_yo_keksintoilmoitukset drop column julkaisutyyppi;
END
