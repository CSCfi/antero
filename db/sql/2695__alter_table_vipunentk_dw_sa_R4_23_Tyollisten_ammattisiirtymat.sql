USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 9.12.2019 20:11:53 ******/
DROP TABLE [dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]
GO

/****** Object:  Table [dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 9.12.2019 20:11:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_R4_23_Tyollisten_ammattisiirtymat](
	[tilv] [varchar](4) NULL,
	[ptoim1r9] [varchar](2) NULL,
	[aikielir5] [varchar](1) NULL,
	[ikar6] [varchar](2) NULL,
	[tol2008_2] [varchar](2) NULL,
	[amm2010_m2] [varchar](5) NULL,
	[opmast_2] [varchar](2) NULL,
	[kaste_t2_2] [varchar](2) NULL,
	[opmopa] [varchar](3) NULL,
	[iscfinarrow2013] [varchar](3) NULL,
	[tutklaja] [varchar](1) NULL,
	[opkelp] [varchar](1) NULL,
	[ptoim1r9_s] [varchar](2) NULL,
	[tmaak_se] [varchar](1) NULL,
	[tol2008_2_s] [varchar](2) NULL,
	[amm2010_m2_s] [varchar](5) NULL,
	[opmast_2_s] [varchar](2) NULL,
	[kaste_t2_2_s] [varchar](2) NULL,
	[opmopa_s] [varchar](3) NULL,
	[iscfinarrow2013_s] [varchar](3) NULL,
	[tutklaja_s] [varchar](1) NULL,
	[opkelp_s] [varchar](1) NULL,
	[erik_s] [varchar](3) NULL,
	[erik_amk_s] [varchar](2) NULL,
	[erik_yo_s] [varchar](2) NULL,
	[lkm] [int] NULL,
	[suhteellinen_ajankohta_avain] [varchar](6) NOT NULL,
	[tietolahde] [varchar](13) NOT NULL
) ON [PRIMARY]

GO


USE [ANTERO]