USE [ANTERO]
GO

DROP TABLE IF EXISTS [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026](
	[Koulutuksen järjestäjä] [varchar](255) NULL,
	[Y-tunnus] [varchar](10) NULL,
	[Omistajatyyppi] [varchar](255) NULL,
	[Vuosi] [varchar](4) NULL,
	[Suoritepäätöksen tyyppi] [varchar](255) NULL,
	[Suoritepäätös] [varchar](255) NULL,
	[Talousarvio] [varchar](255) NULL,
	[Käyttötarkoituksen kohdennus] [varchar](255) NULL,
	[Harkinnanvarainen rahoitus, €] [decimal](20,5) NULL,
	[source] [varchar](255) NULL
) ON [PRIMARY]
GO
