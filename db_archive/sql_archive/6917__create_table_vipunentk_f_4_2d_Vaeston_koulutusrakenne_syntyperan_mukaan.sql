USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan]    Script Date: 17.1.2023 21:43:13 ******/
DROP TABLE IF EXISTS [dbo].[f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan]
GO

/****** Object:  Table [dbo].[f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan]    Script Date: 17.1.2023 21:43:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sp] [nvarchar](2) NULL,
	[sp_id] [int] NULL,
	[aikielir1] [nvarchar](2) NULL,
	[aikielir1_id] [int] NULL,
	[ikar8] [nvarchar](2) NULL,
	[ikar8_id] [int] NULL,
	[tilvasmaak] [nvarchar](2) NULL,
	[tilvasmaak_id] [int] NULL,
	[kansalr2] [nvarchar](2) NULL,
	[kansalr2_id] [int] NULL,
	[syntyp2] [nvarchar](2) NULL,
	[syntyp2_id] [int] NULL,
	[suormaak] [nvarchar](2) NULL,
	[suormaak_id] [int] NULL,
	[iscfi2013] [nvarchar](4) NULL,
	[iscfi2013_id] [int] NULL,
	[kaste_t2] [nvarchar](2) NULL,
	[kaste_t2_id] [int] NULL,
	[kouljat] [nvarchar](2) NULL,
	[kouljat_id] [int] NULL,
	[oppis] [nvarchar](2) NULL,
	[oppis_id] [int] NULL,
	[tutklaja_tr] [nvarchar](2) NULL,
	[tutklaja_tr_id] [int] NULL,
	[opso] [nvarchar](2) NULL,
	[opso_id] [int] NULL,
	[koso] [nvarchar](2) NULL,
	[koso_id] [int] NULL,
	[lkm] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


