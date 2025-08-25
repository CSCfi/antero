USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_palautteet]    Script Date: 15.8.2025 11.05.02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_palautteet] AS 

SELECT 
	[Toteuma/Estimaatti] = case when v.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi]
	,[Rahoituskausi (palautteet)]
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Suoritepäätös (viimeisin)]
	,[Tutkinto]
	,[Koodit Tutkinto]
	,[Tutkintotyyppi]
	,[jarjestys Tutkintotyyppi]
	,[Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 1]

	,[Vaikuttavuusrahoituksen peruste] = 'Opiskelijapalaute'
	,[Kysely]
	,[Kyselyn kohderyhmä]

	,[Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjän kunta]
	,[Koulutuksen järjestäjän maakunta]

	--koodit
	,[Koodit Koulutuksen järjestäjä]

	--jarjestys
	,[jarj Koulutuksen järjestäjän maakunta]

	--apusarakkeet
	,pisteet
	,painotetut_pisteet

FROM dw.v_amos_opiskelijapalaute_uusi v

UNION ALL

SELECT 
	[Toteuma/Estimaatti] = case when v2.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi] = right(v2.rahoituskausi, 4) + 1
	,[Rahoituskausi (palautteet)] = v2.rahoituskausi
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Suoritepäätös (viimeisin)] = case when v2.sisaltyy_amos_spl = 1 then 'Kyllä' else 'Ei' end
	,[Tutkinto]
	,[Koodit Tutkinto]
	,[Tutkintotyyppi]
	,[jarjestys Tutkintotyyppi]
	,[Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 1]

	,[Vaikuttavuusrahoituksen peruste] = 'Työelämäpalaute'
	,[Kysely] = case when v2.kysely_fi like '%työpaikkakysely%' then 'Työpaikkakysely' else 'Työpaikkaohjaajakysely' end
	,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

	,v2.koulutuksen_jarjestaja_fi
	,v2.koulutuksen_jarjestajan_kunta_fi
	,v2.koulutuksen_jarjestajan_maakunta_fi

	--koodit
	,v2.koodit_koulutuksen_jarjestaja

	--jarjestys
	,v2.jarjestys_koulutuksen_jarjestajan_maakunta

	--apusarakkeet
	,v2.apusarake_pisteet
	,v2.apusarake_painotetut_pisteet

FROM dw.v_amos_tyoelamapalaute v2
WHERE right(rahoituskausi, 4) > 2022

GO
