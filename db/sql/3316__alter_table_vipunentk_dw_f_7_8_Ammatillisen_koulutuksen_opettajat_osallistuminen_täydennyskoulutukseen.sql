USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 13.2.2020 15:20:39 ******/
DROP TABLE [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 13.2.2020 15:20:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[a_okieli] [nvarchar](2) NULL,
	[a_virka] [nvarchar](2) NULL,
	[a_aste] [nvarchar](2) NULL,
	[a_ala108] [nvarchar](2) NULL,
	[a_taydjo] [nvarchar](2) NULL,
	[a_taydeit] [nvarchar](2) NULL,
	[a_eitayd] [nvarchar](2) NULL,
	[a_tutktyo] [nvarchar](3) NULL,
	[a_tutkoma] [nvarchar](3) NULL,
	[a_pattyo] [nvarchar](3) NULL,
	[a_patoma] [nvarchar](3) NULL,
	[a_henktyo] [nvarchar](3) NULL,
	[a_henkoma] [nvarchar](3) NULL,
	[a_muutyo] [nvarchar](3) NULL,
	[a_muuoma] [nvarchar](3) NULL,
	[a_kanstyo] [nvarchar](3) NULL,
	[a_kansoma] [nvarchar](3) NULL,
	[a_kehsuu] [nvarchar](2) NULL,
	[tyojakp] [nvarchar](3) NULL,
	[eityojak] [nvarchar](2) NULL,
	[tyojakeit] [nvarchar](2) NULL,
	[a_sp] [nvarchar](2) NULL,
	[a_maakunta] [nvarchar](2) NULL,
	[a_ika] [nvarchar](10) NULL,
	[a_mento1] [nvarchar](2) NULL,
	[a_mento2] [nvarchar](2) NULL,
	[a_mento3] [nvarchar](2) NULL,
	[a_mento4] [nvarchar](2) NULL,
	[a_tyonoh1] [nvarchar](2) NULL,
	[a_tyonoh2] [nvarchar](2) NULL,
	[a_tyonoh3] [nvarchar](2) NULL,
	[a_tyojak] [nvarchar](2) NULL,
	[a_tyojak1] [nvarchar](2) NULL,
	[a_tyojak2] [nvarchar](2) NULL,
	[a_tyojak3] [nvarchar](2) NULL,
	[a_tyojak4] [nvarchar](2) NULL,
	[a_tyopk] [nvarchar](2) NULL,
	[a_tyopk1] [nvarchar](2) NULL,
	[a_tyopk2] [nvarchar](2) NULL,
	[a_tyopk3] [nvarchar](2) NULL,
	[a_tyopk4] [nvarchar](2) NULL,
	[a_tunnit] [nvarchar](2) NULL,
	[a_tunnit_amm1] [nvarchar](2) NULL,
	[a_tunnit_amm2] [nvarchar](2) NULL,
	[a_tunnit_amm3] [nvarchar](2) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO


USE [ANTERO]