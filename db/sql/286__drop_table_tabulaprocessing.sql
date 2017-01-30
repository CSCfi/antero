IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='tabularprocessing'
) BEGIN

drop table dbo.tabularprocessing

END
