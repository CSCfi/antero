USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 9.3.2018 9:02:39 ******/
DROP TABLE [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
GO
/****** Object:  Table [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 9.3.2018 9:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[tunn] [nvarchar](10) NULL,
	[tiede] [nvarchar](10) NULL,
	[vryhma] [nvarchar](10) NULL,
	[ikar4] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[tutktaso] [nvarchar](10) NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[apuraha] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

USE [ANTERO]