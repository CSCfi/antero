USE [VipunenTK]
GO

ALTER TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] DROP CONSTRAINT IF EXISTS [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__paattyy]
GO

ALTER TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] DROP CONSTRAINT IF EXISTS [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__alkaa]
GO


truncate table [dbo].[f_keskeyttaneet]
go

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016]
GO

ALTER TABLE [dbo].[f_keskeyttaneet] DROP CONSTRAINT IF EXISTS [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO


/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 24.11.2021 22:03:25 ******/
DROP TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO

/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 24.11.2021 22:03:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV] [nvarchar](100) NULL,
	[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN] [nvarchar](100) NULL,
	[jarjestys_4bb] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO

ALTER TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO


ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] FOREIGN KEY([4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO

ALTER TABLE [dbo].[f_keskeyttaneet]  WITH CHECK ADD  CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016] FOREIGN KEY([4bb_opiskelijoiden_opintojen_kulku_jarj_ja_kaste_t2_mukaan_id])
REFERENCES [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id])
GO

ALTER TABLE [dbo].[f_keskeyttaneet] CHECK CONSTRAINT [FK_f_keskeyttaneet_4bb_d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016]
GO


