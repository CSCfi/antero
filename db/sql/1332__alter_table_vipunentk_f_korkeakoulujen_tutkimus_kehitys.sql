USE [VipunenTK]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] DROP CONSTRAINT IF EXISTS [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] DROP CONSTRAINT IF EXISTS [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] DROP CONSTRAINT IF EXISTS [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] DROP CONSTRAINT IF EXISTS [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] DROP CONSTRAINT IF EXISTS [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] DROP CONSTRAINT IF EXISTS [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika]
GO
/****** Object:  Table [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]    Script Date: 9.3.2018 9:32:14 ******/
DROP TABLE IF EXISTS [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]
GO
/****** Object:  Table [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]    Script Date: 9.3.2018 9:32:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[oppilaitos_id] [int] NOT NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[tieteenala_id] [int] NOT NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[virkaryhma_id] [int] NOT NULL,
	[ika_avain] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[tutkintotaso_id] [int] NOT NULL,
	[lkm_tutkimushenkilokunta] [int] NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[apuraha] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala] FOREIGN KEY([tieteenala_id])
REFERENCES [dbo].[d_tieteenala] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso] FOREIGN KEY([tutkintotaso_id])
REFERENCES [dbo].[d_tutkintotaso] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma] FOREIGN KEY([virkaryhma_id])
REFERENCES [dbo].[d_virkaryhma] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma]') AND parent_object_id = OBJECT_ID(N'[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]'))
ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma]
GO
USE [ANTERO]