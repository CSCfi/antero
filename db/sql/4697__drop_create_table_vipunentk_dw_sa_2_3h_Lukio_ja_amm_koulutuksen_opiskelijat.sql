USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 5.8.2021 18:50:23 ******/
DROP TABLE [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]
GO

/****** Object:  Table [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 5.8.2021 18:50:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[opmast] [nvarchar](6) NULL,
	[kaste_t2] [nvarchar](6) NULL,
	[opmala] [nvarchar](6) NULL,
	[iscfibroad2013] [nvarchar](6) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[tilvaskun] [nvarchar](3) NULL,
	[tilvaskunx] [nvarchar](3) NULL,
	[alvv] [nvarchar](4) NULL,
	[ika2] [nvarchar](2) NULL,
	[kirikar1] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tutklajl] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tutktav] [nvarchar](2) NULL,
	[tyov] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[tavoite] [nvarchar](2) NULL,
	[yrit] [nvarchar](2) NULL,
	[olosyys] [nvarchar](1) NULL,
	[koso] [nvarchar](1) NULL,
	[opso] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]

GO


