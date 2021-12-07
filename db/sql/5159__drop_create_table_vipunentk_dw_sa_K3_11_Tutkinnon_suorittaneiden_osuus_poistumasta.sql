USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 17.11.2021 13:28:03 ******/
DROP TABLE [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]
GO

/****** Object:  Table [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 17.11.2021 13:28:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](1) NULL,
	[lahde] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[syntv] [nvarchar](4) NULL,
	[tilvaskun] [nvarchar](3) NULL,
	[kansalr1] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[pohjmaa] [nvarchar](1) NULL,
	[alvv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[ololk] [nvarchar](1) NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[koulk] [nvarchar](6) NULL,
	[koulk_kala_t1] [nvarchar](6) NULL,
	[koulk_kala_t2] [nvarchar](6) NULL,
	[koulk_kala_t3] [nvarchar](6) NULL,
	[koulk_kaste_t1] [nvarchar](6) NULL,
	[koulk_kaste_t2] [nvarchar](6) NULL,
	[tutk_kala_t1] [nvarchar](6) NULL,
	[tutk_kala_t2] [nvarchar](6) NULL,
	[tutk_kala_t3] [nvarchar](6) NULL,
	[tutk_kaste_t1] [nvarchar](6) NULL,
	[tutk_kaste_t2] [nvarchar](6) NULL,
	[seurv_kala_t1] [nvarchar](6) NULL,
	[seurv_kala_t2] [nvarchar](6) NULL,
	[seurv_kala_t3] [nvarchar](6) NULL,
	[seurv_kaste_t1] [nvarchar](6) NULL,
	[seurv_kaste_t2] [nvarchar](6) NULL,
	[koulk_opintoala] [nvarchar](6) NULL,
	[koulk_koulutusala] [nvarchar](6) NULL,
	[koulk_koulutusaste] [nvarchar](6) NULL,
	[kkielir1] [nvarchar](2) NULL,
	[kkun] [nvarchar](3) NULL,
	[kkun_kmaak] [nvarchar](2) NULL,
	[ophal] [nvarchar](1) NULL,
	[koultyp] [nvarchar](1) NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[tutkjarj] [nvarchar](10) NULL,
	[tutktunn] [nvarchar](5) NULL,
	[tutkkoulk] [nvarchar](6) NULL,
	[tutk_opintoala] [nvarchar](6) NULL,
	[tutk_koulutusala] [nvarchar](6) NULL,
	[tutk_koulutusaste] [nvarchar](6) NULL,
	[tutkkoultyp] [nvarchar](1) NULL,
	[seurvkmaak] [nvarchar](2) NULL,
	[seurvjarj] [nvarchar](10) NULL,
	[seurvtunn] [nvarchar](5) NULL,
	[seurvkoulk] [nvarchar](6) NULL,
	[seurv_opintoala] [nvarchar](6) NULL,
	[seurv_koulutusala] [nvarchar](6) NULL,
	[seurv_koulutusaste] [nvarchar](6) NULL,
	[seurvkoulutyp] [nvarchar](1) NULL,
	[ptoim1r2] [nvarchar](2) NULL,
	[amas1] [nvarchar](1) NULL,
	[lkm] [int] NULL
) ON [PRIMARY]

GO


