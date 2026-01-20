USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_kaksois_ja_kolmoistutkinnot]    Script Date: 30.7.2025 7.58.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dw].[v_koski_kaksois_ja_kolmoistutkinnot] AS

SELECT
	-- Aikamuuttujat
	d1a.vuosi as Tilastovuosi,
	d1a.lukukausi_fi as Tilastokausi,

	CASE
		WHEN d1b.vuosi is null THEN 'Ei ammatillista perustutkintoa'
		ELSE CONCAT(d1b.vuosi, ' ' ,d1b.lukukausi_fi)
	END as 'Ammatillisen perustutkinnon suorituslukukausi',
	CASE
		WHEN d1c.vuosi is null THEN 'Ei lukion oppimäärää'
		ELSE CONCAT(d1c.vuosi, ' ' ,d1c.lukukausi_fi)
	END as 'Lukion oppimäärän suorituslukukausi',
	CASE
		WHEN d1d.vuosi is null THEN 'Ei ylioppilastutkintoa'
		ELSE CONCAT(d1d.vuosi, ' ' ,d1d.lukukausi_fi)
	END as 'Ylioppilastutkinnon suorituslukukausi',

	-- Henkilömuuttujat
	d2.maanosa1_fi as Kansalaisuus,
	d3.kieli_fi as 'Äidinkieli',
	d4.sukupuoli_fi as Sukupuoli,
	d7.ika_fi as 'Ikä',

	-- Koulutusmuuttujat
	d5.koulutusalataso1_fi as 'Koulutusala, taso 1 (ammatillinen perustutkinto)',
	d5.koulutusalataso2_fi as 'Koulutusala, taso 2 (ammatillinen perustutkinto)',
	d5.koulutusalataso3_fi as 'Koulutusala, taso 3 (ammatillinen perustutkinto)',
	d5.koulutusluokitus_fi as 'Tutkinto (ammatillinen perustutkinto)',

	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 'Ei suorituksia'
		ELSE CONCAT(FLOOR(cast(suoritetut_kurssit_lukio as float) / 2 / 5) * 5 + 1, '-', CEILING(cast(suoritetut_kurssit_lukio as float) / 2 / 5 + 0.001) * 5, ' ', d8b.nimi)
	END as 'Lukio-opintojen laajuus kursseissa (tarkka)',
	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 'Ei suorituksia'
		ELSE CONCAT(FLOOR(cast(suoritetut_kurssit_lukio as float) / 2 / 25) * 25 + 1, '-', CEILING(cast(suoritetut_kurssit_lukio as float) / 2 / 25 + 0.001) * 25, ' ', d8b.nimi)
	END as 'Lukio-opintojen laajuus kursseissa',
	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 'Ei suorituksia'
		ELSE CONCAT(FLOOR(cast(suoritetut_kurssit_lukio as float) / 10) * 10 + 1, '-', CEILING(cast(suoritetut_kurssit_lukio as float) / 10 + 0.001) * 10, ' ', d8.nimi)
	END as 'Lukio-opintojen laajuus opintopisteissä (tarkka)',
	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 'Ei suorituksia'
		ELSE CONCAT(FLOOR(cast(suoritetut_kurssit_lukio as float) / 50) * 50 + 1, '-', CEILING(cast(suoritetut_kurssit_lukio as float) / 50 + 0.001) * 50, ' ', d8.nimi)
	END as 'Lukio-opintojen laajuus opintopisteissä',
	CASE WHEN d1d.vuosi is not null THEN COALESCE(d11.aine_selite_fi, 'Tieto puuttuu') ELSE COALESCE(d11.aine_selite_fi, 'Ei ylioppilastutkintoa') END as 'Ylioppilastutkinnon aine',
	CASE
		WHEN f.master_oid_tiedossa = 0 THEN 'Tieto ammatillisen perustutkinnon ja lukion oppimäärän suorittamisesta puuttuu'
		WHEN f.hetu_tiedossa = 0 THEN 'Tieto ylioppilastutkinnon suorittamisesta puuttuu'
		ELSE 'Ei puutteitta'
	END as 'Suoritustietojen kattavuus',

	CASE 
		WHEN f.kolmoistutkinto_sama_lk = 1 THEN 'Kolmoistutkinto'
		WHEN f.kaksoistutkinto_sama_lk = 1 THEN 'Kaksoistutkinto'
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 'Ammatillinen perustutkinto'
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 'Ylioppilastutkinto'
		ELSE 'Lukion oppimäärä'
	END as 'Suorituksen tyyppi (suoritus samana lukukautena)', 
	CASE 
		WHEN f.kolmoistutkinto_1_lk = 1 THEN 'Kolmoistutkinto'
		WHEN f.kaksoistutkinto_1_lk = 1 THEN 'Kaksoistutkinto'
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 'Ammatillinen perustutkinto'
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 'Ylioppilastutkinto'
		ELSE 'Lukion oppimäärä'
	END as 'Suorituksen tyyppi (suoritus enintään 2 lukukautena)',
	CASE 
		WHEN f.kolmoistutkinto_2_lk = 1 THEN 'Kolmoistutkinto'
		WHEN f.kaksoistutkinto_2_lk = 1 THEN 'Kaksoistutkinto'
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 'Ammatillinen perustutkinto'
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 'Ylioppilastutkinto'
		ELSE 'Lukion oppimäärä'
	END as 'Suorituksen tyyppi (suoritus enintään 3 lukukautena)', 
	CASE 
		WHEN f.kolmoistutkinto_3_lk = 1 THEN 'Kolmoistutkinto'
		WHEN f.kaksoistutkinto_3_lk = 1 THEN 'Kaksoistutkinto'
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 'Ammatillinen perustutkinto'
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 'Ylioppilastutkinto'
		ELSE 'Lukion oppimäärä'
	END as 'Suorituksen tyyppi (suoritus enintään 4 lukukautena)', 

	CASE
		WHEN f.amm_lukio_ero = -1 THEN 'Ei suoritettu'
		ELSE cast(f.amm_lukio_ero as varchar) 
	END as 'Lukukaudet ammatillisen tutkinnon ja lukion oppimäärän välillä',
	CASE
		WHEN f.lukio_yo_ero = -1 THEN 'Ei suoritettu'
		ELSE cast(f.lukio_yo_ero as varchar) 
	END as 'Lukukaudet lukion oppimäärän ja ylioppilastutkinnon välillä',
	CASE
		WHEN amm_yo_ero = -1 THEN 'Ei suoritettu'
		ELSE cast(amm_yo_ero as varchar) 
	END as 'Lukukaudet ammatillisen tutkinnon ja ylioppilastutkinnon välillä',
	-- Organisaatiomuuttujat
	d6a.organisaatio_fi as 'Ammatillisen perustutkinnon oppilaitos',
	d6b.organisaatio_fi as 'Lukion oppimäärän oppilaitos',
	d6c.organisaatio_fi as 'Ylioppilastutkinnon oppilaitos',
	d9a.organisaatio_fi as 'Ammatillisen perustutkinnon koulutuksen järjestäjä',
	d9b.organisaatio_fi as 'Lukion oppimäärän koulutuksen järjestäjä',
	d9c.organisaatio_fi as 'Ylioppilastutkinnon koulutuksen järjestäjä',
	d10a.hyvinvointialue_fi as 'Ammatillisen perustutkinnon koulutuksen järjestäjän hyvinvointialue',
	d10b.hyvinvointialue_fi as 'Lukion oppimäärän koulutuksen järjestäjän hyvinvointialue',
	d10c.hyvinvointialue_fi as 'Ylioppilastutkinnon koulutuksen järjestäjän hyvinvointialue',
	d10a.maakunta_fi as 'Ammatillisen perustutkinnon koulutuksen järjestäjän maakunta',
	d10b.maakunta_fi as 'Lukion oppimäärän koulutuksen järjestäjän maakunta',
	d10c.maakunta_fi as 'Ylioppilastutkinnon koulutuksen järjestäjän maakunta',
	d10a.kunta_fi as 'Ammatillisen perustutkinnon koulutuksen järjestäjän kunta',
	d10b.kunta_fi as 'Lukion oppimäärän koulutuksen järjestäjän kunta',
	d10c.kunta_fi as 'Ylioppilastutkinnon koulutuksen järjestäjän kunta',

	-- Apumuuttujat
	f.master_oid as oppija_oid,
	f.suorittanut_ammatillisen_perustutkinnon,
	f.suorittanut_ylioppilastutkinnon,
	f.suorittanut_lukion_oppimaaran,
	f.kaksoistutkinto_sama_lk,
	f.kaksoistutkinto_1_lk,
	f.kaksoistutkinto_2_lk,
	f.kaksoistutkinto_3_lk,
	f.kolmoistutkinto_sama_lk,
	f.kolmoistutkinto_1_lk,
	f.kolmoistutkinto_2_lk,
	f.kolmoistutkinto_3_lk,

	-- Koodit

	d9a.organisaatio_koodi as 'Koodit Ammatillisen perustutkinnon koulutuksen järjestäjä',
	d9b.organisaatio_koodi as 'Koodit Lukion oppimäärän koulutuksen järjestäjä',
	d9b.organisaatio_koodi as 'Koodit Ylioppilastutkinnon koulutuksen järjestäjä',

	-- Järjestys
	CASE 
		WHEN f.kolmoistutkinto_sama_lk = 1 THEN 1
		WHEN f.kaksoistutkinto_sama_lk = 1 THEN 2
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 3
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 4
		ELSE 5
	END as 'Jarjestys Suorituksen tyyppi suoritus samana lukukautena', 
	CASE 
		WHEN f.kolmoistutkinto_1_lk = 1 THEN 1
		WHEN f.kaksoistutkinto_1_lk = 1 THEN 2
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 3
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 4
		ELSE 5
	END as 'Jarjestys Suorituksen tyyppi suoritus enintään 2 lukukautena',
	CASE 
		WHEN f.kolmoistutkinto_2_lk = 1 THEN 1
		WHEN f.kaksoistutkinto_2_lk = 1 THEN 2
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 3
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 4
		ELSE 5
	END as 'Jarjestys Suorituksen tyyppi suoritus enintään 3 lukukautena', 
	CASE 
		WHEN f.kolmoistutkinto_3_lk = 1 THEN 1
		WHEN f.kaksoistutkinto_3_lk = 1 THEN 2
		WHEN d1b.vuosi = d1a.vuosi and d1b.lukukausi_fi = d1a.lukukausi_fi THEN 3
		WHEN d1d.vuosi = d1a.vuosi and d1d.lukukausi_fi = d1a.lukukausi_fi THEN 4
		ELSE 5
	END as 'Jarjestys Suorituksen tyyppi suoritus enintään 4 lukukautena',
		CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 9999
		ELSE FLOOR(cast(suoritetut_kurssit_lukio as float) / 2 / 5) * 5 + 1
	END as 'Jarjestys Lukio-opintojen laajuus kursseissa (tarkka)',
	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 9999
		ELSE FLOOR(cast(suoritetut_kurssit_lukio as float) / 2 / 25) * 25 + 1
	END as 'Jarjestys Lukio-opintojen laajuus kursseissa',
	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 9999
		ELSE FLOOR(cast(suoritetut_kurssit_lukio as float) / 10) * 10 + 1
	END as 'Jarjestys Lukio-opintojen laajuus opintopisteissä (tarkka)',
	CASE 
		WHEN f.suoritetut_kurssit_lukio is null or f.suoritetut_kurssit_lukio = 0 THEN 9999
		ELSE FLOOR(cast(suoritetut_kurssit_lukio as float) / 50) * 50 + 1
	END as 'Jarjestys Lukio-opintojen laajuus opintopisteissä',

	d10a.jarjestys_hyvinvointialue_koodi as 'Jarjestys Ammatillisen perustutkinnon koulutuksen jarjestajan hyvinvointialue',
	d10b.jarjestys_hyvinvointialue_koodi as 'Jarjestys Lukion oppimäärän koulutuksen jarjestajan hyvinvointialue',
	d10c.jarjestys_hyvinvointialue_koodi as 'Jarjestys Ylioppilastutkinnon koulutuksen jarjestajan hyvinvointialue',
	d10a.jarjestys_maakunta_koodi as 'Jarjestys Ammatillisen perustutkinnon koulutuksen jarjestajan maakunta',
	d10b.jarjestys_maakunta_koodi as 'Jarjestys Lukion oppimäärän koulutuksen jarjestajan maakunta',
	d10c.jarjestys_maakunta_koodi as 'Jarjestys Ylioppilastutkinnon koulutuksen jarjestajan maakunta',
	d10a.jarjestys_kunta_koodi as 'Jarjestys Ammatillisen perustutkinnon koulutuksen jarjestajan kunta',
	d10b.jarjestys_kunta_koodi as 'Jarjestys Lukion oppimäärän koulutuksen jarjestajan kunta',
	d10c.jarjestys_kunta_koodi as 'Jarjestys Ylioppilastutkinnon koulutuksen jarjestajan kunta',
	CASE WHEN d1d.vuosi is not null THEN COALESCE(d11.aine_selite_fi, 'ÖÖÄ') ELSE COALESCE(d11.aine_selite_fi, 'ÖÖÖ') END as 'Jarjestys Ylioppilastutkinnon aine'

FROM [ANTERO].[dw].[f_koski_kaksois_ja_kolmoistutkinnot] f
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1a on d1a.id = f.d_kalenteri_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1b on d1b.id = f.d_kalenteri_amm_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1c on d1c.id = f.d_kalenteri_lukio_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d1d on d1d.id = f.d_kalenteri_yo_id
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d2 on d2.id = f.d_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_kieli] d3 on d3.id = f.d_aidinkieli_id
LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d4 on d4.id = f.d_sukupuoli_id
LEFT JOIN [ANTERO].[dw].[d_koulutusluokitus] d5 on d5.id = f.d_koulutusluokitus_amm_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d6a on d6a.id = f.d_organisaatioluokitus_amm_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d6b on d6b.id = f.d_organisaatioluokitus_lukio_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d6c on d6c.id = f.d_organisaatioluokitus_yo_id
LEFT JOIN [ANTERO].[dw].[d_ika] d7 on d7.id = f.d_ika_id
LEFT JOIN [ANTERO].[dw].[d_opintojenlaajuusyksikko] d8 on d8.id = f.d_opintojenlaajuusyksikko_id
LEFT JOIN [ANTERO].[dw].[d_opintojenlaajuusyksikko] d8b on d8b.koodiarvo = 4
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d9a on d9a.id = f.d_organisaatioluokitus_koulutustoimija_amm_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d9b on d9b.id = f.d_organisaatioluokitus_koulutustoimija_lukio_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d9c on d9c.id = f.d_organisaatioluokitus_koulutustoimija_yo_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d10a on d10a.kunta_koodi = d9a.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d10b on d10b.kunta_koodi = d9b.kunta_koodi
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d10c on d10c.kunta_koodi = d9c.kunta_koodi
LEFT JOIN [ANTERO].[sa].[sa_ytl_aine] d11 on d11.koodi = f.yo_aine_koodi


GO


