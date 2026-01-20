USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi_rahoitusperusteet] AS

SELECT
	f.generoitu
	,varainhoitovuosi = right(f.rahoituskausi,4) + 1
	,d27.ytunnus_amos_spl
	,d27.nimi_amos_spl 

	,painotetut_tutk_ja_osp_hyv_ka = cast(
		0.5 * sum([painotettu_tutkinnot]) 
		+ 0.5 * sum([osaamispisteet_kerroin] * [painottamaton_osaamispisteet])
		as decimal (30,20)
	)
	,painotetut_tutk_ja_osp_hyv_ka_osuus = cast(
		cast(
			cast(sum(cast([painotettu_tutkinnot] as decimal (30,20))) as decimal (18,10))
			+ cast(sum(cast([osaamispisteet_kerroin] as decimal (15,14)) * cast([painottamaton_osaamispisteet] as decimal (20,10))) as decimal (30,20))
			as decimal (18,10)
		) 
		/ 
		cast(
			sum (
				cast(
					cast(sum(cast([painotettu_tutkinnot] as decimal (30,20))) as decimal (18,10))
					+ cast(sum(cast([osaamispisteet_kerroin] as decimal (15,14)) * cast([painottamaton_osaamispisteet] as decimal (20,10))) as decimal (30,20))
					as decimal (18,10)
				) 
			)
			over (partition by f.rahoituskausi, f.generoitu)
			as decimal (18,10)
		)
		as decimal (20,19)
	)

FROM dw.f_amos_tutkinnot_ja_tutkinnonosat_painotetut_uusi  f
LEFT JOIN dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_jarjestaja_id
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.id = f.d_opintojenrahoitus_id
LEFT JOIN dw.d_kieli d17 on d17.id = f.d_kieli_suoritus_luvanmukainen_id
LEFT JOIN dw.d_amos_luvaton_koulutus d23 on d23.id = f.d_amos_luvaton_koulutus_id
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d27 ON d27.oid_avain = d1a.organisaatio_oid 

WHERE 1=1
AND d5.sisaltyy_okm_suoritusrahoitus = 1
AND d17.kieli_koodi != '-2'
AND d23.koodi in (1,23)
AND d27.sisaltyy_amos_spl = 1

GROUP BY 
	f.rahoituskausi
	,f.generoitu
	,d27.ytunnus_amos_spl
	,d27.nimi_amos_spl

GO
