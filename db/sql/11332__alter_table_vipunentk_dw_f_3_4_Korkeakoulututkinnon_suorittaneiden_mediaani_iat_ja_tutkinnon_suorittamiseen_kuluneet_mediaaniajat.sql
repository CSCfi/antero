USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]    Script Date: 30.10.2025 9.54.22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]') AND type in (N'U'))
  DROP TABLE [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]
GO

CREATE TABLE [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutustyyppi] [nvarchar](2) NULL,
	[rahoituslahde] [nvarchar](2) NULL,
	[kv_opiskelija] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymakuukausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulovuosi_korkeakoulu] [nvarchar](4) NULL,
	[kirjoihintulokausi_korkeakoulu] [nvarchar](2) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suorituskuukausi] [nvarchar](2) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[ika_1v] [nvarchar](4) NULL,
	[suoritusika] [decimal](18, 6) NULL,
	[jarjestys_suoritusika] [int] NULL,
	[suoritusaika] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[suoritusaika_kk] [decimal](18, 6) NULL,
	[jarjestys_suoritusaika_kk] [int] NULL,
	[tutkinnot] [int] NULL,
	[koulutuslaji_OKM_avain] [nvarchar](2) NULL
) ON [PRIMARY]
GO


