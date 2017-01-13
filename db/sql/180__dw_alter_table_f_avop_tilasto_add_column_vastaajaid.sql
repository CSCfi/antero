IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='vastaajaid'
) BEGIN

ALTER TABLE dw.f_avop_tilasto ADD vastausid int null

END
