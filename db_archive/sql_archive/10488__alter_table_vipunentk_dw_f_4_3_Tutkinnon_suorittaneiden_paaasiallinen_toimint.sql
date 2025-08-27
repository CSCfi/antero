USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 13.1.2025 15.29.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]
GO

CREATE TABLE [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suorittamismaakunta] [nvarchar](2) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[valiaikainen_amk] [nvarchar](2) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusmuoto] [nvarchar](2) NULL,
	[oppisopimuskoulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](2) NULL,
	[rahoituslahde_v2] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio2] [nvarchar](2) NULL,
	[maassaolo] [nvarchar](2) NULL,
	[ammattiasema] [nvarchar](2) NULL,
	[ammattiluokitus_2010] [nvarchar](5) NULL,
	[lukumaara] [int] NULL,
	[eu_etamaat_avain] [nvarchar](2) NULL,
	[aikielir1_avain] [nvarchar](2) NULL,
	[kansalaisuus_maanosa_avain] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](2) NULL,
	[sijoittuminen_1v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_3v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_5v_tutkinnon_jalkeen] [int] NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_okm] [nvarchar](2) NULL,
	[sektori] [nvarchar](2) NULL
) ON [PRIMARY]
GO


