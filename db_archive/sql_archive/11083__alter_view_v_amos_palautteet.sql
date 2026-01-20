USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_palautteet] AS 

SELECT 
	[Toteuma/Estimaatti] = case when v.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi]
	,[Rahoituskausi (palautteet)]
	,[Suoritepäätös (viimeisin)]

	,[Kokonaisuus] = 'Opiskelijapalaute'

	,[Kysely]
	,[Kyselyn kohderyhmä]

	,[Tutkinto]
	,[Tutkintotyyppi]
	,[Koulutusala, taso 1]
	,[Koulutusala, taso 2]
	,[Koulutusala, taso 3]

	,[Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjän kunta]
	,[Koulutuksen järjestäjän maakunta]
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Oppilaitos]
	,[Oppilaitoksen kunta]
	,[Oppilaitoksen maakunta]

	--koodit
	,[Koodit Koulutuksen järjestäjä]
	,[Koodit Tutkinto]

	--jarjestys
	,[jarj Koulutuksen järjestäjän maakunta]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Oppilaitoksen maakunta]
	,[jarjestys Tutkintotyyppi]
	,[jarjestys Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 2]
	,[jarjestys Koulutusala, taso 3]

	--apusarakkeet
	,pisteet
	,painotetut_pisteet

FROM dw.v_amos_opiskelijapalaute_uusi v

UNION ALL

SELECT 
	[Toteuma/Estimaatti] = case when v2.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi] = right(v2.rahoituskausi, 4) + 1
	,[Rahoituskausi (palautteet)] = v2.rahoituskausi
	,[Suoritepäätös (viimeisin)] = case when v2.sisaltyy_amos_spl = 1 then 'Kyllä' else 'Ei' end
	
	,[Kokonaisuus] = 'Työelämäpalaute'

	,[Kysely] = case when v2.kysely_fi like '%työpaikkakysely%' then 'Työpaikkakysely' else 'Työpaikkaohjaajakysely' end
	,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

	,[Tutkinto]
	,[Tutkintotyyppi]
	,[Koulutusala, taso 1]
	,[Koulutusala, taso 2]
	,[Koulutusala, taso 3]
	
	,v2.koulutuksen_jarjestaja_fi
	,v2.koulutuksen_jarjestajan_kunta_fi
	,v2.koulutuksen_jarjestajan_maakunta_fi
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Oppilaitos]
	,[Oppilaitoksen kunta]
	,[Oppilaitoksen maakunta]

	--koodit
	,v2.koodit_koulutuksen_jarjestaja
	,[Koodit Tutkinto]

	--jarjestys
	,v2.jarjestys_koulutuksen_jarjestajan_maakunta
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Oppilaitoksen maakunta]
	,[jarjestys Tutkintotyyppi]
	,[jarjestys Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 2]
	,[jarjestys Koulutusala, taso 3]

	--apusarakkeet
	,v2.apusarake_pisteet
	,v2.apusarake_painotetut_pisteet

FROM dw.v_amos_tyoelamapalaute v2
WHERE right(rahoituskausi, 4) > 2022

GO
