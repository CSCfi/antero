USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo' AND COLUMN_NAME='jarjestys_yo_koodi')

BEGIN
	ALTER TABLE dw.d_yo ADD jarjestys_yo_koodi AS case when yo_tunnus = '-1' then 'ZZZZZ' else cast(yo_tunnus as varchar(10))
	END
END
