USE [VipunenTK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_tutkintoryhma_id_d_tutkintoryhma]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_tarkastelujakso_id_d_tarkastelujakso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_syntymavuosi_id_d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_suoritusvuosi_id_d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_suorituslukukausi_id_d_kausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_sukupuoli_id_d_sukupuoli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutus_historia_id_d_koulutusluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_opetuskieli_id_d_koulutuksen_kieli_versio1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_koulutuslaji_id_d_ammatillisen_koulutuksen_koulutuslaji]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_aikoul_id_d_nuorten_aikuisten_koulutus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_paasiallinen_toiminta_id_d_paaasiallinen_toiminta]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_moninkertainen_haku_id_d_moninkertainen_haku]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_koulutuksen_paattaneiden_toiminta_id_d_koulutuksen_paattaneiden_toiminta]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_kansalaisuus_id_d_kansalaisuus_versio1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_ika_5v_id_d_ika]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_ika_1v_id_d_ika]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_eumaa_id_d_valtio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_etamaa_id_d_valtio]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_asuinkunta_id_d_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_asuinkunta_historia_id_d_alueluokitus_historia]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_ammattiasema_id_d_ammattiasema]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v_aidinkieli_versio_1_id_d_aidinkieli_versio1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] DROP CONSTRAINT IF EXISTS [FK_f_koulutukseen_sijoittuneet6v__pohjoismaa_id_d_pohjoismaa]
GO
/****** Object:  Table [dbo].[f_koulutukseen_sijoittuneet_6v]    Script Date: 29.3.2018 10:24:31 ******/
DROP TABLE IF EXISTS [dbo].[f_koulutukseen_sijoittuneet_6v]
GO
/****** Object:  Table [dbo].[f_koulutukseen_sijoittuneet_6v]    Script Date: 29.3.2018 10:24:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_koulutukseen_sijoittuneet_6v](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[aineistorivinumero] [int] NOT NULL,
	[tarkastelujakso] [nvarchar](20) NOT NULL,
	[tarkastelujakso_id] [int] NOT NULL,
	[tilastovuosi] [nvarchar](4) NULL,
	[tilastovuosi_id] [int] NOT NULL,
	[tilv_date] [date] NULL,
	[tutkintoryhma] [nvarchar](10) NULL,
	[tutkintoryhma_id] [int] NOT NULL,
	[suoritusvuosi] [nvarchar](4) NULL,
	[suoritusvuosi_id] [nvarchar](10) NOT NULL,
	[suorituslukukausi] [nvarchar](6) NULL,
	[suorituslukukausi_id] [nvarchar](10) NOT NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[syntymavvuosi] [nvarchar](8) NULL,
	[syntymavuosi_id] [nvarchar](10) NOT NULL,
	[aidinkieli_versio_1] [nvarchar](2) NULL,
	[aidinkieli_versio_1_id] [int] NOT NULL,
	[asuinkunta] [nvarchar](3) NULL,
	[asuinkunta_id] [int] NOT NULL,
	[asuinkunta_historia_id] [int] NOT NULL,
	[kansalaisuus] [nvarchar](2) NULL,
	[kansalaisuus_id] [int] NOT NULL,
	[pohjoismaa_id] [int] NOT NULL,
	[eumaa_id] [int] NOT NULL,
	[etamaa_id] [int] NOT NULL,
	[pohjakoulutuksen_oppilaitos] [nvarchar](10) NULL,
	[pohjakoulutuksen_oppilaitos_id] [int] NOT NULL,
	[pohjakoulutuksen_oppilaitos_historia_id] [int] NOT NULL,
	[pohjakoulutuksen_koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[pohjakoulutuksen_opetuskieli] [nvarchar](4) NULL,
	[pohjakoulutuksen_opetuskieli_id] [int] NOT NULL,
	[pohjakoulutuksen_koulutuslaji] [nvarchar](2) NULL,
	[pohjakoulutuksen_koulutuslaji_id] [int] NOT NULL,
	[pohjakoulutuksen_tutktav] [nvarchar](2) NULL,
	[pohjakoulutuksen_tutktav_id] [int] NOT NULL,
	[pohjakoulutuksen_aikoul] [nvarchar](2) NULL,
	[pohjakoulutuksen_aikoul_id] [int] NOT NULL,
	[pohjakoulutuksen_tutkinnon_suoritusmaakunta] [nvarchar](2) NULL,
	[pohjakoulutuksen_tutkinnon_suoritusmaakunta_id] [int] NOT NULL,
	[pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id] [int] NOT NULL,
	[pohjakoulutus] [nvarchar](6) NULL,
	[pohjakoulutus_id] [int] NOT NULL,
	[pohjakoulutus_historia_id] [int] NOT NULL,
	[koulutukseen_sijoittuneen_koulutus] [nvarchar](6) NULL,
	[koulutukseen_sijoittuneen_koulutus_id] [int] NOT NULL,
	[koulutukseen_sijoittuneen_koulutus_historia_id] [int] NOT NULL,
	[koulutukseen_sijoittuneen_oppilaitos] [nvarchar](10) NULL,
	[koulutukseen_sijoittuneen_oppilaitos_id] [int] NOT NULL,
	[koulutukseen_sijoittuneen_oppilaitos_historia_id] [int] NOT NULL,
	[koulutukseen_sijoittuneen_koulutuksen_jarjestaja] [nvarchar](10) NOT NULL,
	[koulutukseen_sijoittuneen_maakunta] [nvarchar](2) NULL,
	[koulutukseen_sijoittuneen_maakunta_id] [int] NOT NULL,
	[koulutukseen_sijoittuneen_maakunta_historia_id] [int] NOT NULL,
	[moninkertainen_haku] [nvarchar](2) NULL,
	[moninkertainen_haku_id] [int] NOT NULL,
	[paaasiallinen_toiminta] [nvarchar](2) NULL,
	[paaasiallinen_toiminta_id] [int] NOT NULL,
	[ammattiasema] [nvarchar](2) NULL,
	[ammattiasema_id] [int] NOT NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](255) NULL,
	[aineisto] [nvarchar](8) NULL,
	[aineisto_id] [nvarchar](8) NULL,
	[lukiokoulutuksessa] [int] NULL,
	[lukiokoulutuksessa_ke] [nvarchar](5) NULL,
	[ammatillisessa_koulutuksessa] [int] NULL,
	[ammatillisessa_koulutuksessa_ke] [nvarchar](5) NULL,
	[ammattikorkeakoulutuksessa] [int] NULL,
	[ammattikorkeakoulutuksessa_ke] [nvarchar](5) NULL,
	[yliopistokoulutuksessa] [int] NULL,
	[yliopistokoulutuksessa_ke] [nvarchar](5) NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa] [int] NULL,
	[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa_ke] [nvarchar](5) NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa] [int] NULL,
	[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa_ke] [nvarchar](5) NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa] [int] NULL,
	[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa_ke] [nvarchar](5) NULL,
	[koulutuksen_paattaineiden_toiminta] [int] NULL,
	[koulutuksen_paattaneiden_toiminta_id] [int] NOT NULL,
	[rivinumero] [int] NOT NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_1v_id] [int] NOT NULL,
	[ika_5v] [nvarchar](10) NULL,
	[ika_5v_id] [int] NOT NULL,
	[opisk_amm_kyllaei_id] [int] NULL,
	[opisk_amk_kyllaei_id] [int] NULL,
	[opisk_yo_kyllaei_id] [int] NULL,
	[opisk_amk_koulala1_kyllaei_id] [int] NULL,
	[opisk_amk_koulala2_kyllaei_id] [int] NULL,
	[opisk_amk_koulala3_kyllaei_id] [int] NULL,
	[opisk_amk_koulala4_kyllaei_id] [int] NULL,
	[opisk_amk_koulala5_kyllaei_id] [int] NULL,
	[opisk_amk_koulala6_kyllaei_id] [int] NULL,
	[opisk_amk_koulala7_kyllaei_id] [int] NULL,
	[opisk_amk_koulala8_kyllaei_id] [int] NULL,
	[opisk_amk_koulala9_kyllaei_id] [int] NULL,
	[opisk_amk_koulala10_kyllaei_id] [int] NULL,
	[opisk_yo_koulala1_kyllaei_id] [int] NULL,
	[opisk_yo_koulala2_kyllaei_id] [int] NULL,
	[opisk_yo_koulala3_kyllaei_id] [int] NULL,
	[opisk_yo_koulala4_kyllaei_id] [int] NULL,
	[opisk_yo_koulala5_kyllaei_id] [int] NULL,
	[opisk_yo_koulala6_kyllaei_id] [int] NULL,
	[opisk_yo_koulala7_kyllaei_id] [int] NULL,
	[opisk_yo_koulala8_kyllaei_id] [int] NULL,
	[opisk_yo_koulala9_kyllaei_id] [int] NULL,
	[opisk_yo_koulala10_kyllaei_id] [int] NULL,
	[opisk_vah2_koulala_kyllaei_id] [int] NULL,
	[haku_amm_kyllaei_id] [int] NULL,
	[haku_amk_kyllaei_id] [int] NULL,
	[haku_yo_kyllaei_id] [int] NULL,
	[eihaku_kk_eiopisk] [int] NULL,
	[eihaku_kk_eiopisk_kk_opisk_ta] [int] NULL,
	[haku_kk_eiopisk_kk] [int] NULL,
	[haku_kk_eiopisk_kk_eiopisk_ta] [int] NULL,
	[haku_kk_eiopisk_kk_opisk_ta] [int] NULL,
	[haku_amk_eiopisk_kk] [int] NULL,
	[haku_yo_eiopisk_kk] [int] NULL,
	[haku_amkyo_eiopisk_kk] [int] NULL,
	[opisk_kk] [int] NULL,
	[opisk_kk_eiopisk_ta] [int] NULL,
	[opisk_kk_opisk_ta] [int] NULL,
	[opisk_vain_amk] [int] NULL,
	[opisk_vain_yo] [int] NULL,
	[opisk_amkyo] [int] NULL,
 CONSTRAINT [PK_f_koulutukseen_sijoittuneet_6v_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v__pohjoismaa_id_d_pohjoismaa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v__pohjoismaa_id_d_pohjoismaa] FOREIGN KEY([pohjoismaa_id])
REFERENCES [dbo].[d_pohjoismaa] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v__pohjoismaa_id_d_pohjoismaa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v__pohjoismaa_id_d_pohjoismaa]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_aidinkieli_versio_1_id_d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_aidinkieli_versio_1_id_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio_1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_aidinkieli_versio_1_id_d_aidinkieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_aidinkieli_versio_1_id_d_aidinkieli_versio1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_ammattiasema_id_d_ammattiasema]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_ammattiasema_id_d_ammattiasema] FOREIGN KEY([ammattiasema_id])
REFERENCES [dbo].[d_ammattiasema] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_ammattiasema_id_d_ammattiasema]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_ammattiasema_id_d_ammattiasema]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_asuinkunta_historia_id_d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_asuinkunta_historia_id_d_alueluokitus_historia] FOREIGN KEY([asuinkunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_asuinkunta_historia_id_d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_asuinkunta_historia_id_d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_asuinkunta_id_d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_asuinkunta_id_d_alueluokitus] FOREIGN KEY([asuinkunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_asuinkunta_id_d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_asuinkunta_id_d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_etamaa_id_d_valtio]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_etamaa_id_d_valtio] FOREIGN KEY([etamaa_id])
REFERENCES [dbo].[d_valtio_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_etamaa_id_d_valtio]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_etamaa_id_d_valtio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_eumaa_id_d_valtio]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_eumaa_id_d_valtio] FOREIGN KEY([eumaa_id])
REFERENCES [dbo].[d_valtio_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_eumaa_id_d_valtio]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_eumaa_id_d_valtio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_ika_1v_id_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_ika_1v_id_d_ika] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_ika_1v_id_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_ika_1v_id_d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_ika_5v_id_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_ika_5v_id_d_ika] FOREIGN KEY([ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_ika_5v_id_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_ika_5v_id_d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_kansalaisuus_id_d_kansalaisuus_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_kansalaisuus_id_d_kansalaisuus_versio1] FOREIGN KEY([kansalaisuus_id])
REFERENCES [dbo].[d_kansalaisuus_versio1] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_kansalaisuus_id_d_kansalaisuus_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_kansalaisuus_id_d_kansalaisuus_versio1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia] FOREIGN KEY([koulutukseen_sijoittuneen_koulutus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia] FOREIGN KEY([koulutukseen_sijoittuneen_maakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus] FOREIGN KEY([koulutukseen_sijoittuneen_maakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutukseen_sijoittuneen_oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutukseen_sijoittuneen_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutuksen_paattaneiden_toiminta_id_d_koulutuksen_paattaneiden_toiminta]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutuksen_paattaneiden_toiminta_id_d_koulutuksen_paattaneiden_toiminta] FOREIGN KEY([koulutuksen_paattaneiden_toiminta_id])
REFERENCES [dbo].[d_koulutuksen_paattaneiden_toiminta] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_koulutuksen_paattaneiden_toiminta_id_d_koulutuksen_paattaneiden_toiminta]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_koulutuksen_paattaneiden_toiminta_id_d_koulutuksen_paattaneiden_toiminta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_moninkertainen_haku_id_d_moninkertainen_haku]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_moninkertainen_haku_id_d_moninkertainen_haku] FOREIGN KEY([moninkertainen_haku_id])
REFERENCES [dbo].[d_moninkertainen_haku] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_moninkertainen_haku_id_d_moninkertainen_haku]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_moninkertainen_haku_id_d_moninkertainen_haku]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_paasiallinen_toiminta_id_d_paaasiallinen_toiminta]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_paasiallinen_toiminta_id_d_paaasiallinen_toiminta] FOREIGN KEY([paaasiallinen_toiminta_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_paasiallinen_toiminta_id_d_paaasiallinen_toiminta]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_paasiallinen_toiminta_id_d_paaasiallinen_toiminta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_aikoul_id_d_nuorten_aikuisten_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_aikoul_id_d_nuorten_aikuisten_koulutus] FOREIGN KEY([pohjakoulutuksen_aikoul_id])
REFERENCES [dbo].[d_nuorten_aikuisten_koulutus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_aikoul_id_d_nuorten_aikuisten_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_aikoul_id_d_nuorten_aikuisten_koulutus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_koulutuslaji_id_d_ammatillisen_koulutuksen_koulutuslaji]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_koulutuslaji_id_d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([pohjakoulutuksen_koulutuslaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_koulutuslaji_id_d_ammatillisen_koulutuksen_koulutuslaji]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_koulutuslaji_id_d_ammatillisen_koulutuksen_koulutuslaji]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_opetuskieli_id_d_koulutuksen_kieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_opetuskieli_id_d_koulutuksen_kieli_versio1] FOREIGN KEY([pohjakoulutuksen_opetuskieli_id])
REFERENCES [dbo].[d_koulutuksen_kieli_versio1] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_opetuskieli_id_d_koulutuksen_kieli_versio1]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_opetuskieli_id_d_koulutuksen_kieli_versio1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([pohjakoulutuksen_oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot] FOREIGN KEY([pohjakoulutuksen_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia] FOREIGN KEY([pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus] FOREIGN KEY([pohjakoulutuksen_tutkinnon_suoritusmaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus] FOREIGN KEY([pohjakoulutuksen_tutktav_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutus_historia_id_d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutus_historia_id_d_koulutusluokitus_historia] FOREIGN KEY([pohjakoulutus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_pohjakoulutus_historia_id_d_koulutusluokitus_historia]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_pohjakoulutus_historia_id_d_koulutusluokitus_historia]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_sukupuoli_id_d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_sukupuoli_id_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_sukupuoli_id_d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_sukupuoli_id_d_sukupuoli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_suorituslukukausi_id_d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_suorituslukukausi_id_d_kausi] FOREIGN KEY([suorituslukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_suorituslukukausi_id_d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_suorituslukukausi_id_d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_suoritusvuosi_id_d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_suoritusvuosi_id_d_kausi] FOREIGN KEY([suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_suoritusvuosi_id_d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_suoritusvuosi_id_d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_syntymavuosi_id_d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_syntymavuosi_id_d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_syntymavuosi_id_d_kausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_syntymavuosi_id_d_kausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_tarkastelujakso_id_d_tarkastelujakso]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_tarkastelujakso_id_d_tarkastelujakso] FOREIGN KEY([tarkastelujakso_id])
REFERENCES [dbo].[d_tarkastelujakso] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_tarkastelujakso_id_d_tarkastelujakso]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_tarkastelujakso_id_d_tarkastelujakso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_tutkintoryhma_id_d_tutkintoryhma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_tutkintoryhma_id_d_tutkintoryhma] FOREIGN KEY([tutkintoryhma_id])
REFERENCES [dbo].[d_tutkintoryhma] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_koulutukseen_sijoittuneet6v_tutkintoryhma_id_d_tutkintoryhma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_6v]'))
ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_6v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet6v_tutkintoryhma_id_d_tutkintoryhma]
GO
USE [ANTERO]