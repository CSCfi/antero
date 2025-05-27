USE [AnteroAPI]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[amm_perusrahoituksen_kohdennukset]') AND type in (N'U'))
DROP TABLE [api].[amm_perusrahoituksen_kohdennukset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_perusrahoituksen_kohdennukset](
	[defaultorder] [int] NOT NULL,
	[vuosi] [varchar](4) NOT NULL,
	[suoritepaatos] [varchar](255) NOT NULL,
	[suoritepaatoksen_tyyppi] [varchar](255) NOT NULL,
	[talousarvio] [varchar](255) NOT NULL,
	[kayttotarkoituksen_kohdennus] [varchar](255) NOT NULL,
	[tyovoimakoulutuksen_kohdennus] [varchar](255) NOT NULL,
	[koulutuksen_jarjestaja] [varchar](255) NOT NULL,
	[koulutuksen_jarjestajan_omistajatyyppi] [varchar](255) NOT NULL,
	[koulutuksen_jarjestajan_opetuskieli] [varchar](50) NOT NULL,
	[koulutuksen_jarjestajan_kunta] [nvarchar](200) NOT NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](10) NOT NULL,
	[koodit_koulutuksen_jarjestajan_kunta] [varchar](3) NOT NULL,
	[lukumaaratieto] [varchar](255) NOT NULL,
	[lukumaara] [decimal](15, 1) NOT NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
	PRIMARY KEY CLUSTERED 
	(
		[defaultorder] ASC
	) WITH (
		PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
	) ON [PRIMARY]
) ON [PRIMARY]
GO
