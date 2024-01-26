USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 12.12.2023 17:09:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
GO

CREATE TABLE [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[tilvasmaak] [nvarchar](10) NULL,
	[tol2008_2] [nvarchar](20) NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[tol2008_oef] [nvarchar](10) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[amm2010_oef1] [nvarchar](20) NULL,
	[amm2010_oef2] [nvarchar](20) NULL,
	[tmaak] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]


GO


