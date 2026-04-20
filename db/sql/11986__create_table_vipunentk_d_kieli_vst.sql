USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_kieli_vst]    Script Date: 20.4.2026 15.37.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[kieli_vst]') AND type in (N'U'))

CREATE TABLE [dbo].[d_kieli_vst](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kieli_koodi] [nvarchar](2) NULL,
	[kieli] [nvarchar](50) NULL,
	[kieli_SV] [nvarchar](50) NULL,
	[kieli_EN] [nvarchar](50) NULL,
	[jarjestys] [smallint] NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


