USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_tutkinto_muulla_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_muulla_kaste_t2ella]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_muulla_kala_t3lla]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_muulla_kala_t2lla]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_muulla_kala_t1lla]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t3lla]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t2lla]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t1lla]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kaste_t2en_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kaste_t2en_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t3n_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t2n_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t1n_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
DROP TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_alkuperaisella_kala_t1lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_alkuperaisella_kala_t2lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_alkuperaisella_kala_t3lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_muulla_kala_t1lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_muulla_kala_t2lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_muulla_kala_t3lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_jatkaa_opiskelua_muulla_kaste_t2ella] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t1n_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kala_t1n_mukaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kala_t1n_mukaan_versio2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t2n_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kala_t2n_mukaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kala_t2n_mukaan_versio2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t3n_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kala_t3n_mukaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kala_t3n_mukaan_versio2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_opintojen_kulku_kaste_t2en_mukaan]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_opintojen_kulku_kaste_t2en_mukaan](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_opintojen_kulku_kaste_t2en_mukaan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t1lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_alkuperaisella_kala_t1lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t2lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_alkuperaisella_kala_t2lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t3lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_alkuperaisella_kala_t3lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_alkuperaisella_kaste_t2ella] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kala_t1lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_muulla_kala_t1lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_muulla_kala_t1lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kala_t2lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_muulla_kala_t2lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_muulla_kala_t2lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kala_t3lla]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_muulla_kala_t3lla](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_muulla_kala_t3lla] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_kaste_t2ella]    Script Date: 26.11.2021 17:32:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[d_tutkinto_muulla_kaste_t2ella](
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
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_tutkinto_muulla_kaste_t2ella] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_alkuperaisella_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t1lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t2lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kala_t3lla] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_jatkaa_opiskelua_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__jatkaa_opiskelua_muulla_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t1n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t1n_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t2n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t2n_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan_versio2__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kala_t3n_mukaan_versio2] ADD  CONSTRAINT [DF__opintojen_kulku_kala_t3n_mukaan_versio2__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kaste_t2en_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kaste_t2en_mukaan__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_opintojen_kulku_kaste_t2en_mukaan] ADD  CONSTRAINT [DF__opintojen_kulku_kaste_t2en_mukaan__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_alkuperaisella_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_alkuperaisella_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t1lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kala_t1lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t1lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t2lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kala_t2lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t2lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t3lla__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kala_t3lla] ADD  CONSTRAINT [DF__tutkinto_muulla_kala_t3lla__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_muulla_kaste_t2ella__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO
ALTER TABLE [dbo].[d_tutkinto_muulla_kaste_t2ella] ADD  CONSTRAINT [DF__tutkinto_muulla_kaste_t2ella__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO
