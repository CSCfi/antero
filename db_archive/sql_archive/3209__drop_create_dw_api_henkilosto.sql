USE [ANTERO]
GO

DROP TABLE IF EXISTS [dw].[api_henkilosto]

IF NOT EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='dw' and TABLE_NAME='api_henkilosto')

BEGIN

CREATE TABLE [dw].[api_henkilosto](
	[defaultorder] [bigint] IDENTITY(0,1) NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Sukupuoli] [varchar](100) NULL,
	[Kansalaisuus] [varchar](200) NULL,
	[Tehtäväjaottelu] [varchar](55) NULL,
	[Tutkijanuravaihe tai tuntiopettajuus] [varchar](255) NULL,
	[Henkilöstöryhmä] [varchar](55) NULL,
	[Henkilöstöryhmä (harjoittelukoulut)] [varchar](55) NULL,
	[Merkittävimmän tutkinnon taso] [varchar](55) NULL,
	[Muun henkilöstön henkilöstöryhmä] [varchar](55) NULL,
	[Työsuhteen nimitystapa] [varchar](55) NULL,
	[Sektori] [varchar](21) NULL,
	[Koulutusala 02] [varchar](255) NULL,
	[Koulutusala 95] [varchar](55) NULL,
	[OKM ohjauksen ala] [varchar](100) NULL,
	[Päätieteenala] [varchar](200) NULL,
	[Tieteenala] [varchar](200) NULL,
	[Ammattikorkeakoulu] [varchar](100) NULL,
	[Yliopisto] [varchar](100) NULL,
	[henkilotyovuosi] [decimal](10, 4) NULL,
	[Koodit Tehtäväjaottelu] [int] NULL,
	[Koodit Ammattikorkeakoulu] [varchar](5) NULL,
	[Koodit Yliopisto] [varchar](5) NULL,
	[Koodit Henkilöstöryhmä] [int] NULL,
	[Koodit OKM ohjauksen ala] [int] NULL,
	[Koodit Tieteenala] [varchar](4) NULL,
	[Koodit Päätieteenala] [varchar](2) NULL,
	[Koodit Merkittävimmän tutkinnon taso] [int] NULL,
	[Koodit Muun henkilöstön henkilöstöryhmä] [int] NULL,
	[Koodit Työsuhteen nimitystapa] [int] NULL,
	[Kansalaisuus järj] [int] NULL,
  [loadtime] [datetime] NOT NULL,
  [username] [varchar](30) NOT NULL,
  PRIMARY KEY CLUSTERED
  (
  	[defaultorder] ASC
  )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
  ) ON [PRIMARY]

END

ALTER TABLE [dw].[api_henkilosto] ADD  CONSTRAINT [DF_dw_api_henkilosto_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[api_henkilosto] ADD  CONSTRAINT [DF_dw_api_henkilosto_username]  DEFAULT (suser_sname()) FOR [username]
GO
