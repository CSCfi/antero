USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_tuva_opiskelijat_kuukausittainen]    Script Date: 23.1.2023 14:18:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER   VIEW [dw].[v_koski_tuva_opiskelijat_kuukausittainen] AS

SELECT --top 1000

	-- Aikamuuttujat
	f.[tilastovuosi] as 'Tilastovuosi'
	,d11.kuukausi_fi as 'Tilastokuukausi'
	,d14.kytkin_fi as 'Opiskeluoikeus alkanut tilastokuukauden aikana'
	,d13.vuosi as 'Opiskeluoikeuden alkamisvuosi'
	,d13.kuukausi_fi as 'Opiskeluoikeuden alkamiskuukausi'
	,f.oo_alkamisajankohta as 'Opiskeluoikeuden alkamisajankohta'

	-- Henkil�muuttujat
	,d2.ikaryhma6_fi as 'Ik�'
	,d1.sukupuoli_fi as 'Sukupuoli'
	,d4.kieliryhma1_fi as '�idinkieli (ryhm�)'
	,d4.kieli_fi as '�idinkieli'
	,d3.maanosa1_fi as 'Kansalaisuus (ryhm�)'
	,d3.maanosa_fi as 'Kansalaisuus (maanosa)'
	,d3.maatjavaltiot2_fi as 'Kansalaisuus (tarkka)'

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
	,d6.organisaatio_fi as 'Koulutuksen j�rjest�j�'
	,d6.koulutuksen_jarjestajan_yritysmuoto as 'Koulutuksen j�rjest�j�n yritysmuoto'
	,CASE
	WHEN f.[tuva_jarjestamislupa] = 'ammatillinen' THEN 'Ammatillisen koulutuksen rahoitusj�rjestelm� (TUVA)'
	WHEN f.[tuva_jarjestamislupa] = 'lukio' THEN 'Lukiokoulutuksen rahoitusj�rjestelm� (TUVA)'
	WHEN f.[tuva_jarjestamislupa] = 'perusopetus' THEN 'Perusopetuksen rahoitusj�rjestelm� (TUVA)' END
	as 'Rahoitusj�rjestelm�'
	,d8.organisaatio_fi as 'Toimipiste'
	,d9.avi_fi as 'Oppilaitoksen AVI'
	,d9.ely_fi as 'Oppilaitoksen ELY'

	-- Apumuuttujat
	,f.[oppija_oid] as 'apusarake_oppija_oid'
	,f.opiskeluoikeus_oid as 'apusarake_opiskeluoikeus_oid'
	,f.tila_20_9 as 'apusarake_tila_20_9'

	-- J�rjestysmuuttujat
	,d11.kuukausi as 'Jarjestys Tilastokuukausi'
	,d13.kuukausi as 'Jarjestys Opiskeluoikeuden alkamiskuukausi'
	,d2.jarjestys_ikaryhma6 as 'Jarjestys Ik�'
	,case
		when d3.maanosa1_koodi = '-1' then '99'
		else d3.maanosa1_koodi
	end as 'J�rjestys Kansalaisuusryhm�'
	,case
		when d4.kieliryhma1_koodi = '-1' then '99'
		else d4.kieliryhma1_koodi
	end as 'J�rjestys �idinkieliryhm�'
	,d5.jarjestys_erityisopetus_koodi as 'J�rjestys Erityisopetus'
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
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d13 ON d13.id = f.d_kalenteri_oo_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d14 ON d14.kytkin_koodi = f.oo_alkanut_kuussa_1_0


GO


USE [ANTERO]