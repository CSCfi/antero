USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_vst]    Script Date: 24.4.2026 16.04.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta_vst]') AND type in (N'U'))

CREATE TABLE [dbo].[d_paaasiallinen_toiminta_vst](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_koodi] [nvarchar](10) NULL,
	[paaasiallinen_toiminta] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_SV] [nvarchar](250) NULL,
	[paaasiallinen_toiminta_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


