USE [ANTERO]
IF EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatiot_ohjauksen_alat' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatiot_ohjauksen_alat drop column  jarjestys_alayksikko_koodi
END
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatiot_ohjauksen_alat' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatiot_ohjauksen_alat ADD jarjestys_alayksikko_koodi AS (case when [alayksikko_koodi]=('-1') then 'ZzZzZ' else CONVERT([varchar](100),[alayksikko_koodi]) end)
END
