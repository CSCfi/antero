USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_arvo_osaamisen_hankkimistavat_amis]    Script Date: 27.12.2024 15.50.19 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_osaamisen_hankkimistavat_amis]') AND type in (N'U'))
DROP TABLE [sa].[sa_arvo_osaamisen_hankkimistavat_amis]
GO

/****** Object:  Table [sa].[sa_arvo_osaamisen_hankkimistavat_amis]    Script Date: 27.12.2024 15.50.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_osaamisen_hankkimistavat_amis](
	[vastaajatunnusid] [int] NOT NULL,
	[osaamisen_hankkimistavat] [varchar](55) NOT NULL
) ON [PRIMARY]
