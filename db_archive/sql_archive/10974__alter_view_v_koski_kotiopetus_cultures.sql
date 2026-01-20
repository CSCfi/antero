USE [ANTERO]
GO

/****** Object:  View [dw].[v_koski_kotiopetus_cultures]    Script Date: 30.7.2025 10.54.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dw].[v_koski_kotiopetus_cultures] as 

SELECT
	[tilastovuosi],
    d6.kuukausi_fi as tilastokuukausi_fi,
	d6.kuukausi_sv as tilastokuukausi_sv,
	d6.lukuvuosi as lukuvuosi,
	d6.lukukausi_fi as lukukausi_fi,
	d6.lukukausi_sv as lukukausi_sv,

	d1.maakunta_fi as opetuksen_jarjestajan_maakunta_fi,
	d1.maakunta_sv as opetuksen_jarjestajan_maakunta_sv,
	d1.kunta_fi as opetuksen_jarjestajan_kunta_fi,
	d1.kunta_sv as opetuksen_jarjestajan_kunta_sv,
	d2.kieliryhma2_fi as aidinkieli_ryhma_fi,
	d2.kieliryhma2_sv as aidinkieli_ryhma_sv,
	d3.sukupuoli_fi as sukupuoli_fi,
	d3.sukupuoli_sv as sukupuoli_sv,
	d4.maanosa1_fi as kansalaisuus_ryhma_fi,
	d4.maanosa1_sv as kansalaisuus_ryhma_sv,
	d5.ika_fi as ika_fi,
	d5.ika_sv as ika_sv,

	f.master_oid as apusarake_oppija_oid,
	f.opiskeluoikeus_oid as apusarake_opiskeluoikeus_oid,
	f.tilastopaiva_20_9 as apusarake_tilastopaiva_20_9,
	1 as apusarake_kotiopetus,

	d6.kuukausi as jarjestys_tilastokuukausi,
	d2.jarjestys_kieliryhma2 as jarjestys_aidinkieli_ryhma,
	d3.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d4.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus_ryhma,
	d5.jarjestys_ika as jarjestys_ika,
	d1.jarjestys_kunta_koodi as jarjestys_opetuksen_jarjestajan_kunta,
	d1.jarjestys_maakunta_koodi as jarjestys_opetuksen_jarjestajan_maakunta,
	d6.jarjestys_lukukausi_reverse as jarjestys_lukukausi

FROM [ANTERO].[dw].[f_koski_kotiopetus] f
LEFT JOIN ANTERO.dw.d_alueluokitus d1 on d1.id = f.d_alueluokitus_opetuksen_jarjestajan_kunta_id
LEFT JOIN ANTERO.dw.d_kieli d2 on d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_ika d5 on d5.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.id = f.d_kalenteri_id

UNION ALL

SELECT
	f.vuosi as tilastovuosi,
    d6.kuukausi_fi as tilastokuukausi_fi,
	d6.kuukausi_sv as tilastokuukausi_sv,
	d6.lukuvuosi as lukuvuosi,
	d6.lukukausi_fi as lukukausi_fi,
	d6.lukukausi_sv as lukukausi_sv,

	d1.maakunta_fi as opetuksen_jarjestajan_maakunta_fi,
	d1.maakunta_sv as opetuksen_jarjestajan_maakunta_sv,
	d1.kunta_fi as opetuksen_jarjestajan_kunta_fi,
	d1.kunta_sv as opetuksen_jarjestajan_kunta_sv,
	d2.kieliryhma2_fi as aidinkieli_ryhma_fi,
	d2.kieliryhma2_sv as aidinkieli_ryhma_sv,
	d3.sukupuoli_fi as sukupuoli_fi,
	d3.sukupuoli_sv as sukupuoli_sv,
	d4.maanosa1_fi as kansalaisuus_ryhma_fi,
	d4.maanosa1_sv as kansalaisuus_ryhma_sv,
	d5.ika_fi as ika_fi,
	d5.ika_sv as ika_sv,

	f.master_oid as apusarake_oppija_oid,
	f.opiskeluoikeus_oid as apusarake_opiskeluoikeus_oid,
	f.tilastopaiva_1_0 as apusarake_tilastopaiva_20_9,
	0 as apusarake_kotiopetus,

	d6.kuukausi as jarjestys_tilastokuukausi,
	d2.jarjestys_kieliryhma2 as jarjestys_aidinkieli_ryhma,
	d3.jarjestys_sukupuoli_koodi as jarjestys_sukupuoli,
	d4.jarjestys_maanosa1_koodi as jarjestys_kansalaisuus_ryhma,
	d5.jarjestys_ika as jarjestys_ika,
	d1.jarjestys_kunta_koodi as jarjestys_opetuksen_jarjestajan_kunta,
	d1.jarjestys_maakunta_koodi as jarjestys_opetuksen_jarjestajan_maakunta,
	d6.jarjestys_lukukausi_reverse as jarjestys_lukukausi

FROM [ANTERO].[dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d0 on d0.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN ANTERO.dw.d_alueluokitus d1 on d0.kunta_koodi = d1.kunta_koodi
LEFT JOIN ANTERO.dw.d_kieli d2 on d2.id = f.d_kieli_aidinkieli_id
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d4 on d4.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_ika d5 on d5.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.id = f.d_kalenteri_id
LEFT JOIN ANTERO.dw.d_vuosiluokka_tai_koulutus d7 ON d7.id = f.d_vuosiluokka_id
WHERE d7.koodi in ('1','2','3','4','5','6','7','8','9','x') and f.vuosi >= 2018 and f.opisk = 1 and tilastopaiva_1_0 = 1

GO

