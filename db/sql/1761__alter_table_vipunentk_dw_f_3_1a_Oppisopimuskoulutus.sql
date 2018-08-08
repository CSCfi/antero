USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 6.7.2018 15:15:15 ******/
DROP TABLE IF EXISTS [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 6.7.2018 15:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppisryh] [nvarchar](8) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](10) NULL,
	[ika] [nvarchar](7) NULL,
	[opetushallinnon_koulutusala] [nvarchar](1) NULL,
	[opetushallinnon_koulutusaste] [nvarchar](2) NULL,
	[koulutusala_taso_1_avain] [nvarchar](12) NULL,
	[koulutusaste_taso_2][nvarchar](9) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](1) NULL,
	[koulutuksen_sijaintimaakunta] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_versio3] [nvarchar](2) NULL,
	[ammattiasema] [nvarchar](1) NULL,
	[opiskelijat] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]