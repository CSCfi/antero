USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_tutkinnot_ja_osaamispisteet_esilataus] AS

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]

SELECT
	defaultorder = 
		row_number() over (
			order by 
				varainhoitovuosi desc,
				[Koulutuksen järjestäjä],
				tilastokausi desc, tilastovuosi desc, tilastokuukausi desc
		)
	
	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
	,hankintakoulutuksen_jarjestaja = [Hankintakoulutuksen järjestäjä]
	,oppilaitos
	,toimipiste
	
	,varainhoitovuosi
	,rahoituskausi
	,tilastokausi
	,tilastovuosi
	,tilastokuukausi = nullif([jarj Tilastokuukausi], '99')
	,koulutuksen_alkamisvuosi = [Koulutuksen alkamisvuosi]
	,koulutuksen_alkamiskuukausi = jarj_koulutuksen_alkamiskuukausi

	,ika_maksuttomuusraja = [Ikä (maksuttomuusraja)]
	,ikaryhma = [Ikäryhmä]
	,sukupuoli
	,aidinkieli_ryhma = [Äidinkieli]

    ,suorituksen_tyyppi = [Suorituksen tyyppi]
	,tutkinto
	,osaamisala
	,suorituskieli
	,rahoitusmuoto

	,luvaton_koulutus = [Luvaton koulutus]
	,luvanmukainen_suorituskieli = [Luvanmukainen suorituskieli]
	
	--k/e
	,huomioidaan_rahoituksessa_kylla_ei = cast(
		case 
			when sisaltyy_okm_suoritusrahoitus = 1
				and [Järjestäjärakenne] = 'Viimeisin suoritepäätös'
				and [Luvaton koulutus] = 'Ei luvaton, hyväksytty'
				and [Luvanmukainen suorituskieli] = 'Ei luvaton, hyväksytty suorituskieli'
			then 1
			else 0
		end
		as bit
	)
	,jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei = cast(case when [Järjestäjärakenne] = 'Viimeisin suoritepäätös' then 1 else 0 end as bit)
	,maksuttomuus_rahoitus_kylla_ei = cast(case when left([Maksuttomuus (rahoitus)], 2) = 'Ei' or [Maksuttomuus (rahoitus)] = 'Tieto puuttuu' then 0 else 1 end as bit)
	,oppisopimuskoulutus_kylla_ei = cast(case when left([Oppisopimuskoulutus], 2) = 'Ei' or [Oppisopimuskoulutus] = 'Tieto puuttuu' then 0 else 1 end as bit)
	,tyovoimakoulutus_kylla_ei = cast(case when left([Työvoimakoulutus], 2) = 'Ei' or [Työvoimakoulutus] = 'Tieto puuttuu' then 0 else 1 end as bit)
    ,vankilaopetus_kylla_ei = cast(case when left([Vankilaopetus], 2) = 'Ei' or [Vankilaopetus] = 'Tieto puuttuu' then 0 else 1 end as bit)
	,hankintakoulutus_kylla_ei = cast(case when left([Hankintakoulutus], 2) = 'Ei' or [Hankintakoulutus] = 'Tieto puuttuu' then 0 else 1 end as bit)
	,toiminnanohjauksen_kokeilu_kylla_ei = cast(case when left([Toiminnanohjauksen kokeilu], 2) = 'Ei' or [Toiminnanohjauksen kokeilu] = 'Tieto puuttuu' then 0 else 1 end as bit)

	--koodit
	,koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu = case when right([Koul. järjestäjän PILKE-alue (kokeilu)], 1) in ('P','I','L','K','E') then right([Koul. järjestäjän PILKE-alue (kokeilu)], 1) end
	,koodit_koulutuksen_jarjestaja = [Koodit Koulutuksen järjestäjä]
	,koodit_hankintakoulutuksen_jarjestaja = [Koodit Hankintakoulutuksen järjestäjä]
	,koodit_oppilaitos = [Koodit Oppilaitos]
	,koodit_toimipiste_oid = [Koodit Toimipiste (OID)]
	,koodit_tutkinto = [Koodit Tutkinto]
	,koodit_osaamisala = [Koodit Osaamisala]
	
	--lkm
    ,tutkinnot_painottamaton_lkm = [painottamaton_tutkinnot]
    ,tutkinnot_painotettu_lkm = [painotettu_tutkinnot]
    ,tutkinnon_osien_osaamispisteet_lkm = [painottamaton_osaamispisteet]
	,tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm = [osaamispisteet_kerroin] * [painottamaton_osaamispisteet]
	,tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm = [painotettu_tutkinnot] + [osaamispisteet_kerroin] * [painottamaton_osaamispisteet]
	,tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus = cast(null as decimal(30,29))

INTO [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]

FROM [ANTERO].[dw].[v_amos_tutkinnot_ja_tutkinnonosat_uusi]

WHERE [Toteuma/Estimaatti] = 'Toteuma'
;


UPDATE t
SET tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus = 
		case 
			when tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm > 0.0
			then cast(tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm as decimal(14,9))
				/ cast(sum_tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet as decimal(18,9))
		end

FROM [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet] t
OUTER APPLY (
	SELECT 
		sum_tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet = sum(tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm)
	FROM [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]	
	
	WHERE 1=1
	AND varainhoitovuosi = t.varainhoitovuosi
	AND huomioidaan_rahoituksessa_kylla_ei = 1 
) q

WHERE t.huomioidaan_rahoituksessa_kylla_ei = 1

GO
