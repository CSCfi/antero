USE [VipunenTK]
GO

/****** Object:  Table [dbo].[d_opettajat_koulutusaste_amm]    Script Date: 11.2.2020 20:22:50 ******/
DROP TABLE [dbo].[d_opettajat_koulutusaste_amm]
GO

/****** Object:  Table [dbo].[d_opettajat_koulutusaste_amm]    Script Date: 11.2.2020 20:22:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opettajat_koulutusaste_amm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutusaste_koodi] [nvarchar](2) NULL,
	[koulutusaste] [nvarchar](255) NULL,
	[koulutusaste_SV] [nvarchar](255) NULL,
	[koulutusaste_EN] [nvarchar](255) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[virhetilanne] [nchar](10) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL
 CONSTRAINT [PK_d_opettajat_koulutusaste_amm] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [ANTERO]