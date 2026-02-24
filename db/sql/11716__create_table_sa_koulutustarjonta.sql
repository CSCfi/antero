USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_koulutustarjonta]    Script Date: 4.2.2026 8.34.41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koulutustarjonta]') AND type in (N'U'))
DROP TABLE [sa].[sa_koulutustarjonta]
GO

/****** Object:  Table [sa].[sa_koulutustarjonta]    Script Date: 4.2.2026 8.34.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koulutustarjonta](
	[hakukohde_oid] [nvarchar](max) NULL,
	[haku_oid] [nvarchar](max) NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskausi] [nvarchar](max) NULL,
	[kk_haku] [bit] NULL,
	[opetuksen_kieli] [varchar](8000) NULL,
	[koulutus_koodi] [varchar](6) NULL,
	[opintoala1995_koodi] [varchar](2) NULL,
	[opintoala2002_koodi] [varchar](3) NULL,
	[alempi_kk] [int] NULL,
	[ylempi_kk] [int] NULL,
	[jatkotutkinto_kk] [int] NULL,
	[koulutustyyppi] [nvarchar](max) NULL,
	[koulutusaste] [int] NULL,
	[apusarake_kk_ammatillinen] [int] NOT NULL,
	[ensimmainen_hakuaika_paattyy] [datetime2](7) NULL,
	[aloituspaikatLkm] [int] NULL,
	[ensikertalaistenAloituspaikat] [int] NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[oppilaitos_oid] [varchar](200) NULL,
	[toimipiste_oid] [varchar](200) NULL,
	[loadtime] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]