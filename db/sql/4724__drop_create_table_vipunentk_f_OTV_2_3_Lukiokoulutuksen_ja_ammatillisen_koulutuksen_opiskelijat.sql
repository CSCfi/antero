USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_oppilaitos_kunta_historia__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_oppilaitos_historia__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_oppilaitoksen_kunta_historia__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_oppilaitoksen_kunta___d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_kunta_historia__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_historia__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__paattymispaivamaara__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__paattymispaivamaara__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__paattymispaivamaara__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__oppilaitos_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__opiskelijan_olo_tamm__d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__opiskelijan_olo_syys__d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__nuorten_aikuisten_koulutus_amm__d_nuorten_aikuisten_koulutus_amm]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_tutkinnon_aloitusvuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_tutkinnon_aloituskausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_kieli__d_kieli]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__kirjoihintulovuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__kirjoihintulokausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_yrittajan_oppisopimuskoulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_tyovoimapoliittinen_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_tyovoimapoliittinen]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_tyonantajasektori]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_tutkintonimike_ammpk]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_tutkinnon_tavoite]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_toimiala_2008]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_todistus_oppisopimuskoulutuksen_suorittamisesta]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_rahoituslahde_amm]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_oppisopimus_yrityksen_koko]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_oppisopimus_purkautunut]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_nuorten_aikuisten_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_lukiokoulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_lahde]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_koulutussektori]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_koulutusohjelma_ammpk]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_koulutuslaji_OKM]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_koulutuksen_tavoite_toteuma]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_koulutuksen_jarjestamismuoto]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__d_amm_sopimusjaksot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__d_ika_1v]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT IF EXISTS [FK__2_3__d_ika_5v]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_hallinnonala]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_ammatillinen_peruskoulutus_lisakoulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_aikuisopiskelija]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__asuinmaakunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__asuinmaakunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] DROP CONSTRAINT [FK__2_3__alkamispaivamaara__d_kausi]
GO

/****** Object:  Table [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 9.8.2021 22:17:29 ******/
DROP TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
GO

/****** Object:  Table [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 9.8.2021 22:17:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[lahde] [nvarchar](2) NULL,
	[lahde_id] [int] NULL,
	[oppilaitos] [nvarchar](10) NULL,
	[oppilaitos_id] [int] NULL,
	[oppilaitos_historia_id] [int] NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[koulutuksen_jarjestaja_id] [int] NULL,
	[koulutuksen_jarjestaja_historia_id] [int] NULL,
	[oppisopimuskoulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppisopimuskoulutuksen_jarjestaja_id] [int] NULL,
	[oppisopimuskoulutuksen_jarjestaja_historia_id] [int] NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kieli_id] [int] NULL,
	[koulutuksen_kunta] [nvarchar](3) NULL,
	[koulutuksen_kunta_id] [int] NULL,
	[koulutuksen_kunta_historia_id] [int] NULL,
	[opetushallinnon_koulutus] [nvarchar](2) NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[aidinkieli_versio1] [nvarchar](2) NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[kirjoihintulovuosi] [nvarchar](10) NULL,
	[jarjestys_kirjoihintulovuosi] [int] NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NULL,
	[kirjoihintulokausi] [nvarchar](2) NULL,
	[kirjoihintulokausi_id] [nvarchar](10) NULL,
	[opiskelijan_olo_tamm] [nvarchar](2) NULL,
	[opiskelijan_olo_tamm_id] [int] NULL,
	[opiskelijan_olo_syys] [nvarchar](2) NULL,
	[opiskelijan_olo_syys_id] [int] NULL,
	[aikuisopiskelija] [nvarchar](2) NULL,
	[aikuisopiskelija_id] [int] NULL,
	[ika_1v] [nvarchar](20) NULL,
	[ika_1v_id] [int] NULL,
	[ika_5v] [nvarchar](2) NULL,
	[ika_5v_id] [int] NULL,
	[lukumaara] [int] NULL,
	[lukiokoulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[lukiokoulutuksen_koulutuslaji_id] [int] NULL,
	[nuorten_aikuisten_koulutus] [nvarchar](2) NULL,
	[nuorten_aikuisten_koulutus_id] [int] NULL,
	[koulutuksen_tutkinnon_aloitusvuosi] [nvarchar](4) NULL,
	[koulutuksen_tutkinnon_aloitusvuosi_id] [nvarchar](10) NULL,
	[koulutuksen_tutkinnon_aloituskausi] [nvarchar](2) NULL,
	[koulutuksen_tutkinnon_aloituskausi_id] [nvarchar](10) NULL,
	[ammatillisen_koulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[ammatillisen_koulutuksen_koulutuslaji_id] [int] NULL,
	[tutkintonimike_ammpk] [nvarchar](5) NULL,
	[tutkintonimike_ammpk_id] [int] NULL,
	[koulutusohjelma_ammpk] [nvarchar](4) NULL,
	[koulutusohjelma_ammpk_id] [int] NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] [nvarchar](2) NULL,
	[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id] [int] NULL,
	[tyovoimapoliittinen_koulutus] [nvarchar](2) NULL,
	[tyovoimapoliittinen_koulutus_id] [int] NULL,
	[rahoituslahde_amm] [nvarchar](2) NULL,
	[rahoituslahde_amm_id] [int] NULL,
	[alkamispaivamaara] [nvarchar](8) NULL,
	[alkamispaivamaara_id] [nvarchar](10) NULL,
	[paattymispaivamaara] [nvarchar](8) NULL,
	[paattymispaivamaara_id] [nvarchar](10) NULL,
	[tutkinnon_tavoite] [nvarchar](2) NULL,
	[tutkinnon_tavoite_id] [int] NULL,
	[yrittajan_oppisopimuskoulutus] [nvarchar](2) NULL,
	[yrittajan_oppisopimuskoulutus_id] [int] NULL,
	[oppisopimus_purkautunut] [nvarchar](2) NULL,
	[oppisopimus_purkautunut_id] [int] NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta] [nvarchar](2) NULL,
	[todistus_oppisopimuskoulutuksen_suorittamisesta_id] [int] NULL,
	[toimiala_2008] [nvarchar](5) NULL,
	[toimiala_2008_id] [int] NULL,
	[oppisopimus_yrityksen_koko] [nvarchar](2) NULL,
	[oppisopimus_yrityksen_koko_id] [int] NULL,
	[tyonantajasektori] [nvarchar](2) NULL,
	[tyonantajasektori_id] [int] NULL,
	[asuinmaakunta] [nvarchar](2) NULL,
	[asuinmaakunta_id] [int] NULL,
	[asuinmaakunta_historia_id] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[koulutussektori] [nvarchar](2) NULL,
	[koulutussektori_id] [int] NULL,
	[hallinnonala] [nvarchar](2) NULL,
	[hallinnonala_id] [int] NULL,
	[hallinnonala2_id] [int] NULL,
	[koulutuksen_jarjestamismuoto] [nvarchar](2) NULL,
	[koulutuksen_jarjestamismuoto_id] [int] NULL,
	[amm_sopimusjaksot] [nvarchar](2) NULL,
	[amm_sopimusjaksot_id] [int] NULL,
	[ammatillinen_peruskoulutus_lisakoulutus] [nvarchar](2) NULL,
	[ammatillinen_peruskoulutus_lisakoulutus_id] [int] NULL,
	[koulutuksen_tavoite_toteuma] [nvarchar](2) NULL,
	[koulutuksen_tavoite_toteuma_id] [int] NULL,
	[tyovoimapoliittinen] [nvarchar](2) NULL,
	[tyovoimapoliittinen_id] [int] NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[opiskelijat_lasna] [int] NULL,
	[aineisto_id] [int] NULL,
	[aineisto_OTV_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[oppilaitos_kunta_id] [int] NULL,
	[oppilaitos_kunta_historia_id] [int] NULL,
	[nuorten_aikuisten_koulutus_amm_id] [int] NULL,
	[koulutuslaji_OKM_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_historia_id] [int] NULL,
	[yht_oppilaitos_id] [int] NULL,
	[yht_oppilaitos_historia_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_kunta_id] [int] NULL,
	[yht_koulutuksen_jarjestaja_kunta_historia_id] [int] NULL,
	[yht_oppilaitos_kunta_id] [int] NULL,
	[yht_oppilaitos_kunta_historia_id] [int] NULL,
	[yht_koulutuksen_kunta_id] [int] NULL,
	[yht_koulutuksen_kunta_historia_id] [int] NULL,
	[koulutusryhma_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__alkamispaivamaara__d_kausi] FOREIGN KEY([alkamispaivamaara_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__alkamispaivamaara__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__asuinmaakunta__d_alueluokitus] FOREIGN KEY([asuinmaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__asuinmaakunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__asuinmaakunta__d_alueluokitus_historia] FOREIGN KEY([asuinmaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__asuinmaakunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_aikuisopiskelija] FOREIGN KEY([aikuisopiskelija_id])
REFERENCES [dbo].[d_aikuisopiskelija] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_aikuisopiskelija]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_ammatillinen_peruskoulutus_lisakoulutus] FOREIGN KEY([ammatillinen_peruskoulutus_lisakoulutus_id])
REFERENCES [dbo].[d_ammatillinen_peruskoulutus_lisakoulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_ammatillinen_peruskoulutus_lisakoulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([ammatillisen_koulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_hallinnonala] FOREIGN KEY([hallinnonala_id])
REFERENCES [dbo].[d_hallinnonala] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_hallinnonala]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_ika_1v] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_ika_1v]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_ika_5v] FOREIGN KEY([ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_ika_5v]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutuksen_jarjestamismuoto] FOREIGN KEY([koulutuksen_jarjestamismuoto_id])
REFERENCES [dbo].[d_koulutuksen_jarjestamismuoto] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutuksen_jarjestamismuoto]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_amm_sopimusjaksot] FOREIGN KEY([amm_sopimusjaksot_id])
REFERENCES [dbo].[d_amm_sopimusjaksot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_amm_sopimusjaksot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutuksen_tavoite_toteuma] FOREIGN KEY([koulutuksen_tavoite_toteuma_id])
REFERENCES [dbo].[d_koulutuksen_tavoite_toteuma] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutuksen_tavoite_toteuma]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutuslaji_OKM] FOREIGN KEY([koulutuslaji_OKM_id])
REFERENCES [dbo].[d_koulutuslaji_okm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutuslaji_OKM]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutusohjelma_ammpk] FOREIGN KEY([koulutusohjelma_ammpk_id])
REFERENCES [dbo].[d_koulutusohjelma_ammpk] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutusohjelma_ammpk]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_koulutussektori] FOREIGN KEY([koulutussektori_id])
REFERENCES [dbo].[d_koulutussektori] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_koulutussektori]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_lahde] FOREIGN KEY([lahde_id])
REFERENCES [dbo].[d_lahde] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_lahde]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_lukiokoulutuksen_koulutuslaji] FOREIGN KEY([lukiokoulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_lukiokoulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_lukiokoulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_nuorten_aikuisten_koulutus] FOREIGN KEY([nuorten_aikuisten_koulutus_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_nuorten_aikuisten_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] FOREIGN KEY([opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_oppisopimus_purkautunut] FOREIGN KEY([oppisopimus_purkautunut_id])
REFERENCES [dbo].[d_oppisopimus_purkautunut] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_oppisopimus_purkautunut]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_oppisopimus_yrityksen_koko] FOREIGN KEY([oppisopimus_yrityksen_koko_id])
REFERENCES [dbo].[d_oppisopimus_yrityksen_koko] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_oppisopimus_yrityksen_koko]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_rahoituslahde_amm] FOREIGN KEY([rahoituslahde_amm_id])
REFERENCES [dbo].[d_rahoituslahde_amm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_rahoituslahde_amm]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_todistus_oppisopimuskoulutuksen_suorittamisesta] FOREIGN KEY([todistus_oppisopimuskoulutuksen_suorittamisesta_id])
REFERENCES [dbo].[d_todistus_oppisopimuskoulutuksen_suorittamisesta] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_todistus_oppisopimuskoulutuksen_suorittamisesta]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_toimiala_2008] FOREIGN KEY([toimiala_2008_id])
REFERENCES [dbo].[d_toimiala_2008] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_toimiala_2008]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_tutkinnon_tavoite] FOREIGN KEY([tutkinnon_tavoite_id])
REFERENCES [dbo].[d_tutkinnon_tavoite] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_tutkinnon_tavoite]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_tutkintonimike_ammpk] FOREIGN KEY([tutkintonimike_ammpk_id])
REFERENCES [dbo].[d_tutkintonimike_ammpk] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_tutkintonimike_ammpk]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_tyonantajasektori] FOREIGN KEY([tyonantajasektori_id])
REFERENCES [dbo].[d_tyonantajasektori] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_tyonantajasektori]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_tyovoimapoliittinen] FOREIGN KEY([tyovoimapoliittinen_id])
REFERENCES [dbo].[d_tyovoimapoliittinen] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_tyovoimapoliittinen]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_tyovoimapoliittinen_koulutus] FOREIGN KEY([tyovoimapoliittinen_koulutus_id])
REFERENCES [dbo].[d_tyovoimapoliittinen_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_tyovoimapoliittinen_koulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__d_yrittajan_oppisopimuskoulutus] FOREIGN KEY([yrittajan_oppisopimuskoulutus_id])
REFERENCES [dbo].[d_yrittajan_oppisopimuskoulutus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__d_yrittajan_oppisopimuskoulutus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__kirjoihintulokausi__d_kausi] FOREIGN KEY([kirjoihintulokausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__kirjoihintulokausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__kirjoihintulovuosi__d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__kirjoihintulovuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_jarjestaja_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_jarjestaja_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_jarjestaja_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_jarjestaja_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_kieli__d_kieli] FOREIGN KEY([koulutuksen_kieli_id])
REFERENCES [dbo].[d_kieli] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_kieli__d_kieli]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_kunta__d_alueluokitus] FOREIGN KEY([koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_kunta__d_alueluokitus_historia] FOREIGN KEY([koulutuksen_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_tutkinnon_aloituskausi__d_kausi] FOREIGN KEY([koulutuksen_tutkinnon_aloituskausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_tutkinnon_aloituskausi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__koulutuksen_tutkinnon_aloitusvuosi__d_kausi] FOREIGN KEY([koulutuksen_tutkinnon_aloitusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__koulutuksen_tutkinnon_aloitusvuosi__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__nuorten_aikuisten_koulutus_amm__d_nuorten_aikuisten_koulutus_amm] FOREIGN KEY([nuorten_aikuisten_koulutus_amm_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus_amm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__nuorten_aikuisten_koulutus_amm__d_nuorten_aikuisten_koulutus_amm]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__opiskelijan_olo_syys__d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_syys_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__opiskelijan_olo_syys__d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__opiskelijan_olo_tamm__d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_tamm_id])
REFERENCES [dbo].[d_opiskelijan_olo_tamm] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__opiskelijan_olo_tamm__d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__oppilaitos__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__oppilaitos__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__oppilaitos_kunta__d_alueluokitus] FOREIGN KEY([oppilaitos_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__oppilaitos_kunta__d_alueluokitus_historia] FOREIGN KEY([oppilaitos_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__oppilaitos_kunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppisopimuskoulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([oppisopimuskoulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__oppisopimuskoulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__paattymispaivamaara__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__paattymispaivamaara__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__paattymispaivamaara__d_aineisto_OTV] FOREIGN KEY([aineisto_OTV_id])
REFERENCES [dbo].[d_aineisto_OTV] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__paattymispaivamaara__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__paattymispaivamaara__d_kausi] FOREIGN KEY([paattymispaivamaara_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__paattymispaivamaara__d_kausi]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot] FOREIGN KEY([yht_koulutuksen_jarjestaja_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_historia__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([yht_koulutuksen_jarjestaja_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_historia__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_kunta__d_alueluokitus] FOREIGN KEY([yht_koulutuksen_jarjestaja_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_kunta_historia__d_alueluokitus_historia] FOREIGN KEY([yht_koulutuksen_jarjestaja_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_koulutuksen_jarjestaja_kunta_historia__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_oppilaitoksen_kunta___d_alueluokitus_historia] FOREIGN KEY([yht_oppilaitos_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_oppilaitoksen_kunta___d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_oppilaitoksen_kunta_historia__d_alueluokitus_historia] FOREIGN KEY([yht_oppilaitos_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_oppilaitoksen_kunta_historia__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_oppilaitos__d_oppilaitoksen_taustatiedot] FOREIGN KEY([yht_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_oppilaitos__d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_oppilaitos_historia__d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([yht_oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_oppilaitos_historia__d_oppilaitoksen_taustatiedot_historia]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_oppilaitos_kunta__d_alueluokitus] FOREIGN KEY([yht_koulutuksen_kunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_oppilaitos_kunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]  WITH CHECK ADD  CONSTRAINT [FK__2_3__yht_oppilaitos_kunta_historia__d_alueluokitus_historia] FOREIGN KEY([yht_koulutuksen_kunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] CHECK CONSTRAINT [FK__2_3__yht_oppilaitos_kunta_historia__d_alueluokitus_historia]
GO


