USE [VipunenTK_DW]
GO

/****** Object:  Table [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 5.5.2022 20:54:26 ******/
DROP TABLE [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO

/****** Object:  Table [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 5.5.2022 20:54:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](2) NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[kansalaisuus_versio1] [nvarchar](1) NULL,
	[pohjoismaa] [nvarchar](1) NULL,
	[eumaa] [nvarchar](1) NULL,
	[etamaa] [nvarchar](1) NULL,
	[tutkinnon_suoritusvuosi] [nvarchar](4) NULL,
	[tutkinnon_suoritusmaakunta] [nvarchar](2) NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusmuoto] [nvarchar](1) NULL,
	[oppisopimuskoulutus] [nvarchar](1) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa] [nvarchar](1) NULL,
	[paaasiallinen_toiminta_versio6] [nvarchar](2) NULL,
	[ammattiluokitus_2001] [nvarchar](2) NULL,
	[ammattiluokitus_2010] [nvarchar](2) NULL,
	[tyossakayntitilaston_tyonantajasektori] [nvarchar](2) NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu] [nvarchar](6) NULL,
	[koulutusluokitus_korkein_viimeisin_aloitettu_sama] [nvarchar](1) NULL,
	[tutkintoon_johtavassa_koulutuksessa] [nvarchar](1) NULL,
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


