USE [AnteroAPI]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet]    Script Date: 31.1.2023 11:49:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet] AS

DECLARE @pvm date

BEGIN
  EXEC [dw].[p_lataa_api_amm_rahoitus_opiskelijavuodet_esilataus]
END

IF (select count(*) from [dw].[api_amm_rahoitus_opiskelijavuodet]) > 0

BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_rahoitus_opiskelijavuodet]

	INSERT INTO [api].[amm_rahoitus_opiskelijavuodet] (
		 [defaultorder]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[sukupuoli]
		,[aidinkieli]
		,[ika]
		,[tutkinto]
		,[osaamisala]
		,[suorituksen_tyyppi]
		,[suorituskieli]
		,[kustannusryhma]
		,[rahoitusmuoto]
		,[erityisopetus]
		,[majoitus]
		,[oppivelvollisuus]
		,[osa_aikaisuus_kylla_ei]
		,[oppisopimuskoulutus_kylla_ei]
		,[vankilaopetus_kylla_ei]
		,[henkilostokoulutus_kylla_ei]
		,[tyovoimakoulutus_kylla_ei]
		,[hankintakoulutus_kylla_ei]
		,[koulutuksen_jarjestaja]
		,[koulutuksen_jarjestajan_kunta]
		,[hankintakoulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestajan_kunta]
		,[oppilaitos]
		,[oppilaitoksen_kunta]
		,[toimipiste]
		,[hyvaksytyt_hylatyt_opiskelijavuodet]
		,[luvaton_koulutus]
		,[luvaton_majoitus]
		,[luvaton_korotustekija]
		,[luvanmukainen_suorituskieli]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_koulutuksen_jarjestajan_kunta]
		,[koodit_hankintakoulutuksen_jarjestaja]
		,[koodit_hankintakoulutuksen_jarjestajan_kunta]
		,[koodit_oppilaitos]
		,[koodit_oppilaitoksen_kunta]
		,[koodit_tutkinto]
		,[koodit_osaamisala]
		,[opiskelijavuoden_tyyppi]
		,[opiskelijavuodet_painottamaton]
		,[opiskelijavuodet_painotettu]
		,tietojoukko_paivitetty_pvm
	)

	--DROP TABLE IF EXISTS [api].[amm_rahoitus_opiskelijavuodet] 
	SELECT 
		 [defaultorder]
		,[tilastovuosi]
		,[tilastokuukausi]
		,[sukupuoli]
		,[aidinkieli]
		,[ika]
		,[tutkinto]
		,[osaamisala]
		,[suorituksen_tyyppi]
		,[suorituskieli]
		,[kustannusryhma]
		,[rahoitusmuoto]
		,[erityisopetus]
		,[majoitus]
		,[oppivelvollisuus]
		,[osa_aikaisuus_kylla_ei]
		,[oppisopimuskoulutus_kylla_ei]
		,[vankilaopetus_kylla_ei]
		,[henkilostokoulutus_kylla_ei]
		,[tyovoimakoulutus_kylla_ei]
		,[hankintakoulutus_kylla_ei]
		,[koulutuksen_jarjestaja]
		,[koulutuksen_jarjestajan_kunta]
		,[hankintakoulutuksen_jarjestaja]
		,[hankintakoulutuksen_jarjestajan_kunta]
		,[oppilaitos]
		,[oppilaitoksen_kunta]
		,[toimipiste]
		,[hyvaksytyt_hylatyt_opiskelijavuodet]
		,[luvaton_koulutus]
		,[luvaton_majoitus]
		,[luvaton_korotustekija]
		,[luvanmukainen_suorituskieli]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_koulutuksen_jarjestajan_kunta]
		,[koodit_hankintakoulutuksen_jarjestaja]
		,[koodit_hankintakoulutuksen_jarjestajan_kunta]
		,[koodit_oppilaitos]
		,[koodit_oppilaitoksen_kunta]
		,[koodit_tutkinto]
		,[koodit_osaamisala]
		,[opiskelijavuoden_tyyppi]
		,[opiskelijavuodet_painottamaton]
		,[opiskelijavuodet_painotettu]
		,[tietojoukko_paivitetty_pvm] = @pvm
	--INTO [api].[amm_rahoitus_opiskelijavuodet] 
	FROM [dw].[api_amm_rahoitus_opiskelijavuodet]

END

ELSE RAISERROR('Source table has no rows.',11,1)
 

GO

USE [ANTERO]