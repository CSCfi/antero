USE [VipunenTK]
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_versio9]    Script Date: 10.3.2018 13:17:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_paaasiallinen_toiminta_versio9]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_paaasiallinen_toiminta_versio9](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[paaasiallinen_toiminta_versio9_koodi] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio9] [nvarchar](150) NULL,
	[paaasiallinen_toiminta_versio9_SV] [nvarchar](150) NULL,
	[paaasiallinen_toiminta_versio9_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]