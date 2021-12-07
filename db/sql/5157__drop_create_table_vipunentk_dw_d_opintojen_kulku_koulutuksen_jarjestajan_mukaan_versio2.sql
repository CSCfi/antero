USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 24.11.2021 22:00:27 ******/
DROP TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO

/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 24.11.2021 22:00:27 ******/
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
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
