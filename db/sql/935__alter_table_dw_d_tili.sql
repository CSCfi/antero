USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_tili' AND COLUMN_NAME='jarjestys_tili_koodi')

BEGIN
	ALTER TABLE dw.d_tili ADD jarjestys_tili_koodi AS case when tili_koodi = '-1' then 'ZZZZZ' else cast(tili_koodi as varchar(10))
	END
END
