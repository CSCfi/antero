USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_perusrahoituksen_kohdennukset] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_perusrahoituksen_kohdennukset_esilataus]
END

IF EXISTS (select 1 from [dw].[api_amm_perusrahoituksen_kohdennukset])
AND (
  EXISTS (
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[talousarvio],[kayttotarkoituksen_kohdennus],[tyovoimakoulutuksen_kohdennus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],[lukumaaratieto],[lukumaara]
	from [dw].[api_amm_perusrahoituksen_kohdennukset]
	except
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[talousarvio],[kayttotarkoituksen_kohdennus],[tyovoimakoulutuksen_kohdennus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],[lukumaaratieto],[lukumaara]
	from [api].[amm_perusrahoituksen_kohdennukset]
  )
  OR EXISTS (
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[talousarvio],[kayttotarkoituksen_kohdennus],[tyovoimakoulutuksen_kohdennus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],[lukumaaratieto],[lukumaara]
	from [api].[amm_perusrahoituksen_kohdennukset]
	except
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[talousarvio],[kayttotarkoituksen_kohdennus],[tyovoimakoulutuksen_kohdennus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],[lukumaaratieto],[lukumaara]
	from [dw].[api_amm_perusrahoituksen_kohdennukset]
  )
)
BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_perusrahoituksen_kohdennukset]

	INSERT INTO [api].[amm_perusrahoituksen_kohdennukset] (
		[defaultorder]
		,[vuosi]
		,[suoritepaatos]
		,[suoritepaatoksen_tyyppi]
		,[talousarvio]
		,[kayttotarkoituksen_kohdennus]
		,[tyovoimakoulutuksen_kohdennus]
		,[koulutuksen_jarjestaja]
		,[koulutuksen_jarjestajan_omistajatyyppi]
		,[koulutuksen_jarjestajan_opetuskieli]
		,[koulutuksen_jarjestajan_kunta]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_koulutuksen_jarjestajan_kunta]
		,[lukumaaratieto]
		,[lukumaara]
		,tietojoukko_paivitetty_pvm
	)
	SELECT 
		[defaultorder]
		,[vuosi]
		,[suoritepaatos]
		,[suoritepaatoksen_tyyppi]
		,[talousarvio]
		,[kayttotarkoituksen_kohdennus]
		,[tyovoimakoulutuksen_kohdennus]
		,[koulutuksen_jarjestaja]
		,[koulutuksen_jarjestajan_omistajatyyppi]
		,[koulutuksen_jarjestajan_opetuskieli]
		,[koulutuksen_jarjestajan_kunta]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_koulutuksen_jarjestajan_kunta]
		,[lukumaaratieto]
		,[lukumaara]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_perusrahoituksen_kohdennukset]

END

IF NOT EXISTS (select 1 from [dw].[api_amm_perusrahoituksen_kohdennukset])
BEGIN
	RAISERROR('Source table has no rows.',11,1)
END

GO
