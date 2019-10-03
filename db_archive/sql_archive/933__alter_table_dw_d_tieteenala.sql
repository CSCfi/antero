USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_tieteenala' AND COLUMN_NAME='jarjestys_paatieteenala_koodi')

BEGIN
	ALTER TABLE dw.d_tieteenala ADD jarjestys_paatieteenala_koodi AS case when paatieteenala_koodi = -1 then '99999' else cast(paatieteenala_koodi as varchar(10)) END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_tieteenala' AND COLUMN_NAME='jarjestys_tieteenala_koodi')

BEGIN
	ALTER TABLE dw.d_tieteenala ADD jarjestys_tieteenala_koodi AS case when tieteenala_koodi = -1 then '99999' else cast(tieteenala_koodi as varchar(10))
	END
END
