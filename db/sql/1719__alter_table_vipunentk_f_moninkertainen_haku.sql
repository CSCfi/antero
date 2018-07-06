USE [VipunenTK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_oppilaitoksen_taustatiedot]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_koulutuksen_alkamiskausi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tutkinnon_taso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tulos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_prioriteetti]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_oppilaitoksen_alueluokitus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_erillisvalinta]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] DROP CONSTRAINT IF EXISTS [FK_f_Moninkertainen_haku_uudet_haut_d_hakukohde]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_uudet_haut]    Script Date: 6.7.2018 15:02:44 ******/
DROP TABLE IF EXISTS [dbo].[f_Moninkertainen_haku_uudet_haut]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_uudet_haut]    Script Date: 6.7.2018 15:02:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Moninkertainen_haku_uudet_haut](
	[Hakukohde_avain] [varchar](5) NULL,
	[Hakukohde_id] [int] NOT NULL,
	[Hakukohde_oppilaitos_avain] [varchar](5) NULL,
	[Hakukohde_oppilaitos_id] [int] NOT NULL,
	[Hakukohde_oppilaitoksen_alueluokitus_avain] [nvarchar](3) NULL,
	[Hakukohde_oppilaitoksen_alueluokitus_id] [int] NOT NULL,
	[Hakukohde_koulutusaste2002_avain] [varchar](8) NULL,
	[Hakukohde_koulutusaste2002_id] [int] NOT NULL,
	[Hakukohde_koulutusaste_taso2_avain] [varchar](18) NULL,
	[Hakukohde_koulutusaste_taso2_id] [int] NOT NULL,
	[Hakukohde_opintoala2002_avain] [varchar](9) NULL,
	[Hakukohde_opintoala2002_id] [int] NOT NULL,
	[Hakukohde_opintoala1995_avain] [varchar](10) NULL,
	[Hakukohde_opintoala1995_id] [int] NOT NULL,
	[Hakukohde_koulutusala_taso1_avain] [varchar](20) NULL,
	[Hakukohde_koulutusala_taso1_id] [int] NOT NULL,
	[Hakukohde_prioriteetti_avain] [varchar](6) NULL,
	[Hakukohde_prioriteetti_id] [int] NOT NULL,
	[Hakukohde_hyvaksytty] [varchar](1) NULL,
	[Hakukohde_vastaanotettu] [varchar](1) NULL,
	[Hakukohteen_tulos_id] [int] NOT NULL,
	[Hakukohde_tutkinnon_taso] [varchar](4) NULL,
	[Hakukohde_tutkinnon_taso_tarkennus] [varchar](6) NULL,
	[Hakukohde_tutkinnon_taso_id] [int] NOT NULL,
	[Hakukohde_erillisvalinta] [varchar](2) NULL,
	[Hakukohde_erillisvalinta_id] [int] NOT NULL,
	[Hakukohde_koulutuksen_alkamislukukausi_avain] [varchar](5) NULL,
	[Hakukohde_koulutuksen_alkamislukukausi_id] [nvarchar](10) NOT NULL,
	[Johdettu_Sama_koulutusaste02_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_koulutusaste02_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_opintoala95_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_opintoala95_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_opintoala02_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_opintoala02_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_koulutusala95_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_koulutusala95_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_koulutusala02_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_koulutusala02_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_oppilaitos_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_oppilaitos_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_sektori_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_sektori_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_sektori_Aiempi_tutkinto_tai_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_laaja_sektori_Aiempi_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Sama_laaja_sektori_Aiempi_tutkinto_tai_opiskelu_Haku] [nvarchar](50) NOT NULL,
	[Johdettu_Hakenut_Amk_ja_Yo] [nvarchar](50) NULL,
	[Johdettu_Hakenut_Korkea_aste_ja_Toinen_aste] [nvarchar](50) NULL,
	[Johdettu_Hakenut_Lukio_ja_Ammatillinen_koulutus] [nvarchar](50) NULL,
	[lkm] [int] NULL,
	[tietolahde] [varchar](31) NOT NULL,
	[rivinumero] [bigint] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_hakukohde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_hakukohde] FOREIGN KEY([Hakukohde_id])
REFERENCES [dbo].[d_hakukohde] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_hakukohde]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_hakukohde]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_erillisvalinta]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_erillisvalinta] FOREIGN KEY([Hakukohde_erillisvalinta_id])
REFERENCES [dbo].[d_hakukohde_erillisvalinta] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_erillisvalinta]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_erillisvalinta]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_oppilaitoksen_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_oppilaitoksen_alueluokitus] FOREIGN KEY([Hakukohde_oppilaitoksen_alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_oppilaitoksen_alueluokitus]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_oppilaitoksen_alueluokitus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_prioriteetti]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_prioriteetti] FOREIGN KEY([Hakukohde_prioriteetti_id])
REFERENCES [dbo].[d_hakukohteen_prioriteetti] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_prioriteetti]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_prioriteetti]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tulos]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tulos] FOREIGN KEY([Hakukohteen_tulos_id])
REFERENCES [dbo].[d_hakukohteen_tulos] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tulos]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tulos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tutkinnon_taso]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tutkinnon_taso] FOREIGN KEY([Hakukohde_tutkinnon_taso_id])
REFERENCES [dbo].[d_hakukohteen_tutkinnon_taso] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tutkinnon_taso]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_Hakukohde_tutkinnon_taso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_koulutuksen_alkamiskausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_koulutuksen_alkamiskausi] FOREIGN KEY([Hakukohde_koulutuksen_alkamislukukausi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_koulutuksen_alkamiskausi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_koulutuksen_alkamiskausi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut]  WITH CHECK ADD  CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_oppilaitoksen_taustatiedot] FOREIGN KEY([Hakukohde_oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Moninkertainen_haku_uudet_haut_d_oppilaitoksen_taustatiedot]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Moninkertainen_haku_uudet_haut]'))
ALTER TABLE [dbo].[f_Moninkertainen_haku_uudet_haut] CHECK CONSTRAINT [FK_f_Moninkertainen_haku_uudet_haut_d_oppilaitoksen_taustatiedot]
GO
USE [ANTERO]