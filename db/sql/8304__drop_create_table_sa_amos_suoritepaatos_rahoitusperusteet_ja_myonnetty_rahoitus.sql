USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_kaikki]    Script Date: 22.11.2023 16.12.59 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_kaikki]') AND type in (N'U'))
DROP TABLE [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_kaikki]
GO

/****** Object:  Table [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_kaikki]    Script Date: 22.11.2023 16.12.59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus_kaikki](
	[Koulutuksen järjestäjä] [varchar](255) NULL,
	[Omistajatyyppi] [varchar](255) NULL,
	[Y-tunnus] [varchar](10) NULL,
	[Vuosi] [varchar](4) NULL,
	[Suoritepäätöksen tyyppi] [varchar](255) NULL,

	[Tavoitteellinen opiskelijavuosimäärä yhteensä] INT NULL,
	[Tavoitteellinen opiskelijavuosimäärä, muu kuin työvoimakoulutus] INT NULL,
	[Tavoitteellinen opiskelijavuosimäärä, työvoimakoulutus] INT NULL,
	[Profiilikerroin]  decimal(20,5) NULL,
	[Painotetut tavoitteelliset opiskelijavuodet]  decimal(20,1) NULL,
	[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] INT NULL,
	[Kiky-vähennys, €] INT NULL,
	[Harkinnanvarainen korotus, €] INT NULL,
	[Perusrahoitus yhteensä, €] INT NULL,
	[TutkINT NULLojen määrä] INT NULL,
	[TutkINT NULLojen painotetut pisteet]  decimal(20,1),
	[Tutkinnon osien osaamispisteet] INT NULL,
	[Tutkinnon osien painotetut osaamispisteet]  decimal(20,1),
	[TutkINT NULLojen ja tutkinnon osien painotetut pisteet yhteensä]  decimal(20,1) NULL,
	[Suoritusrahoitus yhteensä, €] INT NULL,
	[Työllistyneet ja jatko-opINT NULLoihin siirtyneet] INT NULL,
	[Työllistyneet ja jatko-opINT NULLoihin siirtyneet, painotetut pisteet]  decimal(20,1) NULL,
	[Työllistyneet ja jatko-opINT NULLoihin siirtyneet, €] INT NULL,
	[Opiskelunsa aloittaneiden palautteen pisteet] INT NULL,
	[Opiskelunsa aloittaneiden palautteen painotetut pisteet]  decimal(20,1) NULL,
	[Opiskelunsa aloittaneiden opiskelijapalaute, €] INT NULL,
	[Opiskelunsa päättäneiden palautteen pisteet] INT NULL,
	[Opiskelunsa päättäneiden palautteen painotetut pisteet]  decimal(20,1) NULL,
	[Opiskelunsa päättäneiden opiskelijapalaute, €] INT NULL,
	[Työpaikkaohjaajakyselyn pisteet] INT NULL,
	[Työpaikkaohjaajakyselyn painotetut pisteet] decimal(20,1) NULL,
	[Työpaikkaohjaajakysely, €] INT NULL,
	[Työpaikkakyselyn pisteet] INT NULL,
	[Työpaikkakysely, €] INT NULL,
	[Vaikuttavuusrahoitus yhteensä, €] INT NULL,
	[Laskennallinen rahoitus yhteensä (ei sis. alv), €] INT NULL,
	[Arvonlisäverokorvaus, €] INT NULL,
	[tiedostonimi] [varchar](255) NULL,
	[lastmodified] [datetime2](7) NULL,
	[source] [varchar](255) NULL,
	[imp_date] [datetime2](7) NULL
) ON [PRIMARY]
GO
