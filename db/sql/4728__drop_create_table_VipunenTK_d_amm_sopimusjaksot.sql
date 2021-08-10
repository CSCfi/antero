USE [VipunenTK]
GO


ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__d_amm_sopimusjaksot]
GO
ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__amm_sopimusjaksot_id]
GO

ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] DROP CONSTRAINT IF EXISTS [FK__2_4__d_amm_sopimusjaksot]
GO
ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] DROP CONSTRAINT IF EXISTS [FK__2_4__amm_sopimusjaksot_id]
GO

ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_14__d_amm_sopimusjaksot]
GO
ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_14__amm_sopimusjaksot_id]
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_15__d_amm_sopimusjaksot]
GO
ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] DROP CONSTRAINT IF EXISTS [FK__3_15__amm_sopimusjaksot_id]
GO

/****** Object:  Table [dbo].[d_amm_sopimusjaksot]    Script Date: 5.8.2021 14:21:29 ******/
DROP TABLE IF EXISTS [dbo].[d_amm_sopimusjaksot]
GO

/****** Object:  Table [dbo].[d_amm_sopimusjaksot]    Script Date: 5.8.2021 14:21:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_amm_sopimusjaksot](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koodi] [int] NULL,
	[selite_fi] [nvarchar](250) NULL,
	[selite_sv] [nvarchar](250) NULL,
	[selite_en] [nvarchar](250) NULL,
	[jarjestys_koodi] [int] NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_amm_sopimusjaksot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_amm_sopimusjaksot] FOREIGN KEY([amm_sopimusjaksot_id])
REFERENCES [dbo].[d_amm_sopimusjaksot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_amm_sopimusjaksot]
GO


ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_4__d_amm_sopimusjaksot] FOREIGN KEY([amm_sopimusjaksot_id])
REFERENCES [dbo].[d_amm_sopimusjaksot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] CHECK CONSTRAINT [FK__2_4__d_amm_sopimusjaksot]
GO



ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_14__d_amm_sopimusjaksot] FOREIGN KEY([amm_sopimusjaksot_id])
REFERENCES [dbo].[d_amm_sopimusjaksot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat] CHECK CONSTRAINT [FK__3_14__d_amm_sopimusjaksot]
GO


ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]  WITH CHECK ADD  CONSTRAINT [FK__3_15__amm_sopimusjaksot_id] FOREIGN KEY([amm_sopimusjaksot_id])
REFERENCES [dbo].[d_amm_sopimusjaksot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat] CHECK CONSTRAINT [FK__3_15__amm_sopimusjaksot_id]
GO

