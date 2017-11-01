USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_virtajtpsektori' AND COLUMN_NAME='jarjestys_virtajtpsektori_koodi')

BEGIN
	ALTER TABLE dw.d_virtajtpsektori ADD jarjestys_virtajtpsektori_koodi AS case when virtajtpsektori_koodi = -1 then '99999' else cast(virtajtpsektori_koodi as varchar(10))
	END
END
