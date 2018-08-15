USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[f_3_2_Oppisopimus_jatko_opinnot]     ******/
DROP TABLE IF EXISTS [dbo].[f_3_2_Oppisopimus_jatko_opinnot]
GO
/****** Object:  Table [dbo].[f_3_2_Oppisopimus_jatko_opinnot]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_2_Oppisopimus_jatko_opinnot]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[f_3_2_Oppisopimus_jatko_opinnot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](10) NULL,
	[ika] [nvarchar](7) NULL,
	[opetushallinnon_koulutusala] [nvarchar](1) NULL,
	[koulutusala_taso_1_avain] [nvarchar](12) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[jatko_opintojen_koulutusaste] [nvarchar](2) NULL,
	[jatko_opintojen_koulutusaste_taso_2_avain] [nvarchar](9) NULL,
	[opiskelijat] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[jatko_opiskelu] [nvarchar](2) NULL,
	[koulutusaste2002] [nvarchar](2) NULL,
	[jatko_opiskelun_koulutusala] [nvarchar](1) NULL,
	[koulutusaste_taso_2_avain] [nvarchar](9) NULL,
	[jatko_opintojen_koulutusala_taso_1_avain] [nvarchar](12) NULL
) ON [PRIMARY]

GO
END
GO
USE [ANTERO]