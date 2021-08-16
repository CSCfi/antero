USE [VipunenTK_DW]
GO

ALTER TABLE [dbo].[d_koulutuslaji] DROP CONSTRAINT IF EXISTS [DF__d_koulutuslaji__tietolahde]
GO

ALTER TABLE [dbo].[d_koulutuslaji] DROP CONSTRAINT IF EXISTS [DF__d_koulutuslaji__paattyy]
GO

ALTER TABLE [dbo].[d_koulutuslaji] DROP CONSTRAINT IF EXISTS [DF__d_koulutuslaji__alkaa]
GO

/****** Object:  Table [dbo].[d_koulutuslaji]    Script Date: 6.8.2021 11:32:49 ******/
DROP TABLE [dbo].[d_koulutuslaji]
GO

/****** Object:  Table [dbo].[d_koulutuslaji]    Script Date: 6.8.2021 11:32:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_koulutuslaji](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koulutuslaji_koodi] [nvarchar](10) NULL,
	[koulutuslaji] [nvarchar](250) NULL,
	[koulutuslaji_SV] [nvarchar](250) NULL,
	[koulutuslaji_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_koulutuslaji] ADD  CONSTRAINT [DF__d_koulutuslaji__alkaa]  DEFAULT ('1900-01-01') FOR [alkaa]
GO

ALTER TABLE [dbo].[d_koulutuslaji] ADD  CONSTRAINT [DF__d_koulutuslaji__paattyy]  DEFAULT ('9999-01-01') FOR [paattyy]
GO

ALTER TABLE [dbo].[d_koulutuslaji] ADD  CONSTRAINT [DF__d_koulutuslaji__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO


