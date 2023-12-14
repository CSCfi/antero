USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 14.12.2023 13:33:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
GO

CREATE TABLE [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](10) NULL,
	[sp] [nvarchar](10) NULL,
	[aikielir1] [nvarchar](10) NULL,
	[ika] [nvarchar](10) NULL,
	[elaji] [nvarchar](10) NULL,
	[elk_koodi] [nvarchar](10) NULL,
	[ptoim1r8_2x] [nvarchar](10) NULL,
	[tmaak2x] [nvarchar](10) NULL,
	[amm2001_m1_2x] [nvarchar](10) NULL,
	[amm2001_m2_2x] [nvarchar](20) NULL,
	[amm2010_oef1_2x] [nvarchar](10) NULL,
	[amm2010_oef2_2x] [nvarchar](20) NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[tietojen_ajankohta] [nvarchar](20) NULL,
	[tiet_ak] [nvarchar](4) NULL,
	[tiet_akdate] [date] NULL,
	[aineisto] [nvarchar](8) NULL
) ON [PRIMARY]

GO


