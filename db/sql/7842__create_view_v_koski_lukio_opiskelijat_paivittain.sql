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
	,d5.paiva as 'Tilastop�iv�'
	,d6.vuosi as 'Opiskeluoikeuden alkamisvuosi'
	,d6.kuukausi_fi as 'Opiskeluoikeuden alkamiskuukausi'
	,d8.kytkin_fi as 'Opiskeluoikeus alkanut tilastokuukauden aikana'
	,d9.kytkin_fi as 'Opiskeluoikeus alkanut aikaisintaan 2022/03'

	-- Henkil�muuttujat
	,f.ika_ryhma as 'Ik� (ryhm�)'
	,d1.maanosa1_fi as 'Kansalaisuus (ryhm�)'
	,d1.maanosa0_fi as 'Kansalaisuus (maanosa)'
	,d1.maatjavaltiot2_fi as 'Kansalaisuus (tarkka)'

	-- Koulutusmuuttujat
	,f.tavoitetutkinto as 'Tavoitetutkinto'
	,f.oppimaara as 'Oppim��r�'
	,f.koulutus as 'Koulutus'

	-- Organisaatiomuuttujat
	,d3.organisaatio_fi as 'Oppilaitos'
	,d4.maakunta_fi as 'Oppilaitoksen maakunta'
	,d2.organisaatio_fi 'Koulutuksen j�rjest�j�'
	,d2.organisaatio_koodi as 'Koulutuksen j�rjest�j�n Y-tunnus'

	-- Apumuuttujat
	,f.opiskelijat as 'Oppilaiden lukum��r�'
	,f.pv_kk as 'pv_kk'

	-- J�rjestysmuuttujat
	,d5.kuukausi as 'J�rjestys Tilastokuukausi'
	,d5.paiva as 'J�rjestys Tilastop�iv�'
	,d6.vuosi as 'J�rjestys Opiskeluoikeuden alkamisvuosi'
	,d6.kuukausi as 'J�rjestys Opiskeluoikeuden alkamiskuukausi'
	,f.jarj_ika_ryhma as 'J�rjestys Ik� (ryhm�)'
	,d1.jarjestys_maanosa1_koodi as 'J�rjestys Kansalaisuus (ryhm�)'
	,d1.jarjestys_maanosa0_koodi as 'J�rjestys Kansalaisuu (maanosa)'
	,d1.jarjestys_maatjavaltiot2_koodi as 'J�rjestys Kansalaisuus (tarkka)'
	,f.jarj_tavoitetutkinto as 'J�rjestys Tavoitetutkinto'
	,f.jarj_oppimaara as 'J�rjestys Oppimaara'
	,f.jarj_koulutus as 'J�rjestys Koulutus'
	,d3.jarjestys_organisaatio_koodi as 'J�rjestys Oppilaitos'
	,d4.jarjestys_maakunta_koodi as 'J�rjestys Oppilaitoksen maakunta'
	,d2.jarjestys_organisaatio_koodi as 'J�rjestys Koulutuksen j�rjest�j�'
	,d8.jarjestys_kytkin_koodi as 'J�rjestys ooalkanutkuussa'
	,d9.jarjestys_kytkin_koodi as 'J�rjestys ooalkanutaikaisintaan'

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


