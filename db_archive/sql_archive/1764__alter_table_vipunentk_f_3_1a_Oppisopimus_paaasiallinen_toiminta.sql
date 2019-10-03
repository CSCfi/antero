USE [VipunenTK]
GO
/****** Object:  Table [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 12.6.2018 17:58:11 ******/
DROP TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 12.6.2018 17:58:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[oppisryh_id] [int] NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](10) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[ika] [nvarchar](7) NULL,
	[ika_id] [int] NULL,
	[opetushallinnon_koulutusala] [nvarchar](1) NULL,
	[opetushallinnon_koulutusala_id] [int] NULL,
	[opetushallinnon_koulutusaste] [nvarchar](2) NULL,
	[opetushallinnon_koulutusaste_id] [int] NULL,
	[koulutusala_taso_1] [nvarchar](12) NULL,
	[koulutuala_taso_1_id] [int] NULL,
	[koulutusaste_taso_2] [nvarchar](9) NULL,
	[koulutusaste_taso_2_id] [int] NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[koulutuksen_sijaintimaakunta_id] [int] NULL,
	[paaasiallinen_toiminta_versio3] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio3_id] [int] NULL,
	[ammattiasema] [nvarchar](1) NULL,
	[ammattiasema_id] [int] NULL,
	[opiskelijat] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_alueluokitus_koul_sijaintimaakunta] FOREIGN KEY([koulutuksen_sijaintimaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_alueluokitus_koul_sijaintimaakunta]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([ammatillisen_koulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_ammattiasema] FOREIGN KEY([ammattiasema_id])
REFERENCES [dbo].[d_ammattiasema] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_ammattiasema]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_ika_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_ika_ika]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_koulutusluokitus_opetushallinnon_koulutusala] FOREIGN KEY([opetushallinnon_koulutusala_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_koulutusluokitus_opetushallinnon_koulutusala]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_koulutusluokitus_opetushallinnon_koulutusaste] FOREIGN KEY([opetushallinnon_koulutusaste_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_koulutusluokitus_opetushallinnon_koulutusaste]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_paaasiallinen_toiminta_versio3] FOREIGN KEY([paaasiallinen_toiminta_versio3_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_paaasiallinen_toiminta_versio3]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] FOREIGN KEY([oppisryh_id])
REFERENCES [dbo].[d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_sukupuoli_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_koulutusluokitus_koulutuala_taso_1] FOREIGN KEY([koulutuala_taso_1_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_koulutusluokitus_koulutuala_taso_1]
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]  WITH CHECK ADD  CONSTRAINT [FK_3_1a_d_koulutusluokitus_koulutusaste_taso_2] FOREIGN KEY([koulutusaste_taso_2_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta] CHECK CONSTRAINT [FK_3_1a_d_koulutusluokitus_koulutusaste_taso_2]
GO

USE[ANTERO]
