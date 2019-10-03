USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_toiminto' AND COLUMN_NAME='jarjestys_toiminto_koodi')

BEGIN
	ALTER TABLE dw.d_toiminto ADD jarjestys_toiminto_koodi AS case when toiminto_koodi = '-1' then 'ZZZZZ' else cast(toiminto_koodi as varchar(10))
	END
END
