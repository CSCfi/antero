USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 6.2.2020 12:40:25 ******/
DROP TABLE [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 6.2.2020 12:40:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[v_okieli] [nvarchar](4) NULL,
	[v_virka] [nvarchar](4) NULL,
	[v_taydjo] [nvarchar](4) NULL,
	[v_taydeit] [nvarchar](4) NULL,
	[v_eitayd] [nvarchar](4) NULL,
	[v_tutktyo] [nvarchar](3) NULL,
	[v_tutkoma] [nvarchar](3) NULL,
	[v_pattyo] [nvarchar](3) NULL,
	[v_patoma] [nvarchar](3) NULL,
	[v_henktyo] [nvarchar](3) NULL,
	[v_henkoma] [nvarchar](3) NULL,
	[v_muutyo] [nvarchar](3) NULL,
	[v_muuoma] [nvarchar](3) NULL,
	[v_kanstyo] [nvarchar](3) NULL,
	[v_kansoma] [nvarchar](3) NULL,
	[v_kehsuu] [nvarchar](3) NULL,
	[v_sp] [nvarchar](2) NULL,
	[v_maakunta] [nvarchar](2) NULL,
	[v_ika] [nvarchar](10) NULL,
	[v_mento1] [nvarchar](2) NULL,
	[v_mento2] [nvarchar](2) NULL,
	[v_mento3] [nvarchar](2) NULL,
	[v_mento4] [nvarchar](2) NULL,
	[v_tyonoh1] [nvarchar](2) NULL,
	[v_tyonoh2] [nvarchar](2) NULL,
	[v_tyonoh3] [nvarchar](2) NULL,
	[v_tunnit] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]