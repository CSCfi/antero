USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_opintoala95' AND COLUMN_NAME='jarjestys_opintoala95_koodi')

BEGIN
	ALTER TABLE dw.d_opintoala95 ADD jarjestys_opintoala95_koodi AS case when opintoala95_koodi = -1 then '99999' else cast(opintoala95_koodi as varchar(10))
  END
END
