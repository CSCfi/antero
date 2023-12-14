USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 14.12.2023 12:48:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
GO

CREATE TABLE [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[elaji] [nvarchar](10) NULL,
	[elk_koodi] [nvarchar](10) NULL,
	[ptoim1r8x] [nvarchar](10) NULL,
	[tmaakx] [nvarchar](10) NULL,
	[amm2001_m1x] [nvarchar](10) NULL,
	[amm2001_m2x] [nvarchar](20) NULL,
	[amm2010_oef1_x] [nvarchar](10) NULL,
	[amm2010_oef2_x] [nvarchar](20) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tietojen_ajankohta] [nvarchar](10) NULL,
	[tiet_ak] [nvarchar](4) NULL,
	[tiet_akdate] [date] NULL,
	[aineisto] [nvarchar](8) NULL
) ON [PRIMARY]

GO


