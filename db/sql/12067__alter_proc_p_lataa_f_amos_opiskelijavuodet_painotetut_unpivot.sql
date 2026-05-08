USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_unpivot] AS

DROP TABLE IF EXISTS [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot]

SELECT 
	 unpvt.[id]
	,[tilastovuosi]
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
    ,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
    ,[d_organisaatioluokitus_jarj_hist_id]
    ,[d_organisaatioluokitus_jarj_pihvi_id]
    ,[d_organisaatioluokitus_jarj_pihvi_hist_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_osaamisala_id]
    ,[muu_ammatillinen_tarkenne]
    ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id] =
		case 
			when opv_tyyppi = 'opiskelijavuodet_hylatty_painotettu_erityistuki' and opv_summa > 0 then (select id from dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste where koodi = '8')
			when opv_tyyppi = 'opiskelijavuodet_hylatty_painotettu_majoitus' and opv_summa > 0 and d_amos_luvaton_majoitus_id = 0 then (select id from dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste where koodi = '7')
			else d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
		end
    ,[d_amos_luvaton_koulutus_id]
    ,[d_amos_luvaton_majoitus_id] =
		case
			when opv_tyyppi in ('opiskelijavuodet_hylatty_painotettu_majoitus' ,'opiskelijavuodet_painottamaton') then d_amos_luvaton_majoitus_id
			else 0
		end
    ,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
    ,[d_kytkin_hankintakoulutus_id]
    ,[d_kytkin_sisaopp_ov_ylittyy_id]
    ,[d_kytkin_erityistuen_ov_ylittyy_id]
    ,[d_kytkin_oppivelvollisuus_id]

	,[d_amos_painotuksen_tyyppi_id] = coalesce(d.id, '-1')
	,painotettu = nullif(case when opv_tyyppi like '%painotettu%' then opv_summa else 0 end, 0)
	,painottamaton = nullif(case when opv_tyyppi like '%painottamaton%' and opv_tyyppi not like '%hylatty%' then opv_summa else 0 end, 0)
	,hylatty = nullif(case when opv_tyyppi like '%hylatty%' then opv_summa else 0 end, 0)
	,loadtime = getdate()

INTO [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut_unpivot] 

FROM (	

	SELECT 
		f.*
		,ca.opiskelijavuodet_hylatty_painotettu_erityistuki
		,ca.opiskelijavuodet_hylatty_painotettu_majoitus
		,ca.opiskelijavuodet_hylatty_painottamaton
	FROM dw.f_amos_opiskelijavuodet_painotetut f
	CROSS APPLY (
		SELECT
			opiskelijavuodet_hylatty_painotettu_majoitus = cast([opiskelijavuodet_painotettu_majoitus]-[opiskelijavuodet_painotettu_majoitus_hyv] as decimal(30,20)),
			opiskelijavuodet_hylatty_painotettu_erityistuki = cast([opiskelijavuodet_painotettu_erityistuki]-[opiskelijavuodet_painotettu_erityistuki_hyv] as decimal(30,20)),
			opiskelijavuodet_hylatty_painottamaton = [opiskelijavuodet_hylatyt]
	) ca

) k

UNPIVOT (
	opv_summa for opv_tyyppi in (
		 [opiskelijavuodet_painotettu_pt]
		,[opiskelijavuodet_painotettu_at_eat]
		,[opiskelijavuodet_painotettu_valma_telma]
		,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
		,[opiskelijavuodet_painotettu_muu]
		,[opiskelijavuodet_painotettu_erityistuki_hyv]
		,[opiskelijavuodet_painotettu_majoitus_hyv]
		,[opiskelijavuodet_painotettu_henkilostokoulutus]
		,[opiskelijavuodet_painotettu_tyovoimakoulutus]
		,[opiskelijavuodet_painotettu_vankilaopetus]
		,[opiskelijavuodet_painotettu_oppivelvollisuus]
		,[opiskelijavuodet_painottamaton]
		,[opiskelijavuodet_hylatty_painotettu_majoitus]
		,[opiskelijavuodet_hylatty_painotettu_erityistuki]
		,[opiskelijavuodet_hylatty_painottamaton]
	)
) unpvt

LEFT JOIN dw.d_amos_painotuksen_tyyppi d on d.koodi = unpvt.opv_tyyppi

WHERE opv_summa != 0.00

GO
