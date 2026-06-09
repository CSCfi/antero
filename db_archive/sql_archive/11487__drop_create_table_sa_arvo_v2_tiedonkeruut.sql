USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_tiedonkeruut]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_tiedonkeruut]
GO

/****** Object:  Table [sa].[sa_arvo_v2_tiedonkeruut]    Script Date: 23.12.2025 9.49.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_tiedonkeruut](
	[kyselytyyppi] [varchar](100) NULL,
	[nimi_fi] [varchar](1000) NULL,
	[nimi_sv] [varchar](1000) NULL,
	[nimi_en] [varchar](1000) NULL,
	[tarkenne] [varchar](1000) NULL,
	[vuosi] [int] NULL,
	[voimassa_alkupvm] [datetime] NULL,
	[voimassa_loppupvm] [datetime] NULL,
	[kasittelyajan_paattymispvm] [datetime] NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL
) ON [PRIMARY]
GO


USE ANTERO
