TRUNCATE TABLE dw.d_tili

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_tili'
  and COLUMN_NAME='tili_taso5_fi'
) BEGIN

ALTER TABLE dw.d_tili ADD tili_taso5_fi nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_tili'
  and COLUMN_NAME='tili_taso5_sv'
) BEGIN

ALTER TABLE dw.d_tili ADD tili_taso5_sv nvarchar(100) NOT NULL

END

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_tili'
  and COLUMN_NAME='tili_taso5_en'
) BEGIN

ALTER TABLE dw.d_tili ADD tili_taso5_en nvarchar(100) NOT NULL

END