USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_koulutusala_2002' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_koulutusala_2002 ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10))
	END
END
