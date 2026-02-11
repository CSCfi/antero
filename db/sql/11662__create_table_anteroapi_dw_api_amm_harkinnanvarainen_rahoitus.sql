USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_amm_harkinnanvarainen_rahoitus]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amm_harkinnanvarainen_rahoitus](
	[defaultorder] [int] NOT NULL,
	[vuosi] [varchar](4) NOT NULL,
	[suoritepaatos] [varchar](255) NOT NULL,
	[suoritepaatoksen_tyyppi] [varchar](255) NOT NULL,
	[talousarvio] [varchar](255) NOT NULL,
	[kayttotarkoituksen_kohdennus] [varchar](255) NOT NULL,
	[koulutuksen_jarjestaja] [varchar](255) NOT NULL,
	[koulutuksen_jarjestajan_omistajatyyppi] [varchar](255) NOT NULL,
	[koulutuksen_jarjestajan_opetuskieli] [varchar](50) NOT NULL,
	[koulutuksen_jarjestajan_kunta] [nvarchar](200) NOT NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](10) NOT NULL,
	[koodit_koulutuksen_jarjestajan_kunta] [varchar](3) NOT NULL,
	koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu [varchar](1) NULL,
	toiminnanohjauksen_kokeilu_kylla_ei [bit] NULL,
	[harkinnanvarainen_rahoitus_euroa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
