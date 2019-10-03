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