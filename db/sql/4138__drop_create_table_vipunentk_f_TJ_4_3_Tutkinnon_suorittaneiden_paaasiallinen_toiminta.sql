USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_tutkinnon_suoritusvuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_tutkinnon_suorittamismaakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_tutkinnon_suorittamismaakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_valiaikainen_amk]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_tutkintolaji_tyollistymiseen]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_versio2]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_okm]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_ja_maasta_muuttaneet]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_oppisopimuskoulutus]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_maassaolo]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_koulutusmuoto]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_ammattiluokitus_2010]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_ammattiasema]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_aineisto]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_d_aikuisopiskelija]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_asuinmaakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] DROP CONSTRAINT [FK_4_3_asuinmaakunta_d_alueluokitus]
GO

/****** Object:  Table [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 20.11.2020 9:17:41 ******/
DROP TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]
GO

/****** Object:  Table [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 20.11.2020 9:17:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[aineisto_id] [int] NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[asuinmaakunta_id] [int] NULL,
	[asuinmaakunta_historia_id] [int] NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[aikuisopiskelija_id] [int] NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusvuosi_id] [nvarchar](10) NULL,
	[tutkinnon_suorittamismaakunta] [nvarchar](2) NULL,
	[tutkinnon_suorittamismaakunta_id] [int] NULL,
	[tutkinnon_suorittamismaakunta_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[valiaikainen_amk] [nvarchar](2) NULL,
	[valiaikainen_amk_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutusmuoto] [nvarchar](2) NULL,
	[koulutusmuoto_id] [int] NULL,
	[oppisopimuskoulutus] [nvarchar](2) NULL,
	[oppisopimuskoulutus_id] [int] NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id] [int] NULL,
	[paaasiallinen_toiminta_versio2] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio2_id] [int] NULL,
	[maassaolo] [nvarchar](2) NULL,
	[maassaolo_id] [int] NULL,
	[ammattiasema] [nvarchar](2) NULL,
	[ammattiasema_id] [int] NULL,
	[ammattiluokitus_2010] [nvarchar](5) NULL,
	[ammattiluokitus_2010_id] [int] NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[tutkintolaji_tyollistymiseen] [nvarchar](2) NULL,
	[tutkintolaji_tyollistymiseen_id] [int] NULL,
	[sijoittuminen_1v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_3v_tutkinnon_jalkeen] [int] NULL,
	[sijoittuminen_5v_tutkinnon_jalkeen] [int] NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_ja_maasta_muuttaneet_id] [int] NULL,
	[paaasiallinen_toiminta_okm_id] [int] NULL,
	[eu_etamaat_id] [int] NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[kansalaisuus_maanosa_id] [int] NULL,
	[sektori_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_asuinmaakunta_d_alueluokitus] FOREIGN KEY([asuinmaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_asuinmaakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_asuinmaakunta_historia_d_alueluokitus_historia] FOREIGN KEY([asuinmaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_asuinmaakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_aikuisopiskelija] FOREIGN KEY([aikuisopiskelija_id])
REFERENCES [dbo].[d_aikuisopiskelija] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_aikuisopiskelija]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_aineisto]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_ammattiasema] FOREIGN KEY([ammattiasema_id])
REFERENCES [dbo].[d_ammattiasema] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_ammattiasema]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_ammattiluokitus_2010] FOREIGN KEY([ammattiluokitus_2010_id])
REFERENCES [dbo].[d_ammattiluokitus_2010] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_ammattiluokitus_2010]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_koulutusmuoto] FOREIGN KEY([koulutusmuoto_id])
REFERENCES [dbo].[d_koulutusmuoto] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_koulutusmuoto]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_maassaolo] FOREIGN KEY([maassaolo_id])
REFERENCES [dbo].[d_maassaolo] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_maassaolo]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_oppisopimuskoulutus] FOREIGN KEY([oppisopimuskoulutus_id])
REFERENCES [dbo].[d_oppisopimuskoulutus] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_oppisopimuskoulutus]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_ja_maasta_muuttaneet] FOREIGN KEY([paaasiallinen_toiminta_ja_maasta_muuttaneet_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta_ja_maasta_muuttaneet] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_ja_maasta_muuttaneet]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_okm] FOREIGN KEY([paaasiallinen_toiminta_okm_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta_okm] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_okm]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_versio2] FOREIGN KEY([paaasiallinen_toiminta_versio2_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta_versio2] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_paaasiallinen_toiminta_versio2]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_tutkintolaji_tyollistymiseen] FOREIGN KEY([tutkintolaji_tyollistymiseen_id])
REFERENCES [dbo].[d_tutkintolaji_tyollistymiseen] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_tutkintolaji_tyollistymiseen]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_d_valiaikainen_amk] FOREIGN KEY([valiaikainen_amk_id])
REFERENCES [dbo].[d_valiaikainen_amk] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_d_valiaikainen_amk]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_koulutusluokitus_historia_d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_oppilaitos__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_tutkinnon_suorittamismaakunta_d_alueluokitus] FOREIGN KEY([tutkinnon_suorittamismaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_tutkinnon_suorittamismaakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_tutkinnon_suorittamismaakunta_historia_d_alueluokitus_historia] FOREIGN KEY([tutkinnon_suorittamismaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_tutkinnon_suorittamismaakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_3_tutkinnon_suoritusvuosi__d_kausi] FOREIGN KEY([tutkinnon_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_3_tutkinnon_suoritusvuosi__d_kausi]
GO

USE [ANTERO]