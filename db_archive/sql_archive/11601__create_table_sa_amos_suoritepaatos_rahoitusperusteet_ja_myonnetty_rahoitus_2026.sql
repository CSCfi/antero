USE [ANTERO]
GO

DROP TABLE IF EXISTS [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_2026](
	[Koulutuksen järjestäjä] [nvarchar](255) NULL,
	[Y-tunnus] [nvarchar](10) NULL,
	[Omistajatyyppi] [nvarchar](255) NULL,
	[Vuosi] [nvarchar](4) NULL,
	[Suoritepäätöksen tyyppi] [nvarchar](255) NULL,
	[Suoritepäätös] [nvarchar](255) NULL,
	[Tavoitteellinen opiskelijavuosimäärä yhteensä] [decimal](20,5) NULL,
	[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus] [decimal](20,5) NULL,
	[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus] [decimal](20,5) NULL,
	[Profiilikerroin] [decimal](20, 4) NULL,
	[Painotetut tavoitteelliset opiskelijavuodet] [decimal](20,5) NULL,
	[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] [decimal](20,5) NULL,
	[Painottamattomat opiskelijavuodet] [decimal](20,5) NULL,
	[Lähtötason mukaan painotetut opiskelijavuodet] [decimal](20,5) NULL,
	[Lähtötason mukaan painotetut opiskelijavuodet, €] [decimal](20,5) NULL,
	[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet] [decimal](20,5) NULL,
	[Kustannusryhmän ja muiden perusteiden mukaan painotetut opiskelijavuodet, €] [decimal](20,5) NULL,
	[Toteutuneet opiskelijavuodet yhteensä, €] [decimal](20,5) NULL,
	[Kiky-vähennys, €] [decimal](20,5) NULL,
	[Osaamispisteiden määrä] [decimal](20,5) NULL,
	[Tutkinnon osien painotetut osaamispisteet] [decimal](20,5) NULL,
	[Tutkintojen määrä] [decimal](20,5) NULL,
	[Tutkintojen painotetut pisteet] [decimal](20,5) NULL,
	[Osaamispisteiden ja tutkintojen pisteiden painotettu määrä] [decimal](20,5) NULL,
	[Osaamispisteet ja tutkinnot, €] [decimal](20,5) NULL,
	[Jatko-opintoihin siirtyneet ja työllistyneet] [decimal](20,5) NULL,
	[Jatko-opintoihin siirtyneet ja työllistyneet, painotettu määrä] [decimal](20,5) NULL,
	[Jatko-opintoihin siirtyneet ja työllistyneet, €] [decimal](20,5) NULL,
	[Opiskelunsa aloittaneiden palautteen pisteet] [decimal](20,5) NULL,
	[Opiskelunsa aloittaneiden palautteen painotetut pisteet] [decimal](20,5) NULL,
	[Opiskelunsa aloittaneiden opiskelijapalaute, €] [decimal](20,5) NULL,
	[Opiskelunsa päättäneiden palautteen pisteet] [decimal](20,5) NULL,
	[Opiskelunsa päättäneiden palautteen painotetut pisteet] [decimal](20,5) NULL,
	[Opiskelunsa päättäneiden opiskelijapalaute, €] [decimal](20,5) NULL,
	[Työpaikkakyselyn pisteet] [decimal](20,5) NULL,
	[Työpaikkakysely, €] [decimal](20,5) NULL,
	[Työpaikkaohjaajakyselyn pisteet] [decimal](20,5) NULL,
	[Työpaikkaohjaajakyselyn painotetut pisteet] [decimal](20,5) NULL,
	[Työpaikkaohjaajakysely, €] [decimal](20,5) NULL,
	[Laskennallinen perusrahoitus ennen muutosrajoitteiden vaikutusta (2026-2028), €] [decimal](20,5) NULL,
	[Muutosrajoitteiden vaikutus (2026-2028), €] [decimal](20,5) NULL,
	[Laskennallinen perusrahoitus, €] [decimal](20,5) NULL,
	[Harkinnanvarainen rahoitus, €] [decimal](20,5) NULL,
	[Rahoitus yhteensä (ei sis. alv), €] [decimal](20,5) NULL,
	[Arvonlisäverokorvaus, €] [decimal](20,5) NULL,
	[source] [nvarchar](50) NULL
) ON [PRIMARY]
GO


