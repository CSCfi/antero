USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_rahoitusperusteet_ja_myonnetty_rahoitus_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_rahoitusperusteet_ja_myonnetty_rahoitus]

INSERT INTO [dw].[api_amm_rahoitusperusteet_ja_myonnetty_rahoitus] (
	[defaultorder]
	,[vuosi]
    ,[suoritepaatos]
    ,[suoritepaatoksen_tyyppi]
    ,[rahoitusosuus]
    ,[vaikuttavuusrahoituksen_peruste]
    ,[koulutuksen_jarjestaja]
    ,[koulutuksen_jarjestajan_omistajatyyppi]
    ,[koulutuksen_jarjestajan_opetuskieli]
    ,[koulutuksen_jarjestajan_kunta]
    ,[koodit_koulutuksen_jarjestaja]
    ,[koodit_koulutuksen_jarjestajan_kunta]
    ,[lukumaaratiedon_tyyppi]
    ,[lukumaaratieto]
    ,[lukumaara]
)

--DROP TABLE [dw].[api_amm_rahoitusperusteet_ja_myonnetty_rahoitus]

SELECT
	defaultorder = row_number() over (order by [Vuosi], [Suoritepäätös], [Y-tunnus], [Rahoitusosuus], [Vaikuttavuusrahoituksen peruste], [Lukumäärätiedon tyyppi], [Lukumäärätieto])
 
	,vuosi = [Vuosi]
    ,suoritepaatos = [Suoritepäätös]
    ,suoritepaatoksen_tyyppi = [Suoritepäätöksen tyyppi]

	--vain rahoitusperusteita koskevat tiedot
	,rahoitusosuus = [Rahoitusosuus]
    ,vaikuttavuusrahoituksen_peruste = [Vaikuttavuusrahoituksen peruste]
	/*
	--vain kohdennuksia koskevat tiedot
    ,talousarvio = [Talousarvio]
    ,kayttotarkoituksen_kohdennus = [Käyttötarkoituksen kohdennus]
    ,tyovoimakoulutuksen_kohdennus = [Työvoimakoulutuksen kohdennus]
	*/

	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
    ,koulutuksen_jarjestajan_omistajatyyppi = [Koul. järj. omistajatyyppi]
    ,koulutuksen_jarjestajan_opetuskieli = [Koul. järj. opetuskieli]
    ,koulutuksen_jarjestajan_kunta = [Koul. järj. kunta]

    ,koodit_koulutuksen_jarjestaja = [Y-tunnus]
    ,koodit_koulutuksen_jarjestajan_kunta = [kunta_koodi]
	
    ,lukumaaratiedon_tyyppi = [Lukumäärätiedon tyyppi]
    ,lukumaaratieto = [Lukumäärätieto]
    ,lukumaara = [arvo]

--INTO [AnteroAPI].[dw].[api_amm_rahoitusperusteet_ja_myonnetty_rahoitus]

FROM [ANTERO].[dw].[v_amos_suoritepaatokset]

WHERE raportti = 'rahoitusperusteet_ja_myonnetty_rahoitus'

GO
