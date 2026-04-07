USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_arvovastaus_monivalinta]    Script Date: 16.3.2026 10.09.47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_arvovastaus_monivalinta] AS

--TARKISTUS ONKO DIMENSIOSSA TIETO PUUTTUU -RIVI. JOS EI, NIIN LISÄTÄÄN. MUUTEN PÄIVITETÄÄN RIVI.
IF NOT EXISTS (SELECT * FROM dw.d_arvovastaus_monivalinta WHERE id=-1)

	BEGIN

	  SET identity_INSERT dw.d_arvovastaus_monivalinta on;

	  INSERT INTO dw.d_arvovastaus_monivalinta (
		id,
		koodi,
		vastaus_fi,
		vastaus_sv,
		vastaus_en,
		kysymysid,
		kysymysversio,
		jarjestys,
		source
	  )


	  SELECT
		-1,
		-1,
		nimi,
		nimi_sv,
		nimi_en,
		-1,
		1,
		99,
		'ETL: p_lataa_d_arvovastaus_monivalinta'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  ;

	  SET identity_INSERT dw.d_arvovastaus_monivalinta off;

	END

ELSE

	BEGIN

	  UPDATE d SET
		koodi = s.koodi,
		vastaus_fi = s.nimi,
		vastaus_sv = s.nimi_sv,
		vastaus_en = s.nimi_en,
		kysymysid = s.koodi,
		kysymysversio = 1,
		jarjestys = 99,
		source = 'ETL: p_lataa_d_arvovastaus_monivalinta'
	  FROM dw.d_arvovastaus_monivalinta d
	  join sa.sa_koodistot s on s.koodi=d.koodi
	  WHERE s.koodisto='vipunenmeta'
	  and s.koodi='-1'
	  ;
	END
--TARKISTUS PÄÄTTYY

--NYKYISTEN TIETOJEN PÄIVITYS TAI UUSIEN LISÄÄMINEN
MERGE dw.d_arvovastaus_monivalinta AS TARGET

	USING (

	SELECT DISTINCT
		arvo AS koodi,
		COALESCE(monivalintavaihtoehto_fi,monivalintavaihtoehto_sv,monivalintavaihtoehto_en) AS selite_fi,
		COALESCE(monivalintavaihtoehto_sv,monivalintavaihtoehto_fi,monivalintavaihtoehto_en) AS selite_sv,
		COALESCE(monivalintavaihtoehto_en,monivalintavaihtoehto_fi,monivalintavaihtoehto_sv) AS selite_en,
		kysymysid,
		kysymysversio,
		jarjestys,
		'ETL: p_lataa_d_arvovastaus_monivalinta' AS source
	FROM Arvo_SA.sa.sa_arvo_v2_monivalintavaihtoehdot

	UNION ALL

	SELECT DISTINCT
		v.jarjestys AS koodi,
		COALESCE(v.monivalintavaihtoehto_fi,v.monivalintavaihtoehto_sv,v.monivalintavaihtoehto_en) AS selite_fi,
		COALESCE(v.monivalintavaihtoehto_sv,v.monivalintavaihtoehto_fi,v.monivalintavaihtoehto_en) AS selite_sv,
		COALESCE(v.monivalintavaihtoehto_en,v.monivalintavaihtoehto_fi,v.monivalintavaihtoehto_sv) AS selite_en,
		v.kysymysid,
		v.kysymysversio,
		v.jarjestys,
		'ETL: p_lataa_d_arvovastaus_monivalinta' AS source
	FROM  Arvo_SA.sa.sa_arvo_monivalintavaihtoehdot v
	WHERE NOT EXISTS (
	SELECT top 1 * FROM Arvo_SA.sa.sa_arvo_v2_monivalintavaihtoehdot v2
	WHERE v.kysymysid = v2.kysymysid and v.kysymysversio = v2.kysymysversio
	)

	-- Alasvetovalikko-vastaukset
	UNION ALL

	SELECT DISTINCT
		k.koodi,
		k.nimi,
		coalesce(k.nimi_sv, k.nimi),
		coalesce(k.nimi_en, k.nimi),
		s.kysymysid,
		s.kysymysversio,
		k.koodi,
		'ETL: p_lataa_d_arvovastaus_monivalinta' AS source
	FROM (
		SELECT
			k.kysymysid, 
			k.kysymysversio, 	
			JSON_VALUE(REPLACE(k.metatiedot, '''', '"'), '$.koodisto') AS koodisto
		FROM Arvo_SA.sa.sa_arvo_v2_kysymykset k
		WHERE kysymystyyppi = 'alasvetovalikko'
	) s
	LEFT JOIN ANTERO.sa.sa_koodistot k on k.koodisto = LEFT(s.koodisto, CASE CHARINDEX('_', s.koodisto) WHEN 0 THEN LEN(s.koodisto) ELSE CHARINDEX('_', s.koodisto) - 1 END)


	UNION ALL

	-- Yo-uraseurannan tietoja
	SELECT
		f.*, 'ETL: p_lataa_d_arvovastaus_monivalinta' AS source
	FROM (
		SELECT DISTINCT
			CASE
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)', 'VII OSAAMISEN KEHITTÄMINEN') or d1.kysymysid in (2928,2930,2931) THEN d3.paiva - 1
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)', 'VI TYÖ JA OSAAMINEN (1/3)') and d3.paiva = 7 THEN 0
				ELSE d3.paiva
			END as koodi,
			CASE
				WHEN d1.kysymysid = 2930 THEN lkm_1_3.FI
				WHEN d1.kysymysid in (2928,2931) THEN lkm_1_5.FI
				WHEN d1.kysymysryhma_fi in ('I TOHTORIKOULUTUS', 'III TYÖLLISTYMINEN', 'IV NYKYINEN TYÖSUHDE JA SEN LAATU (2/3)', 'V TOHTORIKOULUTUKSEN KEHITTÄMINEN (1/2)', 'VI TYÖ JA OSAAMINEN (2/3)', 'VI TYÖ JA OSAAMINEN (3/3)') THEN vaikuttavuus.FI
				WHEN d1.kysymysryhma_fi in ('II NYKYINEN TYÖSUHDE JA SEN LAATU', 'II TYYTYVÄISYYS TUTKINTOON', 'V TYÖLLISTYMISEN LAATU') and d1.kysymys_fi not like '%tyytyväinen%' THEN samanmielisyys.FI
				WHEN d1.kysymysryhma_fi in ('II TYYTYVÄISYYS TUTKINTOON', 'III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)', 'III TYÖURAN KOKONAISUUS') THEN tyytyvaisyys.FI
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)', 'VI TYÖ JA OSAAMINEN (1/3)') THEN tarkeys.FI
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)') THEN vaikuttavuus2.FI
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)', 'VII OSAAMISEN KEHITTÄMINEN') THEN merkitys.FI
				ELSE NULL
			END as vastaus_fi,
			CASE
				WHEN d1.kysymysid = 2930 THEN lkm_1_3.SV
				WHEN d1.kysymysid in (2928,2931) THEN lkm_1_5.SV
				WHEN d1.kysymysryhma_fi in ('I TOHTORIKOULUTUS', 'III TYÖLLISTYMINEN', 'IV NYKYINEN TYÖSUHDE JA SEN LAATU (2/3)', 'V TOHTORIKOULUTUKSEN KEHITTÄMINEN (1/2)', 'VI TYÖ JA OSAAMINEN (2/3)', 'VI TYÖ JA OSAAMINEN (3/3)') THEN vaikuttavuus.SV
				WHEN d1.kysymysryhma_fi in ('II NYKYINEN TYÖSUHDE JA SEN LAATU', 'II TYYTYVÄISYYS TUTKINTOON', 'V TYÖLLISTYMISEN LAATU') and d1.kysymys_fi not like '%tyytyväinen%' THEN samanmielisyys.SV
				WHEN d1.kysymysryhma_fi in ('II TYYTYVÄISYYS TUTKINTOON', 'III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)', 'III TYÖURAN KOKONAISUUS') THEN tyytyvaisyys.SV
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)', 'VI TYÖ JA OSAAMINEN (1/3)') THEN tarkeys.SV
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)') THEN vaikuttavuus2.SV
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)', 'VII OSAAMISEN KEHITTÄMINEN') THEN merkitys.SV
				ELSE NULL
			END as vastaus_sv,
			CASE
				WHEN d1.kysymysid = 2930 THEN lkm_1_3.EN
				WHEN d1.kysymysid in (2928,2931) THEN lkm_1_5.EN
				WHEN d1.kysymysryhma_fi in ('I TOHTORIKOULUTUS', 'III TYÖLLISTYMINEN', 'IV NYKYINEN TYÖSUHDE JA SEN LAATU (2/3)', 'V TOHTORIKOULUTUKSEN KEHITTÄMINEN (1/2)', 'VI TYÖ JA OSAAMINEN (2/3)', 'VI TYÖ JA OSAAMINEN (3/3)') THEN vaikuttavuus.EN
				WHEN d1.kysymysryhma_fi in ('II NYKYINEN TYÖSUHDE JA SEN LAATU', 'II TYYTYVÄISYYS TUTKINTOON', 'V TYÖLLISTYMISEN LAATU') and d1.kysymys_fi not like '%tyytyväinen%' THEN samanmielisyys.EN
				WHEN d1.kysymysryhma_fi in ('II TYYTYVÄISYYS TUTKINTOON', 'III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)', 'III TYÖURAN KOKONAISUUS') THEN tyytyvaisyys.EN
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)', 'VI TYÖ JA OSAAMINEN (1/3)') THEN tarkeys.EN
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)', 'III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)') THEN vaikuttavuus2.EN
				WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)', 'VII OSAAMISEN KEHITTÄMINEN') THEN merkitys.EN
				ELSE NULL
			END as vastaus_en,
			d1.kysymysid,
			d1.kysymysversio,
			d3.paiva as jarjestys
		FROM ANTERO.dw.d_arvokysymys d1
		LEFT JOIN ANTERO.dw.d_arvotiedonkeruu d2 on d2.kyselyid = d1.kyselyid
		LEFT JOIN ANTERO.dw.d_kalenteri d3 on d3.vuosi = YEAR(GETDATE()) and d3.kuukausi = 1 and d3.paiva BETWEEN 1 and 7
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN '1 = ei lainkaan'
					WHEN d3.paiva = 2 THEN '2 = vain vähän'
					WHEN d3.paiva = 3 THEN '3 = vähän'
					WHEN d3.paiva = 4 THEN '4 = jonkin verran'
					WHEN d3.paiva = 5 THEN '5 = paljon'
					WHEN d3.paiva = 6 THEN '6 = erittäin paljon'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN '1 = inte alls'
					WHEN d3.paiva = 2 THEN '2 = obetydligt'
					WHEN d3.paiva = 3 THEN '3 = något'
					WHEN d3.paiva = 4 THEN '4 = ganska mycket'
					WHEN d3.paiva = 5 THEN '5 = mycket'
					WHEN d3.paiva = 6 THEN '6 = väldigt mycket'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN '1 = not at all'
					WHEN d3.paiva = 2 THEN '2 = only slightly'
					WHEN d3.paiva = 3 THEN '3 = a little'
					WHEN d3.paiva = 4 THEN '4 = some what'
					WHEN d3.paiva = 5 THEN '5 = a lot'
					WHEN d3.paiva = 6 THEN '6 = very much'
				END as EN
		) vaikuttavuus
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN '1 täysin eri mieltä'
					WHEN d3.paiva = 2 THEN '2 eri mieltä'
					WHEN d3.paiva = 3 THEN '3 hieman eri mieltä'
					WHEN d3.paiva = 4 THEN '4 eri mieltä'
					WHEN d3.paiva = 5 THEN '5 samaa mieltä'
					WHEN d3.paiva = 6 THEN '6 täysin samaa mieltä'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN '1 helt av annan åsikt'
					WHEN d3.paiva = 2 THEN '2 av annan åsikt'
					WHEN d3.paiva = 3 THEN '3 delvis av annan åsikt'
					WHEN d3.paiva = 4 THEN '4 delvis av samma åsikt'
					WHEN d3.paiva = 5 THEN '5 av samma åsikt'
					WHEN d3.paiva = 6 THEN '6 helt av samma åsikt'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN '1 fully disagree'
					WHEN d3.paiva = 2 THEN '2 disagree'
					WHEN d3.paiva = 3 THEN '3 somewhat disagree'
					WHEN d3.paiva = 4 THEN '4 somewhat agree'
					WHEN d3.paiva = 5 THEN '5 agree'
					WHEN d3.paiva = 6 THEN '6 fully agree'
				END as EN
		) samanmielisyys
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN '1 erittäin tyytymätön'
					WHEN d3.paiva = 2 THEN '2 tyytymätön'
					WHEN d3.paiva = 3 THEN '3 hieman tyytymätön'
					WHEN d3.paiva = 4 THEN '4 melko tyytyväinen'
					WHEN d3.paiva = 5 THEN '5 tyytyväinen'
					WHEN d3.paiva = 6 THEN '6 erittäin tyytyväinen'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN '1 mycket missnöjd'
					WHEN d3.paiva = 2 THEN '2 missnöjd'
					WHEN d3.paiva = 3 THEN '3 något missnöjd'
					WHEN d3.paiva = 4 THEN '4 ganska missnöjd'
					WHEN d3.paiva = 5 THEN '5 nöjd'
					WHEN d3.paiva = 6 THEN '6 mycket nöjd'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN '1 very dissatisfied'
					WHEN d3.paiva = 2 THEN '2 dissatisfied'
					WHEN d3.paiva = 3 THEN '3 slightly dissatisfied'
					WHEN d3.paiva = 4 THEN '4 slightly satisfied'
					WHEN d3.paiva = 5 THEN '5 satisfied'
					WHEN d3.paiva = 6 THEN '6 very satisfied'
				END as EN
		) tyytyvaisyys
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN '1 ei lainkaan tärkeä'
					WHEN d3.paiva = 2 THEN '2 vain vähän merkitystä'
					WHEN d3.paiva = 3 THEN '3 jonkin verran merkitystä'
					WHEN d3.paiva = 4 THEN '4 melko tärkeä'
					WHEN d3.paiva = 5 THEN '5 tärkeä'
					WHEN d3.paiva = 6 THEN '6 erittäin tärkeä'
					WHEN d3.paiva = 7 THEN '0 vaihtoehto ei koske minua'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN '1 inte alls viktigt'
					WHEN d3.paiva = 2 THEN '2 endast ringa betydelse'
					WHEN d3.paiva = 3 THEN '3 i någon mån betydelse'
					WHEN d3.paiva = 4 THEN '4 ganska viktigt'
					WHEN d3.paiva = 5 THEN '5 viktigt'
					WHEN d3.paiva = 6 THEN '6 mycket viktigt'
					WHEN d3.paiva = 7 THEN '0 alternativet berör inte mig'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN '1 not important at all'
					WHEN d3.paiva = 2 THEN '2 only slightly important'
					WHEN d3.paiva = 3 THEN '3 somewhat important'
					WHEN d3.paiva = 4 THEN '4 moderately imporant'
					WHEN d3.paiva = 5 THEN '5 important'
					WHEN d3.paiva = 6 THEN '6 very important'
					WHEN d3.paiva = 7 THEN '0 not applicable'
				END as EN
		) tarkeys
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN '1 ei lainkaan'
					WHEN d3.paiva = 2 THEN '2 vain vähän'
					WHEN d3.paiva = 3 THEN '3 vähän'
					WHEN d3.paiva = 4 THEN '4 jonkin verran'
					WHEN d3.paiva = 5 THEN '5 paljon'
					WHEN d3.paiva = 6 THEN '6 erittäin paljon'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN '1 inte alls'
					WHEN d3.paiva = 2 THEN '2 obetydligt'
					WHEN d3.paiva = 3 THEN '3 något'
					WHEN d3.paiva = 4 THEN '4 ganska mycket'
					WHEN d3.paiva = 5 THEN '5 mycket'
					WHEN d3.paiva = 6 THEN '6 väldigt mycket'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN '1 not at all'
					WHEN d3.paiva = 2 THEN '2 only slightly'
					WHEN d3.paiva = 3 THEN '3 to some degree'
					WHEN d3.paiva = 4 THEN '4 quite well'
					WHEN d3.paiva = 5 THEN '5 well'
					WHEN d3.paiva = 6 THEN '6 very well'
				END as EN
		) vaikuttavuus2
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN '0 en pysty arvioimaan merkityksen kehittymistä'
					WHEN d3.paiva = 2 THEN '1 merkitys vähenee selvästi'
					WHEN d3.paiva = 3 THEN '2 merkitys vähenee hieman'
					WHEN d3.paiva = 4 THEN '3 merkitys pysyy ennallaan'
					WHEN d3.paiva = 5 THEN '4 merkitys kasvaa hieman'
					WHEN d3.paiva = 6 THEN '5 merkitys kasvaa selvästi'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN '0 jag kan inte bedöma betydelsen'
					WHEN d3.paiva = 2 THEN '1 betydelsen minskar betydligt'
					WHEN d3.paiva = 3 THEN '2 betydelsen minskar en aning'
					WHEN d3.paiva = 4 THEN '3 betydelsen bibehålls'
					WHEN d3.paiva = 5 THEN '4 betydelsen ökar en aning'
					WHEN d3.paiva = 6 THEN '5 betydelsen ökar betydligt'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN '0 I cannot assess the development of the importance'
					WHEN d3.paiva = 2 THEN '1 importance decreases clearly'
					WHEN d3.paiva = 3 THEN '2 importance decreases slightly'
					WHEN d3.paiva = 4 THEN '3 importance remains the same'
					WHEN d3.paiva = 5 THEN '4 importance increases slightly'
					WHEN d3.paiva = 6 THEN '5 importance increases clearly'
				END as EN
		) merkitys
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN 'Ei yhtään'
					WHEN d3.paiva = 2 THEN 'Yksi'
					WHEN d3.paiva = 3 THEN 'Kaksi'
					WHEN d3.paiva = 4 THEN 'Vähintään kolme'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN 'Ingen'
					WHEN d3.paiva = 2 THEN 'Ett'
					WHEN d3.paiva = 3 THEN 'Två'
					WHEN d3.paiva = 4 THEN 'Minst tre'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN 'None'
					WHEN d3.paiva = 2 THEN 'One'
					WHEN d3.paiva = 3 THEN 'Two'
					WHEN d3.paiva = 4 THEN 'At least three'
				END as EN
		) lkm_1_3
		OUTER APPLY (
			SELECT 
				CASE
					WHEN d3.paiva = 1 THEN 'Ei yhtään'
					WHEN d3.paiva = 2 THEN 'Yksi'
					WHEN d3.paiva = 3 THEN 'Kaksi'
					WHEN d3.paiva = 4 THEN 'Kolme'
					WHEN d3.paiva = 5 THEN 'Neljä'
					WHEN d3.paiva = 6 THEN 'Vähintään viisi'
				END as FI,
				CASE
					WHEN d3.paiva = 1 THEN 'Ingen'
					WHEN d3.paiva = 2 THEN 'Ett'
					WHEN d3.paiva = 3 THEN 'Två'
					WHEN d3.paiva = 4 THEN 'Tre'
					WHEN d3.paiva = 5 THEN 'Fyra'
					WHEN d3.paiva = 6 THEN 'Minst fem'
				END as SV,
				CASE
					WHEN d3.paiva = 1 THEN 'None'
					WHEN d3.paiva = 2 THEN 'One'
					WHEN d3.paiva = 3 THEN 'Two'
					WHEN d3.paiva = 4 THEN 'Three'
					WHEN d3.paiva = 5 THEN 'Four'
					WHEN d3.paiva = 6 THEN 'At least five'
				END as EN
		) lkm_1_5
		WHERE d2.kyselytyyppi = 'yo-uraseuranta' and (d1.vastaustyyppi in ('arvosana', 'arvosana6') or d1.kysymysid in (2928,2930,2931))
	) f
	WHERE f.vastaus_fi is not null

	UNION ALL

	SELECT DISTINCT
		CASE
			WHEN kysymysid in (10142,10267,13791) THEN v.jarjestys
			ELSE v.jarjestys + 1
		END AS koodi,
		COALESCE(v.monivalintavaihtoehto_fi,v.monivalintavaihtoehto_sv,v.monivalintavaihtoehto_en) AS selite_fi,
		COALESCE(v.monivalintavaihtoehto_sv,v.monivalintavaihtoehto_fi,v.monivalintavaihtoehto_en) AS selite_sv,
		COALESCE(v.monivalintavaihtoehto_en,v.monivalintavaihtoehto_fi,v.monivalintavaihtoehto_sv) AS selite_en,
		CASE
			WHEN kysymysid = 13791 and d.paiva = 2 THEN 10683
			WHEN kysymysid = 13791 and d.paiva = 3 THEN 10695
			ELSE kysymysid + d.paiva
		end as kysymysid,
		CASE
			WHEN kysymysid = 13791 THEN 1
			ELSE v.kysymysversio
		END as kysymysversio,
		v.jarjestys,
		'ETL: p_lataa_d_arvovastaus_monivalinta' AS source
	FROM  Arvo_SA.sa.sa_arvo_monivalintavaihtoehdot v
	LEFT JOIN ANTERO.dw.d_kalenteri d on d.vuosi = YEAR(GETDATE()) and d.kuukausi = 1 and (d.paiva between 2 and case when kysymysid in (3206,13791) then 3 else 2 end or (kysymysid = 8238 and d.paiva = 4))
	WHERE kysymysid in (2946,3106,3141,3206,8238,8252,8389,10142,10267,13791)

	 ) AS src

ON TARGET.koodi = src.koodi 
and TARGET.kysymysid = src.kysymysid
and TARGET.kysymysversio = src.kysymysversio

WHEN MATCHED THEN

	UPDATE SET
		koodi = src.koodi,
		vastaus_fi = src.selite_fi,
		vastaus_sv = src.selite_sv,
		vastaus_en = src.selite_en,
		kysymysid = src.kysymysid,
		kysymysversio = src.kysymysversio,
		jarjestys = src.jarjestys,
		TARGET.source = src.source

WHEN NOT MATCHED THEN

	INSERT (
	koodi,
	vastaus_fi,
	vastaus_sv,
	vastaus_en,
	kysymysid,
	kysymysversio,
	jarjestys,
	source
	)

	VALUES (
	src.koodi,
	src.selite_fi,
	src.selite_sv,
	src.selite_en,
	src.kysymysid,
	src.kysymysversio,
	src.jarjestys,
	src.source
	);

-- Lisää korjauksia yo-uraseurantaan
UPDATE ANTERO.dw.d_arvovastaus_monivalinta
	SET koodi = koodi + 1
WHERE kysymysid in (10119,7801,8366,2924,6805,8252,8345) 

UPDATE ANTERO.dw.d_arvovastaus_monivalinta
SET koodi = CASE WHEN koodi = 6 THEN 0 ELSE koodi + 1 END, jarjestys = jarjestys + 1 
WHERE	kysymysid BETWEEN 6843 and 6852 or 
		kysymysid BETWEEN 8332 and 8342 or 
		kysymysid BETWEEN 8404 and 8413 or 
		kysymysid BETWEEN 10663 and 10672

UPDATE ANTERO.dw.d_arvovastaus_monivalinta
	SET koodi = CASE 
					WHEN kysymysid = 13811 and koodi = 4 THEN 5
					WHEN kysymysid = 13811 and koodi = 9 THEN 4
					ELSE jarjestys
				END
WHERE kysymysid in (13811,13876) and kysymysversio >= 2