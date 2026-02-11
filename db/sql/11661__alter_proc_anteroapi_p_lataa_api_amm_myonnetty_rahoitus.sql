USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_myonnetty_rahoitus] AS

DECLARE @pvm date

BEGIN
	EXEC [dw].[p_lataa_api_amm_myonnetty_rahoitus_esilataus]
END

IF EXISTS (select 1 from dw.api_amm_myonnetty_rahoitus)
AND (
  EXISTS (
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[rahoitusosuus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu,toiminnanohjauksen_kokeilu_kylla_ei,[lukumaaratiedon_tyyppi],[lukumaaratieto],[lukumaara] 
	from dw.api_amm_myonnetty_rahoitus 
	except 
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[rahoitusosuus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu,toiminnanohjauksen_kokeilu_kylla_ei,[lukumaaratiedon_tyyppi],[lukumaaratieto],[lukumaara]
	from api.amm_myonnetty_rahoitus
  )
  OR EXISTS (
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[rahoitusosuus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu,toiminnanohjauksen_kokeilu_kylla_ei,[lukumaaratiedon_tyyppi],[lukumaaratieto],[lukumaara] 
	from api.amm_myonnetty_rahoitus
	except 
	select [vuosi],[suoritepaatos],[suoritepaatoksen_tyyppi],[rahoitusosuus],[koulutuksen_jarjestaja],[koulutuksen_jarjestajan_omistajatyyppi],[koulutuksen_jarjestajan_opetuskieli],[koulutuksen_jarjestajan_kunta],[koodit_koulutuksen_jarjestaja],[koodit_koulutuksen_jarjestajan_kunta],koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu,toiminnanohjauksen_kokeilu_kylla_ei,[lukumaaratiedon_tyyppi],[lukumaaratieto],[lukumaara] 
	from dw.api_amm_myonnetty_rahoitus
  )
)
BEGIN
	
	SET @pvm = dbo.api_update_time(getdate())
  
	TRUNCATE TABLE [api].[amm_myonnetty_rahoitus]

	INSERT [api].[amm_myonnetty_rahoitus] (
		[defaultorder]
		,[vuosi]
		,[suoritepaatos]
		,[suoritepaatoksen_tyyppi]
		,[rahoitusosuus]
		,[koulutuksen_jarjestaja]
		,[koulutuksen_jarjestajan_omistajatyyppi]
		,[koulutuksen_jarjestajan_opetuskieli]
		,[koulutuksen_jarjestajan_kunta]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_koulutuksen_jarjestajan_kunta]
		,koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu
		,toiminnanohjauksen_kokeilu_kylla_ei
		,[lukumaaratiedon_tyyppi]
		,[lukumaaratieto]
		,[lukumaara]
		,tietojoukko_paivitetty_pvm
	)
	SELECT 
		[defaultorder]
		,[vuosi]
		,[suoritepaatos]
		,[suoritepaatoksen_tyyppi]
		,[rahoitusosuus]
		,[koulutuksen_jarjestaja]
		,[koulutuksen_jarjestajan_omistajatyyppi]
		,[koulutuksen_jarjestajan_opetuskieli]
		,[koulutuksen_jarjestajan_kunta]
		,[koodit_koulutuksen_jarjestaja]
		,[koodit_koulutuksen_jarjestajan_kunta]
		,koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu
		,toiminnanohjauksen_kokeilu_kylla_ei
		,[lukumaaratiedon_tyyppi]
		,[lukumaaratieto]
		,[lukumaara]
		,[tietojoukko_paivitetty_pvm] = @pvm
	FROM [dw].[api_amm_myonnetty_rahoitus]

END

IF NOT EXISTS (select 1 from [dw].[api_amm_myonnetty_rahoitus])
BEGIN
	RAISERROR('Source table has no rows.',11,1)
END

GO
