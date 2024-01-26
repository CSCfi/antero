USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset]    Script Date: 24.11.2023 14:18:09 ******/
DROP TABLE IF EXISTS [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset]
GO

/****** Object:  Table [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset]    Script Date: 24.11.2023 14:18:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset](
	[Koulutuksen järjestäjä] [varchar](255) NULL,
	[Y-tunnus] [varchar](10) NULL,
	[Omistajatyyppi] [varchar](255) NULL,
	[Vuosi] [varchar](4) NULL,
	[Suoritepäätöksen tyyppi] [varchar](255) NULL,
	[Suoritepäätös] [varchar](255) NULL,
	[Talousarvio] [varchar](255) NULL,
	[Käyttötarkoituksen kohdennus] [varchar](255) NULL,
	[Työvoimakoulutuksen kohdennus] [varchar](255) NULL,
	[Tavoitteellinen opiskelijavuosimäärä] [int] NULL,
	[Painotetut tavoitteelliset opiskelijavuodet] [decimal](20, 1) NULL,
	[Perusrahoitus tavoitteellisten opiskelijavuosien perusteella, €] [int] NULL,
	[Harkinnanvarainen korotus, €] [int] NULL,
	[tiedostonimi] [varchar](255) NULL,
	[lastmodified] [datetime2](7) NULL,
	[source] [varchar](255) NULL,
	[imp_date] [datetime2](7) NULL
) ON [PRIMARY]

GO
