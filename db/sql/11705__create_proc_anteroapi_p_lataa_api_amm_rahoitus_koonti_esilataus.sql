USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_koonti_esilataus] AS

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_koonti]

SELECT
	defaultorder = row_number() 
		over (
			order by 
				varainhoitovuosi desc,
				[Koulutuksen järjestäjä],
				Kokonaisuus,
				tilastokausi desc, tilastovuosi desc, tilastokuukausi desc
		)

	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
	,hankintakoulutuksen_jarjestaja = [Hankintakoulutuksen järjestäjä]
	,oppilaitos
	,toimipiste
		
    ,[kokonaisuus]
	
	,varainhoitovuosi
	,rahoituskausi_pl_palautteet = [Rahoituskausi (pl. palautteet)]
	,rahoituskausi_palautteet = [Rahoituskausi (palautteet)]
	,tilastokausi
	,tilastovuosi
	,tilastokuukausi = nullif(jarj_tilastokuukausi, '99')

	,ika_maksuttomuusraja = [Ikä (maksuttomuusraja)]
	,ikaryhma = [Ikäryhmä]
	,sukupuoli = [Sukupuoli]
	,aidinkieli_ryhma = [Äidinkieli (ryhmä)]

    ,suorituksen_tyyppi = [Suorituksen tyyppi]
	,suorituskieli
	,tutkintotyyppi_rahoitus = [Tutkintotyyppi (rahoitus)]
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
			when [Rahoitusmuoto hyväksytään] = 'Rahoitusmuoto hyväksytään'
				and [Järjestäjärakenne] = 'Viimeisin suoritepäätös'
				and [Hyväksytyt/hylätyt opiskelijavuodet] in ('Hyväksytään', 'Tieto puuttuu')
				and [Luvaton koulutus] in ('Ei luvaton, hyväksytty', 'Tieto puuttuu')
				and [Luvaton majoitus] in ('Ei luvaton, hyväksytty', 'Tieto puuttuu')
				and [Luvaton korotustekijä] in ('Ei luvaton, hyväksytty', 'Tieto puuttuu')
				and [Luvanmukainen suorituskieli] in (
					'Muu ammatillinen koulutus', 
					'Luvassa mainittu suorituskieli', 
					'Ei luvaton, hyväksytty suorituskieli', 
					'Tieto puuttuu'
				)
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
	,koodit_tutkinto = [Koodit Tutkinto]
	
	--lkm
    ,opiskelijavuodet_painottamaton_lkm = apusarake_opiskelijavuodet_painottamaton
    ,enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm = apusarake_opv_ei_maksuton_kerroin * apusarake_opiskelijavuodet_painottamaton
    ,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm = apusarake_opv_ei_maksuton_kerroin * apusarake_opiskelijavuodet_painotettu_lahtotaso
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm = apusarake_opv_ei_maksuton_kerroin * apusarake_opiskelijavuodet_painotettu_kustannusryhma
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm = apusarake_opv_ei_maksuton_kerroin * apusarake_opiskelijavuodet_painotettu_erityistuki
    ,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm = apusarake_opv_ei_maksuton_kerroin * apusarake_opiskelijavuodet_painotettu_majoitus
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm = 
		apusarake_opv_ei_maksuton_kerroin 
		* (
			apusarake_opiskelijavuodet_painotettu_kustannusryhma 
			+ apusarake_opiskelijavuodet_painotettu_erityistuki 
			+ apusarake_opiskelijavuodet_painotettu_majoitus
		)
    ,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus = cast(null as decimal(30,29))
	,rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus = cast(null as decimal(30,29))
	
    ,tutkinnot_painottamaton_lkm = [apusarake_painottamaton_tutkinnot]
    ,tutkinnot_painotettu_lkm = [apusarake_painotettu_tutkinnot]
    ,tutkinnon_osien_osaamispisteet_lkm = [apusarake_painottamaton_osaamispisteet]
	,tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm = [apusarake_osaamispisteet_kerroin] * [apusarake_painottamaton_osaamispisteet]
	,tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm = [apusarake_painotettu_tutkinnot] + [apusarake_osaamispisteet_kerroin] * [apusarake_painottamaton_osaamispisteet]
	,tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus = cast(null as decimal(30,29))
   
	,koulutuksen_suorittaneet_tyollistyneet_ei_tyollinen_ennen_koulutusta_lkm = case when trim([Työllinen])='Työllinen' then [apusarake_lkm] end
	,koulutuksen_suorittaneet_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm = case when trim([Työllinen])!='Työllinen' and trim([Korkeakouluopiskelija])='Korkeakouluopiskelija' then [apusarake_lkm] end
	,koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm = case when trim([Työllinen])='Työllinen' or trim([Korkeakouluopiskelija])='Korkeakouluopiskelija' then [apusarake_lkm] end
	,koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_osuus = cast(null as decimal(30,29))

	,opiskelunsa_aloittaneiden_palautteen_pisteet_lkm = case when [kysely]='Aloituskysely' then [apusarake_pisteet] end
	,opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm = case when [kysely]='Aloituskysely' then [apusarake_painotetut_pisteet] end
	,opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_osuus = cast(null as decimal(30,29))
	,opiskelunsa_paattaneiden_palautteen_pisteet_lkm = case when [kysely]='Päättökysely' then [apusarake_pisteet] end
	,opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm = 
		case [Kyselyn kohderyhmä] 
			when 'Koko tutkinnon suorittaneet' then 3 
			when 'Tutkinnon osia suorittaneet' then 1
		end
		* [apusarake_painotetut_pisteet]
	,opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_osuus = cast(null as decimal(30,29))
	,tyopaikkaohjaajakyselyn_pisteet_lkm = case when [kysely]='Työpaikkaohjaajakysely' then [apusarake_pisteet] end
	,tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm = case when [kysely]='Työpaikkaohjaajakysely' then [apusarake_painotetut_pisteet] end
	,tyopaikkaohjaajakyselyn_painotetut_pisteet_osuus = cast(null as decimal(30,29))
	,tyopaikkakyselyn_pisteet_lkm = case when [kysely]='Työpaikkakysely' then [apusarake_pisteet] end
	,tyopaikkakyselyn_pisteet_osuus = cast(null as decimal(30,29))

	,rahoitusosioiden_osuuksilla_painotettu_osuus = cast(null as decimal(38,37))

    ,laskennallinen_rahoitus_ed_v_kiintea_osuus = [apusarake_laskennallinen_rahoitus_osuus_ed_v]
    ,laskennallinen_rahoitus_kiintea_osuus = [apusarake_laskennallinen_rahoitus_osuus]

INTO [dw].[api_amm_rahoitus_koonti]

FROM [ANTERO].[dw].[v_amos_koonti_kaikki_vuodet_apiin]
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
	,tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus = 
		case 
			when tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm > 0.0
			then cast(tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm as decimal(14,9))
				/ cast(sum_tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet as decimal(18,9))
		end
	,koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_osuus = 
		case 
			when koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm > 0.0
			then cast(koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm as decimal(14,9))
				/ cast(sum_koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta as decimal(18,9))
		end
	,opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_osuus = 
		case 
			when opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm > 0.0
			then cast(opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm as decimal(15,7))
				/ cast(sum_opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet as decimal(20,7))
		end
	,opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_osuus = 
		case 
			when opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm > 0.0
			then cast(opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm as decimal(15,7))
				/ cast(sum_opiskelunsa_paattaneiden_palautteen_painotetut_pisteet as decimal(20,7))
		end
	,tyopaikkaohjaajakyselyn_painotetut_pisteet_osuus = 
		case 
			when tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm > 0.0
			then cast(tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm as decimal(15,7))
				/ cast(sum_tyopaikkaohjaajakyselyn_painotetut_pisteet as decimal(20,7))
		end
	,tyopaikkakyselyn_pisteet_osuus = 
		case 
			when tyopaikkakyselyn_pisteet_lkm > 0.0
			then cast(tyopaikkakyselyn_pisteet_lkm as decimal(15,7))
				/ cast(sum_tyopaikkakyselyn_pisteet as decimal(20,7))
		end

FROM [dw].[api_amm_rahoitus_koonti] t
OUTER APPLY (
	SELECT 
		sum_rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso = sum(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm)
		,sum_rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset = sum(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm)
		,sum_tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet = sum(tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm)
		,sum_koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta = sum(koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm)
		,sum_opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet = sum(opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm)
		,sum_opiskelunsa_paattaneiden_palautteen_painotetut_pisteet = sum(opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm)
		,sum_tyopaikkaohjaajakyselyn_painotetut_pisteet = sum(tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm)
		,sum_tyopaikkakyselyn_pisteet = sum(tyopaikkakyselyn_pisteet_lkm)
	FROM [dw].[api_amm_rahoitus_koonti] t2

	WHERE 1=1
	AND t2.varainhoitovuosi = t.varainhoitovuosi
	AND t2.huomioidaan_rahoituksessa_kylla_ei = 1 
) q

WHERE t.huomioidaan_rahoituksessa_kylla_ei = 1
;

UPDATE t
SET rahoitusosioiden_osuuksilla_painotettu_osuus = cast(
	painotetut_opv_lahtotaso_hyv_ka_osuus_paino * coalesce(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus, 0.0)
	+ painotetut_opv_kr_hyv_ka_osuus_paino * coalesce(rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus, 0.0)
	+ painotetut_tutk_ja_osp_hyv_ka_osuus_paino * coalesce(tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus, 0.0)
	+ tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino * coalesce(koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_osuus, 0.0)
	+ aloituskysely_painotetut_pisteet_osuus_paino * coalesce(opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_osuus, 0.0)
	+ paattokysely_painotetut_pisteet_osuus_paino * coalesce(opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_osuus, 0.0)
	+ tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino * coalesce(tyopaikkaohjaajakyselyn_painotetut_pisteet_osuus, 0.0)
	+ tyopaikkakysely_pisteet_osuus_paino * coalesce(tyopaikkakyselyn_pisteet_osuus, 0.0)
	as decimal(38,37)
)
FROM [dw].[api_amm_rahoitus_koonti] t
CROSS APPLY (
	select top 1
		painotetut_opv_lahtotaso_hyv_ka_osuus_paino --= cast(t2.painotetut_opv_lahtotaso_hyv_ka_osuus_paino as decimal(5,4))
		,painotetut_opv_kr_hyv_ka_osuus_paino --= cast(t2.painotetut_opv_kr_hyv_ka_osuus_paino as decimal(5,4))
		,painotetut_tutk_ja_osp_hyv_ka_osuus_paino --= cast(t2.painotetut_tutk_ja_osp_hyv_ka_osuus_paino as decimal(5,4))
		,tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino --= cast(t2.tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus_paino as decimal(5,4))
		,aloituskysely_painotetut_pisteet_osuus_paino --= cast(t2.aloituskysely_painotetut_pisteet_osuus_paino as decimal(5,4))
		,paattokysely_painotetut_pisteet_osuus_paino --= cast(t2.paattokysely_painotetut_pisteet_osuus_paino as decimal(5,4))
		,tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino --= cast(t2.tyopaikkaohjaajakysely_painotetut_pisteet_osuus_paino as decimal(5,4))
		,tyopaikkakysely_pisteet_osuus_paino --= cast(t2.tyopaikkakysely_pisteet_osuus_paino as decimal(5,4))
	from ANTERO.dw.f_amos_koonti_rahoitusperusteet t2
	where t2.Varainhoitovuosi = t.Varainhoitovuosi
) ca
WHERE huomioidaan_rahoituksessa_kylla_ei = 1

GO
