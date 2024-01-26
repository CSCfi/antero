USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_oef_toimiala]    Script Date: 12.12.2023 15:30:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[d_oef_toimiala]
GO

CREATE TABLE [dbo].[d_oef_toimiala](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[oef_toimiala_koodi] [nvarchar](10) NULL,
	[oef_toimiala] [nvarchar](250) NULL,
	[oef_toimiala_SV] [nvarchar](250) NULL,
	[oef_toimiala_EN] [nvarchar](250) NULL,
	[jarjestys_oef_toimiala] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO


