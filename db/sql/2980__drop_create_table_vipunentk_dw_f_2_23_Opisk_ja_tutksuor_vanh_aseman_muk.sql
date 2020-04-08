USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 8.4.2020 15:37:32 ******/
DROP TABLE [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]
GO

/****** Object:  Table [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 8.4.2020 15:37:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[sosioekonominen_asema_1_isa] [nvarchar](1) NULL,
	[sosioekonominen_asema_1_aiti] [nvarchar](1) NULL,
	[sosioekonominen_asema_2_isa] [nvarchar](2) NULL,
	[sosioekonominen_asema_2_aiti] [nvarchar](2) NULL,
	[koulutusluokitus_isa] [nvarchar](6) NULL,
	[koulutusluokitus_aiti] [nvarchar](6) NULL,
	[tulodesiili_isa] [nvarchar](2) NULL,
	[tulodesiili_aiti] [nvarchar](2) NULL,
	[sosioekonominen_tausta] [int] NULL,
	[koulutuslaji] [nvarchar](2) NULL,
	[opetushallinnon_koulutus] [nvarchar](6) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_maakunta] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoillaolo_olosyys] [nvarchar](1) NULL,
	[opetushallinnon_koulutus2] [nvarchar](2) NULL,
	[uudet_opiskelijat] [int] NULL,
	[opiskelijat] [int] NULL,
	[tutkinnot] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_5v] [nvarchar](10) NULL
) ON [PRIMARY]

GO


USE [ANTERO]