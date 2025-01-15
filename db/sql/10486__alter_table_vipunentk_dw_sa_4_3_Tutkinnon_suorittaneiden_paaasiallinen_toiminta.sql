USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_prev]    Script Date: 13.1.2025 15.18.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[aiopis] [nvarchar](2) NULL,
	[suorv] [nvarchar](4) NULL,
	[tutkmaak] [nvarchar](2) NULL,
	[jarj] [nvarchar](10) NULL,
	[tunn] [nvarchar](5) NULL,
	[akk] [nvarchar](5) NULL,
	[koulk] [nvarchar](6) NULL,
	[kouljat] [nvarchar](2) NULL,
	[oppis] [nvarchar](2) NULL,
	[tutklaja_tr] [nvarchar](2) NULL,
	[rahlahde_v2] [nvarchar](2) NULL,
	[ptoim1r2] [nvarchar](2) NULL,
	[maassaolo] [nvarchar](2) NULL,
	[amas] [nvarchar](2) NULL,
	[amm2010] [nvarchar](5) NULL,
	[lkm] [int] NULL,
	[eu_etamaat] [nvarchar](2) NULL,
	[aikielir1] [nvarchar](2) NULL,
	[mosa] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


