USE [VipunenTK_DW]
GO
/****** Object:  Table [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:55:59 ******/
DROP TABLE IF EXISTS [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 23.3.2018 8:55:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk](
	[tilastovuosi] [varchar](4) NULL,
	[sukupuoli_avain] [varchar](1) NULL,
	[syntymavuosi] [varchar](10) NULL,
	[jarjestys_syntymavuosi] [int] NULL,
	[kotikunta_avain] [varchar](3) NULL,
	[kotikunta_sama_kuin_edeltavana_vuonna_avain] [varchar](1) NULL,
	[edeltavan_vuoden_asuinpaikka_avain] [varchar](1) NULL,
	[suomeen_muuttamisvuosi] [varchar](30) NULL,
	[jarjestys_suomeen_muuttamisvuosi] [int] NULL,
	[aidinkieli_versio4_avain] [varchar](2) NULL,
	[kansalaisuus_avain] [varchar](3) NULL,
	[syntymamaa_avain] [varchar](3) NULL,
	[aidin_syntymamaa_avain] [varchar](3) NULL,
	[isan_syntymamaa_avain] [varchar](3) NULL,
	[henkilotunnuksen_oikeellisuus_avain] [varchar](1) NULL,
	[koulutusryhma_avain] [varchar](2) NULL,
	[opetushallinnon_koulutus_avain] [varchar](2) NULL,
	[koulutusluokitus_avain] [varchar](9) NULL,
	[koulutusala_taso2_avain] [varchar](50) NULL,
	[koulutuksen_opetuskieli_avain] [varchar](2) NULL,
	[koulutuksen_sijaintikunta_koodi] [varchar](3) NULL,
	[tutkinnon_aloittamisvuosi] [varchar](10) NULL,
	[jarjestys_tutkinnon_aloittamisvuosi] [int] NULL,
	[opiskelijan_olo_avain] [varchar](1) NULL,
	[maassaolo_avain] [varchar](1) NULL,
	[osatutkinto_koodi] [varchar](1) NULL,
	[aloittaneet] [int] NULL,
	[opiskelijat] [int] NULL,
	[tutkinnot] [int] NULL,
	[tutkinnon_toteuma_avain] [int] NOT NULL,
	[aineisto_avain] [varchar](1) NOT NULL,
	[koulutussektori_avain] [int] NOT NULL,
	[ika1v_avain] [varchar](10) NULL,
	[ikaryhma1_avain] [varchar](10) NULL,
	[ikaryhma2_avain] [varchar](10) NULL,
	[suoritusaika] [varchar](10) NULL,
	[jarjestys_suoritusaika] [int] NULL,
	[aidinkieli_versio1_avain] [varchar](2) NULL,
	[aidinkieli_versio2_avain] [varchar](2) NULL,
	[maahantulo_ja_toisen_asteen_koul_aloittaminen_avain] [int] NULL,
	[maahantulo_ja_korkeakoulutuksen_aloittaminen_avain] [int] NULL,
	[koulutuksen_jarjestamismuoto_avain] [varchar](2) NULL,
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
	[hallinnonala2] [nvarchar](2) NULL
) ON [PRIMARY]
END
GO
USE [ANTERO]