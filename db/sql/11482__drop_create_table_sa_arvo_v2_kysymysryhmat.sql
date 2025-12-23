USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kysymykset]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_kysymykset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_kysymykset](
	[kyselyid] [int] NULL,
	[kysymysryhmaid] [int] NULL,
	[kysymysid] [int] NULL,
	[jarjestys] [int] NULL,
	[kysymys_fi] [varchar](1000) NULL,
	[kysymys_sv] [varchar](1000) NULL,
	[kysymys_en] [varchar](1000) NULL,
	[kysymystyyppi] [varchar](500) NULL,
	[kysymysversio] [int] NULL,
	[pakollinen] [bit] NULL,
	[eos_vastaus_sallittu] [bit] NULL,
	[metatiedot] [varchar](max) NULL,
	[teema] [varchar](4000) NULL,
	[rahoitusmallikysymys] [int] NULL,
	[eos_teksti_fi] [varchar](4000) NULL,
	[eos_teksti_sv] [varchar](4000) NULL,
	[eos_teksti_en] [varchar](4000) NULL,
	[ei_vastaus_ensin] [varchar](10) NULL,
	[koodisto] [varchar](100) NULL,
	[taustakysymyksen_tyyppi] [varchar](100) NULL,
	[source] [varchar](500) NULL,
	[loadtime] [date] NULL,
	[username] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


USE ANTERO
