USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_paivittain]    Script Date: 7.7.2023 9:25:35 ******/
DROP VIEW IF EXISTS [dw].[v_koski_lukio_opiskelijat_paivittain]
GO

/****** Object:  View [dw].[v_koski_lukio_opiskelijat_paivittain]    Script Date: 7.7.2023 9:25:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dw].[v_koski_lukio_opiskelijat_paivittain] AS

SELECT

	-- Aikamuuttujat
	f.[tilastovuosi] as 'Tilastovuosi'
	,d5.kuukausi_fi as 'Tilastokuukausi'
	,d5.paiva as 'Tilastopäivä'
	,d6.vuosi as 'Opiskeluoikeuden alkamisvuosi'
	,d6.kuukausi_fi as 'Opiskeluoikeuden alkamiskuukausi'
	,d8.kytkin_fi as 'Opiskeluoikeus alkanut tilastokuukauden aikana'
	,d9.kytkin_fi as 'Opiskeluoikeus alkanut aikaisintaan 2022/03'

	-- Henkilömuuttujat
	,f.ika_ryhma as 'Ikä (ryhmä)'
	,d1.maanosa1_fi as 'Kansalaisuus (ryhmä)'
	,d1.maanosa0_fi as 'Kansalaisuus (maanosa)'
	,d1.maatjavaltiot2_fi as 'Kansalaisuus (tarkka)'

	-- Koulutusmuuttujat
	,f.tavoitetutkinto as 'Tavoitetutkinto'
	,f.oppimaara as 'Oppimäärä'
	,f.koulutus as 'Koulutus'

	-- Organisaatiomuuttujat
	,d3.organisaatio_fi as 'Oppilaitos'
	,d4.maakunta_fi as 'Oppilaitoksen maakunta'
	,d2.organisaatio_fi 'Koulutuksen järjestäjä'
	,d2.organisaatio_koodi as 'Koulutuksen järjestäjän Y-tunnus'

	-- Apumuuttujat
	,f.opiskelijat as 'Oppilaiden lukumäärä'
	,f.pv_kk as 'pv_kk'

	-- Järjestysmuuttujat
	,d5.kuukausi as 'Järjestys Tilastokuukausi'
	,d5.paiva as 'Järjestys Tilastopäivä'
	,d6.vuosi as 'Järjestys Opiskeluoikeuden alkamisvuosi'
	,d6.kuukausi as 'Järjestys Opiskeluoikeuden alkamiskuukausi'
	,f.jarj_ika_ryhma as 'Järjestys Ikä (ryhmä)'
	,d1.jarjestys_maanosa1_koodi as 'Järjestys Kansalaisuus (ryhmä)'
	,d1.jarjestys_maanosa0_koodi as 'Järjestys Kansalaisuu (maanosa)'
	,d1.jarjestys_maatjavaltiot2_koodi as 'Järjestys Kansalaisuus (tarkka)'
	,f.jarj_tavoitetutkinto as 'Järjestys Tavoitetutkinto'
	,f.jarj_oppimaara as 'Järjestys Oppimaara'
	,f.jarj_koulutus as 'Järjestys Koulutus'
	,d3.jarjestys_organisaatio_koodi as 'Järjestys Oppilaitos'
	,d4.jarjestys_maakunta_koodi as 'Järjestys Oppilaitoksen maakunta'
	,d2.jarjestys_organisaatio_koodi as 'Järjestys Koulutuksen järjestäjä'
	,d8.jarjestys_kytkin_koodi as 'Järjestys ooalkanutkuussa'
	,d9.jarjestys_kytkin_koodi as 'Järjestys ooalkanutaikaisintaan'

FROM [ANTERO].[dw].[f_koski_lukio_opiskelijat_paivittain] f
LEFT JOIN [ANTERO].[dw].[d_maatjavaltiot2] d1 on d1.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d2 on d2.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] d3 on d3.id = f.d_organisaatioluokitus_oppilaitos_id
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d4 on d4.id = f.d_organisaatioluokitus_alue_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d5 on d5.id = d_kalenteri_id
LEFT JOIN [ANTERO].[dw].[d_kalenteri] d6 on d6.id = f.d_oo_aloitus_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d8 ON d8.id = f.d_kytkin_ooalkanutkuussa_id
LEFT JOIN [ANTERO].[dw].[d_kytkin] d9 ON d9.id = f.d_kytkin_ooalkanutaikaisintaan_id



GO


