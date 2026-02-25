USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_palautteet] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_rahoitus_palautteet_esilataus]
END

IF (SELECT count(*) FROM [dw].[api_amm_rahoitus_palautteet]) > 0

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_rahoitus_palautteet]

	INSERT INTO [api].[amm_rahoitus_palautteet] (
		[defaultorder]
		,[koulutuksen_jarjestaja]
		,[oppilaitos]
		,[toimipiste]
		,[varainhoitovuosi]
		,[rahoituskausi]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[kysely]
		,[kyselyn_kohderyhma]
		,[tutkinto]
		,[huomioidaan_rahoituksessa_kylla_ei]
		,[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei]
		,[toiminnanohjauksen_kokeilu_kylla_ei]
		,[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_oppilaitos]
		,[koodit_toimipiste_oid]
		,[koodit_tutkinto]
		,[kyselyn_kohteet_lkm]
		,[vastanneet_lkm]
		,[pisteet_lkm]
		,[painotetut_pisteet_lkm]
		,[kyselyn_rahoitusosuus]
		,[tietojoukko_paivitetty_pvm]
	)

	SELECT 
		[defaultorder]
		,[koulutuksen_jarjestaja]
		,[oppilaitos]
		,[toimipiste]
		,[varainhoitovuosi]
		,[rahoituskausi]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[kysely]
		,[kyselyn_kohderyhma]
		,[tutkinto]
		,[huomioidaan_rahoituksessa_kylla_ei]
		,[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei]
		,[toiminnanohjauksen_kokeilu_kylla_ei]
		,[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_oppilaitos]
		,[koodit_toimipiste_oid]
		,[koodit_tutkinto]
		,[kyselyn_kohteet_lkm]
		,[vastanneet_lkm]
		,[pisteet_lkm]
		,[painotetut_pisteet_lkm]
		,[kyselyn_rahoitusosuus]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_rahoitus_palautteet]

END

ELSE RAISERROR('Source table has no rows.',11,1)
;

TRUNCATE TABLE [dw].[api_amm_rahoitus_palautteet]

GO
