USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 14.11.2018 17:16:13 ******/
DROP TABLE [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
GO

/****** Object:  Table [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 14.11.2018 17:16:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[ikar1] [nvarchar](10) NULL,
	[opmast] [nvarchar](10) NULL,
	[kaste_t2] [nvarchar](10) NULL,
	[tutklaja] [nvarchar](10) NULL,
	[opmopa] [nvarchar](10) NULL,
	[iscfinarrow2013] [nvarchar](10) NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[tol2008] [nvarchar](20) NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[tmaak] [nvarchar](10) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]