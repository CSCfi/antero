USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 28.1.2025 14.49.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]') AND type in (N'U')) 
   DROP TABLE [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
GO

CREATE TABLE [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[Tutkimusmenot_yhteensa] [decimal](8, 3) NULL,
	[Kayttomenot_yhteensa] [decimal](8, 3) NULL,
	[Kayttomenoista_palkat] [decimal](8, 3) NULL,
	[Kayttomenoista_apurahat] [decimal](8, 3) NULL,
	[Laskettu_muutkayttomenot] [decimal](10, 3) NULL,
	[Menot_laitehankinnat] [decimal](8, 3) NULL,
	[OKM_perusrahoitus] [decimal](8, 3) NULL,
	[SuomenAkatemia] [decimal](8, 3) NULL,
	[Muu_OKM] [decimal](8, 3) NULL,
	[TEKES] [decimal](8, 3) NULL,
	[Muu_TEM] [decimal](8, 3) NULL,
	[UM] [decimal](8, 3) NULL,
	[OM] [decimal](8, 3) NULL,
	[SM] [decimal](8, 3) NULL,
	[PM] [decimal](8, 3) NULL,
	[VM] [decimal](8, 3) NULL,
	[MMM] [decimal](8, 3) NULL,
	[LVM] [decimal](8, 3) NULL,
	[STM] [decimal](8, 3) NULL,
	[YM] [decimal](8, 3) NULL,
	[Kunnat] [decimal](8, 3) NULL,
	[Muu_julkinen_rahoitus] [decimal](8, 3) NULL,
	[Kotimaiset_rahastot] [decimal](8, 3) NULL,
	[Kotimaiset_yritykset] [decimal](8, 3) NULL,
	[Ulkomaiset_yritykset] [decimal](8, 3) NULL,
	[EU_puiteohjelmarahoitus] [decimal](8, 3) NULL,
	[EU_aluekehitysrahoitus] [decimal](8, 3) NULL,
	[EU_sosiaalirahasto] [decimal](8, 3) NULL,
	[Muu_EU] [decimal](8, 3) NULL,
	[Ulkomaiset_rahastot] [decimal](8, 3) NULL,
	[Kansainvaliset_jarjestot] [decimal](8, 3) NULL,
	[Muu_ulkomainen_rahoitus] [decimal](8, 3) NULL,
	[Korkeakoulun_omat_varat] [decimal](8, 3) NULL,
	[Muut_kotimaiset_korkeakoulut] [decimal](8, 3) NULL,
	[Hyvinvointialueet] [decimal](8, 3) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
GO


