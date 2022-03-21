USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opintojenrahoitus]    Script Date: 12.3.2021 10:32:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_d_opintojenrahoitus] AS

IF (
		SELECT count(1)
		FROM dw.d_opintojenrahoitus
		WHERE koodi = '-1'
		) = 0
BEGIN
	TRUNCATE TABLE dw.d_opintojenrahoitus

	set identity_insert dw.d_opintojenrahoitus on

	INSERT dw.d_opintojenrahoitus (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,jarjestys_koodi
		,tyovoimakoulutus
		,sisaltyy_okm_perusrahoitus
		,sisaltyy_okm_suoritusrahoitus
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		99,
		koodi,
		koodi,
		koodi,
		'etl: p_lataa_d_opintojen_rahoitus'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta'
	and koodi='-1'
  
	set identity_insert dw.d_opintojenrahoitus off
END


ELSE 

	BEGIN

	UPDATE d SET
	koodi = s.koodi,
	selite_fi = s.nimi,
	selite_sv = s.nimi_sv,
	selite_en = s.nimi_en,
	jarjestys_koodi = 99,
	tyovoimakoulutus = s.koodi,
	sisaltyy_okm_perusrahoitus = s.koodi,
	sisaltyy_okm_suoritusrahoitus = s.koodi,
	source = 'etl: p_lataa_d_opintojen_rahoitus'
	FROM dw.d_opintojenrahoitus d
	join sa.sa_koodistot s on s.koodi=d.koodi
	WHERE s.koodisto='vipunenmeta'
	and s.koodi='-1'
	
	END


MERGE dw.d_opintojenrahoitus AS target
USING (
	SELECT TOP(100) PERCENT
	koodi,
	coalesce(nimi, nimi_sv, nimi_en,'Tieto puuttuu') AS selite_fi,
	coalesce(nimi_sv, nimi, nimi_en,'Information saknas') AS selite_sv,
	coalesce(nimi_en, nimi, nimi_sv,'Missing data') AS selite_en,
	koodi AS jarjestys_koodi,
	CASE WHEN koodi IN (2,3,10,12) or nimi like '%työvoimakoulutus%' THEN 1 ELSE 0 END AS tyovoimakoulutus,
	CASE WHEN koodi IN (1,10,11,12) THEN 1 ELSE 0 END AS sisaltyy_okm_perusrahoitus,
	CASE WHEN koodi IN (1,2,3,7,8,9,10,11,12) THEN 1 ELSE 0 END AS sisaltyy_okm_suoritusrahoitus,
	'virkailija.opintopolku.fi/koodisto-service/rest/json/opintojenrahoitus/koodi' AS source
	FROM sa.sa_koodistot
	where koodisto = 'opintojenrahoitus'
	order by koodi

	) AS src
ON target.koodi = src.koodi
WHEN MATCHED
	THEN
		UPDATE
		SET selite_fi = src.selite_fi
			,selite_sv = src.selite_sv
			,selite_en = src.selite_en
			,jarjestys_koodi = src.jarjestys_koodi
			,tyovoimakoulutus = src.tyovoimakoulutus
			,sisaltyy_okm_perusrahoitus = src.sisaltyy_okm_perusrahoitus
			,sisaltyy_okm_suoritusrahoitus = src.sisaltyy_okm_suoritusrahoitus
			,target.source = src.source
WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,jarjestys_koodi
			,tyovoimakoulutus
			,sisaltyy_okm_perusrahoitus
			,sisaltyy_okm_suoritusrahoitus
			,source
			)
		VALUES (
			src.koodi
			,src.selite_fi
			,src.selite_sv
			,src.selite_en
			,src.jarjestys_koodi
			,src.tyovoimakoulutus
			,src.sisaltyy_okm_perusrahoitus
			,src.sisaltyy_okm_suoritusrahoitus
			,src.source
			);

