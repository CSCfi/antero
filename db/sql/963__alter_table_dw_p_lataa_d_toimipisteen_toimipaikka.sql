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
		,max([toimipisteen toimipaikka]) as selite_fi
		,max([toimipisteen toimipaikka]) as selite_sv
		,max([toimipisteen toimipaikka]) as selite_en
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
			
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_toimipaikka')

BEGIN
	ALTER TABLE dw.d_yo_toimipisteen_toimipaikka ADD jarjestys_koodi_toimipaikka AS case when koodi_toimipaikka = '-1' then 'ZZZZZ' else cast(koodi_toimipaikka as varchar(10))
	END
END

 NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_toimipiste')

BEGIN
	ALTER TABLE dw.d_yo_toimipisteen_toimipaikka ADD jarjestys_koodi_toimipiste AS case when koodi_toimipiste = '-1' then 'ZZZZZ' else cast(koodi_toimipiste as varchar(10))
	END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_toimipisteen_toimipaikka' AND COLUMN_NAME='jarjestys_koodi_yliopisto')

BEGIN
	ALTER TABLE dw.d_yo_toimipisteen_toimipaikka ADD jarjestys_koodi_yliopisto AS case when koodi_yliopisto = '-1' then 'ZZZZZ' else cast(koodi_yliopisto as varchar(10))
	END
END
