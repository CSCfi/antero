USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]    Script Date: 5.8.2021 15:50:07 ******/
DROP TABLE [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]
GO

/****** Object:  Table [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]    Script Date: 5.8.2021 15:50:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](10) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[synkk] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[lkm] [int] NULL,
	[aikoul] [nvarchar](1) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[tutktav] [nvarchar](1) NULL,
	[ophal] [nvarchar](2) NULL,
	[koso] [nvarchar](1) NULL,
	[opso] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


