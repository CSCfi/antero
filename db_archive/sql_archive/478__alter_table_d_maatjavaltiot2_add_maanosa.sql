IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.COLUMNS
  where TABLE_SCHEMA='dw' and TABLE_NAME='d_maatjavaltiot2'
  and COLUMN_NAME='maanosa_koodi'
)
BEGIN

ALTER TABLE dw.d_maatjavaltiot2 ADD
  maanosa_koodi nvarchar(3) NULL,
  maanosa_fi nvarchar(200) NULL,
  maanosa_sv nvarchar(200) NULL,
  maanosa_en nvarchar(200) NULL,
  maanosa2_koodi nvarchar(3) NULL,
  maanosa2_fi nvarchar(200) NULL,
  maanosa2_sv nvarchar(200) NULL,
  maanosa2_en nvarchar(200) NULL,
  maanosa3_koodi nvarchar(3) NULL,
  maanosa3_fi nvarchar(200) NULL,
  maanosa3_sv nvarchar(200) NULL,
  maanosa3_en nvarchar(200) NULL

END
/* revert
ALTER TABLE dw.d_maatjavaltiot2 DROP COLUMN
  maanosa_koodi,
  maanosa_fi,
  maanosa_sv,
  maanosa_en,
  maanosa2_koodi,
  maanosa2_fi,
  maanosa2_sv,
  maanosa2_en,
  maanosa3_koodi,
  maanosa3_fi,
  maanosa3_sv,
  maanosa3_en
--*/
