ALTER PROCEDURE [dw].[p_lataa_d_yo_tiedekunta]
AS
IF (
		SELECT count(1)
		FROM dw.d_yo_tiedekunta
		WHERE [yliopistokoodi] = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo_tiedekunta
	set identity_insert dw.d_yo_tiedekunta on
	INSERT dw.d_yo_tiedekunta (
			id
			,[yliopistokoodi]
			,[tiedekuntakoodi]
			,[tiedekunta]
		,source
		)
	VALUES (
		N'-1'
		,N'-1'
		,N'-1'
		,N'Tuntematon'
		,N'etl: p_lataa_d_yo_tiedekunta'
		)
	set identity_insert dw.d_yo_tiedekunta off
END

MERGE dw.d_yo_tiedekunta AS target
USING (
	SELECT 	[yliopistokoodi]
			,[tiedekuntakoodi]
			,[tiedekunta]
		,'etl: p_lataa_d_yo_tiedekunta' AS source
	FROM sa.sa_suorat_koodistot_yo_tiedekunta
	) AS src
	ON target.[yliopistokoodi] = src.[yliopistokoodi]
		AND target.[tiedekuntakoodi] = src.[tiedekuntakoodi]
WHEN MATCHED
	THEN
		UPDATE
		SET [tiedekunta] = src.[tiedekunta]
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			[yliopistokoodi]
			,[tiedekuntakoodi]
			,[tiedekunta]
			,source
			)
		VALUES (
			src.[yliopistokoodi]
			,src.[tiedekuntakoodi]
			,src.[tiedekunta]
			,src.source
			);
			
IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_tiedekunta' AND COLUMN_NAME='jarjestys_tiedekuntakoodi')

BEGIN
	ALTER TABLE dw.d_yo_tiedekunta ADD jarjestys_tiedekuntakoodi AS case when tiedekuntakoodi = '-1' then 'ZZZZZ' else cast(tiedekuntakoodi as varchar(10))
  END
END

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
	WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='d_yo_tiedekunta' AND COLUMN_NAME='jarjestys_yliopistokoodi')

BEGIN
	ALTER TABLE dw.d_yo_tiedekunta ADD jarjestys_yliopistokoodi AS case when yliopistokoodi = '-1' then 'ZZZZZ' else cast(yliopistokoodi as varchar(10))
  END
END
