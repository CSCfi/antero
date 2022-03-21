USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 5.8.2021 18:38:07 ******/
DROP TABLE [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]
GO

/****** Object:  Table [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 5.8.2021 18:38:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[tunn] [nvarchar](5) NULL,
	[jarj] [nvarchar](10) NULL,
	[opjarj] [nvarchar](10) NULL,
	[koulk] [nvarchar](6) NULL,
	[tunim] [nvarchar](5) NULL,
	[sutunim] [nvarchar](30) NULL,
	[rutunim] [nvarchar](30) NULL,
	[koohj] [nvarchar](4) NULL,
	[sukoohj] [nvarchar](60) NULL,
	[rukoohj] [nvarchar](60) NULL,
	[tutklaja] [nvarchar](1) NULL,
	[tutktav] [nvarchar](2) NULL,
	[kkieli] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[ophal] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[aiopis] [nvarchar](1) NULL,
	[aikoul] [nvarchar](1) NULL,
	[ika2] [nvarchar](2) NULL,
	[kirikar1] [nvarchar](2) NULL,
	[suorpvm] [nvarchar](8) NULL,
	[lkm] [int] NULL,
	[tutalv] [nvarchar](4) NULL,
	[tutalk] [nvarchar](1) NULL,
	[hyvennen] [int] NULL,
	[hyvaik] [int] NULL,
	[suorkouaik] [int] NULL,
	[ovyht] [int] NULL,
	[tyop] [int] NULL,
	[ammos] [int] NULL,
	[opintokok] [int] NULL,
	[tyov] [nvarchar](1) NULL,
	[rahoitus] [nvarchar](2) NULL,
	[vayla] [nvarchar](1) NULL,
	[alaika] [nvarchar](8) NULL,
	[loaika] [nvarchar](8) NULL,
	[tavoite] [nvarchar](2) NULL,
	[toteuma_tutk] [int] NULL,
	[yrit] [nvarchar](1) NULL,
	[purku] [nvarchar](1) NULL,
	[todis] [nvarchar](1) NULL,
	[tol2008] [nvarchar](5) NULL,
	[koko] [nvarchar](1) NULL,
	[tyansek] [nvarchar](1) NULL,
	[suorosat] [int] NULL,
	[tunn_opisk] [nvarchar](5) NULL,
	[jarj_opisk] [nvarchar](10) NULL,
	[kkun_opisk] [nvarchar](3) NULL,
	[koso] [nvarchar](1) NULL,
	[opso] [nvarchar](1) NULL,
	[tietolahde] [nvarchar](250) NULL,
	[rivinumero] [nvarchar](10) NULL
) ON [PRIMARY]

GO


