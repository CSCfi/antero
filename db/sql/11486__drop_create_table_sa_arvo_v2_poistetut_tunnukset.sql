USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_poistetut_tunnukset]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_poistetut_tunnukset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_poistetut_tunnukset](
	[vastaajatunnusid] [int] NULL,
	[tiedonkeruu] [varchar](255) NULL,
	[kyselyid] [int] NULL,
	[poistettuaika] [date] NULL,
	[source] [varchar](255) NULL,
	[loadtime] [date] NULL,
	[username] [varchar](255) NULL
) ON [PRIMARY]
GO


USE ANTERO
