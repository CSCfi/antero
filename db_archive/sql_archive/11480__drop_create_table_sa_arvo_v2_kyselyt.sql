USE [Arvo_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_kyselyt]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_kyselyt]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_kyselyt](
	[kyselyid] [int] NULL,
	[koulutustoimija_oid] [varchar](255) NULL,
	[nimi_fi] [varchar](500) NULL,
	[nimi_sv] [varchar](500) NULL,
	[nimi_en] [varchar](500) NULL,
	[kyselytyyppi] [varchar](255) NULL,
	[tiedonkeruu] [varchar](255) NULL,
	[voimassa_alkupvm] [datetime] NULL,
	[voimassa_loppupvm] [datetime] NULL,
	[uudelleenohjaus_url] [varchar](4000) NULL,
	[kysymysryhmat] [varchar](max) NULL,
	[source] [varchar](500) NULL,
	[loadtime] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[johdantoteksti] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE ANTERO
