ALTER PROCEDURE [dw].[p_lataa_d_amk_toimipisteen_toimipaikka]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk_toimipisteen_toimipaikka
		WHERE koodi_amk = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk_toimipisteen_toimipaikka
	set identity_insert dw.d_amk_toimipisteen_toimipaikka on
	INSERT dw.d_amk_toimipisteen_toimipaikka (
		id
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
		N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'etl: p_lataa_d_amk_toimipisteen_toimipaikka'
		)
	set identity_insert dw.d_amk_toimipisteen_toimipaikka off
END

MERGE dw.d_amk_toimipisteen_toimipaikka AS target
USING (
		SELECT [Ammattikorkeakoulu]
		,max([Toimipisteen koodi]) [Toimipisteen koodi]
		,[Toimipisteen toimipaikan koodi]
		,max([Toimipisteen nimi]) [Toimipisteen nimi]
		,max([Toimipisteen toimipaikka]) [Toimipisteen toimipaikka]
		,max([Toimipaikan ensisijainen katuosoite]) [Toimipaikan ensisijainen katuosoite]
		,max([Toimipaikan postinumero])[Toimipaikan postinumero]
		,max([Toimipaikan kunta])[Toimipaikan kunta]
		,case when max([Toimipisteessa tapahtuva toiminta, TKI-toiminta]) = 1 then 'Kyllä' else 'Ei' end as [Toimipisteessa tapahtuva toiminta, TKI-toiminta]
		,case when max([Toimipisteessa tapahtuva toiminta, palvelutoiminta]) = 1 then 'Kyllä' else 'Ei' end as [Toimipisteessa tapahtuva toiminta, palvelutoiminta]
		,case when max([Toimipisteessa tapahtuva toiminta, nuorten koulutus]) = 1 then 'Kyllä' else 'Ei' end as [Toimipisteessa tapahtuva toiminta, nuorten koulutus]
		,case when max([Toimipisteessa tapahtuva toiminta, aikuiskoulutus]) = 1 then 'Kyllä' else 'Ei' end as [Toimipisteessa tapahtuva toiminta, aikuiskoulutus]
		,case when max([Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]) = 1 then 'Kyllä' else 'Ei' end as [Toimipisteessa tapahtuva toiminta, ylempaan amk-tutkintoon johtava koulutus]
		,'etl: p_lataa_d_amk_toimipisteen_toimipaikka' AS source
	FROM sa.sa_suorat_amk4_toimipisteet
	GROUP BY [Ammattikorkeakoulu]
		,[Toimipisteen toimipaikan koodi]
	) AS src
	ON target.[koodi_amk] = src.[Ammattikorkeakoulu]
		AND target.[koodi_toimipaikka] = src.[Toimipisteen toimipaikan koodi]
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
WHEN NOT MATCHED
	THEN
		INSERT (
			[koodi_amk]
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
			src.[Ammattikorkeakoulu]
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