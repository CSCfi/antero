IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto'
) BEGIN

ALTER TABLE dbo.d_toiminto DROP COLUMN toiminto

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_koodi'
) BEGIN

ALTER TABLE dbo.d_toiminto ADD toiminto_koodi nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_nimi_fi'
) BEGIN

ALTER TABLE dbo.d_toiminto ADD toiminto_nimi_fi nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_nimi_sv'
) BEGIN

ALTER TABLE dbo.d_toiminto ADD toiminto_nimi_sv nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_nimi_en'
) BEGIN

ALTER TABLE dbo.d_toiminto ADD toiminto_nimi_en nvarchar(100) NOT NULL

END