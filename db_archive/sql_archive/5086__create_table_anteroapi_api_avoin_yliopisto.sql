USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [api].[avoin_yliopisto]
GO

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
PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]

