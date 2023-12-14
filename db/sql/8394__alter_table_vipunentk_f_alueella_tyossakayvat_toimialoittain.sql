USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_alueella_tyossakayvat_toimialoittain]    Script Date: 14.12.2023 12:30:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_alueella_tyossakayvat_toimialoittain]
GO

CREATE TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](8) NULL,
	[laatu_id] [int] NOT NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[lkm] [int] NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[mitenna_ammatti_id] [int] NOT NULL,
	[amm2010_oef1] [nvarchar](20) NULL,
	[amm2010_oef2] [nvarchar](20) NULL,
	[oef_ammatti_id] [int] NOT NULL,
	[tol2008_m1] [nvarchar](20) NULL,
	[tol2008_m2] [nvarchar](20) NULL,
	[mitenna_toimiala_id] [int] NOT NULL,
	[tol2008_oef] [nvarchar](10) NULL,
	[oef_toimiala_id] [int] NOT NULL,
	[tol2008] [nvarchar](20) NULL,
	[tol2008_id] [int] NOT NULL,
	[ikar1] [nvarchar](10) NULL,
	[ikar1_koodi] [nvarchar](10) NOT NULL,
	[ika_id] [int] NOT NULL,
	[opmast] [nvarchar](10) NULL,
	[koulutusaste_id] [int] NOT NULL,
	[koulutusaste_taso2] [nvarchar](10) NULL,
	[koulutusaste_taso2_id] [int] NOT NULL,
	[tutklaja] [nvarchar](10) NULL,
	[tutkintolaji_id] [int] NOT NULL,
	[opmopa] [nvarchar](10) NULL,
	[opintoala2002_koodi] [nvarchar](3) NOT NULL,
	[opintoala_id] [int] NOT NULL,
	[koulutusala_taso2] [nvarchar](10) NULL,
	[koulutusala_taso2_id] [int] NOT NULL,
	[koulutusala_taso3] [nvarchar](10) NULL,
	[koulutusala_taso3_id] [int] NOT NULL,
	[tmaak] [nvarchar](10) NULL,
	[tyomaakunta_historia_id] [int] NULL,
	[tyomaakunta_id] [int] NOT NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_alueluokitus_tyopaikka] FOREIGN KEY([tyomaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_alueluokitus_tyopaikka]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_alueluokitus_tyopaikka_historia] FOREIGN KEY([tyomaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_alueluokitus_tyopaikka_historia]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([tutkintolaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_ika]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_mitenna_ammatti] FOREIGN KEY([mitenna_ammatti_id])
REFERENCES [dbo].[d_mitenna_ammatti] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_mitenna_ammatti]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_mitenna_toimiala] FOREIGN KEY([mitenna_toimiala_id])
REFERENCES [dbo].[d_mitenna_toimiala] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_mitenna_toimiala]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_oef_ammatti] FOREIGN KEY([oef_ammatti_id])
REFERENCES [dbo].[d_oef_ammatti] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_oef_ammatti]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_oef_toimiala] FOREIGN KEY([oef_toimiala_id])
REFERENCES [dbo].[d_oef_toimiala] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_oef_toimiala]
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain]  WITH CHECK ADD  CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_toimiala_tk] FOREIGN KEY([tol2008_id])
REFERENCES [dbo].[d_toimiala_tk] ([id])
GO

ALTER TABLE [dbo].[f_alueella_tyossakayvat_toimialoittain] CHECK CONSTRAINT [FK_f_alueella_tyossakayvat_toimialoittain_d_toimiala_tk]
GO


