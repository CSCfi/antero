USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_tyossakayvat_ammateittain]    Script Date: 14.12.2023 10:19:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_tyossakayvat_ammateittain]
GO

CREATE TABLE [dbo].[f_tyossakayvat_ammateittain](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[aineisto] [nvarchar](8) NULL,
	[laatu_id] [int] NOT NULL,
	[tietolahde] [nvarchar](10) NULL,
	[rivinumero] [int] NULL,
	[lkm] [int] NULL,
	[amm2001_m1] [nvarchar](20) NULL,
	[amm2001_m2] [nvarchar](20) NULL,
	[mitenna_ammatti2_id] [int] NOT NULL,
	[amm2001_m] [nvarchar](20) NULL,
	[mitenna_ammatti_id] [int] NOT NULL,
	[amm2010] [nvarchar](20) NULL,
	[amm2010_id] [int] NOT NULL,
	[amm2010_oef1] [nvarchar](20) NULL,
	[amm2010_oef2] [nvarchar](20) NULL,
	[oef_ammatti_id] [int] NOT NULL,
	[sp] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[aikielir1] [nvarchar](10) NULL,
	[aikielir1_id] [int] NOT NULL,
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
	[koulutusluokitus_id] [int] NOT NULL,
	[opintoala2002_koodi] [nvarchar](3) NOT NULL,
	[koulutusala_taso2] [nvarchar](10) NULL,
	[koulutusala_taso2_id] [int] NOT NULL,
	[tmaak] [nvarchar](10) NULL,
	[tyomaakunta_historia_id] [int] NULL,
	[tyomaakunta_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_aidinkieli_versio1] FOREIGN KEY([aikielir1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_alueluokitus_tyopaikka] FOREIGN KEY([tyomaakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_alueluokitus_tyopaikka]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_alueluokitus_tyopaikka_historia] FOREIGN KEY([tyomaakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_alueluokitus_tyopaikka_historia]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_ammatillisen_koulutuksen_koulutuslaji] FOREIGN KEY([tutkintolaji_id])
REFERENCES [dbo].[d_ammatillisen_koulutuksen_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_ammatillisen_koulutuksen_koulutuslaji]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_ika]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_mitenna_ammatti] FOREIGN KEY([mitenna_ammatti_id])
REFERENCES [dbo].[d_mitenna_ammatti] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_mitenna_ammatti]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_oef_ammatti] FOREIGN KEY([oef_ammatti_id])
REFERENCES [dbo].[d_oef_ammatti] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_oef_ammatti]
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain]  WITH CHECK ADD  CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_tyossakayvat_ammateittain] CHECK CONSTRAINT [FK_f_tyossakayvat_ammateittain_d_sukupuoli]
GO


