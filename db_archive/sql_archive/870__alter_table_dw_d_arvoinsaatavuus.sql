USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_avoinsaatavuus' AND COLUMN_NAME='jarjestys_avoinsaatavuus_koodi')

BEGIN
	ALTER TABLE dw.d_avoinsaatavuus ADD jarjestys_avoinsaatavuus_koodi AS case when avoinsaatavuus_koodi = -1 then '99999' else cast(avoinsaatavuus_koodi as varchar(10))
	END
END
