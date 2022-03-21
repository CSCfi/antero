USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija]    Script Date: 27.10.2020 17:04:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_generoi_hyvaksytty_korotustekija] AS

SELECT distinct
	 [tilastovuosi]
      ,[d_kalenteri_tilastokuukausi_id]
      ,[d_sukupuoli_id]
      ,[d_kieli_aidinkieli_id]
      ,[d_ika_id]
      ,[d_osa_aikaisuus_id]
      ,[d_erityisopetus_id]
      ,[d_majoitus_id]
      ,[d_kytkin_oppisopimuskoulutus_id]
      ,[d_kytkin_vankilaopetus_id]
      ,[d_kytkin_henkilostokoulutus_id]
      ,[d_kytkin_tyovoimakoulutus_id]
      ,[d_koulutusluokitus_id]
      ,[d_organisaatioluokitus_oppilaitos_id]
      ,[d_organisaatioluokitus_jarj_id]
      ,[d_organisaatioluokitus_jarj_hist_id]
	  ,[d_organisaatioluokitus_jarj_pihvi_id]
      ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
      ,[d_organisaatioluokitus_toimipiste_id]
      ,[d_amos_spl_jarjestaja_linkki_id]
      ,[d_kustannusryhma_id]
      ,[d_suorituksen_tyyppi_id]
      ,[d_opintojenrahoitus_id]
      ,[d_osaamisala_id]
      ,[muu_ammatillinen_tarkenne]
      ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
      ,[d_amos_luvaton_koulutus_id]
      ,[d_amos_luvaton_majoitus_id] = 0
      ,[d_amos_luvaton_korotustekija_id] = 0
      ,[d_kytkin_hankintakoulutus_id]
      ,[d_kytkin_sisaopp_ov_ylittyy_id]
      ,[d_kytkin_erityistuen_ov_ylittyy_id]
	  ,[d_kytkin_oppivelvollisuus_id]

      ,[opiskelijavuodet_painottamaton] = 0
      ,[opiskelijavuodet_painotettu_yhteensa] = 0
      ,[opiskelijavuodet_painotettu_pt] = 0
      ,[opiskelijavuodet_painotettu_at_eat] = 0
      ,[opiskelijavuodet_painotettu_valma_telma] = 0
      ,[opiskelijavuodet_painotettu_opisk_valm_tukevat] = 0
      ,[opiskelijavuodet_painotettu_muu] = 0
      ,[opiskelijavuodet_painotettu_erityistuki] = 0
      ,[opiskelijavuodet_painotettu_erityistuki_hyv] = 0
      ,[opiskelijavuodet_painotettu_majoitus] = 0
      ,[opiskelijavuodet_painotettu_majoitus_hyv] = 0
      ,[opiskelijavuodet_painotettu_henkilostokoulutus] = 0
      ,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 0
      ,[opiskelijavuodet_painotettu_vankilaopetus] = 0
	  ,[opiskelijavuodet_painotettu_oppivelvollisuus]
      ,[opiskelijavuodet_hylatyt] = 0

      ,[loadtime]

INTO #temp
FROM [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut] f1
WHERE NOT EXISTS (select d_organisaatioluokitus_jarj_id from dw.f_amos_opiskelijavuodet_painotetut f2 where d_amos_luvaton_korotustekija_id = 0 and f2.d_organisaatioluokitus_jarj_id = f1.d_organisaatioluokitus_jarj_id)


INSERT INTO [dw].[f_amos_opiskelijavuodet_painotetut] SELECT * FROM #temp

DROP TABLE #temp