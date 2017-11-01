USE [ANTERO]
GO
IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_liikkuvuudentyyppi' AND COLUMN_NAME='jarjestys_liikkuvuudentyyppi_koodi')

BEGIN
  ALTER TABLE dw.d_liikkuvuudentyyppi ADD jarjestys_liikkuvuudentyyppi_koodi AS case when liikkuvuudentyyppi_koodi = -1 then '99999' else cast(liikkuvuudentyyppi_koodi as varchar(10))
  END
END
