USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 30.12.2021 17:06:47 ******/
DROP TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]
GO

/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 30.12.2021 17:06:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tarkastelujakso_koodi] [nvarchar](20) NOT NULL,
	[tarkastelujakso_id] [int] NOT NULL,
	[sukupuoli_koodi] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[aidinkieli_versio1_koodi] [nvarchar](2) NULL,
	[aidinkieli_id] [int] NOT NULL,
	[suorv] [varchar](4) NULL,
	[suorlk] [varchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[suorituskausi_id] [nvarchar](10) NOT NULL,
	[koulutusluokitus_avain] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NOT NULL,
	[alvv] [varchar](4) NULL,
	[allk] [varchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[aloituskausi_id] [nvarchar](10) NOT NULL,
	[oppisopimuskoulutus_koodi] [nvarchar](2) NULL,
	[oppisopimuskoulutus_id] [int] NOT NULL,
	[ammatillisen_koulutuksen_koulutuslaji_koodi] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NOT NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] [int] NOT NULL,
	[nuorten_aikuisten_koulutus_amm_koodi] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_amm_id] [int] NOT NULL,
	[syntv] [varchar](4) NULL,
	[ika_avain] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[henkiloiden_lkm] [int] NULL,
	[lu_henkiloiden_lkm] [int] NULL,
	[lukoulk] [varchar](6) NULL,
	[lu_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[lusuorv] [varchar](4) NULL,
	[luaikoul] [varchar](1) NULL,
	[lu_nuorten_aikuisten_koulutus_amm_id] [int] NOT NULL,
	[lu_ika] [int] NULL,
	[lu_ika_id] [int] NOT NULL,
	[lu_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lu_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ammlkm_id] [int] NOT NULL,
	[amm_henkiloiden_lkm] [int] NULL,
	[ammkoulk] [varchar](6) NULL,
	[amm_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ammsuorv] [varchar](4) NULL,
	[ammoppis] [varchar](1) NULL,
	[ammoppis_id] [int] NOT NULL,
	[amm_sopimusjaksot_id] [int] NOT NULL,
	[ammtutklaja] [varchar](1) NULL,
	[ammtutklaja_id] [int] NOT NULL,
	[ammtutktav] [varchar](1) NULL,
	[ammtutktav_id] [int] NOT NULL,
	[ammatillinen_koulutus_ryhma] [nvarchar](10) NULL,
	[ammatillinen_koulutus_ryhma_id] [int] NOT NULL,
	[amm_ika] [int] NULL,
	[amm_ika_id] [int] NOT NULL,
	[amm_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amm_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[opist_henkiloiden_lkm] [int] NULL,
	[opistkoulk] [varchar](6) NULL,
	[opist_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[opistsuorv] [varchar](4) NULL,
	[opist_ika] [int] NULL,
	[opist_ika_id] [int] NOT NULL,
	[opist_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[opist_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ammka_henkiloiden_lkm] [int] NULL,
	[ammkakoulk] [varchar](6) NULL,
	[ammka_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ammkasuorv] [varchar](4) NULL,
	[ammka_ika] [int] NULL,
	[ammka_ika_id] [int] NOT NULL,
	[ammka_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ammka_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[amklkm_id] [int] NOT NULL,
	[amk_henkiloiden_lkm] [int] NULL,
	[amkkoulk] [varchar](6) NULL,
	[amk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[amksuorv] [varchar](4) NULL,
	[amkaikoul] [varchar](1) NULL,
	[amkaikoul_id] [int] NOT NULL,
	[amk_ika] [int] NULL,
	[amk_ika_id] [int] NOT NULL,
	[amk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[amk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[akklkm_id] [int] NOT NULL,
	[akk_henkiloiden_lkm] [int] NULL,
	[akkkoulk] [varchar](6) NULL,
	[akk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[akksuorv] [varchar](4) NULL,
	[akk_ika] [int] NULL,
	[akk_ika_id] [int] NOT NULL,
	[akk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[akk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ylamklkm_henkiloiden_lkm] [int] NULL,
	[ylamkkoulk] [varchar](6) NULL,
	[ylamk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ylamksuorv] [varchar](4) NULL,
	[ylamk_ika] [int] NULL,
	[ylamk_ika_id] [int] NOT NULL,
	[ylamk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ylamk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[ykklkm_id] [int] NOT NULL,
	[ykk_henkiloiden_lkm] [int] NULL,
	[ykkkoulk] [varchar](6) NULL,
	[ykk_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[ykksuorv] [varchar](4) NULL,
	[ykk_ika] [int] NULL,
	[ykk_ika_id] [int] NOT NULL,
	[ykk_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[ykk_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[laaker_henkiloiden_lkm] [int] NULL,
	[laakerkoulk] [varchar](6) NULL,
	[laaker_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[laakersuorv] [varchar](4) NULL,
	[laaker_ika] [int] NULL,
	[laaker_ika_id] [int] NOT NULL,
	[laaker_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[laaker_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[lis_henkiloiden_lkm] [int] NULL,
	[liskoulk] [varchar](6) NULL,
	[lis_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[lissuorv] [varchar](4) NULL,
	[lis_ika] [int] NULL,
	[lis_ika_id] [int] NOT NULL,
	[lis_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[lis_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[toht_henkiloiden_lkm] [int] NULL,
	[tohtkoulk] [varchar](6) NULL,
	[toht_myohempi_koulutusluokitus_id] [int] NOT NULL,
	[tohtsuorv] [varchar](4) NULL,
	[toht_ika] [int] NULL,
	[toht_ika_id] [int] NOT NULL,
	[toht_myohempi_tutkinto_suoritettu] [varchar](1) NOT NULL,
	[toht_myohempi_tutkinto_suoritettu_id] [int] NOT NULL,
	[yliopistotutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[yo_jatkotutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[korkeakoulututkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_myohempi_suoritettu_id] [int] NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma1_id] [int] NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma2_id] [int] NOT NULL,
	[ammatillisen_tutkinto_myohempi_suoritettu_ryhma3_id] [int] NOT NULL,
	[myohemman_yliopistotutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_yo_jatkotutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_opisto_tai_ammatillisen_korkea_asteen_tutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_korkeakoulututkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_toisen_asteen_tutkinnon_suorittaneiden_lkm] [int] NULL,
	[myohemman_ammatillisen_tutkinnon_ryhma1_suorittaneiden_lkm] [int] NULL,
	[myohemman_ammatillisen_tutkinnon_ryhma2_suorittaneiden_lkm] [int] NULL,
	[myohemman_ammatillisen_tutkinnon_ryhma3_suorittaneiden_lkm] [int] NULL,
	[lu_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[amm_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[opist_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[ammka_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[akk_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[amk_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[ylamk_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[ykk_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[laaker_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[lis_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[toht_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[yliopistotutkinto_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[korkeakoulututkinto_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_id] [int] NOT NULL,
	[lu_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[amm_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[opist_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[ammka_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[akk_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[amk_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[ylamk_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[ykk_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[laaker_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[lis_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[toht_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[yliopistotutkinto_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[korkeakoulututkinto_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_opintoala2002_id] [int] NOT NULL,
	[lu_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[amm_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[opist_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[ammka_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[akk_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[amk_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[ylamk_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[ykk_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[laaker_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[lis_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[toht_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[yliopistotutkinto_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[korkeakoulututkinto_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_opintoala1995_id] [int] NOT NULL,
	[lu_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[amm_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[opist_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[ammka_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[akk_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[amk_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[ylamk_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[ykk_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[laaker_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[lis_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[toht_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[yliopistotutkinto_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[korkeakoulututkinto_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_id] [int] NOT NULL,
	[lu_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[amm_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[opist_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[ammka_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[akk_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[amk_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[ylamk_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[ykk_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[laaker_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[lis_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[toht_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[yliopistotutkinto_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[korkeakoulututkinto_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id] [int] NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_aidinkieli_versio1_d_ak1] FOREIGN KEY([aidinkieli_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_aidinkieli_versio1_d_ak1]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_ammatillinen_koulutus_luokittelu_d_ammkl] FOREIGN KEY([ammatillinen_koulutus_ryhma_id])
REFERENCES [dbo].[d_ammatillinen_koulutus_luokittelu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_ammatillinen_koulutus_luokittelu_d_ammkl]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_ammatillisen_koulutuksen_koulutuslaji_d_akk] FOREIGN KEY([ammatillisen_koulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_ammatillisen_koulutuksen_koulutuslaji_d_akk]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_ammatillisen_koulutuksen_koulutuslaji_d_amm_akk] FOREIGN KEY([ammtutklaja_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_ammatillisen_koulutuksen_koulutuslaji_d_amm_akk]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_ika_] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_ika_]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_kausi_d_alo] FOREIGN KEY([aloituskausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_kausi_d_alo]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_kausi_d_suo] FOREIGN KEY([suorituskausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_kausi_d_suo]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_akk_ika] FOREIGN KEY([akk_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_akk_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_amk_ika] FOREIGN KEY([amk_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_amk_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_amm_ika] FOREIGN KEY([amm_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_amm_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_ammka_ika] FOREIGN KEY([ammka_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_ammka_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_laaker_ika] FOREIGN KEY([laaker_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_laaker_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_lis_ika] FOREIGN KEY([lis_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_lis_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_lu_ika] FOREIGN KEY([lu_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_lu_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_opist_ika] FOREIGN KEY([opist_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_opist_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_toht_ika] FOREIGN KEY([toht_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_toht_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_ykk_ika] FOREIGN KEY([ykk_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_ykk_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_ylamk_ika] FOREIGN KEY([ylamk_ika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_koulutuksesta_kulunut_aika_d_ylamk_ika]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_nuorten_aikuisten_koulutus_amm_d_amk_na] FOREIGN KEY([amkaikoul_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus_amm] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_nuorten_aikuisten_koulutus_amm_d_amk_na]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_nuorten_aikuisten_koulutus_amm_d_lu_na] FOREIGN KEY([lu_nuorten_aikuisten_koulutus_amm_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus_amm] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_nuorten_aikuisten_koulutus_amm_d_lu_na]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_nuorten_aikuisten_koulutus_amm_d_na] FOREIGN KEY([nuorten_aikuisten_koulutus_amm_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus_amm] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_nuorten_aikuisten_koulutus_amm_d_na]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_d_amm_on] FOREIGN KEY([ammtutktav_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_d_amm_on]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_d_on] FOREIGN KEY([opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_d_on]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_oppisopimuskoulutus_d_amm_osk] FOREIGN KEY([ammoppis_id])
REFERENCES [dbo].[d_oppisopimuskoulutus] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_oppisopimuskoulutus_d_amm_osk]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_oppisopimuskoulutus_d_osk] FOREIGN KEY([oppisopimuskoulutus_id])
REFERENCES [dbo].[d_oppisopimuskoulutus] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_oppisopimuskoulutus_d_osk]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_iscfibroad2013] FOREIGN KEY([akk_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_iscfinarrow2013] FOREIGN KEY([akk_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_koulutusala2002] FOREIGN KEY([akk_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_opintoala1995] FOREIGN KEY([akk_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_opintoala2002] FOREIGN KEY([akk_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_akk_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_iscfibroad2013] FOREIGN KEY([amk_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_iscfinarrow2013] FOREIGN KEY([amk_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_koulutusala2002] FOREIGN KEY([amk_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_opintoala1995] FOREIGN KEY([amk_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_opintoala2002] FOREIGN KEY([amk_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amk_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_iscfibroad2013] FOREIGN KEY([amm_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_iscfinarrow2013] FOREIGN KEY([amm_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_koulutusala2002] FOREIGN KEY([amm_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_opintoala1995] FOREIGN KEY([amm_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_opintoala2002] FOREIGN KEY([amm_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_amm_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_iscfibroad2013] FOREIGN KEY([ammka_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_iscfinarrow2013] FOREIGN KEY([ammka_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_koulutusala2002] FOREIGN KEY([ammka_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_opintoala1995] FOREIGN KEY([ammka_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_opintoala2002] FOREIGN KEY([ammka_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ammka_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_iscfibroad2013] FOREIGN KEY([korkeakoulututkinto_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_iscfinarrow2013] FOREIGN KEY([korkeakoulututkinto_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_koulutusala2002] FOREIGN KEY([korkeakoulututkinto_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_opintoala1995] FOREIGN KEY([korkeakoulututkinto_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_opintoala2002] FOREIGN KEY([korkeakoulututkinto_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_korkeakoulututkinto_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_iscfibroad2013] FOREIGN KEY([laaker_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_iscfinarrow2013] FOREIGN KEY([laaker_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_koulutusala2002] FOREIGN KEY([laaker_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_opintoala1995] FOREIGN KEY([laaker_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_opintoala2002] FOREIGN KEY([laaker_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_laaker_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_iscfibroad2013] FOREIGN KEY([lis_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_iscfinarrow2013] FOREIGN KEY([lis_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_koulutusala2002] FOREIGN KEY([lis_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_opintoala1995] FOREIGN KEY([lis_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_opintoala2002] FOREIGN KEY([lis_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lis_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_iscfibroad2013] FOREIGN KEY([lu_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_iscfinarrow2013] FOREIGN KEY([lu_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_koulutusala2002] FOREIGN KEY([lu_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_opintoala1995] FOREIGN KEY([lu_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_opintoala2002] FOREIGN KEY([lu_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_lu_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_iscfibroad2013] FOREIGN KEY([opist_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_iscfinarrow2013] FOREIGN KEY([opist_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_koulutusala2002] FOREIGN KEY([opist_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_opintoala1995] FOREIGN KEY([opist_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_opintoala2002] FOREIGN KEY([opist_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opist_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013] FOREIGN KEY([opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013] FOREIGN KEY([opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002] FOREIGN KEY([opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995] FOREIGN KEY([opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002] FOREIGN KEY([opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_opisto_tai_ammatillisen_korkea_asteen_tutkinto_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_iscfibroad2013] FOREIGN KEY([toht_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_iscfinarrow2013] FOREIGN KEY([toht_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_koulutusala2002] FOREIGN KEY([toht_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_opintoala1995] FOREIGN KEY([toht_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_opintoala2002] FOREIGN KEY([toht_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toht_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013] FOREIGN KEY([toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013] FOREIGN KEY([toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_koulutusala2002] FOREIGN KEY([toisen_asteen_tutkinto_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_opintoala1995] FOREIGN KEY([toisen_asteen_tutkinto_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_opintoala2002] FOREIGN KEY([toisen_asteen_tutkinto_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_toisen_asteen_tutkinto_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_iscfibroad2013] FOREIGN KEY([ykk_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_iscfinarrow2013] FOREIGN KEY([ykk_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_koulutusala2002] FOREIGN KEY([ykk_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_opintoala1995] FOREIGN KEY([ykk_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_opintoala2002] FOREIGN KEY([ykk_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ykk_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_iscfibroad2013] FOREIGN KEY([ylamk_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_iscfinarrow2013] FOREIGN KEY([ylamk_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_koulutusala2002] FOREIGN KEY([ylamk_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_opintoala1995] FOREIGN KEY([ylamk_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_opintoala2002] FOREIGN KEY([ylamk_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_ylamk_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_iscfibroad2013] FOREIGN KEY([yliopistotutkinto_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_iscfinarrow2013] FOREIGN KEY([yliopistotutkinto_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_koulutusala2002] FOREIGN KEY([yliopistotutkinto_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_opintoala1995] FOREIGN KEY([yliopistotutkinto_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_opintoala2002] FOREIGN KEY([yliopistotutkinto_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yliopistotutkinto_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_iscfibroad2013] FOREIGN KEY([yo_jatkotutkinto_sama_myohempi_iscfibroad2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_iscfibroad2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_iscfinarrow2013] FOREIGN KEY([yo_jatkotutkinto_sama_myohempi_iscfinarrow2013_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_iscfinarrow2013]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_koulutusala2002] FOREIGN KEY([yo_jatkotutkinto_sama_myohempi_koulutusala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_koulutusala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_opintoala1995] FOREIGN KEY([yo_jatkotutkinto_sama_myohempi_opintoala1995_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_opintoala1995]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_opintoala2002] FOREIGN KEY([yo_jatkotutkinto_sama_myohempi_opintoala2002_id])
REFERENCES [dbo].[d_sama_koulutusala] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sama_koulutusala_yo_jatkotutkinto_sama_myohempi_opintoala2002]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_sukupuoli_d_sp] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_sukupuoli_d_sp]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tarkastelujakso_d_tj] FOREIGN KEY([tarkastelujakso_id])
REFERENCES [dbo].[d_tarkastelujakso] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tarkastelujakso_d_tj]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_akk_ts] FOREIGN KEY([akk_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_akk_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amk_ts] FOREIGN KEY([amk_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amk_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_r1_ts] FOREIGN KEY([ammatillisen_tutkinto_myohempi_suoritettu_ryhma1_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_r1_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_r2_ts] FOREIGN KEY([ammatillisen_tutkinto_myohempi_suoritettu_ryhma2_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_r2_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_r3_ts] FOREIGN KEY([ammatillisen_tutkinto_myohempi_suoritettu_ryhma3_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_r3_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_ts] FOREIGN KEY([amm_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_amm_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_ammka_ts] FOREIGN KEY([ammka_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_ammka_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_aste2_ts] FOREIGN KEY([toisen_asteen_tutkinto_myohempi_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_aste2_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_kk_ts] FOREIGN KEY([korkeakoulututkinto_myohempi_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_kk_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_laaker_ts] FOREIGN KEY([laaker_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_laaker_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_lis_ts] FOREIGN KEY([lis_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_lis_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_lu_ts] FOREIGN KEY([lu_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_lu_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_opammka_ts] FOREIGN KEY([opisto_tai_ammatillisen_korkea_asteen_tutkinto_myohempi_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_opammka_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_opist_ts] FOREIGN KEY([opist_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_opist_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_toht_ts] FOREIGN KEY([toht_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_toht_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_ykk_ts] FOREIGN KEY([ykk_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_ykk_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_ylamk_ts] FOREIGN KEY([ylamk_myohempi_tutkinto_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_ylamk_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_yo_ts] FOREIGN KEY([yliopistotutkinto_myohempi_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_yo_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_yojatko_ts] FOREIGN KEY([yo_jatkotutkinto_myohempi_suoritettu_id])
REFERENCES [dbo].[d_tutkinto_suoritettu] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkinto_suoritettu_d_yojatko_ts]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_akk_tm] FOREIGN KEY([akklkm_id])
REFERENCES [dbo].[d_tutkintojen_maara] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_akk_tm]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_amk_tm] FOREIGN KEY([amklkm_id])
REFERENCES [dbo].[d_tutkintojen_maara] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_amk_tm]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_amm_tm] FOREIGN KEY([ammlkm_id])
REFERENCES [dbo].[d_tutkintojen_maara] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_amm_tm]
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]  WITH CHECK ADD  CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_ykk_tm] FOREIGN KEY([ykklkm_id])
REFERENCES [dbo].[d_tutkintojen_maara] ([id])
GO

ALTER TABLE [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8] CHECK CONSTRAINT [FK_4_8_d_tutkintojen_maara_d_ykk_tm]
GO


