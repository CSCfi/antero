USE [ANTERO]
GO
IF EXISTS (
		SELECT * FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_SCHEMA='dbo' AND TABLE_NAME='test_d_aineistotyyppi' AND COLUMN_NAME='jarjestys_aineistotyyppi_koodi')

	BEGIN
		ALTER TABLE dbo.test_d_aineistotyyppi DROP COLUMN jarjestys_aineistotyyppi_koodi
	END
GO
