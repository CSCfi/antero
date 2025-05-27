USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 15.5.2025 9.55.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]') AND type in (N'U'))
  DROP TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO

CREATE TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[aineisto_id] [int] NOT NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NOT NULL,
	[syntymavuosi] [nvarchar](10) NULL,
	[syntymavuosi_id] [nvarchar](10) NOT NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[asuinmaakunta_id] [int] NOT NULL,
	[asuinmaakunta_historia_id] [int] NOT NULL,
	[kansalaisuus_versio1] [nvarchar](1) NULL,
	[kansalaisuus_versio1_id] [int] NOT NULL,
	[pohjoismaa] [nvarchar](1) NULL,
	[pohjoismaa_id] [int] NOT NULL,
	[eumaa] [nvarchar](1) NULL,
	[eumaa_id] [int] NOT NULL,
	[etamaa] [nvarchar](1) NULL,
	[etamaa_id] [int] NOT NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](10) NULL,
	[tutkinnon_suoritusvuosi_id] [nvarchar](10) NOT NULL,
	[tutkinnon_suoritusmaakunta] [nvarchar](2) NULL,
	[tutkinnon_suoritusmaakunta_id] [int] NOT NULL,
	[tutkinnon_suoritusmaakunta_historia_id] [int] NOT NULL,
    [koulutuksen_opetuskieli] [nvarchar](2) NULL,
    [koulutuksen_opetuskieli_id] [int] NOT NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NOT NULL,
	[koulutusluokitus_historia_id] [int] NOT NULL,
	[koulutusmuoto] [nvarchar](1) NULL,
	[koulutusmuoto_id] [int] NOT NULL,
	[oppisopimuskoulutus] [nvarchar](1) NULL,
	[oppisopimuskoulutus_id] [int] NOT NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa_id] [int] NOT NULL,
	[paaasiallinen_toiminta_versio6] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio6_id] [int] NOT NULL,
	[ammattiluokitus_2001] [nvarchar](2) NULL,
	[ammattiluokitus_2001_id] [int] NOT NULL,
	[ammattiluokitus_2010] [nvarchar](2) NULL,
	[ammattiluokitus_2010_id] [int] NOT NULL,
	[tyossakayntitilaston_tyonantajasektori] [nvarchar](2) NULL,
	[tyossakayntitilaston_tyonantajasektori_id] [int] NOT NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu] [nvarchar](6) NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu_id] [int] NOT NULL,
    [kk_ensim_koulutusaste] [nvarchar](2) NULL,
	[kk_ensim_koulutusaste_id] [int] NOT NULL,
    [kk_ensim_hakuvuosi_id] [nvarchar](10) NULL,
	[ta_ensim_koulutusaste] [nvarchar](2) NULL,
	[ta_ensim_koulutusaste_id] [int] NOT NULL,
    [ta_ensim_hakuvuosi_id] [nvarchar](10) NULL,
	[d_kylla_ei_koulutusluokitus_korkein_viimeisin_aloitettu_sama_id] [int] NOT NULL,
	[d_kylla_ei_tutkintoon_johtavassa_koulutuksessa_id] [int] NOT NULL,
	[d_kylla_ei_tutkinto_suoritettu_ulkomailla_id] [int] NOT NULL,
	[lukumaara] [int] NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NOT NULL,
	[vaeston_ika_1v] [nvarchar](10) NULL,
	[vaeston_ika_1v_id] [int] NOT NULL,
	[vaeston_ika_5v] [nvarchar](10) NULL,
	[vaeston_ika_5v_id] [int] NOT NULL,
	[tutkinnon_suoritusika_1v] [nvarchar](10) NULL,
	[tutkinnon_suoritusika_1v_id] [int] NOT NULL,
	[tutkinnon_ika_1v] [nvarchar](10) NULL,
	[tutkinnon_ika_1v_id] [int] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_aidinkieli_versio1_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_aidinkieli_versio1_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_aineisto_d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_aineisto_d_aineisto]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_ammattiluokitus_2001_d_ammattiluokitus_2001] FOREIGN KEY([ammattiluokitus_2001_id])
REFERENCES [dbo].[d_ammattiluokitus_2001] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_ammattiluokitus_2001_d_ammattiluokitus_2001]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_ammattiluokitus_2010_d_ammattiluokitus_2010] FOREIGN KEY([ammattiluokitus_2010_id])
REFERENCES [dbo].[d_ammattiluokitus_2010] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_ammattiluokitus_2010_d_ammattiluokitus_2010]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_asuinmaakunta_d_alueluokitus] FOREIGN KEY([asuinmaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_asuinmaakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_asuinmaakunta_historia_d_alueluokitus_historia] FOREIGN KEY([asuinmaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_asuinmaakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_d_tyossakayntitilaston_tyonantajasektori] FOREIGN KEY([tyossakayntitilaston_tyonantajasektori_id])
REFERENCES [dbo].[d_tyossakayntitilaston_tyonantajasektori] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_d_tyossakayntitilaston_tyonantajasektori]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_etamaa_d_valtio] FOREIGN KEY([etamaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_etamaa_d_valtio]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_eumaa_d_valtio] FOREIGN KEY([eumaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_eumaa_d_valtio]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_kansalaisuus_versio1_d_kansalaisuus_versio1] FOREIGN KEY([kansalaisuus_versio1_id])
REFERENCES [dbo].[d_kansalaisuus_versio1] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_kansalaisuus_versio1_d_kansalaisuus_versio1]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_koulutusluokitus_historia_d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_koulutusmuoto_d_koulutusmuoto] FOREIGN KEY([koulutusmuoto_id])
REFERENCES [dbo].[d_koulutusmuoto] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_koulutusmuoto_d_koulutusmuoto]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_oppisopimuskoulutus_d_oppisopimuskoulutus] FOREIGN KEY([oppisopimuskoulutus_id])
REFERENCES [dbo].[d_oppisopimuskoulutus] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_oppisopimuskoulutus_d_oppisopimuskoulutus]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_paaasiallinen_toiminta_versio6_d_paaasiallinen_toiminta] FOREIGN KEY([paaasiallinen_toiminta_versio6_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_paaasiallinen_toiminta_versio6_d_paaasiallinen_toiminta]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_pohjoismaa_d_pohjoismaa] FOREIGN KEY([pohjoismaa_id])
REFERENCES [dbo].[d_pohjoismaa] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_pohjoismaa_d_pohjoismaa]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_sukupuoli_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_syntymavuosi_d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_syntymavuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_tutkinnon_ika_1v_d_ika] FOREIGN KEY([tutkinnon_ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_tutkinnon_ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_tutkinnon_suoritusika_1v_d_ika] FOREIGN KEY([tutkinnon_suoritusika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_tutkinnon_suoritusika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_tutkinnon_suoritusmaakunta_d_alueluokitus] FOREIGN KEY([tutkinnon_suoritusmaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_tutkinnon_suoritusmaakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_tutkinnon_suoritusmaakunta_historia_d_alueluokitus_historia] FOREIGN KEY([tutkinnon_suoritusmaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_tutkinnon_suoritusmaakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_tutkinnon_suoritusvuosi_d_kausi] FOREIGN KEY([tutkinnon_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_tutkinnon_suoritusvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_vaeston_ika_1v_d_ika] FOREIGN KEY([vaeston_ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_vaeston_ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_vaeston_ika_5v_d_ika] FOREIGN KEY([vaeston_ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_vaeston_ika_5v_d_ika]
GO

-- Uudet luokitukset 2025:

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_koulutuksen_opetuskieli_d_kieli] FOREIGN KEY([koulutuksen_opetuskieli_id])
REFERENCES [dbo].[d_kieli] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_koulutuksen_opetuskieli_d_kieli]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_kk_ensim_koulutusaste_d_koulutusluokitus] FOREIGN KEY([kk_ensim_koulutusaste_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_kk_ensim_koulutusaste_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_kk_ensim_hakuvuosi_d_kausi] FOREIGN KEY([kk_ensim_hakuvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_kk_ensim_hakuvuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_ta_ensim_koulutusaste_d_koulutusluokitus] FOREIGN KEY([ta_ensim_koulutusaste_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_ta_ensim_koulutusaste_d_koulutusluokitus]
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_4_2_ta_ensim_hakuvuosi_d_kausi] FOREIGN KEY([ta_ensim_hakuvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_4_2_ta_ensim_hakuvuosi_d_kausi]
GO

