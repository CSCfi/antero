USE [ANTERO]
GO

IF NOT EXISTS (
  SELECT * FROM INFORMATION_SCHEMA.COLUMNS
  	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_ohjauksenala' AND COLUMN_NAME='jarjestys_ohjauksenala_koodi')

BEGIN
  ALTER TABLE dw.d_ohjauksenala ADD jarjestys_ohjauksenala_koodi AS case when ohjauksenala_koodi = -1 then '99999' else cast(ohjauksenala_koodi as varchar(10))
  END
END
