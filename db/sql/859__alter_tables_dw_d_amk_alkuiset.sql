USE [ANTERO]


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_kelpoisuus' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_amk_kelpoisuus ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10)) END
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_koulutustyyppi' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_amk_koulutustyyppi ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10)) END
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_liikkuvuusohjelma' AND COLUMN_NAME='jarjestys_koodi')


BEGIN
	ALTER TABLE dw.d_amk_liikkuvuusohjelma ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10)) END
END
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_muun_henkilokunnan_henkilostoryhma' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_amk_muun_henkilokunnan_henkilostoryhma ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10)) END
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_paatoimiset_opettajat' AND COLUMN_NAME='jarjestys_koodi')

BEGIN
	ALTER TABLE dw.d_amk_paatoimiset_opettajat ADD jarjestys_koodi AS case when koodi = -1 then '99999' else cast(koodi as varchar(10)) END
END


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_amk')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_amk AS case when koodi_amk = -1 then '99999' else cast(koodi_amk as varchar(10))
END
