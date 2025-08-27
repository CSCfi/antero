USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 21.8.2025 13.46.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]') AND type in (N'U'))
  DROP TABLE [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO

CREATE TABLE [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[asuinmaakunta] [nvarchar](3) NULL,
	[kansalaisuus_versio1] [nvarchar](1) NULL,
	[pohjoismaa] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusmaakunta] [nvarchar](2) NULL,
	[koulutuksen_opetuskieli] [nvarchar](2) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusmuoto] [nvarchar](1) NULL,
	[oppisopimuskoulutus] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](1) NULL,
	[paaasiallinen_toiminta_versio6] [nvarchar](2) NULL,
	[ammattiluokitus_2001] [nvarchar](2) NULL,
	[ammattiluokitus_2010] [nvarchar](2) NULL,
	[tyossakayntitilaston_tyonantajasektori] [nvarchar](2) NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu_ka] [nvarchar](6) NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu_ta] [nvarchar](6) NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu_sama] [nvarchar](1) NULL,
	[aloittanut_ka_koulutuksen] [nvarchar](1) NULL,
	[aloittanut_ta_koulutuksen] [nvarchar](1) NULL,
	[tutkintoon_johtavassa_koulutuksessa] [nvarchar](1) NULL,
	[kk_ensim_koulutusaste] [nvarchar](2) NULL,
	[kk_ensim_hakuvuosi] [nvarchar](4) NULL,
	[ta_ensim_koulutusaste] [nvarchar](2) NULL,
	[ta_ensim_hakuvuosi] [nvarchar](4) NULL,
	[tutkinto_suoritettu_ulkomailla] [nvarchar](1) NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[vaeston_ika_1v] [nvarchar](10) NULL,
	[vaeston_ika_5v] [nvarchar](10) NULL,
	[tutkinnon_suoritusika_1v] [nvarchar](10) NULL,
	[tutkinnon_ika_1v] [nvarchar](10) NULL
) ON [PRIMARY]
GO


