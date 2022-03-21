USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 25.2.2020 20:16:56 ******/
DROP TABLE IF EXISTS [dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 25.2.2020 20:16:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[t_okieli] [nvarchar](4) NULL,
	[t_virka] [nvarchar](4) NULL,
	[t_tayd] [nvarchar](4) NULL,
	[t_tayd_oa] [nvarchar](4) NULL,
	[t_tutktyo] [nvarchar](3) NULL,
	[t_tutkoma] [nvarchar](3) NULL,
	[t_pattyo] [nvarchar](3) NULL,
	[t_patoma] [nvarchar](3) NULL,
	[t_henktyo] [nvarchar](3) NULL,
	[t_henkoma] [nvarchar](3) NULL,
	[t_muutyo] [nvarchar](3) NULL,
	[t_muuoma] [nvarchar](3) NULL,
	[t_kanstyo] [nvarchar](3) NULL,
	[t_kansoma] [nvarchar](3) NULL,
	[t_kehsuu] [nvarchar](3) NULL,
	[t_sp] [nvarchar](2) NULL,
	[t_maakunta] [nvarchar](2) NULL,
	[t_ika] [nvarchar](10) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]