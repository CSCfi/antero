USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_liikkuvuusohjelma' AND COLUMN_NAME='jarjestys_liikkuvuusohjelma_koodi')

BEGIN
	ALTER TABLE dw.d_liikkuvuusohjelma ADD jarjestys_liikkuvuusohjelma_koodi AS case when liikkuvuusohjelma_koodi = -1 then '99999' else cast(liikkuvuusohjelma_koodi as varchar(10))
  END
END
