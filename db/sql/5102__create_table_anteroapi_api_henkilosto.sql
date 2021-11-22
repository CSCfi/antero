USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [api].[henkilosto]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[henkilosto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[sukupuoli] [varchar](100) NULL,
	[kansalaisuus] [varchar](200) NULL,
	[tehtäväjaottelu] [varchar](55) NULL,
	[tutkijanuravaihe_tai_tuntiopettajuus] [varchar](255) NULL,
	[henkilöstöryhmä] [varchar](55) NULL,
	[henkilostoryhma(harjoittelukoulut)] [varchar](55) NULL,
	[merkittävimmän_tutkinnon_taso] [varchar](55) NULL,
	[muun_henkilöstön_henkilöstöryhmä] [varchar](55) NULL,
	[työsuhteen_nimitystapa] [varchar](55) NULL,
	[sektori] [varchar](21) NULL,
	[koulutusala_02] [varchar](255) NULL,
	[Koulutusala_95] [varchar](55) NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[päätieteenala] [varchar](200) NULL,
	[tieteenala] [varchar](200) NULL,
	[ammattikorkeakoulu] [varchar](100) NULL,
	[yliopisto] [varchar](100) NULL,
	[henkilotyovuosi] [decimal](10, 4) NULL,
	[koodit_tehtäväjaottelu] [int] NULL,
	[koodit_ammattikorkeakoulu] [varchar](5) NULL,
	[koodit_yliopisto] [varchar](5) NULL,
	[koodit_henkilöstöryhmä] [int] NULL,
	[koodit_okm_ohjauksen_ala] [int] NULL,
	[koodit_tieteenala] [varchar](4) NULL,
	[koodit_päätieteenala] [varchar](2) NULL,
	[koodit_merkittävimmän_tutkinnon_taso] [int] NULL,
	[koodit_muun_henkilöstön_henkilöstöryhmä] [int] NULL,
	[koodit_työsuhteen_nimitystapa] [int] NULL,
	[kansalaisuus_järj] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

