USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_vuosiluokat]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_tehostettu_tuki]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_pidennetty_oppivelvollisuus]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_erityisen_tuen_paatos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_oppilaitos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] DROP CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_alueluokitus]
GO

/****** Object:  Table [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]    Script Date: 6.7.2021 21:45:03 ******/
DROP TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]
GO

/****** Object:  Table [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]    Script Date: 6.7.2021 21:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm](
	[tilv] [nvarchar](4) NULL,
	[oppilaitos] [nvarchar](5) NULL,
	[oppilaitoksen_taustatiedot_id] [int] NOT NULL,
	[oppilaitoksen_sijainti_id] [int] NOT NULL,
	[tiedtype] [nchar](1) NULL,
	[perusopetuksen_vuosiluokat] [varchar](5) NOT NULL,
	[perusopetuksen_vuosiluokat_id] [int] NOT NULL,
	[sukupuoli] [int] NOT NULL,
	[sukupuoli_id] [int] NOT NULL,
	[perusopetuksen_erityisen_tuen_paatos] [varchar](1) NOT NULL,
	[perusopetuksen_erityisen_tuen_paatos_id] [int] NOT NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus] [varchar](2) NOT NULL,
	[perusopetuksen_pidennetty_oppivelvollisuus_id] [int] NOT NULL,
	[perusopetuksen_tehostettu_tuki] [varchar](9) NOT NULL,
	[perusopetuksen_tehostettu_tuki_id] [int] NOT NULL,
	[tehostetun_tuen_oppilaat] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_alueluokitus] FOREIGN KEY([oppilaitoksen_sijainti_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_oppilaitos] FOREIGN KEY([oppilaitoksen_taustatiedot_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_oppilaitos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_erityisen_tuen_paatos] FOREIGN KEY([perusopetuksen_erityisen_tuen_paatos_id])
REFERENCES [dbo].[d_perusopetuksen_erityisen_tuen_paatos] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_erityisen_tuen_paatos]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_pidennetty_oppivelvollisuus] FOREIGN KEY([perusopetuksen_pidennetty_oppivelvollisuus_id])
REFERENCES [dbo].[d_perusopetuksen_pidennetty_oppivelvollisuus] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_pidennetty_oppivelvollisuus]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_tehostettu_tuki] FOREIGN KEY([perusopetuksen_tehostettu_tuki_id])
REFERENCES [dbo].[d_perusopetuksen_tehostettu_tuki] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_tehostettu_tuki]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_vuosiluokat] FOREIGN KEY([perusopetuksen_vuosiluokat_id])
REFERENCES [dbo].[d_perusopetuksen_vuosiluokat] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_perusopetuksen_vuosiluokat]
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm]  WITH CHECK ADD  CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm] CHECK CONSTRAINT [FK_f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm_d_sukupuoli]
GO


