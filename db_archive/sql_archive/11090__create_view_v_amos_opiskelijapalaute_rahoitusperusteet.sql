USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_opiskelijapalaute_rahoitusperusteet] AS

SELECT 
	generoitu
	,[Varainhoitovuosi]
	,[Koodit Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjä]

	,aloituskysely_painotetut_pisteet = cast(sum(case when v.[Kysely] = 'Aloituskysely' then v.painotetut_pisteet end) as decimal(30,20))
	,aloituskysely_painotetut_pisteet_osuus = cast(
		cast(sum(case when v.[Kysely] = 'Aloituskysely' then cast(v.painotetut_pisteet as decimal(30,20)) end) as decimal(18,10))
		/ cast(sum(cast(sum(case when v.[Kysely] = 'Aloituskysely' then cast(v.painotetut_pisteet as decimal(30,20)) end) as decimal(30,20))) over (partition by v.[Varainhoitovuosi], v.generoitu) as decimal(18,10))
		as decimal(20,19)
	)
	,paattokysely_painotetut_pisteet = cast(sum(case when v.[Kysely] = 'Päättökysely' then case when v.[Kyselyn kohderyhmä] = 'Koko tutkinnon suorittaneet' then 3 else 1 end * v.painotetut_pisteet end) as decimal(30,20))
	,paattokysely_painotetut_pisteet_osuus = cast(
		cast(sum(case when v.[Kysely] = 'Päättökysely' then cast(case when v.[Kyselyn kohderyhmä] = 'Koko tutkinnon suorittaneet' then 3 else 1 end * v.painotetut_pisteet as decimal(30,20)) end) as decimal(18,10))
		/ cast(sum(cast(sum(case when v.[Kysely] = 'Päättökysely' then cast(case when v.[Kyselyn kohderyhmä] = 'Koko tutkinnon suorittaneet' then 3 else 1 end * v.painotetut_pisteet as decimal(30,20)) end) as decimal(30,20))) over (partition by v.[Varainhoitovuosi], v.generoitu) as decimal(18,10))
		as decimal(20,19)
	)

FROM dw.v_amos_opiskelijapalaute_uusi v

WHERE v.[Suoritepäätös (viimeisin)] = 'Kyllä'

GROUP BY 
	generoitu
	,[Varainhoitovuosi]
	,[Koodit Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjä]

GO
