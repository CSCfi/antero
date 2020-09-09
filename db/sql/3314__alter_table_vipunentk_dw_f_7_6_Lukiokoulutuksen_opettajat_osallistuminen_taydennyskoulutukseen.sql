USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 4.2.2020 14:57:06 ******/
DROP TABLE [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 4.2.2020 14:57:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[l_okieli] [nvarchar](2) NULL,
	[l_virka] [nvarchar](2) NULL,
	[l_taydjo] [nvarchar](2) NULL,
	[l_taydeit] [nvarchar](2) NULL,
	[l_eitayd] [nvarchar](2) NULL,
	[l_tutktyo] [nvarchar](4) NULL,
	[l_tutkoma] [nvarchar](4) NULL,
	[l_pattyo] [nvarchar](4) NULL,
	[l_patoma] [nvarchar](4) NULL,
	[l_henktyo] [nvarchar](4) NULL,
	[l_henkoma] [nvarchar](4) NULL,
	[l_muutyo] [nvarchar](4) NULL,
	[l_muuoma] [nvarchar](4) NULL,
	[l_kanstyo] [nvarchar](4) NULL,
	[l_kansoma] [nvarchar](4) NULL,
	[l_kehsuu] [nvarchar](2) NULL,
	[l_sp] [nvarchar](2) NULL,
	[l_maakunta] [nvarchar](3) NULL,
	[l_ika] [nvarchar](10) NULL,
	[l_mento1] [nvarchar](50) NULL,
	[l_mento2] [nvarchar](50) NULL,
	[l_mento3] [nvarchar](50) NULL,
	[l_mento4] [nvarchar](50) NULL,
	[l_tyonoh1] [nchar](10) NULL,
	[l_tyonoh2] [nchar](10) NULL,
	[l_tyonoh3] [nchar](10) NULL,
	[l_tunnit] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]