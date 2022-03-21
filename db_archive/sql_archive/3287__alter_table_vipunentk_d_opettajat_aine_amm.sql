USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_opettajat_aine_amm]    Script Date: 12.2.2020 21:19:36 ******/
DROP TABLE [dbo].[d_opettajat_aine_amm]
GO

/****** Object:  Table [dbo].[d_opettajat_aine_amm]    Script Date: 12.2.2020 21:19:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opettajat_aine_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[aine_koodi] [nvarchar](3) NULL,
	[aine] [nvarchar](255) NULL,
	[aine_SV] [nvarchar](255) NULL,
	[aine_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
 CONSTRAINT [PK_d_opettajat_aine_amm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [ANTERO]