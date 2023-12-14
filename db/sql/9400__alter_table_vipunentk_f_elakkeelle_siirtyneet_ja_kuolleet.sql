USE [VipunenTK]
GO

/****** Object:  Table [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]    Script Date: 14.12.2023 13:39:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]
GO

CREATE TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet](
	[tilv] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli_id] [int] NOT NULL,
	[aidinkieli_versio1_id] [int] NOT NULL,
	[ika_id] [int] NOT NULL,
	[elakkeelle_siirtynyt_tai_kuollut_id] [int] NOT NULL,
	[paaasiallinen_toiminta_id] [int] NOT NULL,
	[alueluokitus_id] [int] NOT NULL,
	[alueluokitus_historia_id] [int] NULL,
	[mitenna_ammatti_id] [int] NOT NULL,
	[oef_ammatti_id] [int] NOT NULL,
	[tietojen_ajankohta_id] [int] NOT NULL,
	[tiet_ak] [nvarchar](4) NULL,
	[tiet_akdate] [date] NULL,
	[lkm_yht] [int] NULL,
	[lkm_elakkeelle_siirtyneet] [int] NULL,
	[lkm_kuolleet] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_alueluokitus] FOREIGN KEY([alueluokitus_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_alueluokitus_historia] FOREIGN KEY([alueluokitus_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_elakkeelle_siirtynyt_tai_kuollut] FOREIGN KEY([elakkeelle_siirtynyt_tai_kuollut_id])
REFERENCES [dbo].[d_elakkeelle_siirtynyt_tai_kuollut] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_elakkeelle_siirtynyt_tai_kuollut]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_ika]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_mitenna_ammatti] FOREIGN KEY([mitenna_ammatti_id])
REFERENCES [dbo].[d_mitenna_ammatti] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_mitenna_ammatti]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_oef_ammatti] FOREIGN KEY([oef_ammatti_id])
REFERENCES [dbo].[d_oef_ammatti] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_oef_ammatti]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_paaasiallinen_toiminta] FOREIGN KEY([paaasiallinen_toiminta_id])
REFERENCES [dbo].[d_paaasiallinen_toiminta] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_paaasiallinen_toiminta]
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet]  WITH CHECK ADD  CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_tietojen_ajankohta] FOREIGN KEY([tietojen_ajankohta_id])
REFERENCES [dbo].[d_tietojen_ajankohta] ([id])
GO

ALTER TABLE [dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] CHECK CONSTRAINT [FK_f_elakkeelle_siirtyneet_ja_kuolleet_d_tietojen_ajankohta]
GO


