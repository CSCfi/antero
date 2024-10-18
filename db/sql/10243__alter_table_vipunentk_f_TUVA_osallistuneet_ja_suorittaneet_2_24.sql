USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24]    Script Date: 18.10.2024 16:36:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24]') AND type in (N'U')) DROP TABLE [dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24]
GO

CREATE TABLE [dbo].[f_TUVA_osallistuneet_ja_suorittaneet_2_24](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde_avain] [nvarchar](2) NULL,
	[lahde_id] [int] NOT NULL,
	[koulutuksen_jarjestajakoodi] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[oppilaitoskoodi] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[tuva_rahoitusjarjestelmakoodi] [nvarchar](1) NULL,
	[tuva_rahoitusjarjestelma_id] [int] NULL,
	[aloitusvuosi] [nvarchar](4) NULL,
	[aloituslukukausi] [nvarchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[aloituskausikoodi_id] [int] NULL,
	[suoritusvuosi] [nvarchar](4) NULL,
	[suorituslukukausi] [nvarchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[suorituskausikoodi_id] [int] NULL,
	[koulutuksen_pituus_kk] [nvarchar](2) NULL,
	[sukupuolikoodi] [nvarchar](1) NULL,
	[sukupuoli_id] [int] NULL,
	[ikaryhma9] [nvarchar](10) NULL,
	[ikaryhma9_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[asuinmaakunta_id] [int] NULL,
	[asuinmaakuntax] [nvarchar](2) NULL,
	[asuinmaakuntax_id] [int] NULL,
	[uusien_lkm] [int] NULL,
	[osallistuneiden_lkm] [int] NULL,
	[suorittaneiden_lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


