USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ylempi_kk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_viimeisimmasta_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_viimeisimman_koulutuksen_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_rahoituslahde_d_rahoituslahde_amm]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_oppilaitoksen_oppilaitostyyppi_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_opiskelijan_olo_syys_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_opiskelijan_asuinkunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_opiskelijan_asuinkunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_opetushallinnon_koulutus_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_nuorten_aikuisten_koulutus_d_nuorten_aikuisten_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_nuorten_aikuisten_koulutus_amm_d_nuorten_aikuisten_koulutus_amm]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_lahde_d_lahde]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_koulutuksen_kunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_koulutuksen_kunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_koulutuksen_jarjestamismuoto_d_koulutuksen_jarjestamismuoto]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_kirjoihintulovuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_kirjoihintulolukukausi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ika5v_d_ika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ika1v_d_ika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ika_14_65_d_ika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_d_opiskelijan_aikaisempi_yleissivistava_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ammpk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ammlisa_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_ammatillisen_koulutuksen_koulutuslaji_d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_alempi_kk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisempi_korkein_tutkinto_d_aikaisempi_korkein_tutkinto]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_opintoala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammpk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammpk_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammpk_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammpk_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammlisa_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammlisa_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammlisa_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_ammlisa_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_opintoala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] DROP CONSTRAINT [FK_2_20_aidinkieli_versio1_d_aidinkieli_versio1]
GO

/****** Object:  Table [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 21.2.2018 17:39:40 ******/
DROP TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]
GO

/****** Object:  Table [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 21.2.2018 17:39:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde_id] [int] NULL,
	[oppilaitoksen_oppilaitostyyppi_id] [int] NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[nuorten_aikuisten_koulutus_id] [int] NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] [int] NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[koulutuksen_kunta_historia_id] [int] NULL,
	[rahoituslahde_id] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulolukukausi_id] [nvarchar](10) NULL,
	[opiskelijan_olo_syys_id] [int] NULL,
	[aikaisempi_ylsk_koulutus_id] [int] NULL,
	[aikaisempi_ammpk_tarkempi] [nvarchar](100) NULL,
	[ammpk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemman_ammpk_opintoala2002_id] [int] NULL,
	[aikaisemman_ammpk_koulutusala2002_id] [int] NULL,
	[aikaisemman_ammpk_koulutusaste2002_id] [int] NULL,
	[aikaisemman_ammpk_koulutusala_taso2_id] [int] NULL,
	[aikaisemman_ammpk_koulutusaste_taso2_id] [int] NULL,
	[aikaisemman_ammpk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisempi_ammpk_nayttotutkintona_tarkempi] [nvarchar](100) NULL,
	[aikaisempi_ammpk_oppisopimuskoulutuksena_tarkempi] [nvarchar](100) NULL,
	[aikaisempi_ammlisa_tarkempi] [nvarchar](100) NULL,
	[ammlisa_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemman_ammlisa_opintoala2002_id] [int] NULL,
	[aikaisemman_ammlisa_koulutusala2002_id] [int] NULL,
	[aikaisemman_ammlisa_koulutusaste2002_id] [int] NULL,
	[aikaisemman_ammlisa_koulutusala_taso2_id] [int] NULL,
	[aikaisemman_ammlisa_koulutusaste_taso2_id] [int] NULL,
	[aikaisemman_ammlisa_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisempi_ammlisa_oppisopimuskoulutuksena_tarkempi] [nvarchar](100) NULL,
	[aikaisempi_alempi_kk_tarkempi] [nvarchar](100) NULL,
	[alempi_kk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemman_alemman_kk_opintoala1995_id] [int] NULL,
	[aikaisemman_alemman_kk_koulutusala1995_id] [int] NULL,
	[aikaisemman_alemman_kk_opintoala2002_id] [int] NULL,
	[aikaisemman_alemman_kk_koulutusala2002_id] [int] NULL,
	[aikaisemman_alemman_kk_koulutusaste2002_id] [int] NULL,
	[aikaisemman_alemman_kk_koulutusala_taso2_id] [int] NULL,
	[aikaisemman_alemman_kk_koulutusaste_taso2_id] [int] NULL,
	[aikaisemman_alemman_kk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisempi_ylempi_kk_tarkempi] [nvarchar](100) NULL,
	[ylempi_kk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikasemman_ylemman_kk_opintoala1995_id] [int] NULL,
	[aikasemman_ylemman_kk_koulutusala1995_id] [int] NULL,
	[aikasemman_ylemman_kk_opintoala2002_id] [int] NULL,
	[aikasemman_ylemman_kk_koulutusala2002_id] [int] NULL,
	[aikasemman_ylemman_kk_koulutusaste2002_id] [int] NULL,
	[aikasemman_ylemman_kk_koulutusala_taso2_id] [int] NULL,
	[aikasemman_ylemman_kk_koulutusaste_taso2_id] [int] NULL,
	[aikaisemman_ylemman_kk_suoritusvuosi_id] [nvarchar](10) NULL,
	[opiskelijan_asuinkunta_id] [int] NULL,
	[opiskelijan_asuinkunta_historia_id] [int] NULL,
	[lukumaara] [int] NULL,
	[rivinumero] [int] NULL,
	[ika1v_id] [int] NULL,
	[ika5v_id] [int] NULL,
	[ika_14_65_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_ammpk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika_id] [int] NULL,
	[aiemman_tutkinnon_ammpk_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammpk_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammpk_koulutusaste_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammlisa_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammlisa_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ammlisa_koulutusaste_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempi_kk_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempi_kk_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alempi_kk_koulutusaste_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempi_kk_opintoala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempi_kk_koulutusala_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylempi_kk_koulutusaste_sama] [nvarchar](100) NULL,
	[aikaisempi_korkein_tutkinto_id] [int] NULL,
	[aiemman_tutkinnon_opintoala2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusaste2002_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusala2002_sama] [nvarchar](100) NULL,
	[nuorten_aikuisten_koulutus_amm_id] [int] NULL,
	[koulutuksen_jarjestamismuoto_id] [int] NULL,
	[aloittaneet] [int] NULL,
	[viimeisimman_koulutuksen_suorituvuosi_id] [nvarchar](10) NULL,
	[viimeisimmasta_koulutuksesta_kulunut_aika_id] [int] NULL,
	[hallinnonala2_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aidinkieli_versio1_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aidinkieli_versio1_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusala1995_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_alemman_kk_koulutusala1995_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_alemman_kk_koulutusala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusaste2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_alemman_kk_koulutusaste2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_opintoala1995_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_alemman_kk_opintoala1995_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_opintoala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_opintoala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_alemman_kk_opintoala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemman_alemman_kk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_alemman_kk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammlisa_koulutusala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_ammlisa_koulutusala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammlisa_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammlisa_koulutusaste2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_ammlisa_koulutusaste2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammlisa_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammlisa_opintoala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_ammlisa_opintoala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammlisa_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammlisa_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemman_ammlisa_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammlisa_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammpk_koulutusala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_ammpk_koulutusala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammpk_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammpk_koulutusaste2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_ammpk_koulutusaste2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammpk_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammpk_opintoala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemman_ammpk_opintoala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammpk_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ammpk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemman_ammpk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ammpk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusala1995_d_koulutusluokitus_historia] FOREIGN KEY([aikasemman_ylemman_kk_koulutusala1995_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikasemman_ylemman_kk_koulutusala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusaste2002_d_koulutusluokitus_historia] FOREIGN KEY([aikasemman_ylemman_kk_koulutusaste2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_koulutusaste2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_opintoala1995_d_koulutusluokitus_historia] FOREIGN KEY([aikasemman_ylemman_kk_opintoala1995_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_opintoala1995_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_opintoala2002_d_koulutusluokitus_historia] FOREIGN KEY([aikasemman_ylemman_kk_opintoala2002_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_opintoala2002_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemman_ylemman_kk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisemman_ylemman_kk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_aikaisempi_korkein_tutkinto_d_aikaisempi_korkein_tutkinto] FOREIGN KEY([aikaisempi_korkein_tutkinto_id])
REFERENCES [dbo].[d_aikaisempi_korkein_tutkinto] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_aikaisempi_korkein_tutkinto_d_aikaisempi_korkein_tutkinto]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_alempi_kk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_alempi_kk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ammatillisen_koulutuksen_koulutuslaji_d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([ammatillisen_koulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ammatillisen_koulutuksen_koulutuslaji_d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ammlisa_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ammlisa_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ammpk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_ammpk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ammpk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] FOREIGN KEY([opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_d_opiskelijan_aikaisempi_yleissivistava_koulutus] FOREIGN KEY([aikaisempi_ylsk_koulutus_id])
REFERENCES [dbo].[d_opiskelijan_aikaisempi_yleissivistava_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_d_opiskelijan_aikaisempi_yleissivistava_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ika_14_65_d_ika] FOREIGN KEY([ika_14_65_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ika_14_65_d_ika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ika1v_d_ika] FOREIGN KEY([ika1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ika1v_d_ika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ika5v_d_ika] FOREIGN KEY([ika5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ika5v_d_ika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_kirjoihintulolukukausi_d_kausi] FOREIGN KEY([kirjoihintulolukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_kirjoihintulolukukausi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_kirjoihintulovuosi_d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_kirjoihintulovuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_koulutuksen_jarjestamismuoto_d_koulutuksen_jarjestamismuoto] FOREIGN KEY([koulutuksen_jarjestamismuoto_id])
REFERENCES [dbo].[d_koulutuksen_jarjestamismuoto] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_koulutuksen_jarjestamismuoto_d_koulutuksen_jarjestamismuoto]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_koulutuksen_kunta_d_alueluokitus] FOREIGN KEY([koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_koulutuksen_kunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_koulutuksen_kunta_historia_d_alueluokitus_historia] FOREIGN KEY([koulutuksen_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_koulutuksen_kunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_koulutusluokitus_historia_d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_lahde_d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_lahde_d_lahde]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_nuorten_aikuisten_koulutus_amm_d_nuorten_aikuisten_koulutus_amm] FOREIGN KEY([nuorten_aikuisten_koulutus_amm_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus_amm] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_nuorten_aikuisten_koulutus_amm_d_nuorten_aikuisten_koulutus_amm]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_nuorten_aikuisten_koulutus_d_nuorten_aikuisten_koulutus] FOREIGN KEY([nuorten_aikuisten_koulutus_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_nuorten_aikuisten_koulutus_d_nuorten_aikuisten_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_opetushallinnon_koulutus_d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_opetushallinnon_koulutus_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_opiskelijan_asuinkunta_d_alueluokitus] FOREIGN KEY([opiskelijan_asuinkunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_opiskelijan_asuinkunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_opiskelijan_asuinkunta_historia_d_alueluokitus_historia] FOREIGN KEY([opiskelijan_asuinkunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_opiskelijan_asuinkunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_opiskelijan_olo_syys_d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_syys_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_opiskelijan_olo_syys_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_oppilaitoksen_oppilaitostyyppi_d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitoksen_oppilaitostyyppi_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_oppilaitoksen_oppilaitostyyppi_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_rahoituslahde_d_rahoituslahde_amm] FOREIGN KEY([rahoituslahde_id])
REFERENCES [dbo].[d_rahoituslahde_amm] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_rahoituslahde_d_rahoituslahde_amm]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_sukupuoli_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_viimeisimman_koulutuksen_suoritusvuosi_d_kausi] FOREIGN KEY([viimeisimman_koulutuksen_suorituvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_viimeisimman_koulutuksen_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_viimeisimmasta_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([viimeisimmasta_koulutuksesta_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_viimeisimmasta_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]  WITH CHECK ADD  CONSTRAINT [FK_2_20_ylempi_kk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] CHECK CONSTRAINT [FK_2_20_ylempi_kk_koulutuksesta_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO


USE [ANTERO]