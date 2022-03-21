USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dw].[p_lataa_d_yo_toimipiste]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_toimipiste
		WHERE id = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_toimipiste
	set identity_insert dw.d_yo_toimipiste on
	INSERT INTO dw.d_yo_toimipiste (
		id
		,koodi_yliopisto
		,koodi_toimipiste
		,selite_fi
		,selite_sv
		,selite_en
		,d_toiminta_tutkintoon_johtava_koulutus_id
		,d_toiminta_tutkimustoiminta_id
		,d_toiminta_muu_id
		,source
		,vuosi
		)

		SELECT
			-1,
			koodi,
			koodi,
			nimi,
			nimi_sv,
			nimi_en,
			koodi,
			koodi,
			koodi,
			'etl: p_lataa_d_yo_toimipiste',
			koodi
		FROM sa.sa_koodistot
		WHERE koodisto='vipunenmeta'
		  AND koodi='-1';

		SET IDENTITY_INSERT dw.d_yo_toimipiste OFF;
END
ELSE
	BEGIN
		UPDATE d
		SET
			koodi_yliopisto = s.koodi,
			koodi_toimipiste = s.koodi,
			selite_fi=s.nimi,
			selite_sv=s.nimi_sv,
			selite_en=s.nimi_en,
			d_toiminta_tutkintoon_johtava_koulutus_id=s.koodi,
			d_toiminta_tutkimustoiminta_id=s.koodi,
			d_toiminta_muu_id=s.koodi,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'etl: p_lataa_d_yo_toimipiste'
		FROM dw.d_yo_toimipiste d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi_yliopisto
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_yo_toimipiste AS target
USING (
	SELECT DISTINCT Yliopisto AS Yliopisto
		,[Toimipisteen koodi] AS [Toimipisteen koodi]
		,[Toimipisteen nimi] AS selite_fi
		,[Toimipisteen nimi] AS selite_sv
		,[Toimipisteen nimi] AS selite_en
		,[Toimipisteeseen liittyvä toiminta, tutkintoon johtava koulutus]
		,[Toimipisteeseen liittyvä toiminta, tutkimustoiminta]
		,[Toimipisteeseen liittyvä toiminta, Muu (aikuiskoulutus ja palvelutoiminta)]
		,'etl: p_lataa_d_yo_toimipiste' AS source
        ,vuosi
	FROM sa.sa_suorat_yo4_toimipisteet

	) AS src
	ON target.koodi_yliopisto = src.Yliopisto
		AND target.koodi_toimipiste = src.[Toimipisteen koodi]
    AND target.vuosi = src.vuosi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,d_toiminta_tutkintoon_johtava_koulutus_id = src.[Toimipisteeseen liittyvä toiminta, tutkintoon johtava koulutus]
			,d_toiminta_tutkimustoiminta_id = src.[Toimipisteeseen liittyvä toiminta, tutkimustoiminta]
			,d_toiminta_muu_id = src.[Toimipisteeseen liittyvä toiminta, Muu (aikuiskoulutus ja palvelutoiminta)]
			,target.source = src.source
      ,target.vuosi = src.vuosi
WHEN NOT MATCHED
	THEN
		INSERT (
			koodi_yliopisto
			,koodi_toimipiste
			,selite_fi
			,selite_sv
			,selite_en
			,d_toiminta_tutkintoon_johtava_koulutus_id
			,d_toiminta_tutkimustoiminta_id
			,d_toiminta_muu_id
			,source
      ,vuosi
			)
		VALUES (
			src.Yliopisto
			,src.[Toimipisteen koodi]
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.[Toimipisteeseen liittyvä toiminta, tutkintoon johtava koulutus]
			,src.[Toimipisteeseen liittyvä toiminta, tutkimustoiminta]
			,src.[Toimipisteeseen liittyvä toiminta, Muu (aikuiskoulutus ja palvelutoiminta)]
			,src.source
      ,src.vuosi
			);


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
