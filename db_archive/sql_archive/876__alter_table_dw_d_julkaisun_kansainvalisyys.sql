USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_julkaisun_kansainvalisyys' AND COLUMN_NAME='jarjestys_julkaisun_kansainvalisyys_koodi')

BEGIN
	ALTER TABLE dw.d_julkaisun_kansainvalisyys ADD jarjestys_julkaisun_kansainvalisyys_koodi AS case when julkaisun_kansainvalisyys_koodi = -1 then '99999' else cast(julkaisun_kansainvalisyys_koodi as varchar(10))
  END
END
