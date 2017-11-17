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

END

IF NOT EXISTS (
  	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_maatjavaltiot2' AND COLUMN_NAME='jarjestys_maanosa0_koodi')

  BEGIN
  	ALTER TABLE dw.d_maatjavaltiot2 ADD jarjestys_maanosa0_koodi AS case when maanosa0_koodi = '-1' then 'ZZZZZ' else cast(maanosa0_koodi as varchar(10))
    END
  END
