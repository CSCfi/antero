USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_tutkinnot_ja_osaamispisteet] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_rahoitus_tutkinnot_ja_osaamispisteet_esilataus]
END

IF (SELECT count(*) FROM [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]) > 0

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_rahoitus_tutkinnot_ja_osaamispisteet]

	INSERT INTO [api].[amm_rahoitus_tutkinnot_ja_osaamispisteet] (
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
		,[suorituksen_tyyppi]
		,[tutkinto]
		,[osaamisala]
		,[suorituskieli]
		,[rahoitusmuoto]
		,[luvaton_koulutus]
		,[luvanmukainen_suorituskieli]
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
		,[koodit_oppilaitos]
		,[koodit_toimipiste_oid]
		,[koodit_tutkinto]
		,[koodit_osaamisala]
		,[tutkinnot_painottamaton_lkm]
		,[tutkinnot_painotettu_lkm]
		,[tutkinnon_osien_osaamispisteet_lkm]
		,[tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus]
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
		,[suorituksen_tyyppi]
		,[tutkinto]
		,[osaamisala]
		,[suorituskieli]
		,[rahoitusmuoto]
		,[luvaton_koulutus]
		,[luvanmukainen_suorituskieli]
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
		,[koodit_oppilaitos]
		,[koodit_toimipiste_oid]
		,[koodit_tutkinto]
		,[koodit_osaamisala]
		,[tutkinnot_painottamaton_lkm]
		,[tutkinnot_painotettu_lkm]
		,[tutkinnon_osien_osaamispisteet_lkm]
		,[tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm]
		,[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]

END

ELSE RAISERROR('Source table has no rows.',11,1)
;

TRUNCATE TABLE [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]

GO
