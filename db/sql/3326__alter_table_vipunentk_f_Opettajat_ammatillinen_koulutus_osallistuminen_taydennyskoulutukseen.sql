USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_taydennyskoulutus]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_opetuskieli]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_opettajan_tehtavatyyppi]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_maakunta]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_ika]
GO

/****** Object:  Table [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]    Script Date: 13.2.2020 15:22:38 ******/
DROP TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]
GO

/****** Object:  Table [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]    Script Date: 13.2.2020 15:22:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[tehtävätyyppi_amm_koulutuksessa_id] [int] NULL,
	[pääasiallinen_koulutusaste_id] [int] NULL,
	[pääasiallinen_koulutusala_id] [int] NULL,
	[taydennyskoulutus_osallistuminen] [int] NULL,
	[taydennyskoulutus_ei_tietoa] [int] NULL,
	[taydennyskoulutus_ei] [int] NULL,
	[taydennyskoulutus_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_oma_aika] [nvarchar](3) NULL,
	[taydennyskoulutus_kelp_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_kelp_oma_aika] [nvarchar](3) NULL,
	[taydennyskoulutus_tantaja_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_tantaja_oma_aika] [nvarchar](3) NULL,
	[taydennyskoulutus_muu_tyoaika] [nvarchar](3) NULL,
	[taydennyskoulutus_muu_oma_aika] [nvarchar](3) NULL,
	[asiantuntijavaihto_tyoaika] [nvarchar](3) NULL,
	[asiantuntijavaihto_oma_aika] [nvarchar](3) NULL,
	[koulutussuunnitelma] [int] NULL,
	[tyoelamajakso_lkm] [nvarchar](3) NULL,
	[tyoelamajakso] [int] NULL,
	[tyoelamajakso_ei_tietoa] [int] NULL,
	[sukupuoli_id] [int] NULL,
	[oppilaitoksen_maakunta_id] [int] NULL,
	[ika_id] [int] NULL,
	[kouluttautunut_mentoriksi] [nchar](10) NULL,
	[toiminut_mentorina] [nchar](10) NULL,
	[ollut_mentoroitavana] [nchar](10) NULL,
	[kouluttautunut_tyonohjaajaksi] [nchar](10) NULL,
	[toiminut_tyonohjaajana] [nchar](10) NULL,
	[ollut_tyonohjauksessa] [nchar](10) NULL,
	[osallistunut_tyoelamajaksolle] [nchar](10) NULL,
	[opiskelijan_ohjaamista] [nchar](10) NULL,
	[tyopaikkaohjaajan_kouluttajan_ohjaamista] [nchar](10) NULL,
	[opintojen_sisallon_ohjaamista] [nchar](10) NULL,
	[oman_osaamisen_kasvattamista] [nchar](10) NULL,
	[tyopaikoilla_tapahtuva_tyo] [int] NULL,
	[opiskelijan_ohjaamista_tp] [nchar](10) NULL,
	[tyopaikkaohjaajan_kouluttajan_ohjaamista_tp] [nchar](10) NULL,
	[opintojen_sisallon_ohjaamista_tp] [nchar](10) NULL,
	[oman_osaamisen_kasvattamista_tp] [nchar](10) NULL,
	[opettajan_tunnit] [int] NULL,
	[hlokohtaistamisen_tunnit] [int] NULL,
	[suunnittelu_ohjaus_tunnit] [int] NULL,
	[hallinnolliset_tunnit] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_ika]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_maakunta] FOREIGN KEY([oppilaitoksen_maakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_maakunta]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_opettajan_tehtavatyyppi] FOREIGN KEY([tehtävätyyppi_amm_koulutuksessa_id])
REFERENCES [dbo].[d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_opettajan_tehtavatyyppi]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_opetuskieli] FOREIGN KEY([oppilaitoksen_kieli_id])
REFERENCES [dbo].[d_opetuskieli2] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_opetuskieli]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_taydennyskoulutus] FOREIGN KEY([taydennyskoulutus_osallistuminen])
REFERENCES [dbo].[d_kylla_ei] ([id])
GO

ALTER TABLE [dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen] CHECK CONSTRAINT [FK_f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen_d_taydennyskoulutus]
GO


USE [ANTERO]