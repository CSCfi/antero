USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija]    Script Date: 5.12.2022 18:17:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot_generoi_hyvaksytty_korotustekija] AS

SELECT distinct
	 [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id] = 0
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_painotuksen_tyyppi_id]
	,[painottamaton_osaamispisteet_summa]
	,[laskentaan_hyvaksyttava]
	,[painottamaton_tutkinnot_ja_osaamispisteet] = 0
	--,[painottamaton_tutkinnon_osien_osaamispisteet] = 0
	,[painotettu_tutkinnot_ja_osaamispisteet] = 0
	--,[painotettu_tutkinnon_osien_osaamispisteet] = 0
	,loadtime = GETDATE()
	
INTO #temp
FROM [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] f1
WHERE NOT EXISTS (select 1 from dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot f2 where f2.d_amos_luvaton_korotustekija_id = 0 and f2.d_organisaatioluokitus_jarjestaja_id = f1.d_organisaatioluokitus_jarjestaja_id)


INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] (
	[tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_painotuksen_tyyppi_id]
	,[painottamaton_osaamispisteet_summa]
	,[laskentaan_hyvaksyttava]
	,[painottamaton_tutkinnot_ja_osaamispisteet] 
	,[painotettu_tutkinnot_ja_osaamispisteet] 
	,loadtime
)

SELECT [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id] = 0
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_amos_painotuksen_tyyppi_id]
	,[painottamaton_osaamispisteet_summa]
	,[laskentaan_hyvaksyttava]
	,[painottamaton_tutkinnot_ja_osaamispisteet] = 0
	--,[painottamaton_tutkinnon_osien_osaamispisteet] = 0
	,[painotettu_tutkinnot_ja_osaamispisteet] = 0
	--,[painotettu_tutkinnon_osien_osaamispisteet] = 0
	,loadtime
FROM #temp

DROP TABLE #temp

