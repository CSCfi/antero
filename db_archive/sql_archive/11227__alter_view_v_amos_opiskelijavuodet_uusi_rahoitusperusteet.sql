USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_opiskelijavuodet_uusi_rahoitusperusteet] AS 

SELECT
	f.generoitu
	,f.varainhoitovuosi
	,d34.ytunnus_amos_spl
	,d34.nimi_amos_spl 

	,painotetut_opv_lahtotaso_hyv_ka = 0.5 * sum(cast(opv_ei_maksuton_kerroin * opiskelijavuodet_painotettu_lahtotaso as decimal (30,20)))
	,painotetut_opv_lahtotaso_hyv_ka_osuus = 
		cast(
			cast(sum(cast(opv_ei_maksuton_kerroin as decimal (15,14)) * cast(opiskelijavuodet_painotettu_lahtotaso as decimal (20,10))) as decimal (18,10))
			/ cast(sum(sum(cast(opv_ei_maksuton_kerroin as decimal (15,14)) * cast(opiskelijavuodet_painotettu_lahtotaso as decimal (20,10)))) over (partition by f.varainhoitovuosi, f.generoitu) as decimal (18,10))
			as decimal (20,19)
		)
	
	,painotetut_opv_kr_hyv_ka = 0.5 * sum(cast(opv_ei_maksuton_kerroin * (opiskelijavuodet_painotettu_kr_ja_tt_yhteensa + opiskelijavuodet_painotettu_erityistuki_hyv + opiskelijavuodet_painotettu_majoitus_hyv) as decimal (30,20)))
	,painotetut_opv_kr_hyv_ka_osuus = 
		cast(
			cast(sum(cast(opv_ei_maksuton_kerroin as decimal (15,14)) * cast(opiskelijavuodet_painotettu_kr_ja_tt_yhteensa + opiskelijavuodet_painotettu_erityistuki_hyv + opiskelijavuodet_painotettu_majoitus_hyv as decimal (20,10))) as decimal (18,10))
			/ cast(sum(sum(cast(opv_ei_maksuton_kerroin as decimal (15,14)) * cast(opiskelijavuodet_painotettu_kr_ja_tt_yhteensa + opiskelijavuodet_painotettu_erityistuki_hyv + opiskelijavuodet_painotettu_majoitus_hyv as decimal (20,10)))) over (partition by f.varainhoitovuosi, f.generoitu) as decimal (18,10))
			as decimal (20,19)
		)

FROM dw.f_amos_opiskelijavuodet_painotetut_uusi f
LEFT JOIN dw.d_organisaatioluokitus d11 ON d11.id = f.d_organisaatioluokitus_jarj_id
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d18 ON d18.id = f.d_kustannusryhma_id
LEFT JOIN dw.d_opintojenrahoitus d19 ON d19.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste d22 ON d22.id = f.d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 ON d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_luvaton_majoitus d24 ON d24.id = f.d_amos_luvaton_majoitus_id
LEFT JOIN dw.d_amos_luvaton_korotustekija d25 ON d25.id = f.d_amos_luvaton_korotustekija_id
LEFT JOIN dw.d_kieli d33 ON d33.id = f.d_kieli_suoritus_luvanmukainen_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d34 ON d34.oid_avain = d11.organisaatio_oid

WHERE 1=1
AND d19.sisaltyy_okm_perusrahoitus = 1
AND d22.koodi = 9
AND d23.hyvaksytaan = 1
AND d24.koodi = 1
AND d25.koodi = 1
AND (d18.koodi = 'muu' or d33.kieli_koodi != '-2')
AND d34.sisaltyy_amos_spl = 1

GROUP BY 
	f.varainhoitovuosi
	,f.generoitu
	,d34.ytunnus_amos_spl
	,d34.nimi_amos_spl

GO
