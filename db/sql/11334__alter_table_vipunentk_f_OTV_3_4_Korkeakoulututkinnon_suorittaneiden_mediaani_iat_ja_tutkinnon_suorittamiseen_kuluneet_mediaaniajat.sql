USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]    Script Date: 30.10.2025 9.58.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]') AND type in (N'U'))
  DROP TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]
GO

CREATE TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[koulutustyyppi_id] [int] NULL,
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
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulovuosi_korkeakoulu_id] [nvarchar](10) NULL,
	[kirjoihintulokausi_korkeakoulu] [nvarchar](2) NULL,
	[kirjoihintulokausi_korkeakoulu_id] [nvarchar](10) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusvuosi_id] [nvarchar](10) NULL,
	[tutkinnon_suorituskuukausi] [nvarchar](2) NULL,
	[tutkinnon_suorituskuukausi_id] [nvarchar](10) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutussektori_id] [int] NULL,
	[ika_1v] [nvarchar](4) NULL,
	[ika_1v_id] [int] NULL,
	[suoritusika] [decimal](18, 6) NULL,
	[jarjestys_suoritusika] [int] NULL,
	[suoritusaika] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[suoritusaika_kk] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika_kk] [int] NULL,
	[tutkinnot] [int] NULL,
	[aineisto_id] [int] NULL,
	[aineisto_OTV_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[oppilaitos_kunta_id] [int] NULL,
	[oppilaitos_kunta_historia_id] [int] NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[rahoituslahde_id] [int] NULL,
	[kv_opiskelija] [nvarchar](2) NULL,
	[kv_opiskelija_id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_aineisto_OTV] FOREIGN KEY([aineisto_OTV_id])
REFERENCES [dbo].[d_aineisto_OTV] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_koulutussektori] FOREIGN KEY([koulutussektori_id])
REFERENCES [dbo].[d_koulutussektori] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_koulutussektori]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_koulutustyyppi] FOREIGN KEY([koulutustyyppi_id])
REFERENCES [dbo].[d_koulutustyyppi] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_koulutustyyppi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_lahde]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__ika_1v_d_ika] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__kirjoihintulokausi__d_kausi] FOREIGN KEY([kirjoihintulokausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__kirjoihintulokausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__kirjoihintulokausi_korkeakoulu__d_kausi] FOREIGN KEY([kirjoihintulokausi_korkeakoulu_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__kirjoihintulokausi_korkeakoulu__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__kirjoihintulovuosi__d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__kirjoihintulovuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__kirjoihintulovuosi_korkeakoulu__d_kausi] FOREIGN KEY([kirjoihintulovuosi_korkeakoulu_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__kirjoihintulovuosi_korkeakoulu__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutuksen_jarjestaja_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_jarjestaja_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_jarjestaja_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutuslaji_OKM_id] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutusluokitus__d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutusluokitus__d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__kv_opiskelija__d_kvopiskelija] FOREIGN KEY([kv_opiskelija_id])
REFERENCES [dbo].[d_kvopiskelija] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__kv_opiskelija__d_kvopiskelija]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__oppilaitos__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__oppilaitos_kunta__d_alueluokitus] FOREIGN KEY([oppilaitos_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__oppilaitos_kunta__d_alueluokitus_historia] FOREIGN KEY([oppilaitos_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__oppilaitos_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__rahoituslahde__d_rahoituslahde] FOREIGN KEY([rahoituslahde_id])
REFERENCES [dbo].[d_rahoituslahde] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__rahoituslahde__d_rahoituslahde]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__syntymakuukausi__d_kausi] FOREIGN KEY([syntymakuukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__syntymakuukausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__syntymavuosi__d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__syntymavuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__tutkinnon_suorituskuukausi__d_kausi] FOREIGN KEY([tutkinnon_suorituskuukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__tutkinnon_suorituskuukausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__tutkinnon_suoritusvuosi__d_kausi] FOREIGN KEY([tutkinnon_suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__tutkinnon_suoritusvuosi__d_kausi]
GO


