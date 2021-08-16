USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]    Script Date: 9.8.2021 21:15:34 ******/
DROP TABLE [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]
GO

/****** Object:  Table [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]    Script Date: 9.8.2021 21:15:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulokausi] [nvarchar](1) NULL,
	[lukumaara] [int] NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](1) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [varchar](4) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[amm_sopimusjaksot] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](20) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[koulutuslaji_OKM_avain] [int] NOT NULL
) ON [PRIMARY]

GO


