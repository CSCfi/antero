ALTER PROCEDURE [dw].[p_lataa_d_organisaation_alayksikot]
AS
IF (
		SELECT count(1)
		FROM dw.d_organisaation_alayksikot
		WHERE [korkeakoulu_koodi] = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_organisaation_alayksikot

	INSERT dw.d_organisaation_alayksikot (
		[vuosi]
		,[korkeakoulu_koodi]
		,[alayksikko_koodi]
		,[alayksikko_nimi]
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'etl: p_lataa_d_organisaation_alayksikot'
		)
END

MERGE dw.d_organisaation_alayksikot AS target
USING (
	SELECT [vuosi]
		,[korkeakoulu_koodi]
		,[alayksikko_koodi]
		,[alayksikko_nimi]
		,'etl: p_lataa_d_organisaation_alayksikot' AS source
	FROM sa.sa_suorat_koodistot_organisaation_alayksikot
	) AS src
	ON target.vuosi = src.vuosi
		AND target.korkeakoulu_koodi = src.korkeakoulu_koodi
		AND target.alayksikko_koodi = src.alayksikko_koodi
WHEN MATCHED
	THEN
		UPDATE
		SET [alayksikko_nimi] = src.[alayksikko_nimi]
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[vuosi]
			,[korkeakoulu_koodi]
			,[alayksikko_koodi]
			,[alayksikko_nimi]
			,source
			)
		VALUES (
			src.[vuosi]
			,src.[korkeakoulu_koodi]
			,src.[alayksikko_koodi]
			,src.[alayksikko_nimi]
			,src.source
			);

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_alayksikko_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot ADD jarjestys_alayksikko_koodi AS case when alayksikko_koodi = '-1' then '99999' else cast(alayksikko_koodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_organisaation_alayksikot' AND COLUMN_NAME='jarjestys_korkeakoulu_koodi')

BEGIN
	ALTER TABLE dw.d_organisaation_alayksikot ADD jarjestys_korkeakoulu_koodi AS case when korkeakoulu_koodi = '-1' then '99999' else cast(korkeakoulu_koodi as varchar(10))
  END
END
