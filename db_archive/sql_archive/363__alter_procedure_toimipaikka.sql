ALTER PROCEDURE [dw].[p_lataa_d_yo_toimipisteen_toimipaikka]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_toimipisteen_toimipaikka
		WHERE koodi_yliopisto = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_toimipisteen_toimipaikka
	set identity_insert dw.d_yo_toimipisteen_toimipaikka on
	INSERT dw.d_yo_toimipisteen_toimipaikka (
		id
		,koodi_yliopisto
		,koodi_toimipiste
		,koodi_toimipaikka
		,selite_fi
		,selite_sv
		,selite_en
		,ensisijainen_katuosoite
		,postinumero
		,kunta
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'Okänd'
		,N'Unknown'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'Tuntematon'
		,N'etl: p_lataa_d_yo_toimipiste'
		)
	set identity_insert dw.d_yo_toimipisteen_toimipaikka off
END


MERGE dw.d_yo_toimipisteen_toimipaikka AS target
USING (
	SELECT Yliopisto
		,max([Toimipisteen koodi]) as [Toimipisteen koodi]
		,[Toimipisteen toimipaikan koodi]
		,max([Toimipisteen nimi]) as selite_fi
		,max([Toimipisteen nimi]) as selite_sv
		,max([Toimipisteen nimi]) as selite_en
		,max([Toimipaikan ensisijainen katuosoite]) as [Toimipaikan ensisijainen katuosoite]
		,max([Toimipaikan postinumero]) as [Toimipaikan postinumero]
		,max([Toimipaikan kunta]) as [Toimipaikan kunta]
		,'etl: p_lataa_d_yo_toimipiste' AS source
	FROM sa.sa_suorat_yo4_toimipisteet
	WHERE [Toimipisteen toimipaikan koodi] IS NOT NULL
	GROUP BY Yliopisto
		,[Toimipisteen toimipaikan koodi]
	) AS src
	ON target.koodi_yliopisto = src.Yliopisto
	AND target.koodi_toimipaikka = src.[Toimipisteen toimipaikan koodi]
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,ensisijainen_katuosoite = COALESCE(src.[Toimipaikan ensisijainen katuosoite], 'NA')
			,postinumero = COALESCE(src.[Toimipaikan postinumero], 'NA')
			,kunta = COALESCE(src.[Toimipaikan kunta], 'NA')
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			koodi_yliopisto
			,koodi_toimipiste
			,koodi_toimipaikka
			,selite_fi
			,selite_sv
			,selite_en
			,ensisijainen_katuosoite
			,postinumero
			,kunta
			,source
			)
		VALUES (
			src.Yliopisto
			,src.[Toimipisteen koodi]
			,src.[Toimipisteen toimipaikan koodi]
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,COALESCE(src.[Toimipaikan ensisijainen katuosoite],'NA')
			,COALESCE(src.[Toimipaikan postinumero],'NA')
			,COALESCE(src.[Toimipaikan kunta],'NA')
			,src.source
			);