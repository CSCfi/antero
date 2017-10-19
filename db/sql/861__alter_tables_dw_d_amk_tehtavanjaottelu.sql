USE [ANTERO]
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_tehtavanjaottelu' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_amk_tehtavanjaottelu ADD jarjestys_koodi AS case when koodi_amk = -1 then '99999' else cast(koodi as varchar(10))
	END
END
