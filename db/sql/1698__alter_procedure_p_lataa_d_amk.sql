USE [Test_VHA]
GO
ALTER PROCEDURE [dw].[p_lataa_d_amk]
AS
IF (
		SELECT count(1)
		FROM dw.d_amk
		WHERE amk_tunnus = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_amk

	set identity_insert dw.d_amk on
	INSERT dw.d_amk (
		id
		,amk_tunnus, amk_nimi_fi, amk_nimi_sv, amk_nimi_en
		,source
		,amk_nykyinen_tunnus, amk_vanha_nimi_fi, amk_vanha_nimi_sv,amk_vanha_nimi_en
		,alkupvm,loppupvm
		)
	VALUES (
		N'-1'
		,N'-1', N'Tuntematon', N'Okänd', N'Unknown'
		,N'etl: p_lataa_d_amk'
		, N'-1', N'Tuntematon', N'Okänd', N'Unknown'
		,N'',N''

		)
	set identity_insert dw.d_amk off
END

MERGE dw.d_amk AS target
USING (
	SELECT koodi as koodi
		,COALESCE(nimi, nimi_sv, nimi_en) AS nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS nimi_en
		,'ETL: p_lataa_d_amk' AS source
		,koodi as nykyinen_tunnus
		,COALESCE(nimi, nimi_sv, nimi_en) AS vanha_nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS vanha_nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS vanha_nimi_en
		,COALESCE(alkupvm,'') as alkupvm
		,COALESCE(loppupvm, '2099-12-31') as loppupvm
	FROM sa.sa_organisaatioluokitus
	WHERE oppilaitostyyppi = '41'

	) AS src
	ON target.amk_tunnus = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET amk_nimi_fi = src.nimi
			,amk_nimi_sv = src.nimi_sv
			,amk_nimi_en = src.nimi_en
			,target.source = src.source
			,amk_nykyinen_tunnus = src.nykyinen_tunnus
			,amk_vanha_nimi_fi = src.vanha_nimi
			,amk_vanha_nimi_sv = src.vanha_nimi_sv
			,amk_vanha_nimi_en = src.vanha_nimi_en
			,alkupvm = src.alkupvm
			,loppupvm = src.loppupvm
WHEN NOT MATCHED
	THEN
		INSERT (
				amk_tunnus, amk_nimi_fi, amk_nimi_sv, amk_nimi_en
				,source
				,amk_nykyinen_tunnus, amk_vanha_nimi_fi, amk_vanha_nimi_sv,amk_vanha_nimi_en
				,alkupvm,loppupvm
				)
		VALUES (
				src.koodi, src.nimi, src.nimi_sv, src.nimi_en
				,src.source
				,src.nykyinen_tunnus,src.vanha_nimi,src.vanha_nimi_sv, src.vanha_nimi_en
				,src.alkupvm, src.loppupvm
				);

--
-- update  names for fusioned universities of applied science
--
MERGE dw.d_amk AS TARGET2
USING (
SELECT
	koodi
	,(SELECT COALESCE(nimi, nimi_sv,nimi_en,'Tuntematon') FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS uusi_nimi
	,(SELECT COALESCE(nimi_sv, nimi,nimi_en,'Okänd') FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS uusi_nimi_sv
	,(SELECT COALESCE(nimi_en, nimi,nimi_sv,'Unknownn') FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS uusi_nimi_en
	,(SELECT koodi FROM sa.sa_organisaatioluokitus WHERE koodi=kkh.korkeakoulun_nykyinen_tunnus ) AS nykyinen_tunnus
	,COALESCE(nimi, nimi_sv,nimi_en,'Tuntematon') AS vanha_nimi
	,COALESCE(nimi_sv, nimi,nimi_en,'Okänd') AS vanha_nimi_sv
	,COALESCE(nimi_en, nimi,nimi_sv,'Unknownn') AS vanha_nimi_en
	,'modified sa.sa_organisaatioluokitus' AS source2
	,s.alkupvm
	,s.loppupvm
 FROM sa.sa_organisaatioluokitus  s
LEFT JOIN sa.sa_korkeakoulu_koodi_historia kkh ON kkh.korkeakoulun_koodi=s.koodi
WHERE koodi =  kkh.korkeakoulun_koodi ) AS SRC2
	ON target2.amk_tunnus = src2.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET target2.amk_nimi_fi = src2.uusi_nimi
			,target2.amk_nimi_sv = src2.uusi_nimi_sv
			,target2.amk_nimi_en = src2.uusi_nimi_en
			,target2.amk_nykyinen_tunnus = src2.nykyinen_tunnus
			,target2.amk_vanha_nimi_fi = src2.vanha_nimi
  			,target2.amk_vanha_nimi_sv = src2.vanha_nimi_sv
  			,target2.amk_vanha_nimi_en = src2.vanha_nimi_en
			,target2.source = src2.source2
			,target2.alkupvm=src2.alkupvm
			,target2.loppupvm=src2.loppupvm;
