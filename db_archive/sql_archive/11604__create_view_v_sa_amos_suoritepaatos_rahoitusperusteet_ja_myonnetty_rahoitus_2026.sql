USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [sa].[v_sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026] AS

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
	/*
		case [Lukumäärätieto]
			when 'Tavoitteellinen opiskelijavuosimäärä yhteensä' then 1
			when 'Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus' then 2
			when 'Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus' then 3
			when 'Profiilikerroin' then 4
			when 'Painotetut tavoitteelliset opiskelijavuodet' then 5
			when 'Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €' then 6
			when 'Kiky-vähennys, €' then 7
			when 'Harkinnanvarainen korotus, €' then 8
			when 'Perusrahoitus yhteensä, €' then 9
			when 'Tutkintojen määrä' then 10
			when 'Tutkintojen painotetut pisteet' then 11
			when 'Tutkinnon osien osaamispisteet' then 12
			when 'Tutkinnon osien painotetut osaamispisteet' then 13
			when 'Tutkintojen ja tutkinnon osien painotetut pisteet yhteensä' then 14
			when 'Suoritusrahoitus yhteensä, €' then 15
			when 'Työllistyneet ja jatko-opintoihin siirtyneet' then 16
			when 'Työllistyneet ja jatko-opintoihin siirtyneet, painotetut pisteet' then 17
			when 'Työllistyneet ja jatko-opintoihin siirtyneet, €' then 18
			when 'Opiskelunsa aloittaneiden palautteen pisteet' then 19
			when 'Opiskelunsa aloittaneiden palautteen painotetut pisteet' then 20
			when 'Opiskelunsa aloittaneiden opiskelijapalaute, €' then 21
			when 'Opiskelunsa päättäneiden palautteen pisteet' then 22
			when 'Opiskelunsa päättäneiden palautteen painotetut pisteet' then 23
			when 'Opiskelunsa päättäneiden opiskelijapalaute, €' then 24
			when 'Työpaikkaohjaajakyselyn pisteet' then 25
			when 'Työpaikkaohjaajakyselyn painotetut pisteet' then 26
			when 'Työpaikkaohjaajakysely, €' then 27
			when 'Työpaikkakyselyn pisteet' then 28
			when 'Työpaikkakysely, €' then 29
			when 'Vaikuttavuusrahoitus yhteensä, €' then 30
			when 'Laskennallinen rahoitus yhteensä (ei sis. alv), €' then 31
			when 'Arvonlisäverokorvaus, €' then 32
			else 99
		end
	*/
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
		--yhdenmukaistetaan tietotyyppi pivotointia varten
		,[Tavoitteellinen opiskelijavuosimäärä yhteensä] = cast([Tavoitteellinen opiskelijavuosimäärä yhteensä] as decimal(20,5))
		,[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus] = cast([Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus] as decimal(20,5))
		,[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus] = cast([Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus] as decimal(20,5))
		,[Profiilikerroin] = cast([Profiilikerroin] as decimal(20,5))
		,[Painotetut tavoitteelliset opiskelijavuodet] = cast([Painotetut tavoitteelliset opiskelijavuodet] as decimal(20,5))
		,[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] = cast([Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] as decimal(20,5))
		,[Kiky-vähennys, €] = cast([Kiky-vähennys, €] as decimal(20,5))
		--,[Perusrahoitus yhteensä, €] = cast([Perusrahoitus yhteensä, €] as decimal(20,5))
		,[Painottamattomat opiskelijavuodet] = cast([Painottamattomat opiskelijavuodet] as decimal(20,5))
		,[Lähtötason mukaan painotetut opiskelijavuodet] = cast([Lähtötason mukaan painotetut opiskelijavuodet] as decimal(20,5))
		,[Lähtötason mukaan painotetut opiskelijavuodet, €] = cast([Lähtötason mukaan painotetut opiskelijavuodet, €] as decimal(20,5))
		,[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet] = cast([Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet] as decimal(20,5))
		,[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet, €] = cast([Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet, €] as decimal(20,5))
		,[Toteutuneet opiskelijavuodet yhteensä, €] = cast([Toteutuneet opiskelijavuodet yhteensä, €] as decimal(20,5))
		,[Osaamispisteiden määrä] = cast([Osaamispisteiden määrä] as decimal(20,5))
		,[Tutkinnon osien painotetut osaamispisteet] = cast([Tutkinnon osien painotetut osaamispisteet] as decimal(20,5))
		,[Tutkintojen määrä] = cast([Tutkintojen määrä] as decimal(20,5))
		,[Tutkintojen painotetut pisteet] = cast([Tutkintojen painotetut pisteet] as decimal(20,5))
		,[Osaamispisteiden ja tutkintojen pisteiden painotettu määrä] = cast([Osaamispisteiden ja tutkintojen pisteiden painotettu määrä] as decimal(20,5))
		,[Osaamispisteet ja tutkinnot, €] = cast([Osaamispisteet ja tutkinnot, €] as decimal(20,5))
		,[Jatko-opintoihin siirtyneet ja työllistyneet] = cast([Jatko-opintoihin siirtyneet ja työllistyneet] as decimal(20,5))
		,[Jatko-opintoihin siirtyneet ja työllistyneet, painotettu määrä] = cast([Jatko-opintoihin siirtyneet ja työllistyneet, painotettu määrä] as decimal(20,5))
		,[Jatko-opintoihin siirtyneet ja työllistyneet, €] = cast([Jatko-opintoihin siirtyneet ja työllistyneet, €] as decimal(20,5))
		,[Opiskelunsa aloittaneiden palautteen pisteet] = cast([Opiskelunsa aloittaneiden palautteen pisteet] as decimal(20,5))
		,[Opiskelunsa aloittaneiden palautteen painotetut pisteet] = cast([Opiskelunsa aloittaneiden palautteen painotetut pisteet] as decimal(20,5))
		,[Opiskelunsa aloittaneiden opiskelijapalaute, €] = cast([Opiskelunsa aloittaneiden opiskelijapalaute, €] as decimal(20,5))
		,[Opiskelunsa päättäneiden palautteen pisteet] = cast([Opiskelunsa päättäneiden palautteen pisteet] as decimal(20,5))
		,[Opiskelunsa päättäneiden palautteen painotetut pisteet] = cast([Opiskelunsa päättäneiden palautteen painotetut pisteet] as decimal(20,5))
		,[Opiskelunsa päättäneiden opiskelijapalaute, €] = cast([Opiskelunsa päättäneiden opiskelijapalaute, €] as decimal(20,5))
		,[Työpaikkaohjaajakyselyn pisteet] = cast([Työpaikkaohjaajakyselyn pisteet] as decimal(20,5))
		,[Työpaikkaohjaajakyselyn painotetut pisteet] = cast([Työpaikkaohjaajakyselyn painotetut pisteet] as decimal(20,5))
		,[Työpaikkaohjaajakysely, €] = cast([Työpaikkaohjaajakysely, €] as decimal(20,5))
		,[Työpaikkakyselyn pisteet] = cast([Työpaikkakyselyn pisteet] as decimal(20,5))
		,[Työpaikkakysely, €] = cast([Työpaikkakysely, €] as decimal(20,5))
		--,[Vaikuttavuusrahoitus yhteensä, €] = cast([Vaikuttavuusrahoitus yhteensä, €] as decimal(20,5))
		,[Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €] = cast([Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €] as decimal(20,5))
		,[Muutosrajoitteiden vaikutus (2026-2028), €] = cast([Muutosrajoitteiden vaikutus (2026-2028), €] as decimal(20,5))
		,[Laskennallinen perusrahoitus, €] = cast([Laskennallinen perusrahoitus, €] as decimal(20,5))
		,[Harkinnanvarainen rahoitus, €] = cast([Harkinnanvarainen rahoitus, €] as decimal(20,5))
		,[Rahoitus yhteensä (ei sis. alv), €] = cast([Rahoitus yhteensä (ei sis. alv), €] as decimal(20,5))
		,[Arvonlisäverokorvaus, €] = cast([Arvonlisäverokorvaus, €] as decimal(20,5))
		
	FROM [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026]
) q
UNPIVOT (
	[arvo] for [Lukumäärätieto] in (
		[Tavoitteellinen opiskelijavuosimäärä yhteensä]
		,[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus]
		,[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus]
		,[Profiilikerroin]
		,[Painotetut tavoitteelliset opiskelijavuodet]
		,[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €]
		,[Kiky-vähennys, €]
		--,[Perusrahoitus yhteensä, €]
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
		--,[Vaikuttavuusrahoitus yhteensä, €]
		,[Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €]
		,[Muutosrajoitteiden vaikutus (2026-2028), €]
		,[Laskennallinen perusrahoitus, €]
		,[Harkinnanvarainen rahoitus, €]
		,[Rahoitus yhteensä (ei sis. alv), €]
		,[Arvonlisäverokorvaus, €]
	)
) unpvt

WHERE [arvo] != 0.00000

GO
