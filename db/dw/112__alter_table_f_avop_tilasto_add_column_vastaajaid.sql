IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_avop_tilasto'
  and COLUMN_NAME='vastaajaid'
) BEGIN

ALTER TABLE dbo.f_avop_tilasto ADD vastausid int null

END
