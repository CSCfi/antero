USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 9.8.2021 21:14:46 ******/
DROP TABLE [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
GO

/****** Object:  Table [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 9.8.2021 21:14:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [varchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [nvarchar](1) NULL,
	[opiskelijan_olo_tamm] [nvarchar](1) NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](20) NULL,
	[ika_5v] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[lukiokoulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[koulutuksen_tutkinnon_aloitusvuosi] [nvarchar](4) NULL,
	[koulutuksen_tutkinnon_aloituskausi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[tutkintonimike_ammpk] [nvarchar](5) NULL,
	[koulutusohjelma_ammpk] [nvarchar](4) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](2) NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[alkamispaivamaara] [nvarchar](8) NULL,
	[paattymispaivamaara] [nvarchar](8) NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](2) NULL,
	[oppisopimus_purkautunut] [nvarchar](2) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](2) NULL,
	[toimiala_2008] [nvarchar](5) NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](2) NULL,
	[tyonantajasektori] [nvarchar](2) NULL,
	[asuinmaakunta] [nvarchar](3) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL,
	[aineistotunnus] [varchar](6) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[hallinnonala] [nvarchar](2) NULL,
	[hallinnonala2] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[amm_sopimusjaksot] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](2) NULL,
	[tyovoimapoliittinen] [nvarchar](2) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuslaji_OKM_avain] [int] NOT NULL,
	[yhtjarj] [nvarchar](10) NULL,
	[yhtoppilaitos] [nvarchar](5) NULL,
	[yht_koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutusryhma_avain] [varchar](2) NULL
) ON [PRIMARY]

GO


