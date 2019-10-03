USE [ANTERO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_majoitus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_majoitus] AS'
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_majoitus]
AS
IF (
		SELECT count(1)
		FROM dw.d_majoitus
		WHERE majoitus_koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_majoitus

	set identity_insert dw.d_majoitus on
	INSERT dw.d_majoitus (
		id
		,majoitus_koodi, majoitus_nimi_fi, majoitus_nimi_sv, majoitus_nimi_en
		, alkupvm, loppupvm, source
		)
	VALUES (
		N'-1'
		,N'-1', N'Tuntematon', N'Okänd', N'Unknown'
		,NULL,NULL,N'etl: p_lataa_d_majoitus'

		)
	set identity_insert dw.d_majoitus off
END

MERGE dw.d_majoitus AS target
USING (
	SELECT TOP 100 PERCENT  koodi as koodi
		,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
		,CAST(alkupvm AS DATE) AS alkupvm
		,CAST(loppupvm AS DATE) AS loppupvm
		,'ETL: p_lataa_d_majoitus' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'majoitusammatillisenkoulutuksenrahoitus'
	order by koodi

	) AS src
	ON target.majoitus_koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET majoitus_nimi_fi = src.nimi
			,majoitus_nimi_sv = src.nimi_sv
			,majoitus_nimi_en = src.nimi_en
			,alkupvm=src.alkupvm
			,loppupvm=src.loppupvm
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				majoitus_koodi, majoitus_nimi_fi, majoitus_nimi_sv, majoitus_nimi_en,
				alkupvm, loppupvm ,source
				)
		VALUES (
				src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
				src.alkupvm, src.loppupvm,src.source
				);
