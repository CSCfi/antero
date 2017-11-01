USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_kytkin' AND COLUMN_NAME='jarjestys_kytkin_koodi')

BEGIN
	ALTER TABLE dw.d_kytkin ADD jarjestys_kytkin_koodi AS case when kytkin_koodi = -1 then '99999' else cast(kytkin_koodi as varchar(10))
  END
END
