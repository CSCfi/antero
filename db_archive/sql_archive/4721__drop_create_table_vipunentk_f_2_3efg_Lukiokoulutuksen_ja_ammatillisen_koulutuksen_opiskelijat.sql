USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 9.8.2021 22:09:32 ******/
DROP TABLE [dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
GO

/****** Object:  Table [dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 9.8.2021 22:09:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja_id] [int] NULL,
	[oppisopimuskoulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kieli_id] [int] NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[koulutuksen_kunta_historia_id] [int] NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[opiskelijan_olo_syys_id] [int] NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[aikuisopiskelija_id] [int] NULL,
	[ika_kirjoihintulovuonna] [nvarchar](10) NULL,
	[ika_kirjoihintulovuonna_id] [int] NULL,
	[ikaryhma_kirjoihintulovuonna_id] [int] NULL,
	[ika] [nvarchar](30) NULL,
	[ika_id] [int] NULL,
	[ikaryhma_id] [int] NULL,
	[lukumaara] [int] NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_id] [int] NULL,
	[koulutuksen_tutkinnon_aloitusvuosi] [nvarchar](4) NULL,
	[koulutuksen_tutkinnon_aloitusvuosi_id] [nvarchar](10) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NULL,
	[tutkintonimike_ammpk] [nvarchar](255) NULL,
	[tutkintonimike_ammpk_id] [int] NULL,
	[koulutusohjelma_ammpk] [nvarchar](100) NULL,
	[koulutusohjelma_ammpk_id] [int] NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] [int] NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[rahoituslahde_amm_id] [int] NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[tutkinnon_tavoite_id] [int] NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[asuinmaakunta_id] [int] NULL,
	[asuinmaakunta_historia_id] [int] NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL,
	[aineistotunnus] [varchar](6) NOT NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutussektori_id] [int] NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto_id] [int] NULL,
	[amm_sopimusjaksot] [nvarchar](2) NULL,
	[amm_sopimusjaksot_id] [int] NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_id] [int] NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](2) NULL,
	[koulutuksen_tavoite_toteuma_id] [int] NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[aineisto_id] [int] NOT NULL,
	[aineisto_OTV_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[nuorten_aikuisten_koulutus_amm_id] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_historia_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[hallinnonala2_id] [int] NULL
) ON [PRIMARY]

GO


