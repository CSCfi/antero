USE [ANTERO]

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_amk')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_amk AS case when koodi_amk = -1 then '99999' else cast(koodi_amk as varchar(10))
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_toimipaikka')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_toimipaikka AS case when koodi_toimipaikka = -1 then '99999' else cast(koodi_toimipaikka as varchar(10))
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_toimipiste')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_toimipiste AS case when koodi_toimipiste = -1 then '99999' else cast(koodi_toimipiste as varchar(10))
END
