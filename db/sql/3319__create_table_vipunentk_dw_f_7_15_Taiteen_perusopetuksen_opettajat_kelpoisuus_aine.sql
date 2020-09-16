USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]    Script Date: 26.2.2020 21:01:15 ******/
DROP TABLE IF EXISTS [dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
GO

/****** Object:  Table [dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]    Script Date: 26.2.2020 21:01:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[t_okieli] [nvarchar](4) NULL,
	[t_tyos] [nvarchar](3) NULL,
	[t_virka] [nvarchar](3) NULL,
	[t_kelp] [nvarchar](3) NULL,
	[t_p1] [nvarchar](3) NULL,
	[t_p2] [nvarchar](3) NULL,
	[t_otaso] [nvarchar](3) NULL,
	[t_ala1] [nvarchar](3) NULL,
	[t_aine1] [nvarchar](3) NULL,
	[t_sp] [nvarchar](2) NULL,
	[t_maakunta] [nvarchar](2) NULL,
	[t_okunryh] [nvarchar](2) NULL,
	[t_ika] [nvarchar](10) NULL,
	[t_osa1] [nvarchar](10) NULL,
	[t_osa2] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]