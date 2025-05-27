USE [ANTERO]
GO

/****** Object:  View [sa].[v_sa_amos_suoritepaatos_perusrahoituksen_kohdennukset]    Script Date: 16.2.2024 11:20:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [sa].[v_sa_amos_suoritepaatos_perusrahoituksen_kohdennukset] AS

SELECT
	[Koulutuksen järjestäjä]
	,[Y-tunnus]
	,[Omistajatyyppi]
	,[Vuosi]
	,[Suoritepäätöksen tyyppi]
	,[Suoritepäätös]
	,[Talousarvio]
	,[Työvoimakoulutuksen kohdennus]
	,[Käyttötarkoituksen kohdennus]

	/*
	,[Käyttötarkoituksen kohdennus_koodi] = 
		case [Käyttötarkoituksen kohdennus]
			when 'Lähihoitajakoulutuksen lisääminen' then 1
			when 'Hoiva-avustajakoulutuksen lisääminen työvoimakoulutuksena' then 2
			when 'Ukrainasta tulleille pakolaisille järjestettävä ammatillinen koulutus ja TUVA-koulutus' then 3
			when 'Koronavirusepidemian johdosta tarvittaviin tukitoimiin' then 4
			when 'Erityisen kalliin koulutuksen järjestämisen turvaaminen' then 5
			when 'Yksittäisen koulutuksen järjestämisen turvaaminen' then 6
			when 'Työpaikkaohjaajien koulutuksen lisääminen ja kehittäminen' then 7
			when 'Urheilijoiden ammatillisen koulutuksen tukeminen' then 8
			when 'Oppivelvollisuuslain mukaisten majoitus- ja matkakorvausten vuoksi aiheutuvien kustannusten kattaminen' then 9
			when 'Muu syy, joka ei ollut ennakoitavissa varsinaista suoritepäätöstä tehtäessä' then 10
			when 'Koronavirusepidemian johdosta tarvittaviin tukitoimiin' then 11
			when 'Rahoituksen määräytymisperusteiden muutoksista aiheutuvien kohtuuttoman suurten kertamuutosten kompensointi' then 12
			when 'Opettajien ja ohjaajien palkkaaminen sekä opetuksen ja ohjauksen tukitoimet' then 13
			when 'Oppisopimuskoulutuksen koulutuskorvauksen uudistamisen kokeilu' then 14
			...
			else 99
		end
	*/
		
	,[Lukumäärätieto_koodi] =
		case [Lukumäärätieto]
			when 'Tavoitteellinen opiskelijavuosimäärä' then 1 -- <-> '..., yhteensä' - tarvittaessa dimensiossa 0-koodi, huom. tällöin vastaava mittariehto
			when 'Painotetut tavoitteelliset opiskelijavuodet' then 5
			when 'Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €' then 6
			when 'Harkinnanvarainen korotus, €' then 8
			when 'Perusrahoitus yhteensä, €' then 9
			else 99
		end
	,[arvo]

	,[raportti] = 'perusrahoituksen_kohdennukset'

FROM (
	SELECT 
		[Koulutuksen järjestäjä]
		,[Omistajatyyppi]
		,[Y-tunnus]
		,[Vuosi]
		,[Suoritepäätöksen tyyppi]
		,[Suoritepäätös]
		,[Talousarvio]
		,[Käyttötarkoituksen kohdennus]
		,[Työvoimakoulutuksen kohdennus]
		--yhdenmukaistetaan tietotyyppi pivotointia varten
		,[Tavoitteellinen opiskelijavuosimäärä] = cast([Tavoitteellinen opiskelijavuosimäärä] as decimal(20,5))
		,[Painotetut tavoitteelliset opiskelijavuodet] = cast([Painotetut tavoitteelliset opiskelijavuodet] as decimal(20,5))
		,[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] = cast([Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] as decimal(20,5))
		,[Harkinnanvarainen korotus, €] = cast([Harkinnanvarainen korotus, €] as decimal(20,5))
		,[Perusrahoitus yhteensä, €] = cast([Perusrahoitus yhteensä, €] as decimal(20,5))
	FROM [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset]
) q
UNPIVOT (
	[arvo] for [Lukumäärätieto] in (
		[Tavoitteellinen opiskelijavuosimäärä]
		,[Painotetut tavoitteelliset opiskelijavuodet]
		,[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €]
		,[Harkinnanvarainen korotus, €]
		,[Perusrahoitus yhteensä, €]
	)
) unpvt

WHERE [arvo] != 0.00000

GO
