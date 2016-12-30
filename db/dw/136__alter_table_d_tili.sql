IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_tili'
  and COLUMN_NAME='tili_taso5_fi'
) BEGIN

ALTER TABLE dbo.d_tili ADD tili_taso5_fi nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_tili'
  and COLUMN_NAME='tili_taso5_sv'
) BEGIN

ALTER TABLE dbo.d_tili ADD tili_taso5_sv nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dbo' and TABLE_NAME='d_tili'
  and COLUMN_NAME='tili_taso5_en'
) BEGIN

ALTER TABLE dbo.d_tili ADD tili_taso5_en nvarchar(100) NOT NULL

END