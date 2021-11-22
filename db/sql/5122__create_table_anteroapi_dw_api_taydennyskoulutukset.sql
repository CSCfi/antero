USE [AnteroAPI]
GO

DROP TABLE IF EXISTS  [dw].[api_taydennyskoulutukset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dw].[api_taydennyskoulutukset](
	[defaultorder] [bigint] NOT NULL,
	[Tilastovuosi] [int] NULL,
	[Yliopisto] [varchar](100) NULL,
	[Sukupuoli] [varchar](100) NULL,
	[koulutukset] [int] NULL,
	[osallistuneet] [int] NULL,
	[Koodit Yliopisto] [varchar](5) NULL,
	[sukupuoli_jarjestys] [int] NOT NULL
PRIMARY KEY CLUSTERED
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

USE [ANTERO]
