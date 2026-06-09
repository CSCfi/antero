USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymysryhmat]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_kysymysryhmat]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_kysymysryhmat](
	[kyselyid] [int] NULL,
	[kysymysryhmaid] [int] NULL,
	[kategoria] [varchar](50) NULL,
	[jarjestys] [int] NULL,
	[nimi_fi] [varchar](500) NULL,
	[nimi_sv] [varchar](500) NULL,
	[nimi_en] [varchar](500) NULL,
	[kuvaus_fi] [varchar](1000) NULL,
	[kuvaus_sv] [varchar](1000) NULL,
	[kuvaus_en] [varchar](1000) NULL,
	[jatkokysymykset] [varchar](max) NULL,
	[kysymykset] [varchar](max) NULL,
	[source] [varchar](500) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE ANTERO
