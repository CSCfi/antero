USE [VipunenTK]
GO

ALTER TABLE [dbo].[d_koulutusohjelma_ammpk] DROP CONSTRAINT IF EXISTS [DF__d_koulutusohjelma_ammpk__tietolahde]
GO

ALTER TABLE [dbo].[d_koulutusohjelma_ammpk] DROP CONSTRAINT IF EXISTS [DF__d_koulutusohjelma_ammpk__paattyy]
GO

ALTER TABLE [dbo].[d_koulutusohjelma_ammpk] DROP CONSTRAINT IF EXISTS [DF__d_koulutusohjelma_ammpk__alkaa]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__d_koulutusohjelma_ammpk]
GO

ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] DROP CONSTRAINT [FK__2_4__d_koulutusohjelma_ammpk]
GO


/****** Object:  Table [dbo].[d_koulutusohjelma_ammpk]    Script Date: 20.8.2021 18:14:47 ******/
DROP TABLE [dbo].[d_koulutusohjelma_ammpk]
GO

/****** Object:  Table [dbo].[d_koulutusohjelma_ammpk]    Script Date: 20.8.2021 18:14:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_koulutusohjelma_ammpk](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusohjelma_ammpk_koodi] [nvarchar](4) NULL,
	[koulutusohjelma_ammpk] [nvarchar](250) NULL,
	[koulutusohjelma_ammpk_SV] [nvarchar](250) NULL,
	[koulutusohjelma_ammpk_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK__d_koulutusohjelma_ammpk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_koulutusohjelma_ammpk] ADD  CONSTRAINT [DF__d_koulutusohjelma_ammpk__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO

ALTER TABLE [dbo].[d_koulutusohjelma_ammpk] ADD  CONSTRAINT [DF__d_koulutusohjelma_ammpk__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO

ALTER TABLE [dbo].[d_koulutusohjelma_ammpk] ADD  CONSTRAINT [DF__d_koulutusohjelma_ammpk__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO


ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutusohjelma_ammpk] FOREIGN KEY([koulutusohjelma_ammpk_id])
REFERENCES [dbo].[d_koulutusohjelma_ammpk] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutusohjelma_ammpk]
GO


ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot]  WITH CHECK ADD  CONSTRAINT [FK__2_4__d_koulutusohjelma_ammpk] FOREIGN KEY([koulutusohjelma_ammpk_id])
REFERENCES [dbo].[d_koulutusohjelma_ammpk] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot] CHECK CONSTRAINT [FK__2_4__d_koulutusohjelma_ammpk]
GO
