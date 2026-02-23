USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr_esilataus]
END

IF (SELECT count(*) FROM [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]) > 0

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]

	INSERT INTO [api].[amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr] (
		[defaultorder]
		,[koulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestaja]
		,[oppilaitos]
		,[toimipiste]
		,[varainhoitovuosi]
		,[rahoituskausi]
		,[tilastokausi]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[koulutuksen_alkamisvuosi]
		,[koulutuksen_alkamiskuukausi]
		,[ika_maksuttomuusraja]
		,[ikaryhma]
		,[sukupuoli]
		,[aidinkieli_ryhma]
		,[toisen_asteen_pohjakoulutus_2018]
		,[suoritettu_tutkinto_maksuttomuus_2018]
		,[perusopetuksen_suoritusvuosi]
		,[perusopetuksen_keskiarvoluokka]
		,[perusopetuksen_yksilollistaminen]
		,[suorituksen_tyyppi]
		,[suorituskieli]
		,[tutkintotyyppi_rahoitus]
		,[tutkinto]
		,[osaamisala]
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
		,[maksuttomuus_koski_kylla_ei]
		,[osa_aikaisuus_kylla_ei]
		,[oppisopimuskoulutus_kylla_ei]
		,[tyovoimakoulutus_kylla_ei]
		,[vankilaopetus_kylla_ei]
		,[hankintakoulutus_kylla_ei]
		,[toiminnanohjauksen_kokeilu_kylla_ei]
		,[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_hankintakoulutuksen_jarjestaja]
		,[koodit_oppilaitos]
		,[koodit_toimipiste_oid]
		,[koodit_tutkinto]
		,[koodit_osaamisala]
		,[opiskelijavuodet_painottamaton_lkm]
		,[opiskelijavuodet_painotettu_lahtotaso_lkm]
		,[opiskelijavuodet_painotettu_kustannusryhma_lkm]
		,[opiskelijavuodet_painotettu_erityistuki_lkm]
		,[opiskelijavuodet_painotettu_majoitus_lkm]
		,[enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus]
		,[tietojoukko_paivitetty_pvm]
	)

	SELECT 
		[defaultorder]
		,[koulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestaja]
		,[oppilaitos]
		,[toimipiste]
		,[varainhoitovuosi]
		,[rahoituskausi]
		,[tilastokausi]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[koulutuksen_alkamisvuosi]
		,[koulutuksen_alkamiskuukausi]
		,[ika_maksuttomuusraja]
		,[ikaryhma]
		,[sukupuoli]
		,[aidinkieli_ryhma]
		,[toisen_asteen_pohjakoulutus_2018]
		,[suoritettu_tutkinto_maksuttomuus_2018]
		,[perusopetuksen_suoritusvuosi]
		,[perusopetuksen_keskiarvoluokka]
		,[perusopetuksen_yksilollistaminen]
		,[suorituksen_tyyppi]
		,[suorituskieli]
		,[tutkintotyyppi_rahoitus]
		,[tutkinto]
		,[osaamisala]
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
		,[maksuttomuus_koski_kylla_ei]
		,[osa_aikaisuus_kylla_ei]
		,[oppisopimuskoulutus_kylla_ei]
		,[tyovoimakoulutus_kylla_ei]
		,[vankilaopetus_kylla_ei]
		,[hankintakoulutus_kylla_ei]
		,[toiminnanohjauksen_kokeilu_kylla_ei]
		,[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_hankintakoulutuksen_jarjestaja]
		,[koodit_oppilaitos]
		,[koodit_toimipiste_oid]
		,[koodit_tutkinto]
		,[koodit_osaamisala]
		,[opiskelijavuodet_painottamaton_lkm]
		,[opiskelijavuodet_painotettu_lahtotaso_lkm]
		,[opiskelijavuodet_painotettu_kustannusryhma_lkm]
		,[opiskelijavuodet_painotettu_erityistuki_lkm]
		,[opiskelijavuodet_painotettu_majoitus_lkm]
		,[enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus]
		,[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]

END

ELSE RAISERROR('Source table has no rows.',11,1)

GO
