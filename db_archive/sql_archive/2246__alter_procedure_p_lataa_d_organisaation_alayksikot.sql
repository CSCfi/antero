USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_organisaation_alayksikot]
AS
IF (
		SELECT count(1)
		FROM dw.d_organisaation_alayksikot
		WHERE alayksikko_koodi = '-1'
		) = 0
BEGIN
	SET IDENTITY_INSERT [dw].[d_organisaation_alayksikot] ON;
	INSERT INTO dw.d_organisaation_alayksikot (
		id,
		vuosi
		,korkeakoulu_koodi
		,paayksikko_koodi
		,alayksikko_koodi
		,alayksikko_nimi
		,alayksikko_nimi_sv
		,alayksikko_nimi_en
		,source
		)
	SELECT
		-1,
		koodi,
		koodi,
		koodi,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		'etl: p_lataa_d_organisaation_alayksikot'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_organisaation_alayksikot OFF;
	END
ELSE
	BEGIN
		UPDATE d
		SET
			paayksikko_koodi = s.koodi,
			alayksikko_nimi=s.nimi,
			alayksikko_nimi_sv=s.nimi_sv,
			alayksikko_nimi_en=s.nimi_en,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'etl: p_lataa_d_organisaation_alayksikot'
		FROM dw.d_organisaation_alayksikot d
		JOIN sa.sa_koodistot s ON s.koodi=d.alayksikko_koodi and s.koodi = d.korkeakoulu_koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

--AMK INITIAL LOAD
MERGE dw.d_organisaation_alayksikot AS target
USING (
	SELECT [vuosi]
	  ,[Korkeakoulun_koodi]
      ,COALESCE([Paayksikon_koodi], '-1') AS Paayksikon_koodi
      ,[Alayksikon_koodi]
      ,[Alayksikon_nimi]
	  ,COALESCE([Alayksikon_nimi_sv], '') AS [Alayksikon_nimi_sv]
	  ,COALESCE([Alayksikon_nimi_en], '') AS [Alayksikon_nimi_en]
	  ,'etl: p_lataa_d_organisaation_alayksikot (' + [IMP_CREATED_BY] +')'AS source
	FROM sa.sa_suorat_amk8a_alayksikkokoodisto where [IMP_CREATED_BY] = 'Initial load'
	) AS src
	ON target.vuosi = src.vuosi
		AND target.korkeakoulu_koodi = src.korkeakoulun_koodi
		AND target.alayksikko_koodi = src.alayksikon_koodi
		AND target.alayksikko_nimi = src.alayksikon_nimi
WHEN MATCHED
	THEN
		UPDATE
		SET target.alayksikko_nimi = src.[alayksikon_nimi]
				,target.alayksikko_nimi_sv = src.[alayksikon_nimi_sv]
				,target.alayksikko_nimi_en = src.[alayksikon_nimi_en]
				,target.paayksikko_koodi = src.[paayksikon_koodi]
				,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[vuosi]
			,[korkeakoulu_koodi]
			,[paayksikko_koodi]
			,[alayksikko_koodi]
			,[alayksikko_nimi]
			,[alayksikko_nimi_sv]
			,[alayksikko_nimi_en]
			,source
			)
		VALUES (
			src.[vuosi]
			,src.[korkeakoulun_koodi]
			,src.[Paayksikon_koodi]
			,src.[alayksikon_koodi]
			,src.[alayksikon_nimi]
			,src.[alayksikon_nimi_sv]
			,src.[alayksikon_nimi_en]
			,src.source
			);
-- AMK KOTA-tiedonkeruun alayksikot
MERGE dw.d_organisaation_alayksikot AS target
		USING (
			SELECT [vuosi]
			  ,[Korkeakoulun_koodi]
		    ,COALESCE([Paayksikon_koodi], '-1') AS Paayksikon_koodi
		    ,COALESCE([Alayksikon_koodi], '-1') AS Alayksikon_koodi
		    ,[Alayksikon_nimi]
			  ,COALESCE([alayksikon_nimi_sv], '') AS [alayksikon_nimi_sv]
				,COALESCE([alayksikon_nimi_en], '') AS [alayksikon_nimi_en]
				,'etl: p_lataa_d_organisaation_alayksikot (' + [IMP_CREATED_BY] +')'AS source
			FROM sa.sa_suorat_amk8a_alayksikkokoodisto where [IMP_CREATED_BY] != 'Initial load'
			) AS src
			ON target.vuosi = src.vuosi
				AND target.korkeakoulu_koodi = src.korkeakoulun_koodi
				AND target.alayksikko_koodi = src.alayksikon_koodi

		WHEN MATCHED
			THEN
				UPDATE
				SET target.alayksikko_nimi = src.[alayksikon_nimi]
						,target.alayksikko_nimi_sv = src.[alayksikon_nimi_sv]
						,target.alayksikko_nimi_en = src.[alayksikon_nimi_en]
						,target.paayksikko_koodi = src.[paayksikon_koodi]
						,target.source = src.source
		WHEN NOT MATCHED
			THEN
				INSERT (
					[vuosi]
					,[korkeakoulu_koodi]
					,[paayksikko_koodi]
					,[alayksikko_koodi]
					,[alayksikko_nimi]
					,[alayksikko_nimi_sv]
					,[alayksikko_nimi_en]
					,source
					)
				VALUES (
					src.[vuosi]
					,src.[korkeakoulun_koodi]
					,src.[Paayksikon_koodi]
					,src.[alayksikon_koodi]
					,src.[alayksikon_nimi]
					,src.[alayksikon_nimi_sv]
					,src.[alayksikon_nimi_en]
					,src.source
					);
-- YO INITIAL LOAD
MERGE dw.d_organisaation_alayksikot AS target
	USING (
		SELECT [vuosi]
		  ,[Korkeakoulun_koodi]
		  ,COALESCE([Paayksikon_koodi], '-1') AS Paayksikon_koodi
		  ,[Alayksikon_koodi]
		  ,[Alayksikon_nimi]
		  ,COALESCE([Alayksikon_nimi_sv], '') AS [Alayksikon_nimi_sv]
		  ,COALESCE([Alayksikon_nimi_en], '') AS [Alayksikon_nimi_en]
		  ,'etl: p_lataa_d_organisaation_alayksikot (' + [IMP_CREATED_BY] +')'AS source
		FROM sa.sa_suorat_yo9a_alayksikkokoodisto
			where [IMP_CREATED_BY] = 'Initial load'
			-- 4.6.2018 /VHä
			-- !!! 2016 vuoden tiedoissa on "tyhjiä" alayksikkökoodeja jotka jätetään latauksesta pois
			AND [Alayksikon_koodi] IS NOT NULL
			) AS src
		ON target.vuosi = src.vuosi
			AND target.korkeakoulu_koodi = src.korkeakoulun_koodi
			AND target.alayksikko_koodi = src.alayksikon_koodi
			AND target.alayksikko_nimi = src.alayksikon_nimi
WHEN MATCHED
	THEN
		UPDATE
		SET target.alayksikko_nimi = src.alayksikon_nimi
				,target.alayksikko_nimi_sv = src.alayksikon_nimi_sv
				,target.alayksikko_nimi_en = src.alayksikon_nimi_en
				,target.paayksikko_koodi = src.paayksikon_koodi
				,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[vuosi]
			,[korkeakoulu_koodi]
			,[paayksikko_koodi]
			,[alayksikko_koodi]
			,[alayksikko_nimi]
			,[alayksikko_nimi_sv]
			,[alayksikko_nimi_en]
			,source
			)
		VALUES (
			src.[vuosi]
			,src.[korkeakoulun_koodi]
			,src.[Paayksikon_koodi]
			,src.[alayksikon_koodi]
			,src.[alayksikon_nimi]
			,src.[Alayksikon_nimi_sv]
			,src.[alayksikon_nimi_en]
			,src.source
			);
-- YO KOTA-tiedonkeruun alayksikot
MERGE dw.d_organisaation_alayksikot AS target
	USING (
		SELECT [vuosi]
		  ,[Korkeakoulun_koodi]
	    ,COALESCE([Paayksikon_koodi], '-1') AS  Paayksikon_koodi
	    ,[Alayksikon_koodi]
	    ,[Alayksikon_nimi]
			,COALESCE([Alayksikon_nimi_sv], '') AS [Alayksikon_nimi_sv]
			,COALESCE([Alayksikon_nimi_en], '') AS [Alayksikon_nimi_en]
			,'etl: p_lataa_d_organisaation_alayksikot (' + [IMP_CREATED_BY] +')'AS source
		FROM sa.sa_suorat_yo9a_alayksikkokoodisto
		WHERE [IMP_CREATED_BY] != 'Initial load'

		) AS src
		ON target.vuosi = src.vuosi
			AND target.korkeakoulu_koodi = src.korkeakoulun_koodi
			AND target.alayksikko_koodi = src.alayksikon_koodi

WHEN MATCHED
	THEN
		UPDATE
			SET target.alayksikko_nimi = src.alayksikon_nimi
					,target.alayksikko_nimi_sv = src.alayksikon_nimi_sv
					,target.alayksikko_nimi_en = src.alayksikon_nimi_en
					,target.paayksikko_koodi = src.paayksikon_koodi
					,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[vuosi]
			,[korkeakoulu_koodi]
			,[paayksikko_koodi]
			,[alayksikko_koodi]
			,[alayksikko_nimi]
			,[alayksikko_nimi_sv]
			,[alayksikko_nimi_en]
			,source
			)
		VALUES (
			src.[vuosi]
			,src.[korkeakoulun_koodi]
			,src.[Paayksikon_koodi]
			,src.[alayksikon_koodi]
			,src.[alayksikon_nimi]
			,src.[alayksikon_nimi_sv]
			,src.[alayksikon_nimi_en]
			,src.source
			);
