USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_kvopiskelija]    Script Date: 17.10.2025 16.39.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_kvopiskelija]') AND type in (N'U'))
  DROP TABLE [dbo].[d_kvopiskelija]
GO

CREATE TABLE [dbo].[d_kvopiskelija](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kvopiskelija_koodi] [nvarchar](10) NULL,
	[kvopiskelija] [nvarchar](250) NULL,
	[kvopiskelija_SV] [nvarchar](250) NULL,
	[kvopiskelija_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


