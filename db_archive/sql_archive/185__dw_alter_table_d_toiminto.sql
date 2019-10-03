IF EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto'
) BEGIN

ALTER TABLE dw.d_toiminto DROP COLUMN toiminto

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_koodi'
) BEGIN

ALTER TABLE dw.d_toiminto ADD toiminto_koodi nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_nimi_fi'
) BEGIN

ALTER TABLE dw.d_toiminto ADD toiminto_nimi_fi nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_nimi_sv'
) BEGIN

ALTER TABLE dw.d_toiminto ADD toiminto_nimi_sv nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_toiminto'
  and COLUMN_NAME='toiminto_nimi_en'
) BEGIN

ALTER TABLE dw.d_toiminto ADD toiminto_nimi_en nvarchar(100) NOT NULL

END