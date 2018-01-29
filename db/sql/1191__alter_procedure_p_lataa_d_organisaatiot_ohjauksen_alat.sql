ALTER PROCEDURE [dw].[p_lataa_d_organisaatiot_ohjauksen_alat]
AS
IF (
		SELECT count(1)
		FROM dw.d_organisaatiot_ohjauksen_alat
		WHERE [korkeakoulu_koodi] = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_organisaatiot_ohjauksen_alat

	INSERT dw.d_organisaatiot_ohjauksen_alat (
		[Vuosi]
		,[korkeakoulu_koodi]
		,[alayksikko_koodi]a
		,[ohjauksen_ala_koodi]
		,[jyvitys]
		,[max_100_%]
		,[source]
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'-1'
		,N'etl: p_lataa_d_organisaatiot_ohjauksen_alat'
		)
END

MERGE dw.d_organisaatiot_ohjauksen_alat AS target
USING (
		SELECT
		[Vuosi]
		,[korkeakoulu_koodi]
		,[alayksikkö_koodi]
		,[ohjauksen_ala_koodi]
		,[jyvitys]
		,[max 100 %]
		,'etl: p_lataa_d_organisaatiot_ohjauksen_alat (' + [IMP_CREATED_BY] +')'AS source
	FROM sa.sa_suorat_amk8b_alayksikot_ohjauksen_alat
	) AS src
	ON target.vuosi = src.vuosi
		AND target.korkeakoulu_koodi = src.korkeakoulu_koodi
		AND target.alayksikko_koodi = src.alayksikkö_koodi
		AND target.ohjauksen_ala_koodi = src.ohjauksen_ala_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET [jyvitys] = src.[jyvitys]
		,[max_100_%] = src.[max 100 %]
		,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[Vuosi]
			,[korkeakoulu_koodi]
			,[alayksikko_koodi]
			,[ohjauksen_ala_koodi]
			,[jyvitys]
			,[max_100_%]
			,[source]
			)
		VALUES (
			src.[Vuosi]
			,src.[korkeakoulu_koodi]
			,src.[alayksikkö_koodi]
			,src.[ohjauksen_ala_koodi]
			,src.[jyvitys]
			,src.[max 100 %]
			,src.[source]
			);
MERGE dw.d_organisaatiot_ohjauksen_alat AS target
USING (
		SELECT
		[Vuosi]
		,[korkeakoulu_koodi]
		,[alayksikkö_koodi]
		,[ohjauksen_ala_koodi]
		,[jyvitys]
		,[max 100 %]
		,'etl: p_lataa_d_organisaatiot_ohjauksen_alat (' + [IMP_CREATED_BY] +')'AS source
	FROM sa.sa_suorat_yo9b_alayksikot_ohjauksen_alat
	) AS src
	ON target.vuosi = src.vuosi
		AND target.korkeakoulu_koodi = src.korkeakoulu_koodi
		AND target.alayksikko_koodi = src.alayksikkö_koodi
		AND target.ohjauksen_ala_koodi = src.ohjauksen_ala_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET [jyvitys] = src.[jyvitys]
			,[max_100_%] = src.[max 100 %]
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[Vuosi]
			,[korkeakoulu_koodi]
			,[alayksikko_koodi]
			,[ohjauksen_ala_koodi]
			,[jyvitys]
			,[max_100_%]
			,[source]
			)
		VALUES (
			src.[Vuosi]
			,src.[korkeakoulu_koodi]
			,src.[alayksikkö_koodi]
			,src.[ohjauksen_ala_koodi]
			,src.[jyvitys]
			,src.[max 100 %]
			,src.[source]
			);


IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatiot_ohjauksen_alat' AND COLUMN_NAME='jarjestys_korkeakoulu_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatiot_ohjauksen_alat ADD jarjestys_korkeakoulu_koodi AS (case when [korkeakoulu_koodi]=(-1) then '99999' else CONVERT([varchar](10),[korkeakoulu_koodi]) end)
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatiot_ohjauksen_alat' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatiot_ohjauksen_alat ADD jarjestys_alayksikko_koodi AS (case when [alayksikko_koodi]=(-1) then 'ZzZzZ' else CONVERT([varchar](100),[alayksikko_koodi]) end)
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaatiot_ohjauksen_alat' AND COLUMN_NAME='jarjestys_ohjauksen_ala_koodi')

BEGIN
	ALTER TABLE dw.d_organisaatiot_ohjauksen_alat ADD jarjestys_ohjauksen_ala_koodi AS (case when [ohjauksen_ala_koodi]=(-1) then '999' else CONVERT([varchar](3),[ohjauksen_ala_koodi]) end)
END
