USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_opettajat_taydennyskoulutus_tpo]    Script Date: 25.2.2020 20:30:41 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_taydennyskoulutus_tpo]
GO

/****** Object:  Table [dbo].[d_opettajat_taydennyskoulutus_tpo]    Script Date: 25.2.2020 20:30:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opettajat_taydennyskoulutus_tpo](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[osaalue_koodi] [nvarchar](3) NULL,
	[osaalue] [nvarchar](255) NULL,
	[osaalue_SV] [nvarchar](255) NULL,
	[osaalue_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO


USE [ANTERO]