USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 28.11.2022 10:28:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   VIEW [dw].[v_koski_tuva_opiskelijat_kuukausittainen] AS

SELECT --top 1000

	-- Aikamuuttujat
	f.[tilastovuosi] as 'Tilastovuosi'
	,d11.kuukausi_fi as 'Tilastokuukausi'

	-- Henkilömuuttujat
	,d2.ikaryhma6_fi as 'Ikä'
	,d1.sukupuoli_fi as 'Sukupuoli'
	,d4.kieliryhma1_fi as 'Äidinkieli (ryhmä)'
	,d3.maanosa1_fi as 'Kansalaisuus (ryhmä)'

	-- Koulutusmuuttujat
	,d11.lukuvuosi as 'Lukuvuosi'
	,d11.lukukausi_fi as 'Lukukausi'
	,d5.erityisopetus_ryhma_fi  as 'Erityisopetus'
	,d10.kytkin_fi as 'Majoitus'
	,d12.kieli_fi as 'Suorituskieli'

	-- Organisaatiomuuttujat
	,d7.organisaatio_fi as 'Oppilaitos'
	,d9.maakunta_fi as 'Oppilaitoksen maakunta'
	,d9.kunta_fi as 'Oppilaitoksen kunta'
	,d7.oppilaitoksenopetuskieli_fi as 'Oppilaitoksen opetuskieli'
	,d6.organisaatio_fi as 'Koulutuksen järjestäjä'
	,d6.koulutuksen_jarjestajan_yritysmuoto as 'Koulutuksen järjestäjän yrtysmuoto'
	,CASE
		WHEN f.[tuva_jarjestamislupa] = 'ammatillinen' THEN 'Ammatillisen koulutuksen rahoitusjärjestelmä (TUVA)'
		WHEN f.[tuva_jarjestamislupa] = 'lukio' THEN 'Lukiokoulutuksen rahoitusjärjestelmä (TUVA)'
		WHEN f.[tuva_jarjestamislupa] = 'perusopetus' THEN 'Perusopetuksen rahoitusjärjestelmä (TUVA)' END
		as 'Rahoitusjärjestelmä'
	,d8.organisaatio_fi as 'Toimipiste'
	,d9.avi_fi as 'Oppilaitoksen AVI'
	,d9.ely_fi as 'Oppilaitoksen ELY'

	-- Apumuuttujat
    ,f.[oppija_oid] as 'apusarake_oppija_oid'
	,f.tila_20_9 as 'apusarake_tila_20_9'

	-- Järjestysmuuttujat
	,d11.kuukausi as 'Jarjestys Tilastokuukausi'
	,d2.jarjestys_ikaryhma6 as 'Jarjestys Ikä'
	,d4.jarjestys_kieliryhma1 as 'Jarjestys Äidinkieliryhmä'
	,d3.jarjestys_maatjavaltiot2_koodi as 'Järjestys Kansalaisuusryhmä'
	,d5.jarjestys_erityisopetus_koodi  as 'Järjestys Erityisopetus'
	,d7.jarjestys_oppilaitoksenopetuskieli_koodi as 'Jarjestys Oppilaitoksen opetuskieli'
	,d9.jarjestys_maakunta_koodi as 'Jarjestys Oppilaitoksen maakunta'
	,d9.jarjestys_kunta_koodi as 'Jarjestys Oppilaitoksen kunta'

FROM [ANTERO].[dw].[f_koski_tuva_opiskelijat_kuukausittainen] f
LEFT JOIN [ANTERO].[dw].[d_sukupuoli] d1 on d1.id = f.d_sukupuoli_id 
LEFT JOIN [ANTERO].[dw].[d_ika] d2 on d2.id = f.d_ika_id
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d3 on d3.id = f.d_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_kieli] d4 on d4.id = f.d_aidinkieli_id
LEFT JOIN [ANTERO].[dw].[d_erityisopetus] d5 on d5.erityisopetus_koodi = f.erityisopetus
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d6 on d6.id = f.d_koulutuksen_jarjestaja_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d7 on d7.id = f.d_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d8 on d8.id = f.d_toimipiste_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d9 on d9.id = f.d_alueluokitus_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d10 on d10.id = f.d_kytkin_majoitus_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d11 on d11.id = d_kalenteri_id
LEFT JOIN [ANTERO].[dw].[d_kieli] d12 on d12.id = f.d_suorituskieli_id

GO