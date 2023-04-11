USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_lukio_opintojen_kulku_cultures]    Script Date: 11.4.2023 10:51:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dw].[v_koski_lukio_opintojen_kulku_cultures] AS

SELECT DISTINCT
	opiskeluoikeus_oid,
	oppija_oid,
	viimeisin_tilanne_alkuperainen_opiskeluoikeus_fi = f.lopputulema,

	aloitusajankohta_fi = d1.aloitusajankohta,
	d1.aloitusvuosipuolisko_fi,
	aloitusvuosi_fi = d1.aloitusvuosi,
	d2.priorisoitu_tilanne_fi,
	d3.tarkastelujakso_fi,
	tavoitetutkinto_fi = d4.koulutusluokitus_fi,
	dY.oppimaara_fi,

	d5.sukupuoli_fi,
	ika_aloittaessa_fi = d7.ika_fi,
	ikaryhma_aloittaessa_fi = d7.ikaryhma3_fi,
	aidinkieli_fi = d8.kieli_fi,
	aidinkieli_ryhma_fi = d8.kieliryhma2_fi,
	kansalaisuus_fi = d9.maatjavaltiot2_fi,
	kansalaisuus_ryhma_fi = d9.maanosa1_fi,
	kansalaisuus_maanosa_fi = d9.maanosa_fi,

	koulutuksen_jarjestaja_fi = d10.organisaatio_fi,
	oppilaitos_fi = d11.organisaatio_fi,
	toimipiste_fi = d12.organisaatio_fi,
	suorituskieli_fi = d13.suorituskieli_yleissivistava_fi,

	oppilaitoksen_kunta_fi = d14.kunta_fi,
	oppilaitoksen_ely_fi = d14.ely_fi,
	oppilaitoksen_avi_fi = d14.avi_fi,
	oppilaitoksen_maakunta_fi = d14.maakunta_fi,
	koulutuksen_jarjestajan_kunta_fi = d15.kunta_fi,
	koulutuksen_jarjestajan_ely_fi = d15.ely_fi,
	koulutuksen_jarjestajan_avi_fi = d15.avi_fi,
	koulutuksen_jarjestajan_maakunta_fi = d15.maakunta_fi,

	vaihtanut_jarjestajaa_priorisoitu_tilanne_fi = d16.vaihdos_fi,
	vaihtanut_oppilaitosta_priorisoitu_tilanne_fi = d17.vaihdos_fi,

	perusopetuksen_suoritusvuosi,
	peruskoulun_paattokeskiarvo_ryhma_fi = d18.selite_fi,
	peruskoulun_lukuaineiden_paattokeskiarvo_ryhma_fi = d19.selite_fi,
	peruskoulun_paattokeskiarvo_kvintiili_fi = d20.selite_fi,
	peruskoulun_lukuaineiden_paattokeskiarvo_kvintiili_fi = d21.selite_fi,

	-- KOODIT
	[koodit_koulutuksen_jarjestaja] = d10.organisaatio_koodi,
	[koodit_oppilaitos] = d11.organisaatio_koodi,

	-- JÄRJESTYKSET
	jarjestys_aloitusajankohta = d1.jarj_aloitusajankohta,
	jarjestys_aloitusvuosipuolisko = d1.jarj_vuosipuolisko,
	jarjestys_priorisoitu_tilanne = d2.priorisoitu_tilanne_koodi,
	jarjestys_tarkastelujakso = d3.jarj_tarkastelujakso,
	jarjestys_tavoitetutkinto = d4.jarjestys_koulutusluokitus_koodi,
	jarjestys_oppimaara = dY.jarj_oppimaara,
	jarjestys_sukupuoli = d5.jarjestys_sukupuoli_koodi,
	jarjestys_ika_aloittaessa = d7.jarjestys_ika,
	jarjestys_ikaryhma_aloittaessa = d7.jarjestys_ikaryhma3,
	jarjestys_aidinkieli_ryhma = d8.jarjestys_kieliryhma2,
	jarjestys_kansalaisuus = d9.jarjestys_maatjavaltiot2_koodi,
	jarjestys_kansalaisuus_maanosa = d9.jarjestys_maanosa_koodi,
	jarjestys_kansalaisuus_ryhma = d9.jarjestys_maanosa1_koodi,
	jarjestys_suorituskieli = null, --d13.kieli_koodi,
	jarjestys_oppilaitoksen_kunta = d14.jarjestys_kunta_koodi,
	jarjestys_oppilaitoksen_maakunta = d14.jarjestys_maakunta_koodi,
	jarjestys_oppilaitoksen_ely = d14.jarjestys_ely_koodi,
	jarjestys_oppilaitoksen_avi = d14.jarjestys_avi_koodi,
	jarjestys_koulutuksen_jarjestajan_kunta = d15.jarjestys_kunta_koodi,
	jarjestys_koulutuksen_jarjestajan_maakunta = d15.jarjestys_maakunta_koodi,
	jarjestys_koulutuksen_jarjestajan_ely = d15.jarjestys_ely_koodi,
	jarjestys_koulutuksen_jarjestajan_avi = d15.jarjestys_avi_koodi,

	jarjestys_vaihtanut_jarjestajaa_priorisoitu_tilanne = d16.jarj_vaihdos,
	jarjestys_vaihtanut_oppilaitosta_priorisoitu_tilanne = d17.jarj_vaihdos,

	jarjestys_peruskoulun_paattokeskiarvo_ryhma = d18.jarj_keskiarvo,
	jarjestys_peruskoulun_lukuaineiden_paattokeskiarvo_ryhma = d19.jarj_keskiarvo,
	jarjestys_peruskoulun_paattokeskiarvo_kvintiili = d20.jarj_keskiarvo,
	jarjestys_peruskoulun_lukuaineiden_paattokeskiarvo_kvintiili = d21.jarj_keskiarvo

FROM  dw.f_koski_lukio_opintojen_kulku f
LEFT JOIN ANTERO.dw.d_opintojen_kulku_kohortit d1 ON f.d_opintojen_kulku_kohortit_id = d1.id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_priorisoitu_tilanne d2 ON f.d_opintojen_kulku_priorisoitu_tilanne_id = d2.id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_tarkastelujakso d3 ON f.d_opintojen_kulku_tarkastelujakso_id = d3.id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 ON f.d_koulutusluokitus_id = d4.id
LEFT JOIN ANTERO.dw.d_sukupuoli d5 ON f.d_sukupuoli_id = d5.id
LEFT JOIN ANTERO.dw.d_ika d6 ON f.d_ika_id = d6.id
LEFT JOIN ANTERO.dw.d_ika d7 ON f.d_ika_aloittaessa_id = d7.id
--LEFT JOIN ANTERO.dw.d_ika dX ON f.d_ika_paattyessa_id = dX.id
LEFT JOIN ANTERO.dw.d_kieli d8 ON f.d_kieli_aidinkieli_id = d8.id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d9 ON f.d_maatjavaltiot2_kansalaisuus_id = d9.id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d10 ON f.d_organisaatioluokitus_jarj_id = d10.id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d11 ON f.d_organisaatioluokitus_oppilaitos_id = d11.id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d12 ON f.d_organisaatioluokitus_toimipiste_id = d12.id
LEFT JOIN ANTERO.dw.d_kieli d13 ON f.d_kieli_suorituskieli_id = d13.id
LEFT JOIN ANTERO.dw.d_lukio_oppimaara_man dY ON f.d_lukio_oppimaara_man_id = dY.id
LEFT JOIN ANTERO.dw.d_alueluokitus d14 ON d14.id = f.d_alueluokitus_oppilaitos_id
LEFT JOIN ANTERO.dw.d_alueluokitus d15 ON d15.id = f.d_alueluokitus_jarjestaja_id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_vaihdokset d16 ON d16.id = f.d_opintojen_kulku_vaihdokset_jarjestaja_id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_vaihdokset d17 ON d17.id = f.d_opintojen_kulku_vaihdokset_oppilaitos_id

LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d18 ON d18.id = d_opintojen_kulku_keskiarvot_keskiarvo_kategoria_id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d19 ON d19.id = d_opintojen_kulku_keskiarvot_lukuaine_kategoria_id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d20 ON d20.id = d_opintojen_kulku_keskiarvot_keskiarvo_kvintiili_id
LEFT JOIN ANTERO.dw.d_opintojen_kulku_keskiarvot d21 ON d21.id = d_opintojen_kulku_keskiarvot_lukuaine_kvintiili_id

WHERE d4.koulutusluokitus_fi != 'Tieto puuttuu' --AND priorisoitu_tilanne_fi != 'Tieto puuttuu'


GO

USE [ANTERO]