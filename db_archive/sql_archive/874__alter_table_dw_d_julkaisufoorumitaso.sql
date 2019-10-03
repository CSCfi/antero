USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_julkaisufoorumitaso' AND COLUMN_NAME='jarjestys_julkaisufoorumitaso_koodi')

BEGIN
	ALTER TABLE dw.d_julkaisufoorumitaso ADD jarjestys_julkaisufoorumitaso_koodi AS case when julkaisufoorumitaso_koodi = -1 then '99999' else cast(julkaisufoorumitaso_koodi as varchar(10))
  END
END
