IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='f_yo_toimipisteet'
  and COLUMN_NAME='toimiala'
) BEGIN
ALTER TABLE dw.f_yo_toimipisteet DROP COLUMN
	toimiala
END
