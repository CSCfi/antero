USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 5.8.2021 18:58:57 ******/
DROP TABLE [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]
GO

/****** Object:  Table [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 5.8.2021 18:58:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[kkieli] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[aiopis] [nvarchar](2) NULL,
	[ika2] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tunim] [nvarchar](255) NULL,
	[sutunim] [nvarchar](255) NULL,
	[rutunim] [nvarchar](255) NULL,
	[koohj] [nvarchar](100) NULL,
	[sukoohj] [nvarchar](100) NULL,
	[rukoohj] [nvarchar](100) NULL,
	[tutktav] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[tavoite] [nvarchar](2) NULL,
	[olosyys] [nvarchar](1) NULL,
	[koso] [nvarchar](1) NULL,
	[opso] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]

GO


