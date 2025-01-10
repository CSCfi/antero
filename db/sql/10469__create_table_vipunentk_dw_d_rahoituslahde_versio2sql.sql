USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_rahoituslahde]    Script Date: 19.12.2024 13.19.40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_rahoituslahde_versio2]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[d_rahoituslahde_versio2](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[rahoituslahde_koodi] [nvarchar](10) NULL,
	[rahoituslahde] [nvarchar](250) NULL,
	[rahoituslahde_SV] [nvarchar](250) NULL,
	[rahoituslahde_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

END

GO


