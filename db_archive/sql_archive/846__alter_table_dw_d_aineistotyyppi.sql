USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_aineistotyyppi' AND COLUMN_NAME='jarjestys_aineistotyyppi_koodi')

BEGIN
	ALTER TABLE dw.d_aineistotyyppi ADD jarjestys_aineistotyyppi_koodi AS
  case when aineistotyyppi_koodi = -1 then '99999' else cast(aineistotyyppi_koodi as varchar(10)) 
  END
END
GO
