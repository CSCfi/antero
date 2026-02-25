USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_koonti] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_rahoitus_koonti_esilataus]
END

IF (SELECT count(*) FROM [dw].[api_amm_rahoitus_koonti]) > 0

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_rahoitus_koonti]

	INSERT INTO [api].[amm_rahoitus_koonti] (
		[defaultorder]
		,[koulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestaja]
		,[oppilaitos]
		,[toimipiste]
		,[kokonaisuus]
		,[varainhoitovuosi]
		,[rahoituskausi_pl_palautteet]
		,[rahoituskausi_palautteet]
		,[tilastokausi]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[ika_maksuttomuusraja]
		,[ikaryhma]
		,[sukupuoli]
		,[aidinkieli_ryhma]
		,[suorituksen_tyyppi]
		,[suorituskieli]
		,[tutkintotyyppi_rahoitus]
		,[kustannusryhma]
		,[rahoitusmuoto]
		,[majoitus]
		,[vaativa_erityinen_tuki]
		,[luvaton_koulutus]
		,[luvaton_majoitus]
		,[luvaton_korotustekija]
		,[luvanmukainen_suorituskieli]
		,[hyvaksytyt_hylatyt_opiskelijavuodet]
		,[huomioidaan_rahoituksessa_kylla_ei]
		,[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei]
		,[maksuttomuus_rahoitus_kylla_ei]
		,[oppisopimuskoulutus_kylla_ei]
		,[tyovoimakoulutus_kylla_ei]
		,[vankilaopetus_kylla_ei]
		,[hankintakoulutus_kylla_ei]
		,[toiminnanohjauksen_kokeilu_kylla_ei]
		,[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_hankintakoulutuksen_jarjestaja]
		,[koodit_tutkinto]
		,[opiskelijavuodet_painottamaton_lkm]
		,[enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus]
		,[tutkinnot_painottamaton_lkm]
		,[tutkinnot_painotettu_lkm]
		,[tutkinnon_osien_osaamispisteet_lkm]
		,[tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus]
		,[koulutuksen_suorittaneet_tyollistyneet_ei_tyollinen_ennen_koulutusta_lkm]
		,[koulutuksen_suorittaneet_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_osuus]
		,[opiskelunsa_aloittaneiden_palautteen_pisteet_lkm]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_osuus]
		,[opiskelunsa_paattaneiden_palautteen_pisteet_lkm]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_osuus]
		,[tyopaikkaohjaajakyselyn_pisteet_lkm]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_osuus]
		,[tyopaikkakyselyn_pisteet_lkm]
		,[tyopaikkakyselyn_pisteet_osuus]
		,[rahoitusosioiden_osuuksilla_painotettu_osuus]
		,[laskennallinen_rahoitus_ed_v_kiintea_osuus]
		,[laskennallinen_rahoitus_kiintea_osuus]
		,[tietojoukko_paivitetty_pvm]
	)

	SELECT 
		[defaultorder]
		,[koulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestaja]
		,[oppilaitos]
		,[toimipiste]
		,[kokonaisuus]
		,[varainhoitovuosi]
		,[rahoituskausi_pl_palautteet]
		,[rahoituskausi_palautteet]
		,[tilastokausi]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[ika_maksuttomuusraja]
		,[ikaryhma]
		,[sukupuoli]
		,[aidinkieli_ryhma]
		,[suorituksen_tyyppi]
		,[suorituskieli]
		,[tutkintotyyppi_rahoitus]
		,[kustannusryhma]
		,[rahoitusmuoto]
		,[majoitus]
		,[vaativa_erityinen_tuki]
		,[luvaton_koulutus]
		,[luvaton_majoitus]
		,[luvaton_korotustekija]
		,[luvanmukainen_suorituskieli]
		,[hyvaksytyt_hylatyt_opiskelijavuodet]
		,[huomioidaan_rahoituksessa_kylla_ei]
		,[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei]
		,[maksuttomuus_rahoitus_kylla_ei]
		,[oppisopimuskoulutus_kylla_ei]
		,[tyovoimakoulutus_kylla_ei]
		,[vankilaopetus_kylla_ei]
		,[hankintakoulutus_kylla_ei]
		,[toiminnanohjauksen_kokeilu_kylla_ei]
		,[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_hankintakoulutuksen_jarjestaja]
		,[koodit_tutkinto]
		,[opiskelijavuodet_painottamaton_lkm]
		,[enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus]
		,[tutkinnot_painottamaton_lkm]
		,[tutkinnot_painotettu_lkm]
		,[tutkinnon_osien_osaamispisteet_lkm]
		,[tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus]
		,[koulutuksen_suorittaneet_tyollistyneet_ei_tyollinen_ennen_koulutusta_lkm]
		,[koulutuksen_suorittaneet_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_lkm]
		,[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_osuus]
		,[opiskelunsa_aloittaneiden_palautteen_pisteet_lkm]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm]
		,[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_osuus]
		,[opiskelunsa_paattaneiden_palautteen_pisteet_lkm]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm]
		,[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_osuus]
		,[tyopaikkaohjaajakyselyn_pisteet_lkm]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm]
		,[tyopaikkaohjaajakyselyn_painotetut_pisteet_osuus]
		,[tyopaikkakyselyn_pisteet_lkm]
		,[tyopaikkakyselyn_pisteet_osuus]
		,[rahoitusosioiden_osuuksilla_painotettu_osuus]
		,[laskennallinen_rahoitus_ed_v_kiintea_osuus]
		,[laskennallinen_rahoitus_kiintea_osuus]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_rahoitus_koonti]

END

ELSE RAISERROR('Source table has no rows.',11,1)
;

TRUNCATE TABLE [dw].[api_amm_rahoitus_koonti]

GO
