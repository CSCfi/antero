USE [VipunenTK_lisatiedot]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_muulla_kaste_t2ella]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_muulla_kala_t3lla]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_muulla_kala_t2lla]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_muulla_kala_t1lla]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_alkuperaisella_kaste_t2ella]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_alkuperaisella_kala_t3lla]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_alkuperaisella_kala_t2lla]
GO

DROP TABLE IF EXISTS [dbo].[tutkinto_alkuperaisella_kala_t1lla]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kaste_t2en_mukaan]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kala_t3n_mukaan]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kala_t2n_mukaan]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2]
GO

DROP TABLE IF EXISTS [dbo].[opintojen_kulku_kala_t1n_mukaan]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_muulla_kala_t3lla]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_muulla_kala_t2lla]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_muulla_kala_t1lla]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla]
GO

DROP TABLE IF EXISTS [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t1lla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t1lla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t1lla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t1lla_EN] [nvarchar](100) NULL,
	[jarjestys_2e_t1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t2lla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t2lla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t2lla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t2lla_EN] [nvarchar](100) NULL,
	[jarjestys_2e_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t3lla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t3lla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t3lla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kala_t3lla_EN] [nvarchar](100) NULL,
	[jarjestys_2e_t3] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_alkuperaisella_kaste_t2ella_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kaste_t2ella_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_alkuperaisella_kaste_t2ella_EN] [nvarchar](100) NULL,
	[jarjestys_1e_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t1lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_kala_t1lla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_kala_t1lla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kala_t1lla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kala_t1lla_EN] [nvarchar](100) NULL,
	[jarjestys_2f_t1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t2lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_kala_t2lla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_kala_t2lla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kala_t2lla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kala_t2lla_EN] [nvarchar](100) NULL,
	[jarjestys_2f_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t3lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_kala_t3lla_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_kala_t3lla] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kala_t3lla_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kala_t3lla_EN] [nvarchar](100) NULL,
	[jarjestys_2f_t3] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[jatkaa_opiskelua_muulla_kaste_t2ella_koodi] [nchar](2) NULL,
	[jatkaa_opiskelua_muulla_kaste_t2ella] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kaste_t2ella_SV] [nvarchar](100) NULL,
	[jatkaa_opiskelua_muulla_kaste_t2ella_EN] [nvarchar](100) NULL,
	[jarjestys_1f_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kala_t1n_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kala_t1n_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_kala_t1n_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t1n_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t1n_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_2a_t1] [nvarchar](10) NULL,
	[jarjestys_2b_t1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kala_t1n_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_kala_t1n_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t1n_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t1n_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_2bb_t1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kala_t2n_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kala_t2n_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_kala_t2n_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t2n_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t2n_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_2a_t2] [nvarchar](10) NULL,
	[jarjestys_2b_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kala_t2n_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_kala_t2n_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t2n_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t2n_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_2bb_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kala_t3n_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kala_t3n_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_kala_t3n_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t3n_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t3n_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_2a_t3] [nvarchar](10) NULL,
	[jarjestys_2b_t3] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kala_t3n_mukaan_versio2_koodi] [nchar](2) NULL,
	[opintojen_kulku_kala_t3n_mukaan_versio2] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t3n_mukaan_versio2_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kala_t3n_mukaan_versio2_EN] [nvarchar](100) NULL,
	[jarjestys_2bb_t3] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_kaste_t2en_mukaan](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintojen_kulku_kaste_t2en_mukaan_koodi] [nchar](2) NULL,
	[opintojen_kulku_kaste_t2en_mukaan] [nvarchar](100) NULL,
	[opintojen_kulku_kaste_t2en_mukaan_SV] [nvarchar](100) NULL,
	[opintojen_kulku_kaste_t2en_mukaan_EN] [nvarchar](100) NULL,
	[jarjestys_1a_t2] [nvarchar](10) NULL,
	[jarjestys_1b_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2](
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_alkuperaisella_kala_t1lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_kala_t1lla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_kala_t1lla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kala_t1lla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kala_t1lla_EN] [nvarchar](100) NULL,
	[jarjestys_2c_t1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_alkuperaisella_kala_t2lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_kala_t2lla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_kala_t2lla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kala_t2lla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kala_t2lla_EN] [nvarchar](100) NULL,
	[jarjestys_2c_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_alkuperaisella_kala_t3lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_kala_t3lla_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_kala_t3lla] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kala_t3lla_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kala_t3lla_EN] [nvarchar](100) NULL,
	[jarjestys_2c_t3] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_alkuperaisella_kaste_t2ella](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_alkuperaisella_kaste_t2ella_koodi] [nchar](2) NULL,
	[tutkinto_alkuperaisella_kaste_t2ella] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kaste_t2ella_SV] [nvarchar](100) NULL,
	[tutkinto_alkuperaisella_kaste_t2ella_EN] [nvarchar](100) NULL,
	[jarjestys_1c_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_muulla_kala_t1lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_kala_t1lla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_kala_t1lla] [nvarchar](100) NULL,
	[tutkinto_muulla_kala_t1lla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_kala_t1lla_EN] [nvarchar](100) NULL,
	[jarjestys_2d_t1] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_muulla_kala_t2lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_kala_t2lla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_kala_t2lla] [nvarchar](100) NULL,
	[tutkinto_muulla_kala_t2lla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_kala_t2lla_EN] [nvarchar](100) NULL,
	[jarjestys_2d_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_muulla_kala_t3lla](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_kala_t3lla_koodi] [nchar](2) NULL,
	[tutkinto_muulla_kala_t3lla] [nvarchar](100) NULL,
	[tutkinto_muulla_kala_t3lla_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_kala_t3lla_EN] [nvarchar](100) NULL,
	[jarjestys_2d_t3] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tutkinto_muulla_kaste_t2ella](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[tutkinto_muulla_kaste_t2ella_koodi] [nchar](2) NULL,
	[tutkinto_muulla_kaste_t2ella] [nvarchar](100) NULL,
	[tutkinto_muulla_kaste_t2ella_SV] [nvarchar](100) NULL,
	[tutkinto_muulla_kaste_t2ella_EN] [nvarchar](100) NULL,
	[jarjestys_1d_t2] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t1lla], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_EN], [jarjestys_2e_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t1lla], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_EN], [jarjestys_2e_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t1lla], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_EN], [jarjestys_2e_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua alkuperaisella koulutusalalla, taso 1', N'Fortsätter studierna inom det ursprungliga utbildningsområdet, nivå 1', N'Continues studies in the original field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t1lla], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t1lla_EN], [jarjestys_2e_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua alkuperaisella koulutusalalla, taso 1', N'Fortsätter inte studierna inom det ursprungliga utbildningsområdet, nivå 1', N'Does not continue studies in the original field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t2lla], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_EN], [jarjestys_2e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t2lla], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_EN], [jarjestys_2e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t2lla], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_EN], [jarjestys_2e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua alkuperaisella koulutusalalla, taso 2', N'Fortsätter studierna inom det ursprungliga utbildningsområdet, nivå 1', N'Continues studies in the original field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t2lla], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t2lla_EN], [jarjestys_2e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua alkuperaisella koulutusalalla, taso 2', N'Fortsätter inte studierna inom det ursprungliga utbildningsområdet, nivå 1', N'Does not continue studies in the original field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t3lla], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_EN], [jarjestys_2e_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t3lla], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_EN], [jarjestys_2e_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t3lla], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_EN], [jarjestys_2e_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua alkuperaisella koulutusalalla, taso 3', N'Fortsätter studierna inom det ursprungliga utbildningsområdet, nivå 1', N'Continues studies in the original field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_koodi], [jatkaa_opiskelua_alkuperaisella_kala_t3lla], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_SV], [jatkaa_opiskelua_alkuperaisella_kala_t3lla_EN], [jarjestys_2e_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua alkuperaisella koulutusalalla, taso 3', N'Fortsätter inte studierna inom det ursprungliga utbildningsområdet, nivå 1', N'Does not continue studies in the original field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_koodi], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_SV], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_EN], [jarjestys_1e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_koodi], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_SV], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_EN], [jarjestys_1e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_koodi], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_SV], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_EN], [jarjestys_1e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua alkuperaisellä koulutusasteella, taso 2', N'Fortsätter studierna på den ursprungliga utbildningsnivån, nivå 2', N'Continues studies in the original level of education, tier 2', N'01', N'E', N' ', N'OKM', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_koodi], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_SV], [jatkaa_opiskelua_alkuperaisella_kaste_t2ella_EN], [jarjestys_1e_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua alkuperaisella koulutusasteella, taso 2', N'Fortsätter inte studierna på den ursprungliga utbildningsnivån, nivå 2', N'Does not continue studies at the original level of education, tier 2', N'02', N'E', N' ', N'OKM', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t1lla_koodi], [jatkaa_opiskelua_muulla_kala_t1lla], [jatkaa_opiskelua_muulla_kala_t1lla_SV], [jatkaa_opiskelua_muulla_kala_t1lla_EN], [jarjestys_2f_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t1lla_koodi], [jatkaa_opiskelua_muulla_kala_t1lla], [jatkaa_opiskelua_muulla_kala_t1lla_SV], [jatkaa_opiskelua_muulla_kala_t1lla_EN], [jarjestys_2f_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t1lla_koodi], [jatkaa_opiskelua_muulla_kala_t1lla], [jatkaa_opiskelua_muulla_kala_t1lla_SV], [jatkaa_opiskelua_muulla_kala_t1lla_EN], [jarjestys_2f_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua muulla koulutusalalla, taso 1', N'Fortsätter studierna inom något annat utbildningsområde, nivå 1', N'Continues studies in another field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t1lla_koodi], [jatkaa_opiskelua_muulla_kala_t1lla], [jatkaa_opiskelua_muulla_kala_t1lla_SV], [jatkaa_opiskelua_muulla_kala_t1lla_EN], [jarjestys_2f_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua muulla koulutusalalla, taso 1', N'Fortsätter inte studierna inom något annat utbildningsområde, nivå 1', N'Does not continue studies in another field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t2lla_koodi], [jatkaa_opiskelua_muulla_kala_t2lla], [jatkaa_opiskelua_muulla_kala_t2lla_SV], [jatkaa_opiskelua_muulla_kala_t2lla_EN], [jarjestys_2f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t2lla_koodi], [jatkaa_opiskelua_muulla_kala_t2lla], [jatkaa_opiskelua_muulla_kala_t2lla_SV], [jatkaa_opiskelua_muulla_kala_t2lla_EN], [jarjestys_2f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t2lla_koodi], [jatkaa_opiskelua_muulla_kala_t2lla], [jatkaa_opiskelua_muulla_kala_t2lla_SV], [jatkaa_opiskelua_muulla_kala_t2lla_EN], [jarjestys_2f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua muulla koulutusalalla, taso 2', N'Fortsätter studierna inom något annat utbildningsområde, nivå 1', N'Continues studies in another field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t2lla_koodi], [jatkaa_opiskelua_muulla_kala_t2lla], [jatkaa_opiskelua_muulla_kala_t2lla_SV], [jatkaa_opiskelua_muulla_kala_t2lla_EN], [jarjestys_2f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua muulla koulutusalalla, taso 2', N'Fortsätter inte studierna inom något annat utbildningsområde, nivå 1', N'Does not continue studies in another field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t3lla_koodi], [jatkaa_opiskelua_muulla_kala_t3lla], [jatkaa_opiskelua_muulla_kala_t3lla_SV], [jatkaa_opiskelua_muulla_kala_t3lla_EN], [jarjestys_2f_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t3lla_koodi], [jatkaa_opiskelua_muulla_kala_t3lla], [jatkaa_opiskelua_muulla_kala_t3lla_SV], [jatkaa_opiskelua_muulla_kala_t3lla_EN], [jarjestys_2f_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t3lla_koodi], [jatkaa_opiskelua_muulla_kala_t3lla], [jatkaa_opiskelua_muulla_kala_t3lla_SV], [jatkaa_opiskelua_muulla_kala_t3lla_EN], [jarjestys_2f_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua muulla koulutusalalla, taso 3', N'Fortsätter studierna inom något annat utbildningsområde, nivå 1', N'Continues studies in another field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kala_t3lla_koodi], [jatkaa_opiskelua_muulla_kala_t3lla], [jatkaa_opiskelua_muulla_kala_t3lla_SV], [jatkaa_opiskelua_muulla_kala_t3lla_EN], [jarjestys_2f_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua muulla koulutusalalla, taso 3', N'Fortsätter inte studierna inom något annat utbildningsområde, nivå 1', N'Does not continue studies in another field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kaste_t2ella_koodi], [jatkaa_opiskelua_muulla_kaste_t2ella], [jatkaa_opiskelua_muulla_kaste_t2ella_SV], [jatkaa_opiskelua_muulla_kaste_t2ella_EN], [jarjestys_1f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kaste_t2ella_koodi], [jatkaa_opiskelua_muulla_kaste_t2ella], [jatkaa_opiskelua_muulla_kaste_t2ella_SV], [jatkaa_opiskelua_muulla_kaste_t2ella_EN], [jarjestys_1f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kaste_t2ella_koodi], [jatkaa_opiskelua_muulla_kaste_t2ella], [jatkaa_opiskelua_muulla_kaste_t2ella_SV], [jatkaa_opiskelua_muulla_kaste_t2ella_EN], [jarjestys_1f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Jatkaa opiskelua muulla koulutusasteella, taso 2', N'Fortsätter studierna inom på någon annan utbildningsnivå, nivå 2', N'Continues studies at another level of education, tier 2', N'01', N'E', N' ', N'OKM', N'CSC Juha')
GO
INSERT [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [jatkaa_opiskelua_muulla_kaste_t2ella_koodi], [jatkaa_opiskelua_muulla_kaste_t2ella], [jatkaa_opiskelua_muulla_kaste_t2ella_SV], [jatkaa_opiskelua_muulla_kaste_t2ella_EN], [jarjestys_1f_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei jatka opiskelua muulla koulutusasteella, taso 2', N'Fortsätter inte studierna på någon annan utbildningsnivå, nivå 2', N'Does not continue studies at another level of education, tier 2', N'02', N'E', N' ', N'OKM', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusalalla, taso 1', N'Examen inom det ursprungliga utbildningsområdet, nivå 1', N'Qualification in the original field of education, tier 1', N'01', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Tutkinto muulla koulutusalalla, taso 1', N'Examen inom annat utbildningsområde, nivå 1', N'Qualification in another field of education, tier 1', N'02', N'03', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Opiskelee alkuperäisellä koulutusalalla, taso 1', N'Studerar inom det ursprungliga utbildningsområdet, nivå 1', N'Studying in the original field of education, tier 1', N'03', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Opiskelee muulla koulutusalalla, taso 1', N'Studerar inom annat utbildningsområde, nivå 1', N'Studying in another field of education, tier 1', N'04', N'04', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'05', N'05', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'06', N'06', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_koodi], [opintojen_kulku_kala_t1n_mukaan], [opintojen_kulku_kala_t1n_mukaan_SV], [opintojen_kulku_kala_t1n_mukaan_EN], [jarjestys_2a_t1], [jarjestys_2b_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'07', N'07', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Suorittanut tavoitetutkinnon', N'Avlagt målexamen', N'Completed target degree', N'1', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Jatkaa opiskelua samalla koulutusalalla, taso 1', N'Studierna fortsätter  inom samma utbildningsområde, nivå 1', N'Studying in the same field of education, tier 1', N'2', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Jatkaa opiskelua muulla koulutusalalla, taso 1', N'Studierna fortsätter  inom annat utbildningsområde, nivå 1', N'Studying in another field of education, tier 1', N'3', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Suorittanut kandidaatin tutkinnon ja keskeyttänyt', N'Avlagt kandidatexamen och avbrutit', N'Completed Bachelor''s degree and discontinued', N'4', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla', N'Studerar eller avlagt examen inom annan utbildningssektor', N'Studying or completed degree in another sector of education', N'5', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'6', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'7', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t1n_mukaan_versio2_koodi], [opintojen_kulku_kala_t1n_mukaan_versio2], [opintojen_kulku_kala_t1n_mukaan_versio2_SV], [opintojen_kulku_kala_t1n_mukaan_versio2_EN], [jarjestys_2bb_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'8', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusalalla, taso 2', N'Examen inom det ursprungliga utbildningsområdet, nivå 1', N'Qualification in the original field of education, tier 1', N'01', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Tutkinto muulla koulutusalalla, taso 2', N'Examen inom annat utbildningsområde, nivå 1', N'Qualification in another field of education, tier 1', N'02', N'03', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Opiskelee alkuperäisellä koulutusalalla, taso 2', N'Studerar inom det ursprungliga utbildningsområdet, nivå 1', N'Studying in the original field of education, tier 1', N'03', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Opiskelee muulla koulutusalalla, taso 2', N'Studerar inom annat utbildningsområde, nivå 1', N'Studying in another field of education, tier 1', N'04', N'04', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'05', N'05', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'06', N'06', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_koodi], [opintojen_kulku_kala_t2n_mukaan], [opintojen_kulku_kala_t2n_mukaan_SV], [opintojen_kulku_kala_t2n_mukaan_EN], [jarjestys_2a_t2], [jarjestys_2b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'07', N'07', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Suorittanut tavoitetutkinnon', N'Avlagt målexamen', N'Completed target degree', N'1', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Jatkaa opiskelua samalla koulutusalalla, taso 2', N'Studierna fortsätter  inom samma utbildningsområde, nivå 1', N'Studying in the same field of education, tier 1', N'2', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Jatkaa opiskelua muulla koulutusalalla, taso 2', N'Studierna fortsätter  inom annat utbildningsområde, nivå 1', N'Studying in another field of education, tier 1', N'3', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Suorittanut kandidaatin tutkinnon ja keskeyttänyt', N'Avlagt kandidatexamen och avbrutit', N'Completed Bachelor''s degree and discontinued', N'4', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla', N'Studerar eller avlagt examen inom annan utbildningssektor', N'Studying or completed degree in another sector of education', N'5', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'6', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'7', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t2n_mukaan_versio2_koodi], [opintojen_kulku_kala_t2n_mukaan_versio2], [opintojen_kulku_kala_t2n_mukaan_versio2_SV], [opintojen_kulku_kala_t2n_mukaan_versio2_EN], [jarjestys_2bb_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'8', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusalalla, taso 3', N'Examen inom det ursprungliga utbildningsområdet, nivå 1', N'Qualification in the original field of education, tier 1', N'01', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Tutkinto muulla koulutusalalla, taso 3', N'Examen inom annat utbildningsområde, nivå 1', N'Qualification in another field of education, tier 1', N'02', N'03', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Opiskelee alkuperäisellä koulutusalalla, taso 3', N'Studerar inom det ursprungliga utbildningsområdet, nivå 1', N'Studying in the original field of education, tier 1', N'03', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Opiskelee muulla koulutusalalla, taso 3', N'Studerar inom annat utbildningsområde, nivå 1', N'Studying in another field of education, tier 1', N'04', N'04', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'05', N'05', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'06', N'06', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_koodi], [opintojen_kulku_kala_t3n_mukaan], [opintojen_kulku_kala_t3n_mukaan_SV], [opintojen_kulku_kala_t3n_mukaan_EN], [jarjestys_2a_t3], [jarjestys_2b_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'07', N'07', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Suorittanut tavoitetutkinnon', N'Avlagt målexamen', N'Completed target degree', N'1', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Jatkaa opiskelua samalla koulutusalalla, taso 3', N'Studierna fortsätter  inom samma utbildningsområde, nivå 1', N'Studying in the same field of education, tier 1', N'2', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Jatkaa opiskelua muulla koulutusalalla, taso 3', N'Studierna fortsätter  inom annat utbildningsområde, nivå 1', N'Studying in another field of education, tier 1', N'3', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Suorittanut kandidaatin tutkinnon ja keskeyttänyt', N'Avlagt kandidatexamen och avbrutit', N'Completed Bachelor''s degree and discontinued', N'4', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Opiskelee tai tehnyt tutkinnon muulla koulutussektorilla', N'Studerar eller avlagt examen inom annan utbildningssektor', N'Studying or completed degree in another sector of education', N'5', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'6', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'7', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kala_t3n_mukaan_versio2_koodi], [opintojen_kulku_kala_t3n_mukaan_versio2], [opintojen_kulku_kala_t3n_mukaan_versio2_SV], [opintojen_kulku_kala_t3n_mukaan_versio2_EN], [jarjestys_2bb_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'8', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusasteella (taso 2), tavoitetutkinto', N'Examen på den ursprungliga utbildningsnivån (nivå 2), målexamen', N'Qualification at the original level of education (tier 2), target qualification', N'01', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Tutkinto alkuperäisellä koulutusasteella (taso 2), välitutkinto', N'Examen på den ursprungliga utbildningsnivån (nivå 2), mellanexamen', N'Qualification at the original level of education (tier 2), intermediate qualification', N'02', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Tutkinto muulla koulutusasteella (taso 2)', N'Examen på annan utbildningsnivå (nivå 2)', N'Qualification at another level of education (tier 2)', N'03', N'04', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Opiskelee alkuperäisellä koulutusasteella (taso 2)', N'Studerar på den ursprungliga utbildningsnivån (nivå 2)', N'Studying at the original level of education (tier 2)', N'04', N'03', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Opiskelee muulla koulutusasteella (taso 2)', N'Studerar på annan utbildningsnivå (nivå 2)', N'Studying at another level of education (tier 2)', N'05', N'05', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'06', N'06', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'07', N'07', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_kaste_t2en_mukaan] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_kaste_t2en_mukaan_koodi], [opintojen_kulku_kaste_t2en_mukaan], [opintojen_kulku_kaste_t2en_mukaan_SV], [opintojen_kulku_kaste_t2en_mukaan_EN], [jarjestys_1a_t2], [jarjestys_1b_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'08', N'08', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusasteella, tavotetutkinto', N'Examen på den ursprungliga utbildningsnivån, målexamen', N'Qualification at the original level of education, target qualification', N'Tutkinto alkuperäisellä koulutusasteella (taso 2), tavotetutkinto', N'Examen på den ursprungliga utbildningsnivån (nivå 2), målexamen', N'Qualification at the original level of education (tier 2), target qualification', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Opiskelee alkuperäisellä koulutuksen järjestäjällä', N'Studier hos den ursprungliga utbildningsarrangören', N'Studying with the original education provider', N'Opiskelee alkuperäisellä koulutuksen järjestäjällä', N'Studier hos den ursprungliga utbildningsarrangören', N'Studying with the original education provider', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (3, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'3 ', N'Opiskelee muulla koulutuksen järjestäjällä', N'Studier hos annan utbildningsarrangör', N'Studying with another education provider', N'Opiskelee muulla koulutuksen järjestäjällä', N'Studier hos annan utbildningsarrangör', N'Studying with another education provider', N'03', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (4, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'4 ', N'Tutkinto alkuperäisellä koulutusasteella, välitutkinto', N'Examen på den ursprungliga utbildningsnivån, mellanexamen', N'Qualification at the original level of education, intermediate qualification', N'Tutkinto alkuperäisellä koulutusasteella (taso 2), välitutkinto', N'Examen på den ursprungliga utbildningsnivån (nivå 2), mellanexamen', N'Qualification at the original level of education (tier 2), intermediate qualification', N'04', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (5, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'5 ', N'Opiskelee muulla koulutusasteella tai tutkinto muulla koulutusasteella', N'Studier på annan utbildningsnivå eller examen på annan utbildningsnivå', N'Studying at another level of education or qualification at another level of education', N'Opiskelee tai tutkinto muulla koulutusasteella (taso 2)', N'Studier eller examen på annan utbildningsnivå (nivå 2)', N'Studying or qualification at another level of education (tier 2)', N'05', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (6, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'6 ', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'Keskeyttänyt työllinen', N'Sysselsatt som avbrutit', N'Non-completion employed', N'06', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (7, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'7 ', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'Keskeyttänyt työtön', N'Arbetslös som avbrutit', N'Non-completion unemployed', N'07', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ([id], [luotu], [alkaa], [paattyy], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_EN], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_SV], [opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_2016_EN], [jarjestys_4bb], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (8, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'8 ', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'Keskeyttänyt muu', N'Avbrutit annan', N'Non-completion other', N'08', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t1lla_koodi], [tutkinto_alkuperaisella_kala_t1lla], [tutkinto_alkuperaisella_kala_t1lla_SV], [tutkinto_alkuperaisella_kala_t1lla_EN], [jarjestys_2c_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t1lla_koodi], [tutkinto_alkuperaisella_kala_t1lla], [tutkinto_alkuperaisella_kala_t1lla_SV], [tutkinto_alkuperaisella_kala_t1lla_EN], [jarjestys_2c_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t1lla_koodi], [tutkinto_alkuperaisella_kala_t1lla], [tutkinto_alkuperaisella_kala_t1lla_SV], [tutkinto_alkuperaisella_kala_t1lla_EN], [jarjestys_2c_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusalalla, taso 1', N'Examen inom det ursprungliga utbildningsområdet, nivå 1', N'Qualification in the original field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t1lla_koodi], [tutkinto_alkuperaisella_kala_t1lla], [tutkinto_alkuperaisella_kala_t1lla_SV], [tutkinto_alkuperaisella_kala_t1lla_EN], [jarjestys_2c_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa alkuperäisellä koulutusalalla, taso 1', N'Ingen examen inom det ursprungliga utbildningsområdet, nivå 1', N'No qualification in the original field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t2lla_koodi], [tutkinto_alkuperaisella_kala_t2lla], [tutkinto_alkuperaisella_kala_t2lla_SV], [tutkinto_alkuperaisella_kala_t2lla_EN], [jarjestys_2c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t2lla_koodi], [tutkinto_alkuperaisella_kala_t2lla], [tutkinto_alkuperaisella_kala_t2lla_SV], [tutkinto_alkuperaisella_kala_t2lla_EN], [jarjestys_2c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t2lla_koodi], [tutkinto_alkuperaisella_kala_t2lla], [tutkinto_alkuperaisella_kala_t2lla_SV], [tutkinto_alkuperaisella_kala_t2lla_EN], [jarjestys_2c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusalalla, taso 2', N'Examen inom det ursprungliga utbildningsområdet, nivå 1', N'Qualification in the original field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t2lla_koodi], [tutkinto_alkuperaisella_kala_t2lla], [tutkinto_alkuperaisella_kala_t2lla_SV], [tutkinto_alkuperaisella_kala_t2lla_EN], [jarjestys_2c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa alkuperäisellä koulutusalalla, taso 2', N'Ingen examen inom det ursprungliga utbildningsområdet, nivå 1', N'No qualification in the original field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t3lla_koodi], [tutkinto_alkuperaisella_kala_t3lla], [tutkinto_alkuperaisella_kala_t3lla_SV], [tutkinto_alkuperaisella_kala_t3lla_EN], [jarjestys_2c_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t3lla_koodi], [tutkinto_alkuperaisella_kala_t3lla], [tutkinto_alkuperaisella_kala_t3lla_SV], [tutkinto_alkuperaisella_kala_t3lla_EN], [jarjestys_2c_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t3lla_koodi], [tutkinto_alkuperaisella_kala_t3lla], [tutkinto_alkuperaisella_kala_t3lla_SV], [tutkinto_alkuperaisella_kala_t3lla_EN], [jarjestys_2c_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusalalla, taso 3', N'Examen inom det ursprungliga utbildningsområdet, nivå 1', N'Qualification in the original field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kala_t3lla_koodi], [tutkinto_alkuperaisella_kala_t3lla], [tutkinto_alkuperaisella_kala_t3lla_SV], [tutkinto_alkuperaisella_kala_t3lla_EN], [jarjestys_2c_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa alkuperäisellä koulutusalalla, taso 3', N'Ingen examen inom det ursprungliga utbildningsområdet, nivå 1', N'No qualification in the original field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kaste_t2ella_koodi], [tutkinto_alkuperaisella_kaste_t2ella], [tutkinto_alkuperaisella_kaste_t2ella_SV], [tutkinto_alkuperaisella_kaste_t2ella_EN], [jarjestys_1c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kaste_t2ella_koodi], [tutkinto_alkuperaisella_kaste_t2ella], [tutkinto_alkuperaisella_kaste_t2ella_SV], [tutkinto_alkuperaisella_kaste_t2ella_EN], [jarjestys_1c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kaste_t2ella_koodi], [tutkinto_alkuperaisella_kaste_t2ella], [tutkinto_alkuperaisella_kaste_t2ella_SV], [tutkinto_alkuperaisella_kaste_t2ella_EN], [jarjestys_1c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto alkuperäisellä koulutusasteella, taso 2', N'Examen på den ursprungliga utbildningsnivån, nivå 2', N'Qualification at the original level of education, tier 2', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_alkuperaisella_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_alkuperaisella_kaste_t2ella_koodi], [tutkinto_alkuperaisella_kaste_t2ella], [tutkinto_alkuperaisella_kaste_t2ella_SV], [tutkinto_alkuperaisella_kaste_t2ella_EN], [jarjestys_1c_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa alkuperäisellä koulutusasteella, taso 2', N'Ingen examen på den ursprungliga utbildningsnivån, nivå 2', N'No qualification at the original level of education, tier 2', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t1lla_koodi], [tutkinto_muulla_kala_t1lla], [tutkinto_muulla_kala_t1lla_SV], [tutkinto_muulla_kala_t1lla_EN], [jarjestys_2d_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t1lla_koodi], [tutkinto_muulla_kala_t1lla], [tutkinto_muulla_kala_t1lla_SV], [tutkinto_muulla_kala_t1lla_EN], [jarjestys_2d_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t1lla_koodi], [tutkinto_muulla_kala_t1lla], [tutkinto_muulla_kala_t1lla_SV], [tutkinto_muulla_kala_t1lla_EN], [jarjestys_2d_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto muulla koulutusalalla, taso 1', N'Examen inom annat utbildningsområde, nivå 1', N'Qualification in another field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t1lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t1lla_koodi], [tutkinto_muulla_kala_t1lla], [tutkinto_muulla_kala_t1lla_SV], [tutkinto_muulla_kala_t1lla_EN], [jarjestys_2d_t1], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa muulla koulutusalalla, taso 1', N'Ingen examen inom annat utbildningsområde, nivå 1', N'No qualification in another field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t2lla_koodi], [tutkinto_muulla_kala_t2lla], [tutkinto_muulla_kala_t2lla_SV], [tutkinto_muulla_kala_t2lla_EN], [jarjestys_2d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t2lla_koodi], [tutkinto_muulla_kala_t2lla], [tutkinto_muulla_kala_t2lla_SV], [tutkinto_muulla_kala_t2lla_EN], [jarjestys_2d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t2lla_koodi], [tutkinto_muulla_kala_t2lla], [tutkinto_muulla_kala_t2lla_SV], [tutkinto_muulla_kala_t2lla_EN], [jarjestys_2d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto muulla koulutusalalla, taso 2', N'Examen inom annat utbildningsområde, nivå 1', N'Qualification in another field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t2lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t2lla_koodi], [tutkinto_muulla_kala_t2lla], [tutkinto_muulla_kala_t2lla_SV], [tutkinto_muulla_kala_t2lla_EN], [jarjestys_2d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa muulla koulutusalalla, taso 2', N'Ingen examen inom annat utbildningsområde, nivå 1', N'No qualification in another field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t3lla_koodi], [tutkinto_muulla_kala_t3lla], [tutkinto_muulla_kala_t3lla_SV], [tutkinto_muulla_kala_t3lla_EN], [jarjestys_2d_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t3lla_koodi], [tutkinto_muulla_kala_t3lla], [tutkinto_muulla_kala_t3lla_SV], [tutkinto_muulla_kala_t3lla_EN], [jarjestys_2d_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t3lla_koodi], [tutkinto_muulla_kala_t3lla], [tutkinto_muulla_kala_t3lla_SV], [tutkinto_muulla_kala_t3lla_EN], [jarjestys_2d_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto muulla koulutusalalla, taso 3', N'Examen inom annat utbildningsområde, nivå 1', N'Qualification in another field of education, tier 1', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kala_t3lla] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kala_t3lla_koodi], [tutkinto_muulla_kala_t3lla], [tutkinto_muulla_kala_t3lla_SV], [tutkinto_muulla_kala_t3lla_EN], [jarjestys_2d_t3], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa muulla koulutusalalla, taso 3', N'Ingen examen inom annat utbildningsområde, nivå 1', N'No qualification in another field of education, tier 1', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kaste_t2ella_koodi], [tutkinto_muulla_kaste_t2ella], [tutkinto_muulla_kaste_t2ella_SV], [tutkinto_muulla_kaste_t2ella_EN], [jarjestys_1d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-2', N'Virhetilanne', N'Feltillstånd', N'Error occurred', N'99', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kaste_t2ella_koodi], [tutkinto_muulla_kaste_t2ella], [tutkinto_muulla_kaste_t2ella_SV], [tutkinto_muulla_kaste_t2ella_EN], [jarjestys_1d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (-1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'-1', N'Tuntematon', N'Information saknas', N'Missing data', N'98', N'K', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kaste_t2ella_koodi], [tutkinto_muulla_kaste_t2ella], [tutkinto_muulla_kaste_t2ella_SV], [tutkinto_muulla_kaste_t2ella_EN], [jarjestys_1d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (1, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'1 ', N'Tutkinto muulla koulutusasteella, taso 2', N'Examen på annan utbildningsnivå, nivå 2', N'Qualification at another level of education, tier 2', N'01', N'E', N' ', N'CSC', N'CSC Juha')
GO
INSERT [dbo].[tutkinto_muulla_kaste_t2ella] ([id], [luotu], [alkaa], [paattyy], [tutkinto_muulla_kaste_t2ella_koodi], [tutkinto_muulla_kaste_t2ella], [tutkinto_muulla_kaste_t2ella_SV], [tutkinto_muulla_kaste_t2ella_EN], [jarjestys_1d_t2], [virhetilanne], [poistettu], [tietolahde], [kommentti]) VALUES (2, CAST(N'2021-11-23' AS Date), CAST(N'1900-01-01' AS Date), CAST(N'9999-01-01' AS Date), N'2 ', N'Ei tutkintoa muulla koulutusasteella, taso 2', N'Ingen examen på annan utbildningsnivå, nivå 2', N'No qualification at another level of education, tier 2', N'02', N'E', N' ', N'CSC', N'CSC Juha')
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[jatkaa_opiskelua_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t1n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t1n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t1n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t2n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t2n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t2n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t3n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t3n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kala_t3n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_kaste_t2en_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kaste_t2en_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_kaste_t2en_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kaste_t2en_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_muulla_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[tutkinto_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_muulla_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
