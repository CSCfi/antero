USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_yo]    Script Date: 15.5.2019 15:40:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_yo] AS

IF (
		SELECT count(1)
		FROM dw.d_yo
		WHERE yo_tunnus = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_yo
	SET IDENTITY_INSERT [dw].[d_yo] ON;
	INSERT INTO dw.d_yo
		(id, yo_tunnus, yo_nimi_fi, yo_nimi_sv, yo_nimi_en
		 ,yo_nykyinen_tunnus, yo_vanha_nimi_fi, yo_vanha_nimi_sv, yo_vanha_nimi_en,
		 alkupvm, loppupvm,source
		 )

	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		NULL,
		NULL,
		'etl: p_lataa_d_yo'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	  AND koodi='-1';
	SET IDENTITY_INSERT dw.d_yo OFF;
END

ELSE
	BEGIN
		UPDATE d
		SET
			yo_tunnus = s.koodi,
			yo_nimi_fi=s.nimi,
			yo_nimi_sv=s.nimi_sv,
			yo_nimi_en=s.nimi_en,
			yo_nykyinen_tunnus = s.koodi,
			yo_vanha_nimi_fi=s.nimi,
			yo_vanha_nimi_sv=s.nimi_sv,
			yo_vanha_nimi_en=s.nimi_en,
			alkupvm=NULL,
			loppupvm=NULL,
			loadtime = GETDATE(),
			username = SUSER_NAME(),
			source = 'ETL: p_lataa_d_tutkinnon_taso'
		FROM dw.d_yo d
		JOIN sa.sa_koodistot s ON s.koodi=d.yo_tunnus
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
	END

MERGE dw.d_yo AS target
USING (
 SELECT koodi
		,coalesce(nimi, nimi_sv, nimi_en) AS nimi
		,coalesce(nimi_sv, nimi, nimi_en) AS nimi_sv
		,coalesce(nimi_en, nimi, nimi_sv) AS nimi_en
		,'etl: p_lataa_d_yo' AS source
		,koodi AS nykyinen_tunnus
		,COALESCE(nimi, nimi_sv, nimi_en) AS vanha_nimi
		,COALESCE(nimi_sv, nimi, nimi_en) AS vanha_nimi_sv
		,COALESCE(nimi_en, nimi, nimi_sv) AS vanha_nimi_en
		,COALESCE(alkupvm,'') AS alkupvm
		,COALESCE(loppupvm, '2099-12-31') AS loppupvm
  FROM sa.sa_oppilaitosluokitus
  WHERE oppilaitostyyppikoodi = '42') AS src
ON target.yo_tunnus = src.koodi
WHEN MATCHED THEN
  UPDATE SET
		yo_nimi_fi = src.nimi,
		yo_nimi_sv = src.nimi_sv,
    yo_nimi_en = src.nimi_en,
    target.source = src.source,
		yo_nykyinen_tunnus = src.nykyinen_tunnus,
		yo_vanha_nimi_fi = src.vanha_nimi,
		yo_vanha_nimi_sv = src.vanha_nimi_sv,
		yo_vanha_nimi_en = src.vanha_nimi_en,
		alkupvm = src.alkupvm,
		loppupvm = src.loppupvm

WHEN NOT MATCHED THEN
  INSERT (yo_tunnus,yo_nimi_fi, yo_nimi_sv, yo_nimi_en
          ,source
		   		,yo_nykyinen_tunnus, yo_vanha_nimi_fi, yo_vanha_nimi_sv, yo_vanha_nimi_en
		   		,alkupvm, loppupvm
		   		)
  values (src.koodi, src.nimi, src.nimi_sv, src.nimi_en, src.source
  		  	,src.nykyinen_tunnus,src.vanha_nimi,src.vanha_nimi_sv, src.vanha_nimi_en
		  		,src.alkupvm, src.loppupvm);

--
-- update  names for fusioned universities
--
MERGE dw.d_yo AS TARGET2
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
	ON target2.yo_tunnus = src2.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET target2.yo_nimi_fi = src2.uusi_nimi
			,target2.yo_nimi_sv = src2.uusi_nimi_sv
			,target2.yo_nimi_en = src2.uusi_nimi_en
			,target2.yo_nykyinen_tunnus = src2.nykyinen_tunnus
			,target2.yo_vanha_nimi_fi = src2.vanha_nimi
  			,target2.yo_vanha_nimi_sv = src2.vanha_nimi_sv
  			,target2.yo_vanha_nimi_en = src2.vanha_nimi_en
			,target2.source = src2.source2
			,target2.alkupvm=src2.alkupvm
			,target2.loppupvm=src2.loppupvm;
