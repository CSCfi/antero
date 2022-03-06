USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__maanosa__d_valtio]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__kotikunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__kotikunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__eumaa__d_valtio]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__etamaa__d_valtio]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__d_pohjoismaa]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__d_kansalaisuus_versio1]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] DROP CONSTRAINT [FK__4_9__d_aidinkieli_versio2]
GO

/****** Object:  Table [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]    Script Date: 7.3.2022 0:24:02 ******/
DROP TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]
GO

/****** Object:  Table [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]    Script Date: 7.3.2022 0:24:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli] [nvarchar](2) NULL,
	[sukupuoli_id] [int] NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta_id] [int] NULL,
	[kotikunta_historia_id] [int] NULL,
	[aidinkieli_versio2] [nvarchar](2) NULL,
	[aidinkieli_versio2_id] [int] NULL,
	[kansalaisuus_versio1] [nvarchar](2) NULL,
	[kansalaisuus_versio1_id] [int] NULL,
	[maanosa] [nvarchar](2) NULL,
	[maanosa_id] [int] NULL,
	[pohjoismaa] [nvarchar](2) NULL,
	[pohjoismaa_id] [int] NULL,
	[eumaa] [nvarchar](2) NULL,
	[eumaa_id] [int] NULL,
	[etamaa] [nvarchar](2) NULL,
	[etamaa_id] [int] NULL,
	[lkm_0v] [int] NULL,
	[lkm_1v] [int] NULL,
	[lkm_2v] [int] NULL,
	[lkm_3v] [int] NULL,
	[lkm_4v] [int] NULL,
	[lkm_5v] [int] NULL,
	[lkm_6v] [int] NULL,
	[lkm_7v] [int] NULL,
	[lkm_8v] [int] NULL,
	[lkm_9v] [int] NULL,
	[lkm_10v] [int] NULL,
	[lkm_11v] [int] NULL,
	[lkm_12v] [int] NULL,
	[lkm_13v] [int] NULL,
	[lkm_14v] [int] NULL,
	[lkm_15v] [int] NULL,
	[lkm_16v] [int] NULL,
	[lkm_17v] [int] NULL,
	[lkm_18v] [int] NULL,
	[lkm_19v] [int] NULL,
	[lkm_20v] [int] NULL,
	[lkm_21v] [int] NULL,
	[lkm_22v] [int] NULL,
	[lkm_23v] [int] NULL,
	[lkm_24v] [int] NULL,
	[lkm_25v] [int] NULL,
	[lkm_26v] [int] NULL,
	[lkm_27v] [int] NULL,
	[lkm_28v] [int] NULL,
	[lkm_29v] [int] NULL,
	[lkm_30v] [int] NULL,
	[lkm_31v] [int] NULL,
	[lkm_32v] [int] NULL,
	[lkm_33v] [int] NULL,
	[lkm_34v] [int] NULL,
	[lkm_35v] [int] NULL,
	[lkm_36v] [int] NULL,
	[lkm_37v] [int] NULL,
	[lkm_38v] [int] NULL,
	[lkm_39v] [int] NULL,
	[lkm_40v] [int] NULL,
	[lkm_41v] [int] NULL,
	[lkm_42v] [int] NULL,
	[lkm_43v] [int] NULL,
	[lkm_44v] [int] NULL,
	[lkm_45v] [int] NULL,
	[lkm_46v] [int] NULL,
	[lkm_47v] [int] NULL,
	[lkm_48v] [int] NULL,
	[lkm_49v] [int] NULL,
	[lkm_50v] [int] NULL,
	[lkm_51v] [int] NULL,
	[lkm_52v] [int] NULL,
	[lkm_53v] [int] NULL,
	[lkm_54v] [int] NULL,
	[lkm_55v] [int] NULL,
	[lkm_56v] [int] NULL,
	[lkm_57v] [int] NULL,
	[lkm_58v] [int] NULL,
	[lkm_59v] [int] NULL,
	[lkm_60v] [int] NULL,
	[lkm_61v] [int] NULL,
	[lkm_62v] [int] NULL,
	[lkm_63v] [int] NULL,
	[lkm_64v] [int] NULL,
	[lkm_65v] [int] NULL,
	[lkm_66v] [int] NULL,
	[lkm_67v] [int] NULL,
	[lkm_68v] [int] NULL,
	[lkm_69v] [int] NULL,
	[lkm_70v] [int] NULL,
	[lkm_71v] [int] NULL,
	[lkm_72v] [int] NULL,
	[lkm_73v] [int] NULL,
	[lkm_74v] [int] NULL,
	[lkm_75v] [int] NULL,
	[lkm_76v] [int] NULL,
	[lkm_77v] [int] NULL,
	[lkm_78v] [int] NULL,
	[lkm_79v] [int] NULL,
	[lkm_80v] [int] NULL,
	[lkm_81v] [int] NULL,
	[lkm_82v] [int] NULL,
	[lkm_83v] [int] NULL,
	[lkm_84v] [int] NULL,
	[lkm_85v] [int] NULL,
	[lkm_86v] [int] NULL,
	[lkm_87v] [int] NULL,
	[lkm_88v] [int] NULL,
	[lkm_89v] [int] NULL,
	[lkm_90v] [int] NULL,
	[lkm_91v] [int] NULL,
	[lkm_92v] [int] NULL,
	[lkm_93v] [int] NULL,
	[lkm_94v] [int] NULL,
	[lkm_95v] [int] NULL,
	[lkm_96v] [int] NULL,
	[lkm_97v] [int] NULL,
	[lkm_98v] [int] NULL,
	[lkm_99v] [int] NULL,
	[lkm_100v_ja_vanh] [int] NULL,
	[lukumaara] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[aineistotunnus] [nvarchar](8) NULL,
	[aidinkieli] [nvarchar](2) NULL,
	[ika0_24_lkm] [int] NULL,
	[ika0_24_ka] [decimal](38, 6) NULL,
	[ika0_100_lkm] [int] NULL,
	[ika0_100_ka] [decimal](38, 6) NULL,
	[ika6_lkm] [int] NULL,
	[ika6_ka] [decimal](24, 6) NULL,
	[ika7_lkm] [int] NULL,
	[ika7_ka] [decimal](24, 6) NULL,
	[ika7_12_lkm] [int] NULL,
	[ika7_12_ka] [decimal](29, 6) NULL,
	[ika13_15_lkm] [int] NULL,
	[ika13_15_ka] [decimal](26, 6) NULL,
	[ika15_64_lkm] [int] NULL,
	[ika15_64_ka] [decimal](38, 6) NULL,
	[ika15_100_lkm] [int] NULL,
	[ika15_100_ka] [decimal](38, 6) NULL,
	[ika16_lkm] [int] NULL,
	[ika16_ka] [decimal](24, 6) NULL,
	[ika16_18_lkm] [int] NULL,
	[ika16_18_ka] [decimal](26, 6) NULL,
	[ika16_19_lkm] [int] NULL,
	[ika16_19_ka] [decimal](27, 6) NULL,
	[ika16_21_lkm] [int] NULL,
	[ika16_21_ka] [decimal](29, 6) NULL,
	[ika19_lkm] [int] NULL,
	[ika19_ka] [decimal](24, 6) NULL,
	[ika19_20_lkm] [int] NULL,
	[ika19_20_ka] [decimal](25, 6) NULL,
	[ika19_21_lkm] [int] NULL,
	[ika19_21_ka] [decimal](26, 6) NULL,
	[ika20_24_lkm] [int] NULL,
	[ika20_24_ka] [decimal](28, 6) NULL,
	[ika20_29_lkm] [int] NULL,
	[ika20_29_ka] [decimal](33, 6) NULL,
	[ika25_lkm] [int] NULL,
	[ika25_ka] [decimal](24, 6) NULL,
	[ika25_34_lkm] [int] NULL,
	[ika25_34_ka] [decimal](33, 6) NULL,
	[ika25_64_lkm] [int] NULL,
	[ika25_64_ka] [decimal](38, 6) NULL,
	[ika25_100_lkm] [int] NULL,
	[ika25_100_ka] [decimal](38, 6) NULL,
	[ika30_lkm] [int] NULL,
	[ika30_ka] [decimal](24, 6) NULL,
	[ika30_34_lkm] [int] NULL,
	[ika30_34_ka] [decimal](28, 6) NULL,
	[aineisto_id] [int] NULL,
	[aineisto_OTV_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__d_aidinkieli_versio2] FOREIGN KEY([aidinkieli_versio2_id])
REFERENCES [dbo].[d_aidinkieli_versio2] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__d_aidinkieli_versio2]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__d_aineisto] FOREIGN KEY([aineisto_id])
REFERENCES [dbo].[d_aineisto] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__d_aineisto]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__d_aineisto_OTV] FOREIGN KEY([aineisto_OTV_id])
REFERENCES [dbo].[d_aineisto_OTV] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__d_aineisto_OTV]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__d_kansalaisuus_versio1] FOREIGN KEY([kansalaisuus_versio1_id])
REFERENCES [dbo].[d_kansalaisuus_versio1] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__d_kansalaisuus_versio1]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__d_pohjoismaa] FOREIGN KEY([pohjoismaa_id])
REFERENCES [dbo].[d_pohjoismaa] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__d_pohjoismaa]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__d_sukupuoli]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__etamaa__d_valtio] FOREIGN KEY([etamaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__etamaa__d_valtio]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__eumaa__d_valtio] FOREIGN KEY([eumaa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__eumaa__d_valtio]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__kotikunta__d_alueluokitus] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__kotikunta__d_alueluokitus]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__kotikunta__d_alueluokitus_historia] FOREIGN KEY([kotikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__kotikunta__d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain]  WITH CHECK ADD  CONSTRAINT [FK__4_9__maanosa__d_valtio] FOREIGN KEY([maanosa_id])
REFERENCES [dbo].[d_valtio] ([id])
GO

ALTER TABLE [dbo].[f_OTV_4_9_Vaestorakenne_kunnittain] CHECK CONSTRAINT [FK__4_9__maanosa__d_valtio]
GO


