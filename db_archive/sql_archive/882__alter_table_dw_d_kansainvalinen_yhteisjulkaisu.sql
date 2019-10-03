USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_kansainvalinen_yhteisjulkaisu' AND COLUMN_NAME='jarjestys_kansainvalinen_yhteisjulkaisu_koodi')

BEGIN
	ALTER TABLE dw.d_kansainvalinen_yhteisjulkaisu ADD jarjestys_kansainvalinen_yhteisjulkaisu_koodi AS case when kansainvalinen_yhteisjulkaisu_koodi = -1 then '99999' else cast(kansainvalinen_yhteisjulkaisu_koodi as varchar(10))
  END
END
