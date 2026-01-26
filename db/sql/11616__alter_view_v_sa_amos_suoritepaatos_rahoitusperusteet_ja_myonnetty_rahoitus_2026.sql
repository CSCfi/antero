USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [sa].[v_sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026] AS

SELECT 
	[Koulutuksen järjestäjä]
	,[Y-tunnus]
	,[Omistajatyyppi]
	,[Vuosi]
	,[Suoritepäätöksen tyyppi]
	,[Suoritepäätös]
	,[Lukumäärätieto_koodi] = (
		select koodi 
		from [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026]
		where selite_fi = [Lukumäärätieto]
	)
	,[arvo]
	,[raportti] = 'rahoitusperusteet_ja_myonnetty_rahoitus'
	
FROM (
	SELECT 
		[Koulutuksen järjestäjä]
		,[Omistajatyyppi]
		,[Y-tunnus]
		,[Vuosi]
		,[Suoritepäätöksen tyyppi]
		,[Suoritepäätös]
		,[Tavoitteellinen opiskelijavuosimäärä yhteensä]
		,[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus]
		,[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus]
		,[Profiilikerroin]
		,[Painotetut tavoitteelliset opiskelijavuodet]
		,[Tavoitteelliset opiskelijavuodet, €]
		,[Kiky-vähennys, €]
		,[Painottamattomat opiskelijavuodet]
		,[Lähtötason mukaan painotetut opiskelijavuodet]
		,[Lähtötason mukaan painotetut opiskelijavuodet, €]
		,[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet]
		,[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet, €]
		,[Toteutuneet opiskelijavuodet yhteensä, €]
		,[Osaamispisteiden määrä]
		,[Tutkinnon osien painotetut osaamispisteet]
		,[Tutkintojen määrä]
		,[Tutkintojen painotetut pisteet]
		,[Osaamispisteiden ja tutkintojen pisteiden painotettu määrä]
		,[Osaamispisteet ja tutkinnot, €]
		,[Jatko-opintoihin siirtyneet ja työllistyneet]
		,[Jatko-opintoihin siirtyneet ja työllistyneet, painotettu määrä]
		,[Jatko-opintoihin siirtyneet ja työllistyneet, €]
		,[Opiskelunsa aloittaneiden palautteen pisteet]
		,[Opiskelunsa aloittaneiden palautteen painotetut pisteet]
		,[Opiskelunsa aloittaneiden opiskelijapalaute, €]
		,[Opiskelunsa päättäneiden palautteen pisteet]
		,[Opiskelunsa päättäneiden palautteen painotetut pisteet]
		,[Opiskelunsa päättäneiden opiskelijapalaute, €]
		,[Työpaikkaohjaajakyselyn pisteet]
		,[Työpaikkaohjaajakyselyn painotetut pisteet]
		,[Työpaikkaohjaajakysely, €]
		,[Työpaikkakyselyn pisteet]
		,[Työpaikkakysely, €]
		,[Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €]
		,[Muutosrajoitteiden vaikutus (2026-2028), €]
		,[Laskennallinen perusrahoitus, €]
		,[Harkinnanvarainen rahoitus, €]
		,[Rahoitus yhteensä (ei sis. alv), €]
		,[Arvonlisäverokorvaus, €]
	FROM [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026]
) q
UNPIVOT (
	[arvo] for [Lukumäärätieto] in (
		[Tavoitteellinen opiskelijavuosimäärä yhteensä]
		,[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus]
		,[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus]
		,[Profiilikerroin]
		,[Painotetut tavoitteelliset opiskelijavuodet]
		,[Tavoitteelliset opiskelijavuodet, €]
		,[Kiky-vähennys, €]
		,[Painottamattomat opiskelijavuodet]
		,[Lähtötason mukaan painotetut opiskelijavuodet]
		,[Lähtötason mukaan painotetut opiskelijavuodet, €]
		,[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet]
		,[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet, €]
		,[Toteutuneet opiskelijavuodet yhteensä, €]
		,[Osaamispisteiden määrä]
		,[Tutkinnon osien painotetut osaamispisteet]
		,[Tutkintojen määrä]
		,[Tutkintojen painotetut pisteet]
		,[Osaamispisteiden ja tutkintojen pisteiden painotettu määrä]
		,[Osaamispisteet ja tutkinnot, €]
		,[Jatko-opintoihin siirtyneet ja työllistyneet]
		,[Jatko-opintoihin siirtyneet ja työllistyneet, painotettu määrä]
		,[Jatko-opintoihin siirtyneet ja työllistyneet, €]
		,[Opiskelunsa aloittaneiden palautteen pisteet]
		,[Opiskelunsa aloittaneiden palautteen painotetut pisteet]
		,[Opiskelunsa aloittaneiden opiskelijapalaute, €]
		,[Opiskelunsa päättäneiden palautteen pisteet]
		,[Opiskelunsa päättäneiden palautteen painotetut pisteet]
		,[Opiskelunsa päättäneiden opiskelijapalaute, €]
		,[Työpaikkakyselyn pisteet]
		,[Työpaikkakysely, €]
		,[Työpaikkaohjaajakyselyn pisteet]
		,[Työpaikkaohjaajakyselyn painotetut pisteet]
		,[Työpaikkaohjaajakysely, €]
		,[Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €]
		,[Muutosrajoitteiden vaikutus (2026-2028), €]
		,[Laskennallinen perusrahoitus, €]
		,[Harkinnanvarainen rahoitus, €]
		,[Rahoitus yhteensä (ei sis. alv), €]
		,[Arvonlisäverokorvaus, €]
	)
) unpvt

WHERE [arvo] != 0.00000000

GO
