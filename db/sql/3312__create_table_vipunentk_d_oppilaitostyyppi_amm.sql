USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_oppilaitostyyppi]    Script Date: 31.3.2020 12:21:44 ******/
DROP TABLE IF EXISTS [dbo].[d_oppilaitostyyppi_amm]
GO

/****** Object:  Table [dbo].[d_oppilaitostyyppi]    Script Date: 31.3.2020 12:21:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_oppilaitostyyppi_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[oppilaitostyyppi_koodi] [nchar](2) NULL,
	[oppilaitostyyppi] [nvarchar](150) NULL,
	[oppilaitostyyppi_SV] [nvarchar](150) NULL,
	[oppilaitostyyppi_EN] [nvarchar](150) NULL,
	[jarjestys] [nvarchar](10) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
 CONSTRAINT [PK_d_oppilaitostyyppi_amm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ANTERO]