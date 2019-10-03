USE [VipunenTK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__isan_syntymamaa_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_tutkinnon_toteuma]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_syntymamaa_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_sukupuoli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opiskelijan_olo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opetushallinnon_koulutus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maassaolo]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_toisen_asteen_koul_aloittaminen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_kork_koul_aloittaminen]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusryhma]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutuksen_opetuskieli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kieli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kansalaisuus_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_ika]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_hetu_ok]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_edeltavan_vuoden_asuinpaikka]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_asuinkunta_sama_vai_eri_kuin_aiemmin_id]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aineisto]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio2]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] DROP CONSTRAINT IF EXISTS [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidin_syntymamaa_id]
GO
/****** Object:  Table [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:57:15 ******/
DROP TABLE IF EXISTS [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:57:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilastovuosi] [varchar](4) NULL,
	[sukupuoli_id] [int] NULL,
	[syntymavuosi] [varchar](10) NULL,
	[jarjestys_syntymavuosi] [int] NULL,
	[kotikunta_id] [int] NULL,
	[kotikunta_historia_id] [int] NULL,
	[asuinkunta_sama_vai_eri_kuin_aiemmin_id] [int] NULL,
	[edeltavan_vuoden_asuinpaikka_id] [int] NULL,
	[suomeen_muuttamisvuosi] [varchar](30) NULL,
	[jarjestys_suomeen_muuttamisvuosi] [int] NULL,
	[aidinkieli_versio4_id] [int] NULL,
	[kansalaisuus_id] [int] NULL,
	[syntymamaa_id] [int] NULL,
	[aidin_syntymamaa_id] [int] NULL,
	[isan_syntymamaa_id] [int] NULL,
	[henkilotunnuksen_oikeellisuus_id] [int] NULL,
	[koulutusryhma_id] [int] NULL,
	[opetushallinnon_koulutus_id] [int] NULL,
	[koulutusluokitus_id] [int] NULL,
	[koulutusluokitus_historia_id] [int] NULL,
	[koulutusala_taso2_id] [int] NULL,
	[koulutuksen_opetuskieli_id] [int] NULL,
	[koulutuksen_sijaintikunta_id] [int] NULL,
	[koulutuksen_sijaintikunta_historia_id] [int] NULL,
	[tutkinnon_aloittamisvuosi] [varchar](10) NULL,
	[jarjestys_tutkinnon_aloittamisvuosi] [int] NULL,
	[opiskelijan_olo_id] [int] NULL,
	[maassaolo_id] [int] NULL,
	[tutkinnon_toteuma_id] [int] NULL,
	[aineisto_id] [int] NULL,
	[koulutussektori_id] [int] NULL,
	[ika_id] [int] NULL,
	[ikaryhma1_id] [int] NULL,
	[ikaryhma2_id] [int] NULL,
	[suoritusaika] [varchar](10) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[aidinkieli_versio1_id] [int] NULL,
	[aidinkieli_versio2_id] [int] NULL,
	[maahantulo_ja_toisen_asteen_koul_aloittaminen_id] [int] NULL,
	[maahantulo_ja_korkeakoulutuksen_aloittaminen_id] [int] NULL,
	[koulutuksen_jarjestamismuoto_id] [int] NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[tutkinnot] [int] NULL,
	[aloittaneet_ulkomaalaistausta_kielen_mukaan] [int] NULL,
	[opiskelijat_ulkomaalaistausta_kielen_mukaan] [int] NULL,
	[tutkinnot_ulkomaalaistausta_kielen_mukaan] [int] NULL,
	[aloittaneet_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] [int] NULL,
	[opiskelijat_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] [int] NULL,
	[tutkinnot_ulkomaalaistausta_vanhempien_synnyinmaan_mukaan] [int] NULL,
	[aloittaneet_ulkomaalaiset] [int] NULL,
	[opiskelijat_ulkomaalaiset] [int] NULL,
	[tutkinnot_ulkomaalaiset] [int] NULL,
	[aloittaneet_ulkomailla_syntyneet] [int] NULL,
	[opiskelijat_ulkomailla_syntyneet] [int] NULL,
	[tutkinnot_ulkomailla_syntyneet] [int] NULL,
	[hallinnonala2_id] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidin_syntymamaa_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidin_syntymamaa_id] FOREIGN KEY([aidin_syntymamaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidin_syntymamaa_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidin_syntymamaa_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio2]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio2] FOREIGN KEY([aidinkieli_versio2_id])
REFERENCES [dbo].[d_aidinkieli_versio2] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio2]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aidinkieli_versio2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aineisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aineisto]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_aineisto]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_historia] FOREIGN KEY([kotikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul] FOREIGN KEY([koulutuksen_sijaintikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul_historia] FOREIGN KEY([koulutuksen_sijaintikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_alueluokitus_koul_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_asuinkunta_sama_vai_eri_kuin_aiemmin_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_asuinkunta_sama_vai_eri_kuin_aiemmin_id] FOREIGN KEY([asuinkunta_sama_vai_eri_kuin_aiemmin_id])
REFERENCES [dbo].[d_asuinkunta_sama_vai_eri_kuin_aiemmin] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_asuinkunta_sama_vai_eri_kuin_aiemmin_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_asuinkunta_sama_vai_eri_kuin_aiemmin_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_edeltavan_vuoden_asuinpaikka]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_edeltavan_vuoden_asuinpaikka] FOREIGN KEY([edeltavan_vuoden_asuinpaikka_id])
REFERENCES [dbo].[d_edeltavan_vuoden_asuinpaikka] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_edeltavan_vuoden_asuinpaikka]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_edeltavan_vuoden_asuinpaikka]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_hetu_ok]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_hetu_ok] FOREIGN KEY([henkilotunnuksen_oikeellisuus_id])
REFERENCES [dbo].[d_hetu_ok] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_hetu_ok]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_hetu_ok]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kansalaisuus_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kansalaisuus_id] FOREIGN KEY([kansalaisuus_id])
REFERENCES [dbo].[d_valtio] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kansalaisuus_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kansalaisuus_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kieli] FOREIGN KEY([aidinkieli_versio4_id])
REFERENCES [dbo].[d_kieli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_kieli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutuksen_opetuskieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutuksen_opetuskieli] FOREIGN KEY([koulutuksen_opetuskieli_id])
REFERENCES [dbo].[d_kieli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutuksen_opetuskieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutuksen_opetuskieli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusryhma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusryhma] FOREIGN KEY([koulutusryhma_id])
REFERENCES [dbo].[d_koulutusryhma] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusryhma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_koulutusryhma]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_kork_koul_aloittaminen]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_kork_koul_aloittaminen] FOREIGN KEY([maahantulo_ja_korkeakoulutuksen_aloittaminen_id])
REFERENCES [dbo].[d_maahantulo_ja_opiskelun_aloittaminen] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_kork_koul_aloittaminen]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_kork_koul_aloittaminen]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_toisen_asteen_koul_aloittaminen]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_toisen_asteen_koul_aloittaminen] FOREIGN KEY([maahantulo_ja_toisen_asteen_koul_aloittaminen_id])
REFERENCES [dbo].[d_maahantulo_ja_opiskelun_aloittaminen] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_toisen_asteen_koul_aloittaminen]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maahantulo_ja_toisen_asteen_koul_aloittaminen]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maassaolo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maassaolo] FOREIGN KEY([maassaolo_id])
REFERENCES [dbo].[d_maassaolo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maassaolo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_maassaolo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opetushallinnon_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opetushallinnon_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opetushallinnon_koulutus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opiskelijan_olo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opiskelijan_olo]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_opiskelijan_olo]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_sukupuoli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_syntymamaa_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_syntymamaa_id] FOREIGN KEY([syntymamaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_syntymamaa_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_syntymamaa_id]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_tutkinnon_toteuma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_tutkinnon_toteuma] FOREIGN KEY([tutkinnon_toteuma_id])
REFERENCES [dbo].[d_tutkinnon_toteuma] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_tutkinnon_toteuma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__d_tutkinnon_toteuma]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__isan_syntymamaa_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]  WITH CHECK ADD  CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__isan_syntymamaa_id] FOREIGN KEY([isan_syntymamaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__isan_syntymamaa_id]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]'))
ALTER TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk] CHECK CONSTRAINT [f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk__isan_syntymamaa_id]
GO
USE [ANTERO]