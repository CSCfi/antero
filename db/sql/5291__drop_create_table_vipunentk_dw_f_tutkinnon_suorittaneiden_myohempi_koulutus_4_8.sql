USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 30.12.2021 17:31:13 ******/
DROP TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]
GO

/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 30.12.2021 17:31:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[ammatillinen_koulutus_ryhma] [nvarchar](10) NULL,
	[ammatillinen_koulutus_ryhma_avain] [nvarchar](10) NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[henkiloiden_lkm] [int] NULL,
	[lulkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_ika] [int] NULL,
	[lu_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammlkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[amm_sopimusjaksot] [varchar](1) NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutktav] [varchar](1) NULL,
	[amm_ika] [int] NULL,
	[amm_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opistlkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammkalkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amklkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amk_ika] [int] NULL,
	[amk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akklkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamklkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykklkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laakerlkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lislkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tohtlkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL
) ON [PRIMARY]

GO


