USE [VipunenTK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_sukupuoli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_oppilaitostyyppi]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opetuskieli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_luokka_aste]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_koulutusaste]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_aine]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajan_tehtavatyyppi_perusopetuksessa]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] DROP CONSTRAINT IF EXISTS [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_ika]
GO
/****** Object:  Table [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]    Script Date: 22.12.2017 10:23:35 ******/
DROP TABLE IF EXISTS [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]
GO
/****** Object:  Table [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]    Script Date: 22.12.2017 10:23:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitoksen_kieli_id] [int] NULL,
	[oppilaitostyyppi_id] [int] NULL,
	[tyosuhde_vakinainen] [int] NULL,
	[tyosuhde_maara_aikainen] [int] NULL,
	[tyosuhde_viransijainen] [int] NULL,
	[tyosuhde_virkavapaa] [int] NULL,
	[tyosuhde_oa_elake] [int] NULL,
	[tyosuhteen_luonne_id] [int] NULL,
	[tehtavatyyppi_perusopetuksessa_id] [int] NULL,
	[paaasiallinen_koulutusmuoto_id] [int] NULL,
	[kelp_esiopetus] [int] NULL,
	[kelp_luokanopettaja] [int] NULL,
	[kelp_aineenopettaja] [int] NULL,
	[kelp_aineenopettaja_lukio] [int] NULL,
	[kelp_erityisluokan_opettaja] [int] NULL,
	[kelp_erityisopettaja_osa_aikainen] [int] NULL,
	[kelp_oppilaanohjaaja] [int] NULL,
	[kelp_opinto_ohjaaja] [int] NULL,
	[kelp_muu] [nchar](10) NULL,
	[kelp_ei] [int] NULL,
	[kelp_kehitysvammaiset] [int] NULL,
	[oman_luokan_aste_id] [int] NULL,
	[oman_luokan_oppilasmäärä] [int] NULL,
	[opettajan_eniten_opettama_aine_id] [int] NULL,
	[opettajan_eniten_opettama_aine_koodi] [varchar](50) NULL,
	[sukupuoli_id] [int] NULL,
	[maakunta_oppilaitos] [varchar](2) NULL,
	[kuntaryhmitys_oppilaitos] [nvarchar](10) NULL,
	[ika_id] [int] NULL,
	[kelp_id] [int] NULL,
	[koko_osa_aikainen_id] [int] NULL,
	[osa_aikaisuuden_syy_id] [int] NULL,
	[opettajan_tunnit] [int] NULL,
	[resurssiopettajan_osallistuminen_id] [int] NULL,
	[resurssiopettajan_tunnit] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajan_tehtavatyyppi_perusopetuksessa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajan_tehtavatyyppi_perusopetuksessa] FOREIGN KEY([tehtavatyyppi_perusopetuksessa_id])
REFERENCES [dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajan_tehtavatyyppi_perusopetuksessa]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajan_tehtavatyyppi_perusopetuksessa]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_aine]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_aine] FOREIGN KEY([opettajan_eniten_opettama_aine_id])
REFERENCES [dbo].[d_opettajat_aine] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_aine]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_aine]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_koulutusaste]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_koulutusaste] FOREIGN KEY([paaasiallinen_koulutusmuoto_id])
REFERENCES [dbo].[d_opettajat_koulutusaste] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_koulutusaste]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_koulutusaste]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_luokka_aste]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_luokka_aste] FOREIGN KEY([oman_luokan_aste_id])
REFERENCES [dbo].[d_opettajat_luokka_aste] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_luokka_aste]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opettajat_luokka_aste]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opetuskieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opetuskieli] FOREIGN KEY([oppilaitoksen_kieli_id])
REFERENCES [dbo].[d_opetuskieli2] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opetuskieli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_opetuskieli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_oppilaitostyyppi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_oppilaitostyyppi] FOREIGN KEY([oppilaitostyyppi_id])
REFERENCES [dbo].[d_oppilaitostyyppi] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_oppilaitostyyppi]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_oppilaitostyyppi]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]  WITH CHECK ADD  CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]'))
ALTER TABLE [dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot] CHECK CONSTRAINT [FK_f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot_d_sukupuoli]
GO
USE [ANTERO]