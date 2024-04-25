USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_perusrahoituksen_kohdennukset_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_perusrahoituksen_kohdennukset]

INSERT INTO [dw].[api_amm_perusrahoituksen_kohdennukset] (
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
)

--DROP TABLE [dw].[api_amm_perusrahoituksen_kohdennukset]

SELECT
	defaultorder = row_number() over (order by [Vuosi], [Suoritepäätös], [Y-tunnus], [Lukumäärätieto], [Käyttötarkoituksen kohdennus])

	,vuosi = [Vuosi]
    ,suoritepaatos = [Suoritepäätös]
    ,suoritepaatoksen_tyyppi = [Suoritepäätöksen tyyppi]
	
	/*
	--vain rahoitusperusteita koskevat tiedot
	,rahoitusosuus = [Rahoitusosuus]
    ,vaikuttavuusrahoituksen_peruste = [Vaikuttavuusrahoituksen peruste]
	*/
	--vain kohdennuksia koskevat tiedot
    ,talousarvio = [Talousarvio]
    ,kayttotarkoituksen_kohdennus = [Käyttötarkoituksen kohdennus]
    ,tyovoimakoulutuksen_kohdennus = [Työvoimakoulutuksen kohdennus]

	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
    ,koulutuksen_jarjestajan_omistajatyyppi = [Koul. järj. omistajatyyppi]
    ,koulutuksen_jarjestajan_opetuskieli = [Koul. järj. opetuskieli]
    ,koulutuksen_jarjestajan_kunta = [Koul. järj. kunta]

    ,koodit_koulutuksen_jarjestaja = [Y-tunnus]
    ,koodit_koulutuksen_jarjestajan_kunta = [kunta_koodi]
	
    ,lukumaaratieto = 
		case 
			when [Lukumäärätieto] = 'Tavoitteellinen opiskelijavuosimäärä yhteensä' then 'Tavoitteellinen opiskelijavuosimäärä' --kohdennuksissa ei mittareissa jaottelua tyov mukaan
			else [Lukumäärätieto]
		end
    ,lukumaara = cast([arvo] as decimal(15,1)) --kohdennuksissa ei 5-desim. profiilikerrointa mukana

--INTO [AnteroAPI].[dw].[api_amm_perusrahoituksen_kohdennukset]

FROM [ANTERO].[dw].[v_amos_suoritepaatokset]

WHERE raportti = 'perusrahoituksen_kohdennukset'

GO
