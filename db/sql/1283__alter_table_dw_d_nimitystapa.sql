USE [ANTERO]

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_nimitystapa' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_nimitystapa ADD jarjestys_koodi AS case when koodi = '-1' then '999' else cast(koodi as varchar(5))
	END
END
