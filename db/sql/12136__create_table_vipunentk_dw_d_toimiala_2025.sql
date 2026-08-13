USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_toimiala_2025]    Script Date: 12.8.2026 16.57.33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_toimiala_2025]') AND type in (N'U'))

CREATE TABLE [dbo].[d_toimiala_2025](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[toimiala_2025_koodi] [nvarchar](10) NULL,
	[toimiala_2025] [nvarchar](250) NULL,
	[toimiala_2025_SV] [nvarchar](250) NULL,
	[toimiala_2025_EN] [nvarchar](250) NULL,
	[taso] [nvarchar](2) NULL,
	[taso1] [nvarchar](2) NULL,
	[jarjestys] [smallint] NULL,
	[jarjestys_taso] [smallint] NULL,
	[jarjestys_taso1] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


