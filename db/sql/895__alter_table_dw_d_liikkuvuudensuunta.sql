USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_liikkuvuudensuunta' AND COLUMN_NAME='jarjestys_liikkuvuudensuunta_koodi')

BEGIN
	ALTER TABLE dw.d_liikkuvuudensuunta ADD jarjestys_liikkuvuudensuunta_koodi AS case when liikkuvuudensuunta_koodi = -1 then '99999' else cast(liikkuvuudensuunta_koodi as varchar(10))
	END
END
