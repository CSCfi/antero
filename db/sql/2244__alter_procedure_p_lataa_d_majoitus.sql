USE [ANTERO]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_majoitus]
AS
IF (
		SELECT count(1)
		FROM dw.d_majoitus
		WHERE majoitus_koodi = '-1'
		) = 0
BEGIN
	SET IDENTITY_INSERT dw.d_majoitus ON;
	INSERT INTO dw.d_majoitus (
		id,
		majoitus_koodi,
		majoitus_nimi_fi,
		majoitus_nimi_sv,
		majoitus_nimi_en,
		alkupvm,
		loppupvm,
		source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		NULL,
		NULL,
		'ETL: p_lataa_d_majoitus'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1'
	  ;

	  SET IDENTITY_INSERT dw.d_majoitus OFF;
	END
ELSE
	BEGIN
		UPDATE d
		SET
			majoitus_koodi = s.koodi,
			majoitus_nimi_fi=s.nimi,
			majoitus_nimi_sv=s.nimi_sv,
			majoitus_nimi_en=s.nimi_en,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'ETL: p_lataa_d_majoitus'
		FROM dw.d_majoitus d
		JOIN sa.sa_koodistot s ON s.koodi=d.majoitus_koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
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
