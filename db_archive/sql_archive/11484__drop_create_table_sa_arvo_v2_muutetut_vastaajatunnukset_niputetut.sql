USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_muutetut_vastaajatunnukset_niputetut]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_muutetut_vastaajatunnukset_niputetut]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_muutetut_vastaajatunnukset_niputetut](
	[vastaajatunnusid] [int] NULL,
	[kohteiden_lkm] [int] NULL,
	[kyselyid] [int] NULL,
	[nippu] [varchar](1000) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitoskoodi] [varchar](20) NULL,
	[taustatiedot] [varchar](4000) NULL,
	[tiedonkeruu] [varchar](255) NULL,
	[vastaajatunnus] [varchar](20) NULL,
	[voimassa_alkupvm] [datetime] NULL,
	[voimassa_loppupvm] [datetime] NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY]
GO


USE ANTERO
