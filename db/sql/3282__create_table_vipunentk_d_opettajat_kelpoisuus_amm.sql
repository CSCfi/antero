USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_opettajat_kelpoisuus_amm]    Script Date: 31.3.2020 12:34:06 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_kelpoisuus_amm]
GO

/****** Object:  Table [dbo].[d_opettajat_kelpoisuus_amm]    Script Date: 31.3.2020 12:34:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opettajat_kelpoisuus_amm](
	[id] [int] NOT NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[kelpoisuus_koodi] [nvarchar](3) NULL,
	[kelpoisuus] [nvarchar](255) NULL,
	[kelpoisuus_SV] [nvarchar](255) NULL,
	[kelpoisuus_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[luotu] [date] NULL,
	[kommentti] [nvarchar](250) NULL
CONSTRAINT [PK_d_opettajat_kelpoisuus_amm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ANTERO]