USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]    Script Date: 9.8.2021 21:15:11 ******/
DROP TABLE [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]
GO

/****** Object:  Table [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]    Script Date: 9.8.2021 21:15:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[tutkintonimike_ammpk] [nvarchar](5) NULL,
	[koulutusohjelma_ammpk] [nvarchar](4) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [varchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulokausi] [nvarchar](1) NULL,
	[aikuisopiskelija] [nvarchar](1) NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](1) NULL,
	[ika_1v] [nvarchar](20) NULL,
	[ika_5v] [nvarchar](2) NULL,
	[suorituspaivamaara] [nvarchar](8) NULL,
	[lukumaara] [int] NULL,
	[koulutuksen_tutkinnon_aloitusvuosi] [nvarchar](4) NULL,
	[koulutuksen_tutkinnon_aloituskausi] [nvarchar](1) NULL,
	[ov_hyvaksiluettu_ennen] [int] NULL,
	[ov_hyvaksiluettu_aikana] [int] NULL,
	[ov_suoritettu_koulutuksen_aikana] [int] NULL,
	[ov_yhteensa] [int] NULL,
	[ov_tyossaoppiminen] [int] NULL,
	[lkm_ammattiosaaminen] [int] NULL,
	[lkm_opintokokonaisuus] [int] NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](1) NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[vayla_nayttotutkintoon] [nvarchar](1) NULL,
	[alkamispaivamaara] [nvarchar](8) NULL,
	[paattymispaivamaara] [nvarchar](8) NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[tutkinnon_toteuma] [int] NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](1) NULL,
	[oppisopimus_purkautunut] [nvarchar](1) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](1) NULL,
	[toimiala_2008] [nvarchar](5) NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](1) NULL,
	[tyonantajasektori] [nvarchar](1) NULL,
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
	[tutkinnot] [int] NULL,
	[nuorten_aikuisten_koulutus_amm] [nvarchar](2) NULL,
	[koulutuslaji_OKM_avain] [int] NOT NULL,
	[yhtjarj] [nvarchar](10) NULL,
	[yhtoppilaitos] [nvarchar](5) NULL,
	[yht_koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutusryhma_avain] [varchar](2) NULL
) ON [PRIMARY]

GO


