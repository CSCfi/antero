USE [VipunenTK]
GO

DROP TABLE IF EXISTS [dbo].[d_opettajat_ala_tpo]
GO

DROP TABLE IF EXISTS [dbo].[d_opettajat_koulutusaste_tpo]
GO

DROP TABLE IF EXISTS [dbo].[d_opettajat_opintotaso_tpo]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opettajat_ala_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[ala_koodi] [nvarchar](3) NULL,
	[ala] [nvarchar](255) NULL,
	[ala_SV] [nvarchar](255) NULL,
	[ala_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[d_opettajat_koulutusaste_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutusaste_koodi] [nvarchar](3) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[d_opettajat_opintotaso_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[opintotaso_koodi] [nvarchar](3) NULL,
	[opintotaso] [nvarchar](255) NULL,
	[opintotaso_SV] [nvarchar](255) NULL,
	[opintotaso_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

USE [ANTERO]
