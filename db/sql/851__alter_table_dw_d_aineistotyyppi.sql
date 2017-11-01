USE [ANTERO]
GO
IF EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_aineistotyyppi' AND COLUMN_NAME='jarjestys_aineistotyyppi_koodi')

	BEGIN
		ALTER TABLE dw.d_aineistotyyppi DROP COLUMN jarjestys_aineistotyyppi_koodi
	END
GO
