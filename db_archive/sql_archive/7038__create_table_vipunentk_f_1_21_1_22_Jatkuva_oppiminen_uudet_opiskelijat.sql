USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]    Script Date: 23.12.2022 17:28:58 ******/
DROP TABLE IF EXISTS [dbo].[f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]
GO

/****** Object:  Table [dbo].[f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]    Script Date: 23.12.2022 17:28:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[aineisto] [nvarchar](50) NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[sektori] [nvarchar](2) NULL,
	[sektori_id] [int] NULL,
	[ikar8] [nvarchar](2) NULL,
	[ikar8_id] [int] NULL,
	[ika_25_64_vuotta_id] [int] NULL,
	[sp] [nvarchar](2) NULL,
	[sp_id] [int] NULL,
	[syntyp2] [nvarchar](2) NULL,
	[syntyp2_id] [int] NULL,
	[tilvaskunsuuraluer2] [nvarchar](2) NULL,
	[tilvaskunsuuraluer2_id] [int] NULL,
	[tilvaskunryh] [nvarchar](2) NULL,
	[tilvaskunryh_id] [int] NULL,
	[ptoim1r6e] [nvarchar](2) NULL,
	[ptoim1r6e_id] [int] NULL,
	[sosee] [nvarchar](2) NULL,
	[sosee_id] [int] NULL,
	[pientul_id] [int] NULL,
	[tol2008_1_v2] [nvarchar](2) NULL,
	[tol2008_1_v2_id] [int] NULL,
	[iscfi2013] [nvarchar](4) NULL,
	[iscfi2013_id] [int] NULL,
	[kaste_t2_3] [nvarchar](2) NULL,
	[kaste_t2_3_id] [int] NULL,
	[eitutkjoht] [nvarchar](2) NULL,
	[eitutkjoht_id] [int] NULL,
	[tavoite] [nvarchar](2) NULL,
	[tavoite_id] [int] NULL,
	[tyov_id] [int] NULL,
	[lkm] [int] NULL,
	[korkein_aiempi_tutkinto_id] [int] NULL,
	[korkein_aiempi_tutkinto_vuotta_kulunut] [varchar](5) NULL,
	[aikyo_id] [int] NULL,
	[aikyo_vuotta_kulunut] [varchar](5) NULL,
	[aikpt_id] [int] NULL,
	[aikpt_vuotta_kulunut] [varchar](5) NULL,
	[aikateat_id] [int] NULL,
	[aikateat_vuotta_kulunut] [varchar](5) NULL,
	[aikamk_id] [int] NULL,
	[aikamk_vuotta_kulunut] [varchar](5) NULL,
	[aikalkk_id] [int] NULL,
	[aikalkk_vuotta_kulunut] [varchar](5) NULL,
	[aikylamk_id] [int] NULL,
	[aikylamk_vuotta_kulunut] [varchar](5) NULL,
	[aikylkk_id] [int] NULL,
	[aikylkk_vuotta_kulunut] [varchar](5) NULL
) ON [PRIMARY]

GO


