USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_yotutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ylkktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ylamktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_rahoituslahde_d_rahoituslahde]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_pohjakoulutuksen_tila_d_pohjakoulutuksen_tila]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelumuoto_d_opiskelumuoto]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelijan_opintoala_2002_edellisvuonna_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelijan_opintoala_1995_edellisvuonna_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelijan_olo_tamm_d_opiskelijan_olo_tamm]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelijan_olo_syys_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelijan_koulutus_edellisvuonna_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_opiskelijan_fte_tieto_d_opiskelijan_fte_tieto]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_lahde_id_d_lahde]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_koulutustyyppi_d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_koulutusluokitusd_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_koulutusluokitus_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_koulutuksen_kunta_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_koulutuksen_kunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kotikunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kotikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kotikunta_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_sektori_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_sektori_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_opintoala_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_opintoala_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulusektori_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulu_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulu_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kirjoihintulolukukausi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_kansalaisuus_versio2_d_kansalaisuus_versio2]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_KAK_koulutustyyppi_d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ika_5v_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ika_1v_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ika_18_65_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ika_14_65_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_d_vahintaan_55_op_suorittanut]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_d_vahintaan_45_op_suorittanut]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_avoinvayla_d_avoinvayla]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_ammtutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_amktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_alkktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisempi_korkein_tutkinto_d_aikaisempi_korkein_tutkinto]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_yotutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ammtutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_amktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aik_suor_yotutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aik_suor_ylempikktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aik_suor_ylempiamktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aik_suor_ammtutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aik_suor_amktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] DROP CONSTRAINT [FK_f_KAK_2_10_aik_suor_alempikktutk_koulk_d_koulutusluokitus]
GO

/****** Object:  Table [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 9.4.2021 1:06:54 ******/
DROP TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
GO

/****** Object:  Table [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 9.4.2021 1:06:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde_id] [int] NULL,
	[oppilaitoksen_taustatiedot_id] [int] NULL,
	[oppilaitoksen_taustatiedot_historia_id] [int] NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[koulutuksen_kunta_historia_id] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[ika_1v_id] [int] NULL,
	[ika_5v_id] [int] NULL,
	[ika_14_65_id] [int] NULL,
	[kotikunta_id] [int] NULL,
	[kotikunta_historia_id] [int] NULL,
	[kansalaisuus_versio2_id] [int] NULL,
	[opiskelijan_olo_tamm_id] [int] NULL,
	[opiskelijan_olo_syys_id] [int] NULL,
	[rahoituslahde_id] [int] NULL,
	[opiskelijan_fte_tieto_id] [int] NULL,
	[vahintaan_45_op_suorittanut_id] [int] NULL,
	[vahintaan_55_op_suorittanut_id] [int] NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulolukukausi_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_sektori_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_sektori_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_korkeakoulu_lasnaoleva_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_opintoala_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi_opintoala_lasnaoleva_id] [nvarchar](10) NULL,
	[koulutustyyppi_id] [int] NULL,
	[opiskelumuoto_id] [int] NULL,
	[avoinvayla_id] [int] NULL,
	[aikaisemmin_suoritettu_yotutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_yotutk_tarkempi] [nvarchar](100) NULL,
	[yotutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_yotutk_koulutustiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_yotutk_koulutustiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritetun_yotutk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisemmin_suoritetun_yotutk_oppilaitostiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_yotutk_oppilaitostiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritettu_ammtutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_ammtutk_tarkempi] [nvarchar](100) NULL,
	[ammtutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_ammtutk_koulutustiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_ammtutk_koulutustiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritetun_ammtutk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritettu_amktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_amktutk_tarkempi] [nvarchar](100) NULL,
	[amktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_amktutk_koulutustiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_amktutk_koulutustiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritetun_amktutk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisemmin_suoritetun_amktutk_oppilaitostiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_amktutk_oppilaitostiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritettu_ylempiamktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_ylempiamktutk_tarkempi] [nvarchar](100) NULL,
	[ylempiamktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritettu_alempikktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_alempikktutk_tarkempi] [nvarchar](100) NULL,
	[alempikktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_alempikktutk_koulutustiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_alempikktutk_koulutustiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritettu_ylempikktutk] [nvarchar](1) NULL,
	[aikaisemmin_suoritettu_ylempikktutk_tarkempi] [nvarchar](100) NULL,
	[ylempikktutk_pohjakoulutuksen_tila] [nvarchar](150) NULL,
	[aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_historia_id] [int] NULL,
	[aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_id] [nvarchar](10) NULL,
	[aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_id] [int] NULL,
	[aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_historia_id] [int] NULL,
	[opiskelijan_koulutus_edellisvuonna_id] [int] NULL,
	[opiskelijan_opintoala2002_edellisvuonna_id] [int] NULL,
	[opiskelijan_opintoala1995_edellisvuonna_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_yotutk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_amktutk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika_id] [int] NULL,
	[aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika_id] [int] NULL,
	[aiemman_tutkinnon_yotutk_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_opintoala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_yotutk_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_yotutk_koulutusaste_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ammtutk_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ammtutk_opintoala2002_sama][nvarchar](100) NULL,
    [aiemman_tutkinnon_ammtutk_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ammtutk_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amm_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amm_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amm_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amm_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_amm_koulutusaste_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amktutk_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amktutk_opintoala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amktutk_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amk_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amk_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amk_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_amk_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_amk_koulutusaste_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempiamktutk_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempiamktutk_opintoala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempiamktutk_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempiamktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylamk_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylamk_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylamk_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylamk_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylamk_koulutusaste_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alempikktutk_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alempikktutk_opintoala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alempikktutk_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alempikktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alkk_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alkk_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alkk_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_alkk_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_alkk_koulutusaste_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempikktutk_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempikktutk_opintoala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempikktutk_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylempikktutk_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylkk_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylkk_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylkk_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_ylkk_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_ylkk_koulutusaste_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_opintoala1995_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_opintoala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_koulutusala2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_koulutusaste2002_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_koulutusala_taso1_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_koulutusala_taso2_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_koulutusala_taso3_sama] [nvarchar](100) NULL,
    [aiemman_tutkinnon_koulutusaste_taso1_sama] [nvarchar](100) NULL,
	[aiemman_tutkinnon_koulutusaste_taso2_sama] [nvarchar](100) NULL,
	[pohjakoulutuksen_tila_id] [int] NULL,
	[opiskelijat] [int] NULL,
	[aloittaneet] [int] NULL,
	[aikaisempi_korkein_tutkinto_id] [int] NULL,
	[ika_18_65_id] [int] NULL,
	[ylempi_korkeakoulututkinto] [int] NULL,
	[ylempi_amk_tutkinto] [int] NULL,
	[alempi_korkeakoulututkinto] [int] NULL,
	[amk_tutkinto] [int] NULL,
	[ammatillinen_perustutkinto] [int] NULL,
	[ylioppilastutkinto] [int] NULL,
	[ei_perusasteen_jalkeista_koulutusta] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aik_suor_alempikktutk_koulk_d_koulutusluokitus] FOREIGN KEY([aikaisemmin_suoritetun_alempikktutk_koulutustiedot_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aik_suor_alempikktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aik_suor_amktutk_koulk_d_koulutusluokitus] FOREIGN KEY([aikaisemmin_suoritetun_amktutk_koulutustiedot_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aik_suor_amktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aik_suor_ammtutk_koulk_d_koulutusluokitus] FOREIGN KEY([aikaisemmin_suoritetun_ammtutk_koulutustiedot_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aik_suor_ammtutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aik_suor_ylempiamktutk_koulk_d_koulutusluokitus] FOREIGN KEY([aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aik_suor_ylempiamktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aik_suor_ylempikktutk_koulk_d_koulutusluokitus] FOREIGN KEY([aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aik_suor_ylempikktutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aik_suor_yotutk_koulk_d_koulutusluokitus] FOREIGN KEY([aikaisemmin_suoritetun_yotutk_koulutustiedot_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aik_suor_yotutk_koulk_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_amktutk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemmin_suoritetun_amktutk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_amktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ammtutk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemmin_suoritetun_ammtutk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ammtutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_yotutk_suoritusvuosi_d_kausi] FOREIGN KEY([aikaisemmin_suoritetun_yotutk_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisemmin_suoritetun_yotutk_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_aikaisempi_korkein_tutkinto_d_aikaisempi_korkein_tutkinto] FOREIGN KEY([aikaisempi_korkein_tutkinto_id])
REFERENCES [dbo].[d_aikaisempi_korkein_tutkinto] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_aikaisempi_korkein_tutkinto_d_aikaisempi_korkein_tutkinto]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_alkktutk_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_alkktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_amktutk_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_amktutk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_amktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ammtutk_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ammtutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_avoinvayla_d_avoinvayla] FOREIGN KEY([avoinvayla_id])
REFERENCES [dbo].[d_avoinvayla] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_avoinvayla_d_avoinvayla]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitoksen_taustatiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_d_vahintaan_45_op_suorittanut] FOREIGN KEY([vahintaan_45_op_suorittanut_id])
REFERENCES [dbo].[d_vahintaan_45_op_suorittanut] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_d_vahintaan_45_op_suorittanut]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_d_vahintaan_55_op_suorittanut] FOREIGN KEY([vahintaan_55_op_suorittanut_id])
REFERENCES [dbo].[d_vahintaan_55_op_suorittanut] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_d_vahintaan_55_op_suorittanut]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ika_14_65_id_d_ika] FOREIGN KEY([ika_14_65_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ika_14_65_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ika_18_65_id_d_ika] FOREIGN KEY([ika_18_65_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ika_18_65_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ika_1v_id_d_ika] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ika_1v_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ika_5v_id_d_ika] FOREIGN KEY([ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ika_5v_id_d_ika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_KAK_koulutustyyppi_d_koulutustyyppi] FOREIGN KEY([koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_KAK_koulutustyyppi_d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kansalaisuus_versio2_d_kansalaisuus_versio2] FOREIGN KEY([kansalaisuus_versio2_id])
REFERENCES [dbo].[d_kansalaisuus_versio2] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kansalaisuus_versio2_d_kansalaisuus_versio2]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulolukukausi_d_kausi] FOREIGN KEY([kirjoihintulolukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulolukukausi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulu_d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulu_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulu_lasnaoleva_d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulu_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulusektori_d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulusektori_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulusektori_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_opintoala_d_kausi] FOREIGN KEY([kirjoihintulovuosi_opintoala_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_opintoala_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_opintoala_lasnaoleva_d_kausi] FOREIGN KEY([kirjoihintulovuosi_opintoala_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_opintoala_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_sektori_d_kausi] FOREIGN KEY([kirjoihintulovuosi_sektori_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_sektori_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_sektori_lasnaoleva_d_kausi] FOREIGN KEY([kirjoihintulovuosi_sektori_lasnaoleva_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kirjoihintulovuosi_sektori_lasnaoleva_d_kausi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kotikunta_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kotikunta_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kotikunta_d_alueluokitus] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kotikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_kotikunta_historia_d_alueluokitus_historia] FOREIGN KEY([kotikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_kotikunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_koulutuksen_kunta_d_alueluokitus] FOREIGN KEY([koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_koulutuksen_kunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_koulutuksen_kunta_d_alueluokitus_historia] FOREIGN KEY([koulutuksen_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_koulutuksen_kunta_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_koulutusluokitus_d_koulutusluokitus] FOREIGN KEY([koulutusluokitus_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_koulutusluokitus_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_koulutusluokitusd_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_koulutusluokitusd_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_koulutustyyppi_d_koulutustyyppi] FOREIGN KEY([koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_koulutustyyppi_d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_lahde_id_d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_lahde_id_d_lahde]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelijan_fte_tieto_d_opiskelijan_fte_tieto] FOREIGN KEY([opiskelijan_fte_tieto_id])
REFERENCES [dbo].[d_opiskelijan_fte_tieto] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelijan_fte_tieto_d_opiskelijan_fte_tieto]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelijan_koulutus_edellisvuonna_d_koulutusluokitus] FOREIGN KEY([opiskelijan_koulutus_edellisvuonna_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelijan_koulutus_edellisvuonna_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelijan_olo_syys_d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_syys_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelijan_olo_syys_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelijan_olo_tamm_d_opiskelijan_olo_tamm] FOREIGN KEY([opiskelijan_olo_tamm_id])
REFERENCES [dbo].[d_opiskelijan_olo_tamm] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelijan_olo_tamm_d_opiskelijan_olo_tamm]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelijan_opintoala_1995_edellisvuonna_d_koulutusluokitus] FOREIGN KEY([opiskelijan_opintoala1995_edellisvuonna_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelijan_opintoala_1995_edellisvuonna_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelijan_opintoala_2002_edellisvuonna_d_koulutusluokitus] FOREIGN KEY([opiskelijan_opintoala2002_edellisvuonna_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelijan_opintoala_2002_edellisvuonna_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_opiskelumuoto_d_opiskelumuoto] FOREIGN KEY([opiskelumuoto_id])
REFERENCES [dbo].[d_opiskelumuoto] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_opiskelumuoto_d_opiskelumuoto]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_pohjakoulutuksen_tila_d_pohjakoulutuksen_tila] FOREIGN KEY([pohjakoulutuksen_tila_id])
REFERENCES [dbo].[d_pohjakoulutuksen_tila] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_pohjakoulutuksen_tila_d_pohjakoulutuksen_tila]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_rahoituslahde_d_rahoituslahde] FOREIGN KEY([rahoituslahde_id])
REFERENCES [dbo].[d_rahoituslahde] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_rahoituslahde_d_rahoituslahde]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_sukupuoli_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemmin_suoritetun_alempikktutk_koulutustiedot_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_oppilaitoksen_taustatiedot] FOREIGN KEY([aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_alempikktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemmin_suoritetun_amktutk_koulutustiedot_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_oppilaitoksen_taustatiedot] FOREIGN KEY([aikaisemmin_suoritetun_amktutk_oppilaitostiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([aikaisemmin_suoritetun_amktutk_oppilaitostiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_amktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemmin_suoritetun_ammtutk_koulutustiedot_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_oppilaitoksen_taustatiedot] FOREIGN KEY([aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ammtutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_oppilaitoksen_taustatiedot] FOREIGN KEY([aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempiamktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_oppilaitoksen_taustatiedot] FOREIGN KEY([aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_ylempikktutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_koulutusluokitus_historia] FOREIGN KEY([aikaisemmin_suoritetun_yotutk_koulutustiedot_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_oppilaitoksen_taustatiedot] FOREIGN KEY([aikaisemmin_suoritetun_yotutk_oppilaitostiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([aikaisemmin_suoritetun_yotutk_oppilaitostiedot_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_suoritettu_yotutk_d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ylamktutk_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ylamktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_ylkktutk_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_ylkktutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_f_KAK_2_10_yotutk_kulunut_aika_d_koulutuksesta_kulunut_aika] FOREIGN KEY([aikaisemmasta_koulutuksesta_yotutk_kulunut_aika_id])
REFERENCES [dbo].[d_koulutuksesta_kulunut_aika] ([id])
GO

ALTER TABLE [dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] CHECK CONSTRAINT [FK_f_KAK_2_10_yotutk_kulunut_aika_d_koulutuksesta_kulunut_aika]
GO


