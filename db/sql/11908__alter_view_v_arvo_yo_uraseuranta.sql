USE [ANTERO]
GO

/****** Object:  View [dw].[v_arvo_yo_uraseuranta_uusi_api_testi]    Script Date: 16.3.2026 11.58.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE OR ALTER VIEW [dw].[v_arvo_yo_uraseuranta] AS

SELECT 
	d1.kysymysid,
	d2.ika_fi as [Ikä (valmistuessa)],
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN '20–24-vuotiaat' 
		ELSE d2.ikaryhma1_fi 
	END as [Ikäryhmä (valmistuessa)],
	d3.sukupuoli_fi as Sukupuoli,
	d4.kieliryhma1_fi AS [Äidinkieli],
	d5.maatjavaltiot2_fi as [Kansalaisuus],
	d5.maanosa_fi [Kansalaisuus (maanosa)],
	d12.rahoituslahde_nimi_fi as 'Rahoituslähde',
	d6.koulutusastetaso1_fi as [Koulutusaste, taso 1],
	d6.koulutusastetaso2_fi as [Koulutusaste, taso 2],
	d6.koulutusalataso1_fi as [Koulutusala, taso 1],
	d6.koulutusalataso2_fi as [Koulutusala, taso 2],
	d6.koulutusalataso3_fi as [Koulutusala, taso 3],
	d6.okmohjauksenala_fi as [OKM ohjauksen ala],
	d6.koulutusluokitus_fi as [Koulutusnimike],
	CASE
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (1/4)','III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)') THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS.'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Miten tohtorikoulutus kehitti kyseisiä valmiuksia?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Miten tohtorikoulutus kehitti kyseisiä valmiuksia?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (4/4)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmistumisen jälkeen?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Arvioi seuraavien taitokokonaisuuksien merkityksen kehittymistä seuraavan viiden vuoden aikana?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)' THEN 'III TOHTORIKOULUTUS JA SEN MERKITYS. Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmistumisen jälkeen?'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (1/3)' THEN 'VI TYÖ JA OSAAMINEN (1/3). Arvioi, miten seuraavat tekijät ovat vaikuttaneet työllistymiseesi valmitumisen jälkeen?'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (2/3)' THEN 'VI TYÖ JA OSAAMINEN (2/3). Kuinka tärkeitä seuraavat tiedot ja taidot ovat työssäsi'	
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (3/3)' THEN 'VI TYÖ JA OSAAMINEN (3/3). Miten yliopisto-opiskelu kehitti kyseisiä valmiuksia?'	
		WHEN d1.kysymysryhma_fi in ('I TYÖMARKKINATILANTEESI', 'I  TYÖMARKKINATILANTEESI','I  TYÖMARKKINATILANNE') THEN 'I TYÖMARKKINATILANNE'
		ELSE d1.kysymysryhma_fi 
	END	as [Kysymysryhmä],
	
	-- Vuoden 2021 kysymyksiä ei ole versioitu. Muokataan kysymyksien vuosilukuja.
	CASE
		WHEN f.tilastovuosi = 2021 THEN REPLACE(REPLACE(d1.kysymys_fi, '2017','2016'),'2019','2018')
		ELSE d1.kysymys_fi 
	END as Kysymys,
	CASE 
		WHEN d1.rahoitusmallikysymys = 1 THEN
			CASE
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN '1. Koulutus antoi riittävät valmiudet työelämään.'
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN '2. Miten tyytyväinen olet kokonaisuudessaan vuonna x suorittamaasi tutkintoon työurasi kannalta?'
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN '3. Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin.'
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. Työni vastaa tällä hetkellä vaativuustasoltaan hyvin yliopistollista koulutustani.'
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN '1) analyyttiset, systemaattisen ajattelun taidot'
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN '2) tiedonhankintataidot'
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN '3) kyky oppia ja omaksua uutta'
				WHEN d1.kysymys_fi like '%tieteiden%' THEN '4) tieteidenvälisyys/moniammatillisissa ryhmissä toimiminen'
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN '5) itseohjautuvuus/oma-aloitteisuus'
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN '6) yrittäjyystaidot'
				ELSE NULL
			END
		ELSE NULL
	END as 'Kysymys (rahoitusmalli)',
	CASE 
		WHEN d1.rahoitusmallikysymys = 1 THEN
			CASE 
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN '1. Utbildningen gav tillräckliga färdigheter för arbetslivet.'
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN '2. Med tanke på din karriär, hur nöjd är du med den examen du avlade år x i sin helhet?'
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN '3. Jag kan i mitt nuvarande arbete utnyttja väl de kunskaper och färdigheter som jag lärt mig vid universitetet.'
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. Kravnivån på mitt arbete motsvarar väl min universitetsutbildning.'
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN '1) färdigheter för analytiskt och systematiskt tänkande'
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN '2) färdigheter i informationssökning'
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN '3) förmåga att lära sig och tillägna sig nytt'
				WHEN d1.kysymys_fi like '%tieteiden%' THEN '4) tvärvetenskaplighet/fungera i mångprofessionella grupper'
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN '5) självstyrande/eget initiativtagande'
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN '6) entreprenörs-/företagarförmåga'
				ELSE NULL
			END
		ELSE NULL
	END as 'Fråga (finansieringsmodell)',
	CASE 
		WHEN d1.rahoitusmallikysymys = 1 THEN
			CASE 
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN '1. The studies equipped me sufficiently for the working life.'
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN '2. How satisfied are you overall with the degree you completed in year x in terms of your career?'
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN '3. The skills and knowledge I learned at the university can be applied well in my current job.'
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN '4. The requirements of my current job correspond well with my academic qualifications.'
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN '1) analytical and systematic thinking skills'
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN '2) information retrieval skills'
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN '3) ability to learn and adopt new things'
				WHEN d1.kysymys_fi like '%tieteiden%' THEN '4) interdisciplinary/multi-professional teamwork'
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN '5) self-direction/initiative'
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN '6) entrepreneurship skills'
				ELSE NULL
			END
		ELSE NULL
	END as 'Question (funding model)',
	d11.kyselypohja_tarkenne_fi as [Kyselypohja],
	tilastovuosi as Kyselyvuosi,
	tilastovuosi as 'Tilastovuosi',
	d10.kytkin_fi as [Rahoitusmallikysymys],
	d10.kytkin_sv as 'Finansieringsmodellfråga',
	d10.kytkin_en as 'Funding modell question',

	f.rahoituskysymys_paino,

	-- CSCVIPUNEN-3471
	CASE 
		WHEN d9.id = -1 and d8.id = -1 THEN cast(f.numerovalinta as varchar)
		WHEN d9.id <> -1 THEN d9.kytkin_fi
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and tilastovuosi in (2021, 2022) THEN 'Vastauksia ei kerätty vuosina 2021 ja 2022'
		ELSE d8.vastaus_fi
	END as Monivalintavaihtoehto,
	CASE
		WHEN d9.id <> -1 THEN d9.kytkin_koodi
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and tilastovuosi IN (2021, 2022) THEN NULL
		ELSE numerovalinta
	END as numerovalinta,
	CASE	
		WHEN d1.kysymysid in (6821,6805,6950, 8366, 8382) THEN 'arvosana6' 
		WHEN d1.kysymysryhma_fi like '%III TOHTORIKOULUTUS JA SEN MERKITYS (4/4)%' or d1.kysymysryhma_fi like '%VI TYÖ JA OSAAMINEN (1/3)%' THEN 'arvosana6'
		ELSE d1.vastaustyyppi
	END as 'vastaustyyppi',

	d7.organisaatio_fi as [Korkeakoulu],
	[vastaajaid],
	1 as [lukumaara],

	tilastovuosi as 'Enkätår',
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN '20–24 år' 
		ELSE d2.ikaryhma1_sv
	END as [Åldersgrupp],
	d3.sukupuoli_sv as [Kön],
	d4.kieliryhma1_sv AS [Modersmål],
	d12.rahoituslahde_nimi_sv as 'Finansieringskälla',
	d7.organisaatio_sv as [Högskola],
	CASE
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (1/4)','III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)') THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE.'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Hur viktiga är följande kunskaper och färdigheter i ditt nuvarande arbete?'	
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Hur viktiga är följande kunskaper och färdigheter i ditt nuvarande arbete?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Hur mycket bidrog doktorsutbildningen till dessa färdigheter?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Hur mycket bidrog doktorsutbildningen till dessa färdigheter?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (4/4)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Bedöm hur följande faktorer har påverkat din sysselsättning efter utexamineringen.'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Hur bedömer du att betydelsen av följande kompetenshelheter kommer att utvecklas under de kommande fem åren?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)' THEN 'III  DOKTORSUTBILDNINGEN OCH DESS BETYDELSE. Bedöm hur följande faktorer har påverkat din sysselsättning efter utexamineringen.'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (1/3)' THEN 'VI ARBETE OCH KUNNANDE (1/3). Bedöm hur följande faktorer har påverkat din sysselsättning efter utexamineringen.'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (2/3)' THEN 'VI ARBETE OCH KUNNANDE (2/3). Hur viktiga är följande kunskaper och färdigheter i ditt nuvarande arbete?'	
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (3/3)' THEN 'VI ARBETE OCH KUNNANDE (3/3). Hur utvecklade universitetsstudierna arbetslivsfärdigheterna i fråga?'	
		WHEN d1.kysymysryhma_fi in ('I TYÖMARKKINATILANTEESI','I TYÖMARKKINATILANNE','I  TYÖMARKKINATILANTEESI','I  TYÖMARKKINATILANNE') THEN 'I  ARBETSMARKNADSSITUATION'
		WHEN d1.kysymysryhma_fi = 'IV TYÖTILANNE' THEN 'IV NUVARANDE ANSTÄLLNING OCH DESS KARAKTÄR'
		ELSE d1.kysymysryhma_sv 
	END as [Frågegrupp],
	CASE
		WHEN f.tilastovuosi = 2021 THEN REPLACE(REPLACE(d1.kysymys_sv, '2017','2016'),'2019','2018')
		ELSE d1.kysymys_sv 
	END as [Fråga],
	-- CSCVIPUNEN-3471
	CASE
		WHEN d9.id = -1 and d8.id = -1 THEN cast(f.numerovalinta as varchar)
		WHEN d9.id <> -1 THEN d9.kytkin_sv
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and tilastovuosi IN (2021, 2022) THEN 'Svar har inte samlats in åren 2021 och 2022'
		ELSE d8.vastaus_sv
	END as Flervalsalternativ,
	d6.koulutusastetaso1_sv as [Utbildningsnivå, nivå 1],
	d6.koulutusastetaso1_sv as [Utbildningsnivå, nivå 2],
	d6.koulutusalataso1_sv as [Utbildningsområde, nivå 1],
	d6.koulutusalataso2_sv as [Utbildningsområde, nivå 2],
	d6.koulutusalataso3_sv as [Utbildningsområde, nivå 3],
	d6.okmohjauksenala_sv as [UKM-styrningsområde],
	d6.koulutusluokitus_sv as [Utbildningsbenämning],
	--ENGLANTI
	tilastovuosi as 'Survey year',
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN 'Aged 20–24' 
		ELSE d2.ikaryhma1_en
	END as [Age group],
	d3.sukupuoli_en as Gender,
	d4.kieliryhma1_en as [Native language],
	d12.rahoituslahde_nimi_en as 'Source of funding',
	d7.organisaatio_en as [Higher education institution],
	CASE
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (1/4)','III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)') THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE.'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. How important are the following knowledge and skills in your current job?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. How important are the following knowledge and skills in your current job?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. How did your doctoral education develop these capabilities?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. How did your doctoral education develop these capabilities?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (4/4)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. Assess how the following factors have affected your employment after graduation.'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. How do you assess the development of the importance of the following skill sets within the five upcoming years?'
		WHEN d1.kysymysryhma_fi ='III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)' THEN 'III  DOCTORAL EDUCATION AND ITS SIGNIFICANCE. Assess how the following factors have affected your employment after graduation.'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (1/3)' THEN 'VI WORK AND COMPETENCE (1/3). Assess how the following factors have affected your employment after graduation.'
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (2/3)' THEN 'VI WORK AND COMPETENCE (2/3). How important are the following knowledge and skills in your current job?'		
		WHEN d1.kysymysryhma_fi ='VI TYÖ JA OSAAMINEN (3/3)' THEN 'VI WORK AND COMPETENCE (3/3). How did your university studies develop these skills for the working life?'
		WHEN d1.kysymysryhma_fi in ('I TYÖMARKKINATILANTEESI', 'I TYÖMARKKINATILANNE','I  TYÖMARKKINATILANTEESI','I  TYÖMARKKINATILANNE') THEN 'I  YOUR JOB MARKET SITUATION'
		ELSE d1.kysymysryhma_en 
	END as [Question group],
	CASE
		WHEN f.tilastovuosi = 2021 THEN REPLACE(REPLACE(d1.kysymys_en, '2017','2016'),'2019','2018')
		ELSE d1.kysymys_en
	END as [Question],
	-- CSCVIPUNEN-3471
	CASE
		WHEN d9.id = -1 and d8.id = -1 THEN cast(f.numerovalinta as varchar)
		WHEN d9.id <> -1 THEN d9.kytkin_en
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and tilastovuosi IN (2021, 2022) THEN 'Answers were not collected in years 2021 and 2022'
		ELSE d8.vastaus_en
	END as [Multiple choice option],
	d6.koulutusastetaso1_en as [Level of education, tier 1],
	d6.koulutusastetaso2_en as [Level of education, tier 2],
	d6.koulutusalataso1_en as [Field of education, tier 1],
	d6.koulutusalataso2_en as [Field of education, tier 2],
	d6.koulutusalataso3_en as [Field of education, tier 3],
	d6.okmohjauksenala_en as [Field of education, HE steering],
	d6.koulutusluokitus_en as [Name of education],
	CASE 
		WHEN SUBSTRING(@@SERVERNAME,4,1) = 'T' THEN 1 
		WHEN tilastovuosi < YEAR(GETDATE()) - 1 THEN 1 
		ELSE 0 -- Muutetaan manuaalisesti sen jälkeen kun on saatu julkaisulupa
	END AS vuosi_tilasto,
	d7.organisaatio_koodi as [Koodit Korkeakoulu],
	d6.koulutusluokitus_koodi as [Koodit Koulutus],
	CASE 
		WHEN d2.ika_fi in ('20','21','22','23','24') THEN 20
		ELSE d2.jarjestys_ikaryhma1 
	END as jarjestys_ikaryhma,
	d2.jarjestys_ika,
	d3.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d4.jarjestys_kieliryhma1 as [jarjestys_kieli],
	d5.jarjestys_maatjavaltiot2_koodi as [jarjestys_kansalaisuus],
	CASE 
		WHEN d1.kysymysryhma_fi in ('I TYÖMARKKINATILANNE','I TYÖMARKKINATILANTEESI','I TAUSTAKYSYMYKSET', 'I TYÖMARKKINATILANNE','I TOHTORIKOULUTUS') THEN 1
		WHEN d1.kysymysryhma_fi in ('II NYKYINEN TYÖSUHDE JA SEN LAATU','II TYYTYVÄISYYS TUTKINTOON') THEN 2
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (1/4)','III TYÖURAN KOKONAISUUS','III TOHTORIKOULUTUS JA SEN MERKITYS (1/5)','III TYÖLLISTYMINEN') THEN 3
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (2/4)','IV TYÖTILANNE','III TOHTORIKOULUTUS JA SEN MERKITYS (2/5)', 'IV NYKYINEN TYÖSUHDE JA SEN LAATU (1/3)') THEN 4
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (3/4)','V TYÖLLISTYMISEN LAATU','III TOHTORIKOULUTUS JA SEN MERKITYS (3/5)', 'IV NYKYINEN TYÖSUHDE JA SEN LAATU (2/3)') THEN 5
		WHEN d1.kysymysryhma_fi in ('VI TYÖ JA OSAAMINEN (1/3)','III TOHTORIKOULUTUS JA SEN MERKITYS (4/5)', 'IV NYKYINEN TYÖSUHDE JA SEN LAATU (3/3)') THEN 6
		WHEN d1.kysymysryhma_fi in ('III TOHTORIKOULUTUS JA SEN MERKITYS (4/4)','VI TYÖ JA OSAAMINEN (1/3)','III TOHTORIKOULUTUS JA SEN MERKITYS (5/5)', 'V TOHTORIKOULUTUKSEN KEHITTÄMINEN (1/2)') THEN 7
		WHEN d1.kysymysryhma_fi in ('IV TOHTORIOPINTOJEN RAHOITUS','VI TYÖ JA OSAAMINEN (2/3)', 'V TOHTORIKOULUTUKSEN KEHITTÄMINEN (2/2)') THEN 8
		WHEN d1.kysymysryhma_fi in ('VI TYÖ JA OSAAMINEN (3/3)') THEN 9
		WHEN d1.kysymysryhma_fi in ('VII OSAAMISEN KEHITTÄMINEN') THEN 10
		WHEN d1.kysymysryhma_fi in ('Uraseurantakyselyn erityisteema 2020: Koronaviruspandemian vaikutukset') THEN 11
		ELSE 99 
	END	[jarjestys_kysymysryhma],
	d1.kysymysjarjestys2 as [jarjestys_kysymys],
	d6.jarjestys_okmohjauksenala_koodi as [jarjestys_ohjauksenala],
	d6.jarjestys_koulutusastetaso1_koodi as [jarjestys_koulutusaste1],
	d6.jarjestys_koulutusastetaso2_koodi as [jarjestys_koulutusaste2],
	d6.jarjestys_koulutusalataso1_koodi as [jarjestys_koulutusala1],
	d6.jarjestys_koulutusalataso2_koodi as [jarjestys_koulutusala2],
	d6.jarjestys_koulutusalataso3_koodi as [jarjestys_koulutusala3],

	CASE
		WHEN d9.id = -1 and d8.id = -1 THEN cast(f.numerovalinta as varchar)
		WHEN d9.id <> -1 THEN d9.jarjestys_kytkin_koodi
		WHEN d1.kysymys_fi = '5. Mikä seuraavista vaihtoehdoista kuvaa parhaiten tähänastisen työurasi kokonaisuutta?' and tilastovuosi IN (2021, 2022) THEN '99999'
		ELSE d8.jarjestys
	END as [jarjestys_monivalinta],
	CASE 
		WHEN d1.rahoitusmallikysymys = 1 THEN
			CASE
				WHEN d1.kysymys_fi like '%Koulutus antoi riittävät valmiudet työelämään%' THEN 1
				WHEN d1.kysymys_fi like '%Miten tyytyväinen olet kokonaisuudessaan vuonna%' THEN 2
				WHEN d1.kysymys_fi like '%Pystyn hyödyntämään yliopistossa oppimiani tietoja ja taitoja nykyisessä työssäni hyvin%' THEN 3
				WHEN d1.kysymys_fi like '%Työni vastaa vaativuustasoltaan hyvin yliopistollista koulutustani%' THEN 4
				WHEN d1.kysymys_fi like '%analyyttiset%' THEN 5
				WHEN d1.kysymys_fi like '%tiedonhankinta%' THEN 6
				WHEN d1.kysymys_fi like '%kyky oppia%' THEN 7
				WHEN d1.kysymys_fi like '%tieteiden%' THEN 8
				WHEN d1.kysymys_fi like '%itseohjautuvuus%' THEN 9
				WHEN d1.kysymys_fi like '%yrittäjyys%' THEN 10
				ELSE NULL
			END
		ELSE NULL
	END as 'jarjestys_kysymys_rahoitusmalli',
	d12.jarjestys_rahoituslahde_koodi as jarjestys_rahoituslahde
FROM [ANTERO].dw.f_arvo_yo_uraseuranta  f
LEFT JOIN ANTERO.dw.d_arvokysymys d1 on d1.id = f.d_arvokysymys_id 
LEFT JOIN ANTERO.dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_kieli d4 on d4.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d5 on d5.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d7 on d7.id = f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_arvovastaus_monivalinta d8 on d8.id = f.d_arvovastaus_monivalinta_id
LEFT JOIN ANTERO.dw.d_kytkin d9 on d9.id = f.d_kytkin_vaihtoehto_id
LEFT JOIN ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = d1.rahoitusmallikysymys
LEFT JOIN ANTERO.dw.d_arvotiedonkeruu d11 on d11.id = f.d_arvotiedonkeruu_id
LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d12 on d12.id = f.d_virta_rahoituslahde_id