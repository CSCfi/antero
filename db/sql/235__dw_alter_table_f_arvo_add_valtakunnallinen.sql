IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_arvo'
  and COLUMN_NAME='valtakunnallinen'
) BEGIN

ALTER TABLE dw.f_arvo ADD valtakunnallinen bit NULL

END
