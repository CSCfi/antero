USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_tuva_rahoitusjarjestelma]    Script Date: 18.9.2024 10:21:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[d_tuva_rahoitusjarjestelma]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[d_tuva_rahoitusjarjestelma](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[rahoitusjarjestelma_koodi] [nvarchar](10) NULL,
	[rahoitusjarjestelma] [nvarchar](250) NULL,
	[rahoitusjarjestelma_SV] [nvarchar](250) NULL,
	[rahoitusjarjestelma_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]
END

GO


