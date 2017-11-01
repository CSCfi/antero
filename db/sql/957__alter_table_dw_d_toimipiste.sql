USE [ANTERO]
GO
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_toimipiste' AND COLUMN_NAME='jarjestys_koodi_toimipiste')

BEGIN
	ALTER TABLE dw.d_yo_toimipiste ADD jarjestys_koodi_toimipiste AS case when koodi_toimipiste = '-1' then 'ZZZZZ' else cast(koodi_toimipiste as varchar(10))
	END
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_toimipiste' AND COLUMN_NAME='jarjestys_koodi_yliopisto')

BEGIN
	ALTER TABLE dw.d_yo_toimipiste ADD jarjestys_koodi_yliopisto AS case when koodi_yliopisto = '-1' then 'ZZZZZ' else cast(koodi_yliopisto as varchar(10))
	END
END
