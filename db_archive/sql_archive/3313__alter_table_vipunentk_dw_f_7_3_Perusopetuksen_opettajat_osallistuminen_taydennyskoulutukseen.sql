USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 30.1.2020 17:13:04 ******/
DROP TABLE [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 30.1.2020 17:13:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[p_okieli] [nvarchar](2) NULL,
	[p_virka] [nvarchar](2) NULL,
	[p_taydjo] [nvarchar](2) NULL,
	[p_taydeit] [nvarchar](2) NULL,
	[p_eitayd] [nvarchar](2) NULL,
	[p_tutktyo] [nvarchar](4) NULL,
	[p_tutkoma] [nvarchar](4) NULL,
	[p_pattyo] [nvarchar](4) NULL,
	[p_patoma] [nvarchar](4) NULL,
	[p_henktyo] [nvarchar](4) NULL,
	[p_henkoma] [nvarchar](4) NULL,
	[p_muutyo] [nvarchar](4) NULL,
	[p_muuoma] [nvarchar](4) NULL,
	[p_kanstyo] [nvarchar](4) NULL,
	[p_kansoma] [nvarchar](4) NULL,
	[p_kehsuu] [nvarchar](2) NULL,
	[p_sp] [nvarchar](2) NULL,
	[p_maakunta] [nvarchar](3) NULL,
	[p_ika] [nvarchar](10) NULL,
	[p_mento1] [nvarchar](50) NULL,
	[p_mento2] [nvarchar](50) NULL,
	[p_mento3] [nvarchar](50) NULL,
	[p_mento4] [nvarchar](50) NULL,
	[p_tyonoh1] [nchar](10) NULL,
	[p_tyonoh2] [nchar](10) NULL,
	[p_tyonoh3] [nchar](10) NULL,
	[p_tunnit] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]