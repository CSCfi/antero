USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [sa].[v_sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus] AS

SELECT 
	[Koulutuksen järjestäjä]
	,[Y-tunnus]
	,[Omistajatyyppi]
	,[Vuosi]
	,[Suoritepäätöksen tyyppi]
	,[Suoritepäätös]

	,[Lukumäärätieto_koodi] = 
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
		,[Harkinnanvarainen korotus, €] = cast([Harkinnanvarainen korotus, €] as decimal(20,5))
		,[Perusrahoitus yhteensä, €] = cast([Perusrahoitus yhteensä, €] as decimal(20,5))
		,[Tutkintojen määrä] = cast([Tutkintojen määrä] as decimal(20,5))
		,[Tutkintojen painotetut pisteet] = cast([Tutkintojen painotetut pisteet] as decimal(20,5))
		,[Tutkinnon osien osaamispisteet] = cast([Tutkinnon osien osaamispisteet] as decimal(20,5))
		,[Tutkinnon osien painotetut osaamispisteet] = cast([Tutkinnon osien painotetut osaamispisteet] as decimal(20,5))
		,[Tutkintojen ja tutkinnon osien painotetut pisteet yhteensä] = cast([Tutkintojen ja tutkinnon osien painotetut pisteet yhteensä] as decimal(20,5))
		,[Suoritusrahoitus yhteensä, €] = cast([Suoritusrahoitus yhteensä, €] as decimal(20,5))
		,[Työllistyneet ja jatko-opintoihin siirtyneet] = cast([Työllistyneet ja jatko-opintoihin siirtyneet] as decimal(20,5))
		,[Työllistyneet ja jatko-opintoihin siirtyneet, painotetut pisteet] = cast([Työllistyneet ja jatko-opintoihin siirtyneet, painotetut pisteet] as decimal(20,5))
		,[Työllistyneet ja jatko-opintoihin siirtyneet, €] = cast([Työllistyneet ja jatko-opintoihin siirtyneet, €] as decimal(20,5))
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
		,[Vaikuttavuusrahoitus yhteensä, €] = cast([Vaikuttavuusrahoitus yhteensä, €] as decimal(20,5))
		,[Laskennallinen rahoitus yhteensä (ei sis. alv), €] = cast([Laskennallinen rahoitus yhteensä (ei sis. alv), €] as decimal(20,5))
		,[Arvonlisäverokorvaus, €] = cast([Arvonlisäverokorvaus, €] as decimal(20,5))
	FROM [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus]
) q
UNPIVOT (
	[arvo] for [Lukumäärätieto] in (
		[Tavoitteellinen opiskelijavuosimäärä yhteensä]
		,[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus]
		,[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus]
		,[Painotetut tavoitteelliset opiskelijavuodet]
		,[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €]
		,[Kiky-vähennys, €]
		,[Harkinnanvarainen korotus, €]
		,[Perusrahoitus yhteensä, €]
		,[Tutkintojen määrä]
		,[Tutkintojen painotetut pisteet]
		,[Tutkinnon osien osaamispisteet]
		,[Tutkinnon osien painotetut osaamispisteet]
		,[Tutkintojen ja tutkinnon osien painotetut pisteet yhteensä]
		,[Suoritusrahoitus yhteensä, €]
		,[Työllistyneet ja jatko-opintoihin siirtyneet]
		,[Työllistyneet ja jatko-opintoihin siirtyneet, painotetut pisteet]
		,[Työllistyneet ja jatko-opintoihin siirtyneet, €]
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
		,[Vaikuttavuusrahoitus yhteensä, €]
		,[Laskennallinen rahoitus yhteensä (ei sis. alv), €]
		,[Arvonlisäverokorvaus, €]
	)
) unpvt

WHERE [arvo] != ''

GO
