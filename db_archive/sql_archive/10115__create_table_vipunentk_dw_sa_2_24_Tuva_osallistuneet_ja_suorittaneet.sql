USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_2_24_Tuva_osallistuneet_ja_suorittaneet]    Script Date: 17.9.2024 16:36:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_2_24_Tuva_osallistuneet_ja_suorittaneet]') AND type in (N'U'))
DROP TABLE [dbo].[sa_2_24_Tuva_osallistuneet_ja_suorittaneet]

GO

CREATE TABLE [dbo].[sa_2_24_Tuva_osallistuneet_ja_suorittaneet](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[suunta] [nvarchar](1) NULL,
	[allv] [nvarchar](4) NULL,
	[allk] [nvarchar](1) NULL,
	[aloituskausikoodi] [varchar](8) NULL,
	[suorv] [nvarchar](4) NULL,
	[suorlk] [nvarchar](1) NULL,
	[suorituskausikoodi] [varchar](8) NULL,
	[tuva_kk] [nvarchar](2) NULL,
	[sp] [nvarchar](1) NULL,
	[ikar9] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[tilvasmaakx] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


