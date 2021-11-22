USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [dw].[api_yo_talous2]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_yo_talous2](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Konserni] [varchar](5) NULL,
	[Yliopisto] [varchar](100) NULL,
	[Koulutusala] [varchar](100) NULL,
	[Aineisto] [nvarchar](100) NULL,
	[Ohjauksenala] [varchar](100) NULL,
	[Statistikår] [int] NULL,
	[Universitet] [varchar](100) NULL,
	[Utbildningsområde] [varchar](100) NULL,
	[Material typ] [nvarchar](100) NULL,
	[Ohjauksenala_sv] [varchar](100) NULL,
	[Statistical year] [int] NULL,
	[University] [varchar](100) NULL,
	[Field of education] [varchar](100) NULL,
	[Material type] [nvarchar](100) NULL,
	[Ohjauksenala_en] [varchar](100) NULL,
	[Koodit_yliopisto] [varchar](5) NULL,
	[Koodit_koulutusala] [varchar](3) NULL,
	[Koodit_aineisto] [nvarchar](2) NULL,
	[Koodit_ohjauksenala] [varchar](3) NULL,
	[tili_taso0_fi] [varchar](100) NULL,
	[tili_taso1_fi] [varchar](100) NULL,
	[tili_taso2_fi] [varchar](100) NULL,
	[tili_taso3_fi] [varchar](100) NULL,
	[tili_taso4_fi] [varchar](100) NULL,
	[tili_taso5_fi] [nvarchar](100) NULL,
	[tili_taso0_sv] [varchar](100) NULL,
	[tili_taso1_sv] [varchar](100) NULL,
	[tili_taso2_sv] [varchar](100) NULL,
	[tili_taso3_sv] [varchar](100) NULL,
	[tili_taso4_sv] [varchar](100) NULL,
	[tili_taso5_sv] [nvarchar](100) NULL,
	[tili_taso0_en] [varchar](100) NULL,
	[tili_taso1_en] [varchar](100) NULL,
	[tili_taso2_en] [varchar](100) NULL,
	[tili_taso3_en] [varchar](100) NULL,
	[tili_taso4_en] [varchar](100) NULL,
	[tili_taso5_en] [nvarchar](100) NULL,
	[toiminto_nimi_fi] [nvarchar](100) NULL,
	[arvo] [bigint] NULL,
	PRIMARY KEY CLUSTERED
	(
		[defaultorder] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

USE [ANTERO]
