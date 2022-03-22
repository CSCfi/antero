USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_oppivelvolliset]    Script Date: 21.3.2022 14:42:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_koski_oppivelvolliset] AS

SELECT 

	-- Aikamuuttujat
	 f.[tilastovuosi] as Tilastovuosi
    ,d11.kuukausi_fi as Tilastokuukausi
	,f.[ajankohta] as 'Tiedon ajankohta'

	-- Henkilömuuttujat
	,d1.sukupuoli_fi as Sukupuoli
	,d2.ika_fi as Ikä
	,f.syntymavuosi as Syntymävuosi
	,d3.kunta_fi as Kotikunta
	,d3.maakunta_fi as Kotimaakunta
	,d4.kieli_fi as 'Äidinkieli'
	,d5.maanosa1_fi as Kansalaisuus
	,CASE 
		WHEN f.oppivelvollisen_toiminta = 1 THEN 'Suorittanut toisen asteen tutkinnon'
		WHEN f.oppivelvollisen_toiminta = 2 THEN 'Täyttänyt 18 vuotta'
		WHEN f.oppivelvollisen_toiminta = 3 AND f.koulutusmuoto = 'ammatillinenkoulutus' THEN 'Tutkintoon johtavassa ammatillisessa koulutuksessa'
		WHEN f.oppivelvollisen_toiminta = 3 THEN 'Tutkintoon johtavassa lukiokoulutuksessa'
		WHEN f.oppivelvollisen_toiminta = 5 THEN 'Suorittaa perusopetuksen oppimäärää'
		WHEN f.oppivelvollisen_toiminta = 6 THEN 'Esiopetuksessa'
		WHEN f.oppivelvollisen_toiminta = 7 THEN 'Tutkintoon johtamattomassa koulutuksessa (kelpaa oppivelvollisuuden suorittamiseen)'
		WHEN f.oppivelvollisen_toiminta = 8 THEN 'Keskeyttänyt oppivelvollisuuden suorittamisen väliaikaisesti'
		WHEN f.oppivelvollisen_toiminta = 9 THEN 'Tutkintoon johtamattomassa koulutuksessa (ei kelpaa oppivelvollisuuden suorittamiseen)'
		WHEN f.oppivelvollisen_toiminta in (10,11,12) THEN 'Ei koulutuksessa'
	END AS 'Oppivelvollisen toiminta, taso 2'

	,CASE 
		WHEN f.oppivelvollisen_toiminta in (1,2) THEN 'Suorittanut oppivelvollisuuden'
		WHEN f.oppivelvollisen_toiminta in (3,5,6,7) THEN 'Suorittaa oppivelvollisuutta'
		WHEN f.oppivelvollisen_toiminta in (8,9,10,11,12) THEN 'Ei suorita oppivelvollisuutta' 
	END AS 'Oppivelvollisen toiminta, taso 1'
	,d12.kytkin_fi as 'Suorittanut perusopetuksen oppimäärän'
	,d13.kytkin_fi as 'Oppivelvollisuuden suorittamiseen kelpaavassa koulutuksessa'
	-- Koulutusmuuttujat
	,d6.koulutusalataso1_fi  as 'Koulutusala, taso 1'
	,d6.koulutusalataso2_fi as 'Koulutusala, taso 2'
	,d6.koulutusalataso3_fi as 'Koulutusala, taso 3'
	,d6.koulutusastetaso1_fi as 'Koulutusaste, taso 1'
	,d6.koulutusastetaso2_fi as 'Koulutusaste, taso 2'
	,CASE
		WHEN koulutusmuoto  = 'aikuistenperusopetus' THEN 'Aikuisten perusopetus'
		WHEN koulutusmuoto = 'ammatillinenkoulutus' THEN 'Ammatillinen koulutus'
		WHEN koulutusmuoto = 'diatutkinto' THEN 'DIA-tutkinto'
		WHEN koulutusmuoto  = 'esiopetus' THEN 'Esiopetus'
		WHEN koulutusmuoto  = 'ibtutkinto' THEN 'IB-tutkinto'
		WHEN koulutusmuoto  = 'internationalschool' THEN 'International school'
		WHEN koulutusmuoto  = 'lukiokoulutus' THEN 'Lukiokoulutus'
		WHEN koulutusmuoto  = 'luva' THEN 'Lukiokoulutukseen valmistava koulutus'
		WHEN koulutusmuoto  = 'perusopetukseenvalmistavaopetus' THEN 'Perusopetukseen valmistava opetus'
		WHEN koulutusmuoto  = 'perusopetuksenlisaopetus' THEN 'Perusopetuksen lisäopetus'
		WHEN koulutusmuoto  = 'perusopetus' THEN 'Perusopetus'
		WHEN koulutusmuoto  = 'vapaansivistystyonkoulutus' THEN 'Vapaan sivistystyön koulutus' 
		ELSE koulutusmuoto
	END as Koulutusmuoto
	,d15.kunta_fi as 'Perusopetuksen suorituskunta'
	,d15.maakunta_fi as 'Perusopetuksen suoritusmaakunta'
	-- Organisaatiomuuttujat
	,d7.organisaatio_fi as Oppilaitos
	,d7.oppilaitostyyppi_fi as Oppilaitostyyppi
	,d9.maakunta_fi as 'Oppilaitoksen maakunta'
	,d9.kunta_fi as 'Oppilaitoksen kunta'
	,d7.oppilaitoksenopetuskieli_fi as 'Oppilaitoksen opetuskieli'

	,d8.organisaatio_fi as 'Koulutuksen järjestäjä'
	,d10.maakunta_fi as 'Koulutuksen järjestäjän maakunta'
	,d10.kunta_fi as 'Koulutuksen järjestäjän kunta'

	-- Apumuuttujat

    ,[oppija_oid]

	-- Järjestysmuuttujat

	,CASE 
		WHEN f.oppivelvollisen_toiminta in (1,2) THEN 1
		WHEN f.oppivelvollisen_toiminta in (3,4,5,6,7) THEN 2
		WHEN f.oppivelvollisen_toiminta in (8,9,10,11,12) THEN 3 END as 'Jarjestys Oppivelvollisen toiminta, taso 1'
	,CASE
		WHEN f.oppivelvollisen_toiminta = 3 AND f.koulutusmuoto != 'ammatillinenkoulutus'  THEN 4
		WHEN f.oppivelvollisen_toiminta in (10,11,12) THEN 10
		ELSE f.oppivelvollisen_toiminta
	END AS 'Jarjestys Oppivelvollisen toiminta, taso 2'

	,d6.jarjestys_koulutusalataso1_koodi as 'Jarjestys Koulutusala, taso 1'
	,d6.jarjestys_koulutusalataso2_koodi as 'Jarjestys Koulutusala, taso 2'
	,d6.jarjestys_koulutusalataso3_koodi as 'Jarjestys Koulutusala, taso 3'
	,d6.jarjestys_koulutusastetaso1_koodi as 'Jarjestys Koulutusaste, taso 1'
	,d6.jarjestys_koulutusastetaso2_koodi as 'Jarjestys Koulutusaste, taso 2'
	,d7.jarjestys_oppilaitostyyppi_koodi as 'Jarjestys Oppilaitostyyppi'
	,d9.jarjestys_maakunta_koodi as 'Jarjestys Oppilaitoksen maakunta'
	,d9.jarjestys_kunta_koodi as 'Jarjestys Oppilaitoksen kunta'
	,d7.jarjestys_oppilaitoksenopetuskieli_koodi as 'Jarjestys Oppilaitoksen opetuskieli'
	,d10.jarjestys_maakunta_koodi as 'Jarjestys Koulutuksen järjestäjän maakunta'
	,d10.jarjestys_kunta_koodi as 'Jarjestys Koulutuksen järjestäjän kunta'
	,d15.kunta_koodi as 'Jarjestys Perusopetuksen suorituskunta'
	,d15.maakunta_koodi as 'Jarjestys Perusopetuksen suoritusmaakunta'
	,f.tilastokuukausi as 'Jarjestys Tilastokuukausi'
FROM [ANTERO].[dw].[f_koski_oppivelvolliset] f
LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
LEFT JOIN [ANTERO].[dw].[d_ika] d2 on d2.id = f.d_ika_id 
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d3 on d3.id = f.d_alueluokitus_id 
LEFT JOIN [ANTERO].[dw].[d_kieli] d4 on d4.id = f.d_kieli_id 
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d5 on d5.id = f.d_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d6 on d6.id = f.d_koulutusluokitus_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d7 on d7.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d8 on d8.id = f.d_organisaatioluokitus_koulutuksen_jarjestaja_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d9 on d9.kunta_koodi = d7.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d10 on d10.kunta_koodi = d8.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d11 on d11.kalenteri_avain = f.ajankohta
LEFT JOIN [ANTERO].[dw].[d_kytkin] d12 on d12.id = f.d_kytkin_suorittanut_perusopetuksen_oppimaaran_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d13 on d13.id = f.d_kytkin_kelpaa_oppivelvollisuuden_suorittamiseen
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d14 on d14.id = f.d_organisaatioluokitus_perusopetuksen_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d15 on d15.kunta_koodi = d14.kunta_koodi


GO

USE [ANTERO]