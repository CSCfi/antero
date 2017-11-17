IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_maatjavaltiot2'
  and COLUMN_NAME='maanosa0_koodi'
)
BEGIN

ALTER TABLE dw.d_maatjavaltiot2 ADD
  maanosa0_koodi nvarchar(3) NULL,
  maanosa0_fi nvarchar(200) NULL,
  maanosa0_sv nvarchar(200) NULL,
  maanosa0_en nvarchar(200) NULL
END
