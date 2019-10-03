IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='tabularprocessing'
  and COLUMN_NAME='tabular'
) BEGIN

ALTER TABLE dbo.tabularprocessing ADD tabular varchar(max) NULL

END
