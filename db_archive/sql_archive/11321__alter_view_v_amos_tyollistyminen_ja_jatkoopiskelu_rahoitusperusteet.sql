USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu_rahoitusperusteet] AS

SELECT 
	[Toteuma/Estimaatti]
	,[Varainhoitovuosi]
	,[Koodit Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjä]

	,tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka = 0.5 * sum([lkm])
	,tyoll_ja_jatkoopisk_ei_tyoll_ennen_koul_ka_osuus = cast(
		cast(1.0 * sum([lkm]) as decimal(18,12)) 
		/ cast(sum(sum([lkm])) over (partition by [Varainhoitovuosi], [Toteuma/Estimaatti]) as decimal(18,12))
		as decimal(30,29)
	)

	FROM [dw].[v_amos_tyollistyminen_ja_jatkoopiskelu]

	WHERE 1=1
	AND [jarj Työllisen määritelmä] = 2 --'Väh. 2 kk työllisenä'
	AND [jarj Työllisen määritelmä (palkansaaja)] = 2 
	AND [jarj Työllisen määritelmä (yrittäjä)] = 2 
	AND trim([Työllinen ennen koulutusta]) = 'Ei työllinen ennen koulutuksen alkamisvuotta'
	AND trim([Sijoittuminen]) = 'Työllinen tai korkeakouluopiskelija'
	AND [Järjestäjärakenne] = 'Viimeisin suoritepäätös'

GROUP BY 
	[Toteuma/Estimaatti]
	,[Varainhoitovuosi]
	,[Koodit Koulutuksen järjestäjä]
	,[Koulutuksen järjestäjä]

GO
