USE [VipunenTK_DW]
GO

ALTER TABLE [dbo].[d_koulutuslaji_okm] DROP CONSTRAINT [DF__koulutuslaji_okm__tietolahde]
GO

/****** Object:  Table [dbo].[d_koulutuslaji_okm]    Script Date: 6.8.2021 11:32:54 ******/
DROP TABLE [dbo].[d_koulutuslaji_okm]
GO

/****** Object:  Table [dbo].[d_koulutuslaji_okm]    Script Date: 6.8.2021 11:32:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_koulutuslaji_okm](
	[id] [int] NOT NULL,
	[luotu] [date] NULL,
	[koulutuslaji_okm_avain] [nvarchar](10) NULL,
	[koulutuslaji_okm] [nvarchar](250) NULL,
	[koulutuslaji_okm_SV] [nvarchar](250) NULL,
	[koulutuslaji_okm_EN] [nvarchar](250) NULL,
	[koulutuslaji_okm2] [nvarchar](250) NULL,
	[koulutuslaji_okm2_SV] [nvarchar](250) NULL,
	[koulutuslaji_okm2_EN] [nvarchar](250) NULL,
	[jarjestys] [nvarchar](50) NULL,
	[jarjestys2] [nvarchar](50) NULL,
	[virhetilanne] [nchar](1) NULL,
	[poistettu] [nchar](1) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[kommentti] [nvarchar](250) NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[d_koulutuslaji_okm] ADD  CONSTRAINT [DF__koulutuslaji_okm__tietolahde]  DEFAULT ('Tilastokeskus') FOR [tietolahde]
GO


