USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_erilliset_opinto_oikeudet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_erilliset_opinto_oikeudet](
	[defaultorder] [bigint] NOT NULL,
	[tilastovuosi] [int] NULL,
	[koulutusala] [varchar](100) NULL,
	[okm_ohjauksen_ala] [varchar](100) NULL,
	[yliopisto] [varchar](100) NULL,
	[suorittaneiden_lkm] [int] NULL,
	[opettajakoulutus_suorittaneiden_lkm] [int] NULL,
	[erillisilla_oik_op_lkm] [int] NULL,
	[erillisilla_oik_opkoul_op_lkm] [int] NULL,
	[koodit_yliopisto] [varchar](5) NULL,
	[koodit_koulutusala] [int] NULL,
	[koodit_okm_ohjauksen_ala] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

