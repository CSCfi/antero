USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_palautteet]    Script Date: 8.12.2025 9.11.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_palautteet] AS 

SELECT 
	[Toteuma/Estimaatti] = case when v.generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,[Varainhoitovuosi]
	,[Rahoituskausi]
	,[Rahoituskausi (palautteet)] = [Rahoituskausi]
	,[Tilastokausi] = [Suorituskausi]
	,[Tilastovuosi]
	,[Tilastokuukausi]
	,[Järjestäjärakenne]

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
	,[Toiminnanohjauksen kokeilu]
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Oppilaitos]
	,[Oppilaitoksen kunta]
	,[Oppilaitoksen maakunta]

	--koodit
	,[Koodit Koulutuksen järjestäjä]
	,[Koodit Tutkinto]

	--jarjestys
	,[jarjestys Tilastokuukausi]
	,[jarj Koulutuksen järjestäjän maakunta]
	,[jarjestys Toiminnanohjauksen kokeilu]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Oppilaitoksen maakunta]
	,[jarjestys Tutkintotyyppi]
	,[jarjestys Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 2]
	,[jarjestys Koulutusala, taso 3]

	--apusarakkeet
	,pisteet = cast(pisteet as decimal(12,4))
	,painotetut_pisteet = cast(painotetut_pisteet as decimal(20,10))

FROM dw.v_amos_opiskelijapalaute_uusi v

UNION ALL

SELECT 
	[Toteuma/Estimaatti] = case when generoitu = 1 then 'Estimaatti' else 'Toteuma' end
	,varainhoitovuosi
	,rahoituskausi
	,[Rahoituskausi (palautteet)] = rahoituskausi
	,tilastokausi = suorituskausi
	,tilastovuosi
	,tilastokuukausi
	,[Järjestäjärakenne] = case when sisaltyy_amos_spl = 1 then 'Viimeisin suoritepäätös' else 'Poistuneet järjestäjät' end
	
	,[Kokonaisuus] = 'Työelämäpalaute'

	,[Kysely] = case when kysely_fi like '%työpaikkakysely%' then 'Työpaikkakysely' else 'Työpaikkaohjaajakysely' end
	,[Kyselyn kohderyhmä] = 'Tieto puuttuu'

	,[Tutkinto]
	,[Tutkintotyyppi]
	,[Koulutusala, taso 1]
	,[Koulutusala, taso 2]
	,[Koulutusala, taso 3]
	
	,koulutuksen_jarjestaja_fi
	,koulutuksen_jarjestajan_kunta_fi
	,koulutuksen_jarjestajan_maakunta_fi
	,[Toiminnanohjauksen kokeilu]
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Oppilaitos]
	,[Oppilaitoksen kunta]
	,[Oppilaitoksen maakunta]

	--koodit
	,koodit_koulutuksen_jarjestaja
	,[Koodit Tutkinto]

	--jarjestys
	,jarjestys_tilastokuukausi
	,jarjestys_koulutuksen_jarjestajan_maakunta
	,[jarjestys Toiminnanohjauksen kokeilu]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Oppilaitoksen maakunta]
	,[jarjestys Tutkintotyyppi]
	,[jarjestys Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 2]
	,[jarjestys Koulutusala, taso 3]

	--apusarakkeet
	,apusarake_pisteet
	,apusarake_painotetut_pisteet

FROM dw.v_amos_tyoelamapalaute v2

GO
