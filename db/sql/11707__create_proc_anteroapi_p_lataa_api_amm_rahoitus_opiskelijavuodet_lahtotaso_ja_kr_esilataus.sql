USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr_esilataus] AS

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]

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
	,tilastokuukausi = nullif(jarj_tilastokuukausi, '99')
	,koulutuksen_alkamisvuosi = [Koulutuksen alkamisvuosi]
	,koulutuksen_alkamiskuukausi = jarj_koulutuksen_alkamiskuukausi

	,ika_maksuttomuusraja = [Ikä (maksuttomuusraja)]
	,ikaryhma = [Ikäryhmä]
	,sukupuoli
	,aidinkieli_ryhma = [Äidinkieli (ryhmä)]
	
	,toisen_asteen_pohjakoulutus_2018 = [Toisen asteen pohjakoulutus (2018-)]
	,suoritettu_tutkinto_maksuttomuus_2018 = [Suoritettu tutkinto, maksuttomuus (2018-)]

	,perusopetuksen_suoritusvuosi = nullif([Perusop. suoritusvuosi], '-1')
	,perusopetuksen_keskiarvoluokka = [Perusop. keskiarvoluokka 2]
	,perusopetuksen_yksilollistaminen = [Perusop. yksilöllistäminen]

    ,suorituksen_tyyppi = [Suorituksen tyyppi]
	,suorituskieli
	,tutkintotyyppi_rahoitus = [Tutkintotyyppi (rahoitus)]
	,tutkinto
	,osaamisala
	,kustannusryhma = [Kustannusryhmä]
	,rahoitusmuoto

	,majoitus
	,vaativa_erityinen_tuki = [Vaativa erityinen tuki]

	,luvaton_koulutus = [Luvaton koulutus]
	,luvaton_majoitus = [Luvaton majoitus]
	,luvaton_korotustekija = [Luvaton korotustekijä]
	,luvanmukainen_suorituskieli = [Luvanmukainen suorituskieli]
	,hyvaksytyt_hylatyt_opiskelijavuodet = [Hyväksytyt/hylätyt opiskelijavuodet]
	
	--k/e
	,huomioidaan_rahoituksessa_kylla_ei = cast(
		case 
			when sisaltyy_okm_perusrahoitus = 1
				and [Järjestäjärakenne] = 'Viimeisin suoritepäätös'
				and [Hyväksytyt/hylätyt opiskelijavuodet] = 'Hyväksytään'
				and [Luvaton koulutus] = 'Ei luvaton, hyväksytty'
				and [Luvaton majoitus] = 'Ei luvaton, hyväksytty'
				and [Luvaton korotustekijä] = 'Ei luvaton, hyväksytty'
				and [Luvanmukainen suorituskieli] in (
					'Muu ammatillinen koulutus', 
					'Luvassa mainittu suorituskieli'
				)
			then 1
			else 0
		end
		as bit
	)
	,jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei = cast(case when [Järjestäjärakenne] = 'Viimeisin suoritepäätös' then 1 else 0 end as bit)
	,maksuttomuus_rahoitus_kylla_ei = cast(case when left([Maksuttomuus (rahoitus)], 2) = 'Ei' or [Maksuttomuus (rahoitus)] = 'Tieto puuttuu' then 0 else 1 end as bit)
	,maksuttomuus_koski_kylla_ei = cast(case when left([Maksuttomuus (KOSKI)], 2) = 'Ei' or [Maksuttomuus (KOSKI)] = 'Tieto puuttuu' then 0 else 1 end as bit)
	,osa_aikaisuus_kylla_ei = cast(case when left([Osa-aikaisuus], 2) = 'Ei' or [Osa-aikaisuus] = 'Tieto puuttuu' then 0 else 1 end as bit)
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
    ,opiskelijavuodet_painottamaton_lkm = painottamaton
    ,opiskelijavuodet_painotettu_lahtotaso_lkm = painotettu_lahtotaso
	,opiskelijavuodet_painotettu_kustannusryhma_lkm = painotettu_kustannusryhma
	,opiskelijavuodet_painotettu_erityistuki_lkm = painotettu_erityistuki
    ,opiskelijavuodet_painotettu_majoitus_lkm = painotettu_majoitus
	
    ,enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm = opv_ei_maksuton_kerroin * painottamaton
    ,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm = opv_ei_maksuton_kerroin * painotettu_lahtotaso
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm = opv_ei_maksuton_kerroin * painotettu_kustannusryhma
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm = opv_ei_maksuton_kerroin * painotettu_erityistuki
    ,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm = opv_ei_maksuton_kerroin * painotettu_majoitus
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm = 
		opv_ei_maksuton_kerroin 
		* (
			painotettu_kustannusryhma 
			+ painotettu_erityistuki 
			+ painotettu_majoitus
		)

    ,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus = cast(null as decimal(30,29))
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus = cast(null as decimal(30,29))

INTO [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]

FROM [ANTERO].[dw].[v_amos_opiskelijavuodet_uusi]

WHERE [Toteuma/Estimaatti] = 'Toteuma'
;


UPDATE t
SET rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus = 
		case 
			when rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm > 0.0
			then cast(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm as decimal(14,9))
				/ cast(sum_rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso as decimal(18,9))
		end
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus = 
		case 
			when rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm > 0.0
			then cast(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm as decimal(14,9))
				/ cast(sum_rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset as decimal(18,9))
		end

FROM [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr] t
OUTER APPLY (
	SELECT 
		sum_rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso = sum(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm)
		,sum_rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset = sum(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm)
	FROM [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]	
	
	WHERE 1=1
	AND varainhoitovuosi = t.varainhoitovuosi
	AND huomioidaan_rahoituksessa_kylla_ei = 1 
) q

WHERE t.huomioidaan_rahoituksessa_kylla_ei = 1

GO
