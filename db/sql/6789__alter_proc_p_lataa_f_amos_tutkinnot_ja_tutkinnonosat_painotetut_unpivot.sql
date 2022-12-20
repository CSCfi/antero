USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]    Script Date: 5.12.2022 18:14:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] AS


DROP TABLE IF EXISTS [ANTERO].[dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
--TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]

--INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] (
--	[tilastovuosi]
--	,[d_kalenteri_id]
--	,[d_kalenteri_alkamispaiva_id]
--	,[d_sukupuoli_id]
--	,[d_kieli_aidinkieli_id]
--	,[d_ika_id]
--	,[d_erityisopetus_id]
--	,[d_koulutusluokitus_id]
--	,[d_organisaatioluokitus_jarjestaja_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
--	,[d_organisaatioluokitus_jarjestaja_hist_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
--	,[d_amos_spl_jarjestaja_linkki_id]
--	,[d_organisaatioluokitus_oppilaitos_id]
--	,[d_organisaatioluokitus_toimipiste_id]
--	,[d_kustannusryhma_id]
--	,[d_suorituksen_tyyppi_id]
--	,[d_osaamisala_id]
--	,[d_kieli_suoritus_id]
--	,[d_kieli_suoritus_lupa_id]
--	,[d_opintojenrahoitus_id]
--	,[d_oppisopimuskoulutus_id]
--	,[d_kytkin_vankilaopetus_id]
--	,[d_amos_luvaton_koulutus_id]
--	,[d_amos_luvaton_korotustekija_id]
--	,[d_kytkin_hankintakoulutus_id]
--	,[painottamaton_osaamispisteet_summa]
--	,[d_amos_painotuksen_tyyppi_id]
--	,[laskentaan_hyvaksyttava]
--	,[painottamaton_tutkinnot_ja_osaamispisteet]
--	,[painotettu_tutkinnot_ja_osaamispisteet]
--	,[loadtime]
--)

SELECT
	unpvt.id
	,[tilastovuosi]
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
	,[painottamaton_osaamispisteet_summa]
	--
	,[d_amos_painotuksen_tyyppi_id] = coalesce(d.id, '-1')
	,laskentaan_hyvaksyttava = case when tyyppi like '%hylatty%' then 0 else 1 end
	,painottamaton_tutkinnot_ja_osaamispisteet = case when tyyppi like '%painottamaton%' then summa else 0 end
	--,painottamaton_tutkinnon_osien_osaamispisteet = case when tyyppi like '%painottamaton%' and tyyppi like '%osaamispisteet%' then summa else 0 end
	,painotettu_tutkinnot_ja_osaamispisteet = case when tyyppi like '%painotettu%' then summa else 0 end
	--,painotettu_tutkinnon_osien_osaamispisteet = case when tyyppi like '%painotettu%' and tyyppi like '%osaamispisteet%' then summa else 0 end
	,loadtime = getdate()
   
INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]

FROM (

	SELECT  
		f.*
		,ca2.painottamaton_tutkinnot_pt
		,ca2.painottamaton_tutkinnot_at_eat
		,ca2.painottamaton_osatutkinnot_pt
		,ca2.painottamaton_osatutkinnot_at_eat
		,ca2.painottamaton_osaamispisteet_hyvaksytty_pt
		,ca2.painottamaton_osaamispisteet_hyvaksytty_at_eat
		,ca2.painottamaton_osaamispisteet_hylatty_pt
		,ca2.painottamaton_osaamispisteet_hylatty_at_eat
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr
		,ca2.painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki
	FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f
	JOIN dw.d_koulutusluokitus kl on kl.id = f.d_koulutusluokitus_id
	JOIN dw.d_amos_luvaton_koulutus lk on lk.id = f.d_amos_luvaton_koulutus_id

	--tavoitteelliset opiskelijavuodet (fuusiot huomioiden)
	LEFT JOIN dw.d_opintojenrahoitus opr on opr.id = f.d_opintojenrahoitus_id
	LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_jarjestaja_id
	LEFT JOIN (
		SELECT
			ytunnus = coalesce(d.ytunnus_amos_spl, sa.ytunnus)
			,vuosi
			,tavoitteelliset_opiskelijavuodet = SUM(tavoitteelliset_opiskelijavuodet)
		FROM sa.sa_amos_tavoitteelliset_opiskelijavuodet sa
		LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = sa.ytunnus 
		GROUP BY coalesce(d.ytunnus_amos_spl, sa.ytunnus),vuosi
	) sa1 on sa1.ytunnus = d1a.organisaatio_koodi and sa1.vuosi = f.tilastovuosi

	--tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien luvallisten osaamispisteiden summa per järjestäjä per vuosi
	LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d9 on d9.id = f.d_amos_spl_jarjestaja_linkki_id
	LEFT JOIN (
		SELECT 
			f.tilastovuosi
			,organisaatio_koodi = d1.ytunnus_amos_spl
			,osaamispisteet_sum = sum(f.painottamaton_osaamispisteet)
		FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut f
		JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.id = f.d_amos_spl_jarjestaja_linkki_id
		JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
		JOIN dw.d_amos_luvaton_koulutus d3 on d3.id = f.d_amos_luvaton_koulutus_id
		WHERE d2.sisaltyy_okm_suoritusrahoitus = 1 and d3.hyvaksytaan = 1
		GROUP BY f.tilastovuosi, d1.ytunnus_amos_spl
	) os_pisteet_summa on os_pisteet_summa.organisaatio_koodi = d9.ytunnus_amos_spl AND os_pisteet_summa.tilastovuosi = f.tilastovuosi

	--laskentaan hyväksyttävä osaamispistemäärä
	CROSS APPLY (
		SELECT
			leikkauskerroin = cast(
				CASE 
					WHEN os_pisteet_summa.osaamispisteet_sum > 120.0 * sa1.tavoitteelliset_opiskelijavuodet THEN (120.0 * sa1.tavoitteelliset_opiskelijavuodet) / os_pisteet_summa.osaamispisteet_sum
					ELSE 1.0
				END
			as decimal(30,20))
	) ca1
	CROSS APPLY (
		SELECT
			painottamaton_tutkinnot_pt = cast(case when kl.tutkintotyyppi_koodi = '02' then painottamaton_tutkinnot else 0 end as decimal(30,20)),
			painottamaton_tutkinnot_at_eat = cast(case when kl.tutkintotyyppi_koodi in ('19','20') then painottamaton_tutkinnot else 0 end as decimal(30,20)),
			painottamaton_osatutkinnot_pt = cast(case when kl.tutkintotyyppi_koodi = '02' then painottamaton_osatutkinnot else 0 end as decimal(30,20)),
			painottamaton_osatutkinnot_at_eat = cast(case when kl.tutkintotyyppi_koodi in ('19','20') then painottamaton_osatutkinnot else 0 end as decimal(30,20)),
			painottamaton_osaamispisteet_hyvaksytty_pt = cast(case when kl.tutkintotyyppi_koodi = '02' then leikkauskerroin * painottamaton_osaamispisteet else 0 end as decimal(30,20)),
			painottamaton_osaamispisteet_hyvaksytty_at_eat = cast(case when kl.tutkintotyyppi_koodi in ('19','20') then leikkauskerroin * painottamaton_osaamispisteet else 0 end as decimal(30,20)),
			painottamaton_osaamispisteet_hylatty_pt = cast(case when kl.tutkintotyyppi_koodi = '02' then (1.0-leikkauskerroin) * painottamaton_osaamispisteet else 0 end as decimal(30,20)),
			painottamaton_osaamispisteet_hylatty_at_eat = cast(case when kl.tutkintotyyppi_koodi in ('19','20') then (1.0-leikkauskerroin) * painottamaton_osaamispisteet else 0 end as decimal(30,20)),
			painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr = cast(leikkauskerroin * painotettu_tutkinnon_osien_osaamispisteet_pt_kr as decimal(30,20)),
			painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr = cast(leikkauskerroin * painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr as decimal(30,20)),
			painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki = cast(leikkauskerroin * painotettu_tutkinnon_osien_osaamispisteet_erityistuki as decimal(30,20)),
			painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr = cast((1.0-leikkauskerroin) * painotettu_tutkinnon_osien_osaamispisteet_pt_kr as decimal(30,20)),
			painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr = cast((1.0-leikkauskerroin) * painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr as decimal(30,20)),
			painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki = cast((1.0-leikkauskerroin) * painotettu_tutkinnon_osien_osaamispisteet_erityistuki as decimal(30,20))
	) ca2
) k


UNPIVOT (
	summa for tyyppi in (
		 [painottamaton_tutkinnot_pt]
		,[painottamaton_tutkinnot_at_eat]
		,[painottamaton_osatutkinnot_pt]
		,[painottamaton_osatutkinnot_at_eat]
		,[painottamaton_osaamispisteet_hyvaksytty_pt]
		,[painottamaton_osaamispisteet_hyvaksytty_at_eat]
		,[painottamaton_osaamispisteet_hylatty_pt]
		,[painottamaton_osaamispisteet_hylatty_at_eat]
		,[painotettu_tutkinnot_pt_kr_pk]
		,[painotettu_tutkinnot_at_eat_kr_pk]
		,[painotettu_tutkinnot_erityistuki]
		,[painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_pt_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_at_eat_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hyvaksytty_erityistuki]
		,[painotettu_tutkinnon_osien_osaamispisteet_hylatty_pt_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hylatty_at_eat_kr]
		,[painotettu_tutkinnon_osien_osaamispisteet_hylatty_erityistuki]
	)
) unpvt

LEFT JOIN dw.d_amos_painotuksen_tyyppi d on d.koodi = unpvt.tyyppi

WHERE summa != 0


----
--SELECT
--	[tilastovuosi]
--    ,[d_kalenteri_id]
--	,[d_kalenteri_alkamispaiva_id]
--    ,[d_sukupuoli_id]
--    ,[d_kieli_aidinkieli_id]
--    ,[d_ika_id]
--    ,[d_erityisopetus_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_organisaatioluokitus_jarjestaja_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
--	,[d_organisaatioluokitus_jarjestaja_hist_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_organisaatioluokitus_oppilaitos_id]
--    ,[d_organisaatioluokitus_toimipiste_id]
--    ,[d_kustannusryhma_id]
--    ,[d_suorituksen_tyyppi_id]
--	  ,[d_osaamisala_id]
--	,[d_kieli_suoritus_id]
--	,[d_kieli_suoritus_lupa_id]
--    ,[d_opintojenrahoitus_id]
--    ,[d_oppisopimuskoulutus_id]
--    ,[d_kytkin_vankilaopetus_id]
--	,[d_amos_luvaton_koulutus_id]
--	,[d_amos_luvaton_korotustekija_id]
--	,[d_kytkin_hankintakoulutus_id]
--	,[painottamaton_osaamispisteet_summa]
--	,[d_amos_painotuksen_tyyppi_id]
--	,laskentaan_hyvaksyttava
--	,painottamaton_tutkinnot_ja_osaamispisteet = SUM(painottamaton_tutkinnot_ja_osaamispisteet)
--	,painotettu_tutkinnot_ja_osaamispisteet = SUM(painotettu_tutkinnot_ja_osaamispisteet)
--	,[loadtime] = GETDATE()
--INTO #temp
--FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot
--GROUP BY 
--	[tilastovuosi]
--    ,[d_kalenteri_id]
--	,[d_kalenteri_alkamispaiva_id]
--    ,[d_sukupuoli_id]
--    ,[d_kieli_aidinkieli_id]
--    ,[d_ika_id]
--    ,[d_erityisopetus_id]
--    ,[d_koulutusluokitus_id]
--    ,[d_organisaatioluokitus_jarjestaja_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
--	,[d_organisaatioluokitus_jarjestaja_hist_id]
--	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
--    ,[d_amos_spl_jarjestaja_linkki_id]
--    ,[d_organisaatioluokitus_oppilaitos_id]
--    ,[d_organisaatioluokitus_toimipiste_id]
--    ,[d_kustannusryhma_id]
--    ,[d_suorituksen_tyyppi_id]
--	  ,[d_osaamisala_id]
--	,[d_kieli_suoritus_id]
--	,[d_kieli_suoritus_lupa_id]
--    ,[d_opintojenrahoitus_id]
--    ,[d_oppisopimuskoulutus_id]
--    ,[d_kytkin_vankilaopetus_id]
--	,[d_amos_luvaton_koulutus_id]
--	,[d_amos_luvaton_korotustekija_id]
--	,[d_kytkin_hankintakoulutus_id]
--	,[painottamaton_osaamispisteet_summa]
--	,[d_amos_painotuksen_tyyppi_id]
--	,laskentaan_hyvaksyttava


--DROP TABLE IF EXISTS [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot]
--SELECT * INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut_unpivot] FROM #temp

--DROP TABLE #temp