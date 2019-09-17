USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_amk_toimipisteen_toimipaikka]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk_toimipisteen_toimipaikka
		WHERE koodi_amk = '-1'
		) = 0
BEGIN
	set identity_insert dw.d_amk_toimipisteen_toimipaikka on
	INSERT INTO dw.d_amk_toimipisteen_toimipaikka (
		id
		,[vuosi]
		,[koodi_amk]
		,[koodi_toimipiste]
		,[koodi_toimipaikka]
		,[toimipisteen_nimi]
		,[toimipaikan_nimi]
		,[ensisijainen_katuosoite]
		,[postinumero]
		,[kunta]
		,[tki_toiminta]
		,[palvelutoiminta]
		,[nuorten_koulutus]
		,[aikuiskoulutus]
		,[ylempaan_amk_tutkintoon_johtava_koulutus]
		,source

		)

	SELECT
	    N'-1',
		N'-1',
		N'-1',
		N'-1',
		N'-1',
		nimi,nimi,nimi,nimi,nimi,nimi,nimi,nimi,nimi, nimi,
		'etl: p_lataa_d_amk_toimipisteen_toimipaikka'

	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1'
	  ;
	  SET IDENTITY_INSERT dw.d_amk_toimipisteen_toimipaikka OFF;
	END
ELSE
	BEGIN
		UPDATE d
		SET
		    vuosi=s.koodi,
			koodi_toimipiste = s.koodi,
			koodi_toimipaikka = s.koodi,
			toimipisteen_nimi = s.nimi,
			toimipaikan_nimi = s.nimi,
			ensisijainen_katuosoite = s.nimi,
			postinumero = s.nimi,
			kunta = s.nimi,
			tki_toiminta = s.nimi,
			palvelutoiminta = s.nimi,
			nuorten_koulutus = s.nimi,
			aikuiskoulutus = s.nimi,
			ylempaan_amk_tutkintoon_johtava_koulutus = s.nimi,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'etl: p_lataa_d_amk_toimipisteen_toimipaikka'
		FROM dw.d_amk_toimipisteen_toimipaikka d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi_amk
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_amk_toimipisteen_toimipaikka AS target
USING (
		SELECT
		 vuosi
		,[Ammattikorkeakoulu]
		,[Toimipisteen koodi]
		,[Toimipisteen toimipaikan koodi]
		,max([Toimipisteen nimi]) [Toimipisteen nimi]
		,max([Toimipisteen toimipaikka]) [Toimipisteen toimipaikka]
		,max([Toimipaikan ensisijainen katuosoite]) [Toimipaikan ensisijainen katuosoite]
		,max([Toimipaikan postinumero])[Toimipaikan postinumero]
		,max([Toimipaikan kunta])[Toimipaikan kunta]
		,case
			when max([Toimipisteessa tapahtuva toiminta, TKI-toiminta]) = '1' then 'Kyllä'
			when max([Toimipisteessa tapahtuva toiminta, TKI-toiminta]) = 'Kyllä' then 'Kyllä'
			else 'Ei'
		 end as [Toimipisteessa tapahtuva toiminta, TKI-toiminta]
		,case
			when max([Toimipisteessa tapahtuva toiminta, palvelutoiminta]) = '1' then 'Kyllä'
			when max([Toimipisteessa tapahtuva toiminta, palvelutoiminta])  = 'Kyllä' then 'Kyllä'
			else 'Ei'
		 end as [Toimipisteessa tapahtuva toiminta, palvelutoiminta]
		,case
			when max([Toimipisteessa tapahtuva toiminta, nuorten koulutus]) = '1' then 'Kyllä'
				when max([Toimipisteessa tapahtuva toiminta, nuorten koulutus]) = 'Kyllä' then 'Kyllä'
			else 'Ei'
		 end as [Toimipisteessa tapahtuva toiminta, nuorten koulutus]
		,case
			when max([Toimipisteessa tapahtuva toiminta, aikuiskoulutus]) = '1' then 'Kyllä'
			when max([Toimipisteessa tapahtuva toiminta, aikuiskoulutus]) = 'Kyllä' then 'Kyllä'
			else 'Ei' end as [Toimipisteessa tapahtuva toiminta, aikuiskoulutus]
		,case
			when max([Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]) = '1' then 'Kyllä'
				when max([Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]) = 'Kyllä' then 'Kyllä'
			else 'Ei'
		 end as [Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]
		,'etl: p_lataa_d_amk_toimipisteen_toimipaikka' AS source

	FROM sa.sa_suorat_amk4_toimipisteet
	GROUP BY [Ammattikorkeakoulu], vuosi
	     ,[Toimipisteen koodi]
		,[Toimipisteen toimipaikan koodi]
	) AS src
	ON target.[koodi_amk] = src.[Ammattikorkeakoulu]
		AND target.[koodi_toimipiste] = src.[Toimipisteen koodi]
		AND target.[koodi_toimipaikka] = src.[Toimipisteen toimipaikan koodi]
		AND target.vuosi =src.vuosi
WHEN MATCHED
	THEN
		UPDATE
		SET [toimipisteen_nimi] = src.[Toimipisteen nimi]
			,[toimipaikan_nimi] = src.[Toimipisteen toimipaikka]
			,[ensisijainen_katuosoite] = src.[Toimipaikan ensisijainen katuosoite]
			,[postinumero] = src.[Toimipaikan postinumero]
			,[kunta] = src.[Toimipaikan kunta]
			,[tki_toiminta] = src.[Toimipisteessa tapahtuva toiminta, TKI-toiminta]
			,[palvelutoiminta] = src.[Toimipisteessa tapahtuva toiminta, palvelutoiminta]
			,[nuorten_koulutus] = src.[Toimipisteessa tapahtuva toiminta, nuorten koulutus]
			,[aikuiskoulutus] = src.[Toimipisteessa tapahtuva toiminta, aikuiskoulutus]
			,[ylempaan_amk_tutkintoon_johtava_koulutus] = src.[Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]
			,target.source = src.source
			,target.vuosi=src.vuosi
WHEN NOT MATCHED
	THEN
		INSERT (
			vuosi
			,[koodi_amk]
			,[koodi_toimipiste]
			,[koodi_toimipaikka]
			,[toimipisteen_nimi]
			,[toimipaikan_nimi]
			,[ensisijainen_katuosoite]
			,[postinumero]
			,[kunta]
			,[tki_toiminta]
			,[palvelutoiminta]
			,[nuorten_koulutus]
			,[aikuiskoulutus]
			,[ylempaan_amk_tutkintoon_johtava_koulutus]
			,source

			)
		VALUES (
			src.vuosi
			,src.[Ammattikorkeakoulu]
			,src.[Toimipisteen koodi]
			,src.[Toimipisteen toimipaikan koodi]
			,src.[Toimipisteen nimi]
			,src.[Toimipisteen toimipaikka]
			,src.[Toimipaikan ensisijainen katuosoite]
			,src.[Toimipaikan postinumero]
			,src.[Toimipaikan kunta]
			,src.[Toimipisteessa tapahtuva toiminta, TKI-toiminta]
			,src.[Toimipisteessa tapahtuva toiminta, palvelutoiminta]
			,src.[Toimipisteessa tapahtuva toiminta, nuorten koulutus]
			,src.[Toimipisteessa tapahtuva toiminta, aikuiskoulutus]
			,src.[Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]
			,'etl: p_lataa_d_amk_toimipisteen_toimipaikka'

			);
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_amk')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_amk AS case when koodi_amk = -1 then '99999' else cast(koodi_amk as varchar(10))
	END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_toimipaikka')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_toimipaikka AS case when koodi_toimipaikka = -1 then '99999' else cast(koodi_toimipaikka as varchar(10))
	END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_amk_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_toimipiste')

BEGIN
	ALTER TABLE dw.d_amk_toimipisteen_toimipaikka ADD jarjestys_koodi_toimipiste AS case when koodi_toimipiste = -1 then '99999' else cast(koodi_toimipiste as varchar(10))
	END
END
