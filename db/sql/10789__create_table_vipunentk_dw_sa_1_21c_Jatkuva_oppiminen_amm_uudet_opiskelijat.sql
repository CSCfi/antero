USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]    Script Date: 28.5.2025 11.17.09 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]') AND type in (N'U'))
DROP TABLE [dbo].[sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]
GO

/****** Object:  Table [dbo].[sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat]    Script Date: 28.5.2025 11.17.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sa_1_21c_Jatkuva_oppiminen_amm_uudet_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[sp] [nvarchar](2) NULL,
	[ikar8] [nvarchar](2) NULL,
	[ptoim1r6e] [nvarchar](2) NULL,
	[sosee] [nvarchar](2) NULL,
	[tavoite] [nvarchar](2) NULL,
	[tyov] [nvarchar](2) NULL,
	[kaste_t2_3] [nvarchar](2) NULL,
	[iscfibroad2013] [nvarchar](2) NULL,
	[koulk] [nvarchar](6) NULL,
	[koulknimi] [nvarchar](255) NULL,
	[aiktutk] [nvarchar](2) NULL,
	[kaste_t2_tr] [nvarchar](2) NULL,
	[lkm] [int] NULL,
	[aineisto] [nvarchar](50) NULL
) ON [PRIMARY]
GO
