USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 4.12.2018 14:28:52 ******/
DROP TABLE [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
GO

/****** Object:  Table [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 4.12.2018 14:28:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[vryhma] [nvarchar](10) NULL,
	[ikar4] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[tutktaso] [nvarchar](10) NULL,
	[kaste_t2] [nvarchar](10) NULL,
	[lkm_tutkimushenkilokunta] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]