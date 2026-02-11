USE [AnteroAPI]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dw].[p_lataa_api_amm_harkinnanvarainen_rahoitus_esilataus] AS

TRUNCATE TABLE [dw].[api_amm_harkinnanvarainen_rahoitus]

INSERT INTO [dw].[api_amm_harkinnanvarainen_rahoitus] (
	[defaultorder]
	,[vuosi]
    ,[suoritepaatos]
    ,[suoritepaatoksen_tyyppi]
    ,[talousarvio]
    ,[kayttotarkoituksen_kohdennus]
    ,[koulutuksen_jarjestaja]
    ,[koulutuksen_jarjestajan_omistajatyyppi]
    ,[koulutuksen_jarjestajan_opetuskieli]
    ,[koulutuksen_jarjestajan_kunta]
    ,[koodit_koulutuksen_jarjestaja]
    ,[koodit_koulutuksen_jarjestajan_kunta]
	,koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu
	,toiminnanohjauksen_kokeilu_kylla_ei
	,[harkinnanvarainen_rahoitus_euroa]
)

--DROP TABLE [dw].[api_amm_harkinnanvarainen_rahoitus]

SELECT
	defaultorder = row_number() over (
		order by 
			[Vuosi], 
			[Suoritepäätös], 
			[Y-tunnus], 
			[Lukumäärätieto], 
			[Käyttötarkoituksen kohdennus]
	)

	,vuosi = [Vuosi]
    ,suoritepaatos = [Suoritepäätös]
    ,suoritepaatoksen_tyyppi = [Suoritepäätöksen tyyppi]

    ,talousarvio = [Talousarvio]
    ,kayttotarkoituksen_kohdennus = [Käyttötarkoituksen kohdennus]

	,koulutuksen_jarjestaja = [Koulutuksen järjestäjä]
    ,koulutuksen_jarjestajan_omistajatyyppi = [Koul. järj. omistajatyyppi]
    ,koulutuksen_jarjestajan_opetuskieli = [Koul. järj. opetuskieli]
    ,koulutuksen_jarjestajan_kunta = [Koul. järj. kunta]

    ,koodit_koulutuksen_jarjestaja = [Y-tunnus]
    ,koodit_koulutuksen_jarjestajan_kunta = [kunta_koodi]
	,koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu = case when right([Koul. järjestäjän PILKE-alue (kokeilu)], 1) in ('P','I','L','K','E') then right([Koul. järjestäjän PILKE-alue (kokeilu)], 1) end
	,toiminnanohjauksen_kokeilu_kylla_ei = cast(case when left([Toiminnanohjauksen kokeilu], 2) = 'Ei' or [Toiminnanohjauksen kokeilu] = 'Tieto puuttuu' then 0 else 1 end as bit)
	
    ,[harkinnanvarainen_rahoitus_euroa] = cast([arvo] as int)

--INTO [AnteroAPI].[dw].[api_amm_harkinnanvarainen_rahoitus]

FROM [ANTERO].[dw].[v_amos_suoritepaatokset_2026]

WHERE raportti = 'perusrahoituksen_kohdennukset'

GO
