USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_yleisopetuksen_osuus]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_vuosiluokat]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_erityisen_tuen_paatos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_oppilaitos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_alueluokitus]
GO

/****** Object:  Table [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]    Script Date: 6.7.2021 21:42:12 ******/
DROP TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]
GO

/****** Object:  Table [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]    Script Date: 6.7.2021 21:42:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus](
	[tilv] [nvarchar](4) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[oppilaitoksen_sijainti_id] [int] NOT NULL,
	[tiedtype] [nchar](1) NULL,
	[perusopetuksen_vuosiluokat] [varchar](5) NOT NULL,
	[perusopetuksen_vuosiluokat_id] [int] NOT NULL,
	[perusopetuksen_erityisen_tuen_paatos] [varchar](2) NOT NULL,
	[perusopetuksen_erityisen_tuen_paatos_id] [int] NOT NULL,
	[perusopetuksen_yleisopetuksen_osuus] [varchar](10) NOT NULL,
	[perusopetuksen_yleisopetuksen_osuus_id] [int] NOT NULL,
	[erityisen_tuen_oppilaiden_opetus] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_alueluokitus] FOREIGN KEY([oppilaitoksen_sijainti_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_oppilaitos] FOREIGN KEY([oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_oppilaitos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_erityisen_tuen_paatos] FOREIGN KEY([perusopetuksen_erityisen_tuen_paatos_id])
REFERENCES [dbo].[d_perusopetuksen_erityisen_tuen_paatos] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_erityisen_tuen_paatos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_vuosiluokat] FOREIGN KEY([perusopetuksen_vuosiluokat_id])
REFERENCES [dbo].[d_perusopetuksen_vuosiluokat] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_vuosiluokat]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_yleisopetuksen_osuus] FOREIGN KEY([perusopetuksen_yleisopetuksen_osuus_id])
REFERENCES [dbo].[d_perusopetuksen_yleisopetuksen_osuus] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus_d_perusopetuksen_yleisopetuksen_osuus]
GO


