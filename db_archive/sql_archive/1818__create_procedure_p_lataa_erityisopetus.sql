USE [ANTERO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_erityisopetus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_erityisopetus] AS'
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_erityisopetus]
AS
IF (
		SELECT count(1)
		FROM dw.d_erityisopetus
		WHERE erityisopetus_koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_erityisopetus

	set identity_insert dw.d_erityisopetus on
	INSERT dw.d_erityisopetus (
		id
		,erityisopetus_koodi, erityisopetus_nimi_fi, erityisopetus_nimi_sv, erityisopetus_nimi_en
		, alkupvm, loppupvm, source
		)
	VALUES (
		N'-1'
		,N'-1', N'Tuntematon', N'Okänd', N'Unknown'
		,NULL,NULL,N'etl: p_lataa_d_erityisopetus'

		)
	set identity_insert dw.d_erityisopetus off
END

MERGE dw.d_erityisopetus AS target
USING (
	SELECT TOP 100 PERCENT  koodi as koodi
		,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
		,CAST(alkupvm AS DATE) AS alkupvm
		,CAST(loppupvm AS DATE) AS loppupvm
		,'ETL: p_lataa_d_erityisopetus' AS source
	FROM sa.sa_koodistot
	WHERE koodisto = 'erityisopetusammatillisenkoulutuksenrahoitus'
	order by koodi

	) AS src
	ON target.erityisopetus_koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET erityisopetus_nimi_fi = src.nimi
			,erityisopetus_nimi_sv = src.nimi_sv
			,erityisopetus_nimi_en = src.nimi_en
			,alkupvm=src.alkupvm
			,loppupvm=src.loppupvm
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
				erityisopetus_koodi, erityisopetus_nimi_fi, erityisopetus_nimi_sv, erityisopetus_nimi_en,
				alkupvm, loppupvm ,source
				)
		VALUES (
				src.koodi, src.nimi, src.nimi_sv, src.nimi_en,
				src.alkupvm, src.loppupvm,src.source
				);
