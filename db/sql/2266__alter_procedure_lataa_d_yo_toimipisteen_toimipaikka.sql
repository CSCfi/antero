USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_yo_toimipisteen_toimipaikka]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_toimipisteen_toimipaikka
		WHERE koodi_yliopisto = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_toimipisteen_toimipaikka
	SET IDENTITY_INSERT dw.d_yo_toimipisteen_toimipaikka ON
	INSERT INTO dw.d_yo_toimipisteen_toimipaikka (
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
	SELECT
			-1,
			koodi,
			koodi,
			koodi,
			nimi,
			nimi_sv,
			nimi_en,
			nimi,
			nimi,
			nimi,
			'ETL: p_lataa_d_yo_toimipisteen_toimipaikka'
		FROM sa.sa_koodistot
		WHERE koodisto='vipunenmeta'
		  AND koodi='-1';
		SET IDENTITY_INSERT dw.d_yo_toimipisteen_toimipaikka OFF;
END
ELSE
	BEGIN
		UPDATE d
		SET
			koodi_yliopisto = s.koodi,
			koodi_toimipiste = s.koodi,
			koodi_toimipaikka= s.koodi,
			selite_fi= s.nimi,
			selite_sv= s.nimi_sv,
			selite_en= s.nimi_en,
			ensisijainen_katuosoite = nimi,
			postinumero = s.nimi,
			kunta = s.nimi,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'etl: p_lataa_d_yo_toimipisteen_toimipaikka'
		FROM dw.d_yo_toimipisteen_toimipaikka d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi_yliopisto AND s.koodi=d.koodi_toimipiste
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
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
		,'etl: p_lataa_d_yo_toimipisteen_toimipaikka' AS source
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

IF NOT EXISTS (
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
