USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_katsomusaine]    Script Date: 16.1.2026 16.04.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_katsomusaine]') AND type in (N'U'))
CREATE TABLE [dbo].[d_katsomusaine](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[katsomusaine_koodi] [nvarchar](2) NULL,
	[katsomusaine] [nvarchar](250) NULL,
	[katsomusaine_SV] [nvarchar](250) NULL,
	[katsomusaine_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


