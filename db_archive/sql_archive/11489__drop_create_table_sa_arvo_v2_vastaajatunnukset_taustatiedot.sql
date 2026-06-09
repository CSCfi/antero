USE [Arvo_SA]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_vastaajatunnukset_taustatiedot]') AND type in (N'U'))
BEGIN
	DROP TABLE [sa].[sa_arvo_v2_vastaajatunnukset_taustatiedot]
END
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_vastaajatunnukset_taustatiedot](
	[taustatieto] [varchar](255) NULL,
	[luontiPvm] [datetime] NULL,
	[muokkausPvm] [datetime] NULL
) ON [PRIMARY]
GO


USE ANTERO
