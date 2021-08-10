USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[d_amm_sopimusjaksot]    Script Date: 5.8.2021 14:15:16 ******/
DROP TABLE IF EXISTS [dbo].[d_amm_sopimusjaksot]
GO

/****** Object:  Table [dbo].[d_amm_sopimusjaksot]    Script Date: 5.8.2021 14:15:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_amm_sopimusjaksot](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[alkaa] [date] NULL,
	[paattyy] [date] NULL,
	[koodi] [int] NULL,
	[selite_fi] [nvarchar](250) NULL,
	[selite_sv] [nvarchar](250) NULL,
	[selite_en] [nvarchar](250) NULL,
	[jarjestys_koodi] [int] NULL,
	[virhetilanne] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO


