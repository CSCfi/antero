USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__tutkinnon_suoritusvuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__tutkinnon_suorituskuukausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__syntymavuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__syntymakuukausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__oppilaitos_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__koulutusluokitus__d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__kirjoihintulovuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__kirjoihintulokausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_tutkinnon_toteuma]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_nuorten_aikuisten_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_lahde]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_koulutussektori]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_koulutuksen_jarjestamismuoto]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_15__d_amm_sopimusjaksot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_ammatillinen_peruskoulutus_lisakoulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT [FK__3_15__d_aidinkieli_versio1]
GO

/****** Object:  Table [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]    Script Date: 9.8.2021 22:17:50 ******/
DROP TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]
GO

/****** Object:  Table [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]    Script Date: 9.8.2021 22:17:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja_id] [int] NULL,
	[oppisopimuskoulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_id] [nvarchar](10) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[syntymakuukausi_id] [nvarchar](10) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulokausi_id] [nvarchar](10) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusvuosi_id] [nvarchar](10) NULL,
	[tutkinnon_suorituskuukausi] [nvarchar](2) NULL,
	[tutkinnon_suorituskuukausi_id] [nvarchar](10) NULL,
	[lukumaara] [int] NULL,
	[tutkinnon_toteuma] [nvarchar](2) NULL,
	[tutkinnon_toteuma_id] [int] NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] [int] NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_id] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutussektori_id] [int] NULL,
	[ika_1v] [nvarchar](4) NULL,
	[ika_1v_id] [int] NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto_id] [int] NULL,
	[amm_sopimusjaksot] [nvarchar](2) NULL,
	[amm_sopimusjaksot_id] [int] NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_id] [int] NULL,
	[suoritusika] [decimal](18, 6) NULL,
	[jarjestys_suoritusika] [int] NULL,
	[suoritusaika] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[tutkinnot] [int] NULL,
	[aineisto_id] [int] NULL,
	[aineisto_OTV_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[oppilaitos_kunta_id] [int] NULL,
	[oppilaitos_kunta_historia_id] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_aineisto_OTV] FOREIGN KEY([aineisto_OTV_id])
REFERENCES [dbo].[d_aineisto_OTV] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_ammatillinen_peruskoulutus_lisakoulutus] FOREIGN KEY([ammatillinen_peruskoulutus_lisakoulutus_id])
REFERENCES [dbo].[d_ammatillinen_peruskoulutus_lisakoulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_ammatillinen_peruskoulutus_lisakoulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([ammatillisen_koulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_koulutuksen_jarjestamismuoto] FOREIGN KEY([koulutuksen_jarjestamismuoto_id])
REFERENCES [dbo].[d_koulutuksen_jarjestamismuoto] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_koulutuksen_jarjestamismuoto]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_amm_sopimusjaksot] FOREIGN KEY([amm_sopimusjaksot_id])
REFERENCES [dbo].[d_amm_sopimusjaksot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_amm_sopimusjaksot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_koulutussektori] FOREIGN KEY([koulutussektori_id])
REFERENCES [dbo].[d_koulutussektori] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_koulutussektori]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_lahde]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_nuorten_aikuisten_koulutus] FOREIGN KEY([nuorten_aikuisten_koulutus_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_nuorten_aikuisten_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] FOREIGN KEY([opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__d_tutkinnon_toteuma] FOREIGN KEY([tutkinnon_toteuma_id])
REFERENCES [dbo].[d_tutkinnon_toteuma] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__d_tutkinnon_toteuma]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__ika_1v_d_ika] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__kirjoihintulokausi__d_kausi] FOREIGN KEY([kirjoihintulokausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__kirjoihintulokausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__kirjoihintulovuosi__d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__kirjoihintulovuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutuksen_jarjestaja_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_jarjestaja_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_jarjestaja_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutuslaji_OKM_id] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutusluokitus__d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutusluokitus__d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__oppilaitos__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__oppilaitos_kunta__d_alueluokitus] FOREIGN KEY([oppilaitos_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__oppilaitos_kunta__d_alueluokitus_historia] FOREIGN KEY([oppilaitos_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__oppilaitos_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppisopimuskoulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppisopimuskoulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__syntymakuukausi__d_kausi] FOREIGN KEY([syntymakuukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__syntymakuukausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__syntymavuosi__d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__syntymavuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__tutkinnon_suorituskuukausi__d_kausi] FOREIGN KEY([tutkinnon_suorituskuukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__tutkinnon_suorituskuukausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__tutkinnon_suoritusvuosi__d_kausi] FOREIGN KEY([tutkinnon_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__tutkinnon_suoritusvuosi__d_kausi]
GO


