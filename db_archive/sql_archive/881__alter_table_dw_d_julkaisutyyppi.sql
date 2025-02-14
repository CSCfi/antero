USE [ANTERO]
GO
IF EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_julkaisutyyppi' AND COLUMN_NAME='jarjestys_julkaisunpaaluokka_koodi')

BEGIN
	ALTER TABLE dw.d_julkaisutyyppi DROP COLUMN  jarjestys_julkaisunpaaluokka_koodi
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_julkaisutyyppi' AND COLUMN_NAME='jarjestys_julkaisunpaaluokka_koodi')

BEGIN
	ALTER TABLE dw.d_julkaisutyyppi ADD jarjestys_julkaisunpaaluokka_koodi AS case when julkaisunpaaluokka_koodi = '-1' then 'ZZZZZ' else cast(julkaisunpaaluokka_koodi as varchar(10))
  END
END
