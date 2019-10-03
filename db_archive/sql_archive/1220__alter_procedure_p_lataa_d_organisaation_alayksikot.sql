
ALTER PROCEDURE [dw].[p_lataa_d_organisaation_alayksikot]
AS
IF (
		SELECT count(1)
		FROM dw.d_organisaation_alayksikot
		WHERE [korkeakoulu_koodi] = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_organisaation_alayksikot
	set identity_insert dw.d_organisaation_alayksikot on;
	INSERT dw.d_organisaation_alayksikot (
		id
		,[vuosi]
		,[korkeakoulu_koodi]
		,[paayksikko_koodi]
		,[alayksikko_koodi]
		,[alayksikko_nimi]
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'etl: p_lataa_d_organisaation_alayksikot'
		)
	set identity_insert dw.d_organisaation_alayksikot off;
END

MERGE dw.d_organisaation_alayksikot AS target
USING (
	SELECT [vuosi]
	  ,[Korkeakoulun_koodi]
      ,COALESCE([Paayksikon_koodi], '-1') as Paayksikon_koodi
      ,[Alayksikon_koodi]
      ,[Alayksikon_nimi]
		,'etl: p_lataa_d_organisaation_alayksikot (' + [IMP_CREATED_BY] +')'AS source
	FROM sa.sa_suorat_amk8a_alayksikkokoodisto
	) AS src
	ON target.vuosi = src.vuosi
		AND target.korkeakoulu_koodi = src.korkeakoulun_koodi
		AND target.alayksikko_koodi = src.alayksikon_koodi
		AND target.alayksikko_nimi = src.alayksikon_nimi
WHEN MATCHED
	THEN
		UPDATE
		SET target.alayksikko_nimi = src.[alayksikon_nimi]
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
			,source
			)
		VALUES (
			src.[vuosi]
			,src.[korkeakoulun_koodi]
			,src.[Paayksikon_koodi]
			,src.[alayksikon_koodi]
			,src.[alayksikon_nimi]
			,src.source
			);
MERGE dw.d_organisaation_alayksikot AS target
USING (
	SELECT [vuosi]
	  ,[Korkeakoulun_koodi]
      ,COALESCE([Paayksikon_koodi], '-1') as Paayksikon_koodi
      ,[Alayksikon_koodi]
      ,[Alayksikon_nimi]
		,'etl: p_lataa_d_organisaation_alayksikot (' + [IMP_CREATED_BY] +')'AS source
	FROM sa.sa_suorat_yo9a_alayksikkokoodisto
	) AS src
	ON target.vuosi = src.vuosi
		AND target.korkeakoulu_koodi = src.korkeakoulun_koodi
		AND target.alayksikko_koodi = src.alayksikon_koodi
		AND target.alayksikko_nimi = src.alayksikon_nimi
WHEN MATCHED
	THEN
		UPDATE
		SET target.alayksikko_nimi = src.alayksikon_nimi
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
			,source
			)
		VALUES (
			src.[vuosi]
			,src.[korkeakoulun_koodi]
			,src.[Paayksikon_koodi]
			,src.[alayksikon_koodi]
			,src.[alayksikon_nimi]
			,src.source
			);
