USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_tyoelamapalaute_rahoitusperusteet] AS

SELECT 
	v2.generoitu
	,[Varainhoitovuosi] = right(v2.rahoituskausi, 4) + 1
	,v2.koodit_koulutuksen_jarjestaja
	,v2.koulutuksen_jarjestaja_fi

	,tyopaikkakysely_pisteet = cast(sum(case when v2.kysely_fi like '%työpaikkakysely%' then v2.apusarake_pisteet end) as decimal(30,10))
	,tyopaikkakysely_pisteet_osuus = 
		cast(sum(case when v2.kysely_fi like '%työpaikkakysely%' then v2.apusarake_pisteet end) as decimal(20,10))
		/ cast(
			sum(sum(case when v2.kysely_fi like '%työpaikkakysely%' then v2.apusarake_pisteet end)) over (partition by v2.rahoituskausi, v2.generoitu)
			as decimal(20,10)
		)
	
	,tyopaikkaohjaajakysely_painotetut_pisteet = cast(sum(case when v2.kysely_fi not like '%työpaikkakysely%' then v2.apusarake_painotetut_pisteet end) as decimal(30,10))
	,tyopaikkaohjaajakysely_painotetut_pisteet_osuus = 
		cast(sum(case when v2.kysely_fi not like '%työpaikkakysely%' then v2.apusarake_painotetut_pisteet end) as decimal(20,10))
		/ cast(
			sum(sum(case when v2.kysely_fi not like '%työpaikkakysely%' then v2.apusarake_painotetut_pisteet end)) over (partition by v2.rahoituskausi, v2.generoitu)
			as decimal(20,10)
		)

FROM dw.v_amos_tyoelamapalaute v2

WHERE right(rahoituskausi, 4) > 2022
AND v2.sisaltyy_amos_spl = 1

GROUP BY 
	generoitu
	,v2.rahoituskausi
	,koodit_koulutuksen_jarjestaja
	,koulutuksen_jarjestaja_fi

GO
