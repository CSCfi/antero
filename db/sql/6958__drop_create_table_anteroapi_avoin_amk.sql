USE [AnteroAPI]
GO

/****** Object:  Table [api].[avoin_amk]    Script Date: 31.1.2023 11:22:39 ******/
DROP TABLE [api].[avoin_amk]
GO

/****** Object:  Table [api].[avoin_amk]    Script Date: 31.1.2023 11:22:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[avoin_amk](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[sukupuoli] [varchar](10) NULL,
	[okm_ohjauksen_ala] [varchar](75) NULL,
	[koulutusala] [varchar](75) NULL,
	[ammattikorkeakoulu] [varchar](75) NULL,
	[osallistuneet] [int] NULL,
	[opintopisteet_yht] [int] NULL,
	[opintopisteet_amk] [int] NULL,
	[opintopisteet_kansalaisopistot] [int] NULL,
	[opintopisteet_kansanopistot] [int] NULL,
	[opintopisteet_kesayo] [int] NULL,
	[opintopisteet_muut] [int] NULL,
	[opintopisteet_yo] [int] NULL,
	[sektori] [varchar](50) NULL,
	[koodit_ammattikorkeakoulu] [varchar](6) NULL,
	[koodit_sukupuoli] [varchar](2) NULL,
	[koodit_okm_ohjauksen ala] [varchar](2) NULL,
	[koodit_koulutusala] [int] NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]