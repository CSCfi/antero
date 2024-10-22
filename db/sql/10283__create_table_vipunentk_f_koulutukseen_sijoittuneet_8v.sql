USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_koulutukseen_sijoittuneet_8v]    Script Date: 22.10.2024 10:09:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_koulutukseen_sijoittuneet_8v]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_koulutukseen_sijoittuneet_8v](
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
	[opintotuki_ulkom] [nvarchar](2) NULL,
	[opintotuki_ulkom_id] [int] NOT NULL,
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
	[ika_1v_suorv_id] [int] NULL,
	[opisk_lu_kyllaei_id] [int] NULL,
	[opisk_amm_pk_kyllaei_id] [int] NULL,
	[opisk_amm_at_kyllaei_id] [int] NULL,
	[opisk_amm_eat_kyllaei_id] [int] NULL,
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
	[eihaku_kk_eiopisk_kk_opisk_lu] [int] NULL,
	[eihaku_kk_eiopisk_kk_opisk_pk] [int] NULL,
	[eihaku_kk_eiopisk_kk_opisk_at] [int] NULL,
	[eihaku_kk_eiopisk_kk_opisk_eat] [int] NULL,
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
	[tj0_koul_luokitus_id] [int] NULL,
 CONSTRAINT [PK_f_koulutukseen_sijoittuneet_8v_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v__pohjoismaa_id_d_pohjoismaa] FOREIGN KEY([pohjoismaa_id])
REFERENCES [dbo].[d_pohjoismaa] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v__pohjoismaa_id_d_pohjoismaa]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_aidinkieli_versio_1_id_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio_1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_aidinkieli_versio_1_id_d_aidinkieli_versio1]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_ammattiasema_id_d_ammattiasema] FOREIGN KEY([ammattiasema_id])
REFERENCES [dbo].[d_ammattiasema] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_ammattiasema_id_d_ammattiasema]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_asuinkunta_historia_id_d_alueluokitus_historia] FOREIGN KEY([asuinkunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_asuinkunta_historia_id_d_alueluokitus_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_asuinkunta_id_d_alueluokitus] FOREIGN KEY([asuinkunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_asuinkunta_id_d_alueluokitus]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_etamaa_id_d_valtio] FOREIGN KEY([etamaa_id])
REFERENCES [dbo].[d_valtio] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_etamaa_id_d_valtio]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_eumaa_id_d_valtio] FOREIGN KEY([eumaa_id])
REFERENCES [dbo].[d_valtio] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_eumaa_id_d_valtio]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_ika_1v_id_d_ika] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_ika_1v_id_d_ika]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_ika_5v_id_d_ika] FOREIGN KEY([ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_ika_5v_id_d_ika]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_kansalaisuus_id_d_kansalaisuus_versio1] FOREIGN KEY([kansalaisuus_id])
REFERENCES [dbo].[d_kansalaisuus_versio1] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_kansalaisuus_id_d_kansalaisuus_versio1]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia] FOREIGN KEY([koulutukseen_sijoittuneen_koulutus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_koulutus_historia_id_d_koulutusluokitus_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia] FOREIGN KEY([koulutukseen_sijoittuneen_maakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_maakunta_historia_id_d_alueluokitus_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus] FOREIGN KEY([koulutukseen_sijoittuneen_maakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_maakunta_id_d_alueluokitus]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([koulutukseen_sijoittuneen_oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot] FOREIGN KEY([koulutukseen_sijoittuneen_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_koulutukseen_sijoittuneen_oppilaitos_id_d_oppilaitoksen_taustatiedot]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_opintotuki_ulkom_id] FOREIGN KEY([opintotuki_ulkom_id])
REFERENCES [dbo].[d_kylla_ei] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_opintotuki_ulkom_id]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia] FOREIGN KEY([pohjakoulutuksen_oppilaitos_historia_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_oppilaitos_historia_id_d_oppilaitoksen_taustatiedot_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot] FOREIGN KEY([pohjakoulutuksen_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_oppilaitos_id_d_oppilaitoksen_taustatiedot]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia] FOREIGN KEY([pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id_d_alueluokitus_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus] FOREIGN KEY([pohjakoulutuksen_tutkinnon_suoritusmaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_tutkinnon_suoritusmaakunta_id_d_alueluokitus]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus] FOREIGN KEY([pohjakoulutuksen_tutktav_id])
REFERENCES [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutuksen_tutktav_id_d_opetus_suun_koulutus_nayt_tutk_valm_koulutus]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutus_historia_id_d_koulutusluokitus_historia] FOREIGN KEY([pohjakoulutus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_pohjakoulutus_historia_id_d_koulutusluokitus_historia]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_sukupuoli_id_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_sukupuoli_id_d_sukupuoli]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_suorituslukukausi_id_d_kausi] FOREIGN KEY([suorituslukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_suorituslukukausi_id_d_kausi]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_suoritusvuosi_id_d_kausi] FOREIGN KEY([suoritusvuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_suoritusvuosi_id_d_kausi]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_syntymavuosi_id_d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_syntymavuosi_id_d_kausi]

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v]  WITH CHECK ADD  CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_tj0_koulutus] FOREIGN KEY([tj0_koul_luokitus_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])

ALTER TABLE [dbo].[f_koulutukseen_sijoittuneet_8v] CHECK CONSTRAINT [FK_f_koulutukseen_sijoittuneet8v_tj0_koulutus]
END
GO


