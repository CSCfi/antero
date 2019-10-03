USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]    Script Date: 22.12.2017 9:30:55 ******/
DROP TABLE [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
GO
/****** Object:  Table [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]    Script Date: 22.12.2017 9:30:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[p_okieli] [nvarchar](2) NULL,
	[p_oltyp] [nvarchar](2) NULL,
	[p_tyos1] [nvarchar](2) NULL,
	[p_tyos2] [nvarchar](2) NULL,
	[p_tyos3] [nvarchar](2) NULL,
	[p_tyos4] [nvarchar](2) NULL,
	[p_tyos5] [nvarchar](2) NULL,
	[p_tyos] [nvarchar](50) NULL,
	[p_virka] [nvarchar](2) NULL,
	[p_aste] [nvarchar](2) NULL,
	[p_k1] [nvarchar](2) NULL,
	[p_k2] [nvarchar](2) NULL,
	[p_k3] [nvarchar](2) NULL,
	[p_k4] [nvarchar](2) NULL,
	[p_k5] [nvarchar](2) NULL,
	[p_k6] [nvarchar](2) NULL,
	[p_k7] [nvarchar](2) NULL,
	[p_k8] [nvarchar](2) NULL,
	[p_k9] [nvarchar](2) NULL,
	[p_k10] [nvarchar](2) NULL,
	[p_k11] [nvarchar](2) NULL,
	[p_olaste] [nvarchar](2) NULL,
	[p_oluom] [int] NULL,
	[p_aine] [nvarchar](2) NULL,
	[p_sp] [nvarchar](10) NULL,
	[p_maakunta] [varchar](2) NULL,
	[p_okunryh] [nvarchar](10) NULL,
	[p_ika] [nvarchar](10) NULL,
	[p_kelpu] [nvarchar](10) NULL,
	[p_osa1] [nchar](10) NULL,
	[p_osa2] [nchar](10) NULL,
	[p_opetus] [int] NULL,
	[p_resu1] [int] NULL,
	[p_resu2] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO
USE [ANTERO]