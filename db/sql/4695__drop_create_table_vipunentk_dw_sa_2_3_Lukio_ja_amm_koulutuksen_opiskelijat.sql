USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 5.8.2021 19:11:55 ******/
DROP TABLE [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]
GO

/****** Object:  Table [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 5.8.2021 19:11:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[olotamm] [nvarchar](1) NULL,
	[olosyys] [nvarchar](1) NULL,
	[aiopis] [nvarchar](2) NULL,
	[koso] [nvarchar](1) NULL,
	[opso] [nvarchar](1) NULL,
	[ika2] [nvarchar](2) NULL,
	[kirikar1] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tutklajl] [nvarchar](2) NULL,
	[aikoul] [nvarchar](2) NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutalk] [nvarchar](2) NULL,
	[tutklaja] [nvarchar](2) NULL,
	[tunim] [nvarchar](5) NULL,
	[sutunim] [nvarchar](30) NULL,
	[rutunim] [nvarchar](30) NULL,
	[koohj] [nvarchar](4) NULL,
	[sukoohj] [nvarchar](60) NULL,
	[rukoohj] [nvarchar](60) NULL,
	[tutktav] [nvarchar](2) NULL,
	[tyov] [nvarchar](2) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[alaika] [nvarchar](8) NULL,
	[loaika] [nvarchar](8) NULL,
	[tavoite] [nvarchar](2) NULL,
	[yrit] [nvarchar](2) NULL,
	[purku] [nvarchar](2) NULL,
	[todis] [nvarchar](2) NULL,
	[tol2008] [nvarchar](5) NULL,
	[koko] [nvarchar](2) NULL,
	[tyansek] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](3) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]

GO


