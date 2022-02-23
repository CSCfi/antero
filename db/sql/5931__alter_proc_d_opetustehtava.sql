USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_opetustehtava]    Script Date: 23.2.2022 16:01:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_d_opetustehtava] AS


IF (SELECT count(1) FROM dw.d_opetustehtava WHERE koodi = '-1') = 0

BEGIN
	TRUNCATE TABLE dw.d_opetustehtava
		
	SET IDENTITY_INSERT dw.d_opetustehtava ON

	INSERT dw.d_opetustehtava (
		id
		,koodi
		,selite_fi
		,selite_sv
		,selite_en
		,selite2_fi
		,selite2_sv
		,selite2_en
		,jarjestys
		,source
		)
	SELECT
		-1,
		koodi,
		nimi,
		nimi_sv,
		nimi_en,
		nimi,
		nimi_sv,
		nimi_en,
		9,
		'etl: p_lataa_d_opetustehtava'
	FROM sa.sa_koodistot
	WHERE koodisto='vipunenmeta' AND koodi='-1';

	SET IDENTITY_INSERT dw.d_opetustehtava OFF
END

ELSE BEGIN
	UPDATE d
		SET
			koodi = s.koodi,
			selite_fi = s.nimi,
			selite_sv = s.nimi_sv,
			selite_en = s.nimi_en,
			selite2_fi = s.nimi,
			selite2_sv = s.nimi_sv,
			selite2_en = s.nimi_en,
			jarjestys = 99,
			loadtime = getdate(),
			username = suser_name(),
			source = 'etl: p_lataa_d_opetustehtava'
		FROM dw.d_opetustehtava d
		JOIN sa.sa_koodistot s ON s.koodi=d.koodi
		WHERE s.koodisto='vipunenmeta' AND s.koodi='-1';
END


MERGE dw.d_opetustehtava AS target
USING (
	SELECT 
		koodi
		,nimi
		,nimi_sv
		,nimi_en
		,nimi2 = 
			case
				when nimi = 'kaksivuotinen esiopetus (5- ja 6-vuotiaat)' then 'kaksivuotinen esiopetus (5- ja 6-vuotiaat) (kielikoulut)'
				when (nimi like '%kehitysvammaisille%' or nimi like '%kehitysvammaiset%') and (nimi like '%esi%' or nimi like '%perusopetus%') then 'esi- ja perusopetus pidennetyn oppivelvollisuuden oppilaille'
				when nimi in ('perusopetus muille kuin oppivelvollisille','Aikuisten perusopetus') then 'aikuisten perusopetus'
				when (nimi like '%kehitysvammaisille%' or nimi like '%kehitysvammaiset%') and nimi like '%lisäopetus%' then 'lisäopetus pidennetyn oppivelvollisuuden piirissä olleille oppilaille '
				when nimi = 'kaksivuotinen esikoulu' then 'kaksivuotinen esikoulu (Helsingin eurooppalainen koulu)'
				when nimi = 'alakoulu vuosiluokat 1–5' then 'alakoulu vuosiluokat 1–5  (Helsingin eurooppalainen koulu)'
				when nimi = 'yläkoululukio vuosiluokat 1–7' then 'yläkoululukio vuosiluokat 1–7  (Helsingin eurooppalainen koulu)'
				when nimi = 'erityisopetus' then null
				else nimi
			end
		,nimi2_sv = nimi_sv
		,nimi2_en = nimi_en
		,jarjestys = koodi
		,'etl: p_lataa_d_opetustehtava' AS source
	FROM sa.sa_koodistot
	where koodisto = 'opetustehtava'
) AS src
ON target.koodi = src.koodi

WHEN MATCHED
	THEN
		UPDATE
		SET 
			selite_fi = src.nimi
			,selite_sv = src.nimi_sv
			,selite_en = src.nimi_en
			,selite2_fi = src.nimi2
			,selite2_sv = src.nimi2_sv
			,selite2_en = src.nimi2_en
			,target.source = src.source

WHEN NOT MATCHED
	THEN
		INSERT (
			koodi
			,selite_fi
			,selite_sv
			,selite_en
			,selite2_fi
			,selite2_sv
			,selite2_en
			,jarjestys
			,source
			)
		VALUES (
			src.koodi
			,src.nimi
			,src.nimi_sv
			,src.nimi_en
			,src.nimi2
			,src.nimi2_sv
			,src.nimi2_en
			,src.jarjestys
			,src.source
			);

update dw.d_opetustehtava
set jarjestys2 = 
	case selite2_fi
		when 'esiopetus' then 1
		when 'esiopetus tilapäisesti ulkomailla asuville oppivelvollisille Suomen kansalaisille' then 2
		when 'kaksivuotinen esiopetus (5- ja 6-vuotiaat) (kielikoulut)' then 3
		when 'esi- ja perusopetus pidennetyn oppivelvollisuuden oppilaille' then 4
		when 'perusopetukseen valmistava opetus' then 5
		when 'perusopetus' then 6
		when 'perusopetus vuosiluokat 1–6' then 7
		when 'perusopetus vuosiluokat 1–9' then 8
		when 'perusopetus vuosiluokat 7–9' then 9
		when 'perusopetus tilapäisesti ulkomailla asuville oppivelvollisille Suomen kansalaisille' then 10
		when 'aikuisten perusopetus' then 11
		when 'lisäopetus' then 12
		when 'lisäopetus pidennetyn oppivelvollisuuden piirissä olleille oppilaille' then 13
		when 'ei näytetä ollenkaan raportilla' then 14
		when 'joustava perusopetus (JOPO)' then 15
		when 'kaksivuotinen esikoulu (Helsingin eurooppalainen koulu)' then 16
		when 'alakoulu vuosiluokat 1–5  (Helsingin eurooppalainen koulu)' then 17
		when 'yläkoululukio vuosiluokat 1–7  (Helsingin eurooppalainen koulu)' then 18
	end