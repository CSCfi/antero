USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatio' AND COLUMN_NAME='jarjestys_oppilaitostyyppi_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatio ADD jarjestys_oppilaitostyyppi_koodi AS case when oppilaitostyyppi_koodi = '-1' then '99999' else cast(oppilaitostyyppi_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatio' AND COLUMN_NAME='jarjestys_organisaatio_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatio ADD jarjestys_organisaatio_koodi AS case when organisaatio_koodi = '-1 'then '99999' else cast(organisaatio_koodi as varchar(10))
  END
END
