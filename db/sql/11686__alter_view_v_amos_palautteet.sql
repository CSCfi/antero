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
	
	,[Toiminnanohjauksen kokeilu]
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,[Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjän kunta]
	,[Koulutuksen järjestäjän maakunta]
	,[Oppilaitos]
	,[Oppilaitoksen kunta]
	,[Oppilaitoksen maakunta]
	,[Toimipiste]
	,[Toimipisteen kunta]
	,[Toimipisteen maakunta]

	--koodit
	,[Koodit Koulutuksen järjestäjä]
	,[Koodit Oppilaitos]
	,[Koodit Toimipiste (OID)]
	,[Koodit Tutkinto]

	--jarjestys
	,[jarjestys Tilastokuukausi]
	,[jarjestys Toiminnanohjauksen kokeilu]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,[jarjestys Koulutuksen järjestäjän maakunta]
	,[jarjestys Oppilaitoksen maakunta]
	,[jarjestys Toimipisteen maakunta]
	,[jarjestys Tutkintotyyppi]
	,[jarjestys Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 2]
	,[jarjestys Koulutusala, taso 3]

	--apusarakkeet
	,pisteet = cast(pisteet as decimal(12,4))
	,painotetut_pisteet = cast(painotetut_pisteet as decimal(20,10))
	,kohteet = cast(kohteet as decimal(12,4))
	,vastanneet = cast(vastanneet as decimal(12,4))

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
	
	,[Toiminnanohjauksen kokeilu]
	,[Koul. järjestäjän PILKE-alue (kokeilu)]
	,koulutuksen_jarjestaja_fi
	,koulutuksen_jarjestajan_kunta_fi
	,koulutuksen_jarjestajan_maakunta_fi
	,[Oppilaitos]
	,[Oppilaitoksen kunta]
	,[Oppilaitoksen maakunta]
	,[Toimipiste]
	,[Toimipisteen kunta]
	,[Toimipisteen maakunta]

	--koodit
	,koodit_koulutuksen_jarjestaja
	,[Koodit Oppilaitos]
	,[Koodit Toimipiste (OID)]
	,[Koodit Tutkinto]

	--jarjestys
	,jarjestys_tilastokuukausi
	,[jarjestys Toiminnanohjauksen kokeilu]
	,[jarjestys Koul. järjestäjän PILKE-alue (kokeilu)]
	,jarjestys_koulutuksen_jarjestajan_maakunta
	,[jarjestys Oppilaitoksen maakunta]
	,[jarjestys Toimipisteen maakunta]
	,[jarjestys Tutkintotyyppi]
	,[jarjestys Koulutusala, taso 1]
	,[jarjestys Koulutusala, taso 2]
	,[jarjestys Koulutusala, taso 3]

	--apusarakkeet
	,apusarake_pisteet
	,apusarake_painotetut_pisteet
	,apusarake_kohteet
	,apusarake_vastanneet

FROM dw.v_amos_tyoelamapalaute v2

GO
