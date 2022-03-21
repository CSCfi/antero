USE [AnteroAPI]
GO


DROP TABLE IF EXISTS  [api].[avoin_amk]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[avoin_amk](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Sukupuoli] [nvarchar](100) NULL,
	[OKM ohjauksen ala] [varchar](100) NULL,
	[Koulutusala] [varchar](255) NULL,
	[Ammattikorkeakoulu] [varchar](100) NULL,
	[osallistuneet] [int] NULL,
	[opintopisteet_yht] [int] NULL,
	[opintopisteet_amk] [int] NULL,
	[opintopisteet_kansalaisopistot] [int] NULL,
	[opintopisteet_kansanopistot] [int] NULL,
	[opintopisteet_kesayo] [int] NULL,
	[opintopisteet_muut] [int] NULL,
	[opintopisteet_yo] [int] NULL,
	[Sektori] [varchar](9) NULL,
	[Koodit Ammattikorkeakoulu] [varchar](5) NULL,
	[Koodit Sukupuoli] [varchar](5) NULL,
	[Koodit OKM ohjauksen ala] [varchar](3) NULL,
	[Koodit Koulutusala] [int] NULL,
	PRIMARY KEY CLUSTERED
	(
		[defaultorder] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

USE [ANTERO]
