USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk] DROP CONSTRAINT IF EXISTS [FK__2_1_R2_22__d_koulutuslaji_okm]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__d_koulutuslaji_OKM]
GO
ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] DROP CONSTRAINT IF EXISTS [FK__2_4__d_koulutuslaji_OKM]
GO
ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] DROP CONSTRAINT IF EXISTS [FK__2_4__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__d_koulutuslaji_OKM]
GO
ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_8__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__d_koulutuslaji_OKM]
GO
ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] DROP CONSTRAINT IF EXISTS [FK__2_9__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_14__d_koulutuslaji_okm]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_15__koulutuslaji_OKM_id]
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] DROP CONSTRAINT IF EXISTS [FK__3_4__koulutuslaji_OKM_id]
GO


/****** Object:  Table [dbo].[d_koulutuslaji_okm]    Script Date: 6.8.2021 11:40:05 ******/
DROP TABLE [dbo].[d_koulutuslaji_okm]
GO

/****** Object:  Table [dbo].[d_koulutuslaji_okm]    Script Date: 6.8.2021 11:40:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_koulutuslaji_okm](
	[id] [int] NOT NULL,
	[koulutuslaji_okm_avain] [nvarchar](10) NULL,
	[koulutuslaji_okm] [nvarchar](250) NULL,
	[koulutuslaji_okm_SV] [nvarchar](250) NULL,
	[koulutuslaji_okm_EN] [nvarchar](250) NULL,
	[koulutuslaji_okm2] [nvarchar](250) NULL,
	[koulutuslaji_okm2_SV] [nvarchar](250) NULL,
	[koulutuslaji_okm2_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[jarjestys2] [nvarchar](50) NULL,
 CONSTRAINT [PK_d_koulutuslaji_okm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk]  WITH CHECK ADD  CONSTRAINT [FK__2_1_R2_22__d_koulutuslaji_okm] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk] CHECK CONSTRAINT [FK__2_1_R2_22__d_koulutuslaji_okm]
GO


ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutuslaji_OKM]
GO


ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_4__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] CHECK CONSTRAINT [FK__2_4__d_koulutuslaji_OKM]
GO


ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_8__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_8_Korkeakouluopiskelijat] CHECK CONSTRAINT [FK__2_8__d_koulutuslaji_OKM]
GO


ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_9__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_9_Korkeakoulututkinnot] CHECK CONSTRAINT [FK__2_9__d_koulutuslaji_OKM]
GO


ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_14__d_koulutuslaji_okm] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat] CHECK CONSTRAINT [FK__3_14__d_koulutuslaji_okm]
GO


ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__koulutuslaji_OKM_id] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__koulutuslaji_OKM_id]
GO


ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]  WITH CHECK ADD  CONSTRAINT [FK__3_4__koulutuslaji_OKM_id] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat] CHECK CONSTRAINT [FK__3_4__koulutuslaji_OKM_id]
GO

