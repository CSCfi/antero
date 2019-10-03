USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_tiedekunta' AND COLUMN_NAME='jarjestys_tiedekuntakoodi')

BEGIN
	ALTER TABLE dw.d_yo_tiedekunta ADD jarjestys_tiedekuntakoodi AS case when tiedekuntakoodi = '-1' then 'ZZZZZ' else cast(tiedekuntakoodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_tiedekunta' AND COLUMN_NAME='jarjestys_yliopistokoodi')

BEGIN
	ALTER TABLE dw.d_yo_tiedekunta ADD jarjestys_yliopistokoodi AS case when yliopistokoodi = '-1' then 'ZZZZZ' else cast(yliopistokoodi as varchar(10))
  END
END
