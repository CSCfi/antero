USE [VipunenTK_lisatiedot]
GO

/****** Object:  Table [dbo].[oppimaara_vst]    Script Date: 29.4.2026 10.22.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[oppimaara_vst]') AND type in (N'U'))

CREATE TABLE [dbo].[oppimaara_vst](
	[id] [int] NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oppimaara_koodi] [nvarchar](2) NULL,
	[oppimaara] [nvarchar](250) NULL,
	[oppimaara_SV] [nvarchar](250) NULL,
	[oppimaara_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
GO


