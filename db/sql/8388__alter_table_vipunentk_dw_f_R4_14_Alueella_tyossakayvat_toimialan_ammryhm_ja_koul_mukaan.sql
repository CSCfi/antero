USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 14.12.2023 11:02:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
GO

CREATE TABLE [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ikar1] [nvarchar](10) NULL,
	[opmast] [nvarchar](10) NULL,
	[kaste_t2] [nvarchar](10) NULL,
	[tutklaja] [nvarchar](10) NULL,
	[opmopa] [nvarchar](10) NULL,
	[iscfinarrow2013] [nvarchar](10) NULL,
	[tilvasmaak] [varchar](2) NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[tol2008_oef] [nvarchar](10) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[amm2010_oef1] [nvarchar](20) NULL,
	[amm2010_oef2] [nvarchar](20) NULL,
	[tsekt] [nvarchar](10) NULL,
	[tmaak] [nvarchar](10) NULL,
	[sose] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


