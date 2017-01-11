IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='f_arvo'
  and COLUMN_NAME='valtakunnallinen'
) BEGIN

ALTER TABLE dbo.f_arvo ADD valtakunnallinen bit NULL

END
