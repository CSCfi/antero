USE [AnteroAPI]
GO

/****** Object:  Table [api].[avoin_yliopisto]    Script Date: 31.1.2023 11:23:14 ******/
DROP TABLE [api].[avoin_yliopisto]
GO

/****** Object:  Table [api].[avoin_yliopisto]    Script Date: 31.1.2023 11:23:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[avoin_yliopisto](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[sukupuoli] [varchar](10) NULL,
	[yliopisto] [varchar](75) NULL,
	[suorittaneiden_lkm] [int] NULL,
	[koodit_yliopisto] [varchar](5) NULL,
	[koodit_sukupuoli] [varchar](2) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]