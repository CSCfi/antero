USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_opetuskieli]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_opettajan_tehtavatyyppi_perusopetuksessa]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_ika]
GO

/****** Object:  Table [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]    Script Date: 4.2.2020 14:41:40 ******/
DROP TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]    Script Date: 4.2.2020 14:41:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[tehtavatyyppi_perusopetuksessa_id] [int] NULL,
	[taydennyskoulutus_osallistuminen] [nvarchar](2) NULL,
	[taydennyskoulutus_ei_tietoa] [nvarchar](2) NULL,
	[taydennyskoulutus_ei] [nvarchar](2) NULL,
	[taydennyskoulutus_tyoaika] [nvarchar](4) NULL,
	[taydennyskoulutus_oma_aika] [nvarchar](4) NULL,
	[taydennyskoulutus_kelp_tyoaika] [nvarchar](4) NULL,
	[taydennyskoulutus_kelp_oma_aika] [nvarchar](4) NULL,
	[taydennyskoulutus_tantaja_tyoaika] [nvarchar](4) NULL,
	[taydennyskoulutus_tantaja_oma_aika] [nvarchar](4) NULL,
	[taydennyskoulutus_muu_tyoaika] [nvarchar](4) NULL,
	[taydennyskoulutus_muu_oma_aika] [nvarchar](4) NULL,
	[asiantuntijavaihto_tyoaika] [nvarchar](4) NULL,
	[asiantuntijavaihto_oma_aika] [nvarchar](4) NULL,
	[koulutussuunnitelma] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[maakunta_oppilaitos] [nvarchar](3) NULL,
	[ika_id] [int] NULL,
	[kouluttautunut_mentoriksi] [nchar](10) NULL,
	[toiminut_mentorina] [nchar](10) NULL,
	[ollut_mentoroitavana] [nchar](10) NULL,
	[kouluttautunut_tyonohjaajaksi] [nchar](10) NULL,
	[toiminut_tyonohjaajana] [nchar](10) NULL,
	[ollut_tyonohjauksessa] [nchar](10) NULL,
	[opettajan_tunnit] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_ika]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_opettajan_tehtavatyyppi_perusopetuksessa] FOREIGN KEY([tehtavatyyppi_perusopetuksessa_id])
REFERENCES [dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_opettajan_tehtavatyyppi_perusopetuksessa]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_opetuskieli] FOREIGN KEY([oppilaitoksen_kieli_id])
REFERENCES [dbo].[d_opetuskieli2] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_opetuskieli]
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen_d_sukupuoli]
GO

USE [ANTERO]
