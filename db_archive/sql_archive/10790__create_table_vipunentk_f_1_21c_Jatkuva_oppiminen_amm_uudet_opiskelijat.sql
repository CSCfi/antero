USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]    Script Date: 28.5.2025 11.15.56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]') AND type in (N'U'))
DROP TABLE [dbo].[f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]
GO

/****** Object:  Table [dbo].[f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]    Script Date: 28.5.2025 11.15.56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[aineisto] [nvarchar](50) NULL,
	[ikar8] [nvarchar](2) NULL,
	[ikar8_id] [int] NULL,
	[ika_25_64_vuotta_id] [int] NULL,
	[sp] [nvarchar](2) NULL,
	[sp_id] [int] NULL,
	[ptoim1r6e] [nvarchar](2) NULL,
	[ptoim1r6e_id] [int] NULL,
	[sosee] [nvarchar](2) NULL,
	[sosee_id] [int] NULL,
	[koulk] [nvarchar](6) NULL,
	[koulknimi] [nvarchar](255) NULL,
	[iscfibroad2013] [nvarchar](2) NULL,
	[iscfibroad2013_id] [int] NULL,
	[kaste_t2_3] [nvarchar](2) NULL,
	[kaste_t2_3_id] [int] NULL,
	[tavoite] [nvarchar](2) NULL,
	[tavoite_id] [int] NULL,
	[tyov_id] [int] NULL,
	[lkm] [int] NULL,
	[kaste_t2_tr] [nvarchar](2) NULL,
	[kaste_t2_tr_id] [int] NULL,
	[aiktutk_id] [int] NULL
) ON [PRIMARY]
GO
