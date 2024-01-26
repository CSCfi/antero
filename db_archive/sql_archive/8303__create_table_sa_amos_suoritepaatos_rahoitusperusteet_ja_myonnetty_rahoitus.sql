USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus]') AND type in (N'U'))

BEGIN
USE [ANTERO]

CREATE TABLE [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus](
	[Koulutuksen järjestäjä] [varchar](255) NULL,
	[Omistajatyyppi] [varchar](255) NULL,
	[Y-tunnus] [varchar](10) NULL,
	[Vuosi] [varchar](4) NULL,
	[Suoritepäätöksen tyyppi] [varchar](255) NULL,
	[Tavoitteellinen opiskelijavuosimäärä yhteensä] [varchar](50) NULL,
	[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus] [varchar](50) NULL,
	[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus] [varchar](50) NULL,
	[Profiilikerroin] [varchar](50) NULL,
	[Painotetut tavoitteelliset opiskelijavuodet] [varchar](50) NULL,
	[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] [varchar](50) NULL,
	[Kiky-vähennys, €] [varchar](50) NULL,
	[Harkinnanvarainen korotus, €] [varchar](50) NULL,
	[Perusrahoitus yhteensä, €] [varchar](50) NULL,
	[Tutkintojen määrä] [varchar](50) NULL,
	[Tutkintojen painotetut pisteet] [varchar](50) NULL,
	[Tutkinnon osien osaamispisteet] [varchar](50) NULL,
	[Tutkinnon osien painotetut osaamispisteet] [varchar](50) NULL,
	[Tutkintojen ja tutkinnon osien painotetut pisteet yhteensä] [varchar](50) NULL,
	[Suoritusrahoitus yhteensä, €] [varchar](50) NULL,
	[Työllistyneet ja jatko-opintoihin siirtyneet] [varchar](50) NULL,
	[Työllistyneet ja jatko-opintoihin siirtyneet, painotetut pisteet] [varchar](50) NULL,
	[Työllistyneet ja jatko-opintoihin siirtyneet, €] [varchar](50) NULL,
	[Opiskelunsa aloittaneiden palautteen pisteet] [varchar](50) NULL,
	[Opiskelunsa aloittaneiden palautteen painotetut pisteet] [varchar](50) NULL,
	[Opiskelunsa aloittaneiden opiskelijapalaute, €] [varchar](50) NULL,
	[Opiskelunsa päättäneiden palautteen pisteet] [varchar](50) NULL,
	[Opiskelunsa päättäneiden palautteen painotetut pisteet] [varchar](50) NULL,
	[Opiskelunsa päättäneiden opiskelijapalaute, €] [varchar](50) NULL,
	[Työpaikkaohjaajakyselyn pisteet] [varchar](50) NULL,
	[Työpaikkaohjaajakyselyn painotetut pisteet] [varchar](50) NULL,
	[Työpaikkaohjaajakysely, €] [varchar](50) NULL,
	[Työpaikkakyselyn pisteet] [varchar](50) NULL,
	[Työpaikkakysely, €] [varchar](50) NULL,
	[Vaikuttavuusrahoitus yhteensä, €] [varchar](50) NULL,
	[Laskennallinen rahoitus yhteensä (ei sis. alv), €] [varchar](50) NULL,
	[Arvonlisäverokorvaus, €] [varchar](50) NULL,
	[tiedostonimi] [varchar](255) NULL,
	[lastmodified] [datetime2](7) NULL,
	[source] [varchar](255) NULL,
	[imp_date] [datetime2](7) NULL
) ON [PRIMARY]

END

GO
