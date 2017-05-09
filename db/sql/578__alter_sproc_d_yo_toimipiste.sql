ALTER PROCEDURE [dw].[p_lataa_d_yo_toimipiste]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_toimipiste
		WHERE koodi_yliopisto = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_toimipiste
	set identity_insert dw.d_yo_toimipiste on
	INSERT dw.d_yo_toimipiste (
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
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'Okänd'
		,N'Unknown'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'etl: p_lataa_d_yo_toimipiste'
		)
	set identity_insert dw.d_yo_toimipiste off
END

MERGE dw.d_yo_toimipiste AS target
USING (
	SELECT MAX(Yliopisto) AS Yliopisto
		,MAX([Toimipisteen koodi]) AS [Toimipisteen koodi]
		,[Toimipisteen nimi] AS selite_fi
		,[Toimipisteen nimi] AS selite_sv
		,[Toimipisteen nimi] AS selite_en
		,[Toimipisteeseen liittyvä toiminta, tutkintoon johtava koulutus]
		,[Toimipisteeseen liittyvä toiminta, tutkimustoiminta]
		,[Toimipisteeseen liittyvä toiminta, Muu (aikuiskoulutus ja palvelutoiminta)]
		,'etl: p_lataa_d_yo_toimipiste' AS source
	FROM sa.sa_suorat_yo4_toimipisteet
	GROUP BY [Toimipisteen nimi]
		,[Toimipisteeseen liittyvä toiminta, tutkintoon johtava koulutus]
		,[Toimipisteeseen liittyvä toiminta, tutkimustoiminta]
		,[Toimipisteeseen liittyvä toiminta, Muu (aikuiskoulutus ja palvelutoiminta)]
	) AS src
	ON target.koodi_yliopisto = src.Yliopisto
		AND target.koodi_toimipiste = src.[Toimipisteen koodi]
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
			);