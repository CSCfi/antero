USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_tulodesiili_isa_d_tulodesiili]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_tulodesiili_aiti_d_tulodesiili]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_syntymavuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_sosioekonominen_asema_2_isa_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_sosioekonominen_asema_2_aiti_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_sosioekonominen_asema_1_isa_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_sosioekonominen_asema_1_aiti_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_opiskelijan_olo_syys_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_opetushallinnon_koulutus2_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_opetushallinnon_koulutus_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutusluokitus_isa_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutusluokitus_aiti_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutuslaji_d_koulutuslaji]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutuksen_maakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutuksen_maakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_koulutuksen_kieli_d_kieli]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_kotikunta1x_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_kotikunta1x_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_kotikunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_kotikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_kirjoihintulovuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_ika_5v_d_ika]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] DROP CONSTRAINT IF EXISTS [FK_2_23_aidinkieli_versio1x_d_aidinkieli_versio1]
GO

/****** Object:  Table [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 8.4.2020 13:42:26 ******/
DROP TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]
GO

/****** Object:  Table [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 8.4.2020 13:42:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk](
	[tilastointivuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[sukupuoli] [nvarchar](1) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[syntymavuosi] [nvarchar](4) NULL,
	[syntymavuosi_id] [nvarchar](10) NOT NULL,
	[aidinkieli_versio1x] [nvarchar](2) NULL,
	[aidinkieli_versio1x_id] [int] NOT NULL,
	[kotikunta] [nvarchar](3) NULL,
	[kotikunta_id] [int] NOT NULL,
	[kotikunta_historia_id] [int] NOT NULL,
	[kotikunta1x] [nvarchar](3) NULL,
	[kotikunta1x_id] [int] NOT NULL,
	[kotikunta1x_historia_id] [int] NOT NULL,
	[sosioekonominen_asema_1_isa] [nvarchar](1) NULL,
	[sosioekonominen_asema_1_isa_id] [int] NOT NULL,
	[sosioekonominen_asema_1_aiti] [nvarchar](1) NULL,
	[sosioekonominen_asema_1_aiti_id] [int] NOT NULL,
	[sosioekonominen_asema_2_isa] [nvarchar](2) NULL,
	[sosioekonominen_asema_2_isa_id] [int] NOT NULL,
	[sosioekonominen_asema_2_aiti] [nvarchar](2) NULL,
	[sosioekonominen_asema_2_aiti_id] [int] NOT NULL,
	[koulutusluokitus_isa] [nvarchar](6) NULL,
	[koulutusluokitus_isa_id] [int] NOT NULL,
	[koulutusluokitus_isa_historia_id] [int] NOT NULL,
	[koulutusluokitus_aiti] [nvarchar](6) NULL,
	[koulutusluokitus_aiti_id] [int] NOT NULL,
	[koulutusluokitus_aiti_historia_id] [int] NOT NULL,
	[tulodesiili_isa] [nvarchar](2) NULL,
	[tulodesiili_isa_id] [int] NOT NULL,
	[tulodesiili_aiti] [nvarchar](2) NULL,
	[tulodesiili_aiti_id] [int] NOT NULL,
	[sosioekonominen_tausta] [int] NULL,
	[koulutuslaji] [nvarchar](2) NULL,
	[koulutuslaji_id] [int] NOT NULL,
	[opetushallinnon_koulutus] [nvarchar](1) NULL,
	[opetushallinnon_koulutus_id] [int] NOT NULL,
	[koulutusluokitus] [nvarchar](6) NULL,
	[koulutusluokitus_id] [int] NOT NULL,
	[koulutusluokitus_historia_id] [int] NOT NULL,
	[koulutuksen_kieli] [nvarchar](2) NULL,
	[koulutuksen_kieli_id] [int] NOT NULL,
	[koulutuksen_maakunta] [nvarchar](2) NULL,
	[koulutuksen_maakunta_id] [int] NOT NULL,
	[koulutuksen_maakunta_historia_id] [int] NOT NULL,
	[kirjoihintulovuosi] [nvarchar](4) NULL,
	[kirjoihintulovuosi_id] [nvarchar](10) NOT NULL,
	[opiskelijan_olo_syys] [nvarchar](1) NULL,
	[opiskelijan_olo_syys_id] [int] NOT NULL,
	[opetushallinnon_koulutus2] [nvarchar](1) NULL,
	[opetushallinnon_koulutus2_id] [int] NOT NULL,
	[uudet_opiskelijat] [int] NULL,
	[opiskelijat] [int] NULL,
	[tutkinnot] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL,
	[ika_1v] [nvarchar](10) NULL,
	[ika_1v_id] [int] NULL,
	[ika_5v] [nvarchar](10) NULL,
	[ika_5v_id] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_aidinkieli_versio1x_d_aidinkieli_versio1] FOREIGN KEY([aidinkieli_versio1x_id])
REFERENCES [dbo].[d_aidinkieli_versio1] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_aidinkieli_versio1x_d_aidinkieli_versio1]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_ika_1v_d_ika] FOREIGN KEY([ika_1v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_ika_1v_d_ika]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_ika_5v_d_ika] FOREIGN KEY([ika_5v_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_ika_5v_d_ika]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_kirjoihintulovuosi_d_kausi] FOREIGN KEY([kirjoihintulovuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_kirjoihintulovuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_kotikunta_d_alueluokitus] FOREIGN KEY([kotikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_kotikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_kotikunta_historia_d_alueluokitus_historia] FOREIGN KEY([kotikunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_kotikunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_kotikunta1x_d_alueluokitus] FOREIGN KEY([kotikunta1x_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_kotikunta1x_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_kotikunta1x_historia_d_alueluokitus_historia] FOREIGN KEY([kotikunta1x_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_kotikunta1x_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutuksen_kieli_d_kieli] FOREIGN KEY([koulutuksen_kieli_id])
REFERENCES [dbo].[d_kieli] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutuksen_kieli_d_kieli]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutuksen_maakunta_d_alueluokitus] FOREIGN KEY([koulutuksen_maakunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutuksen_maakunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutuksen_maakunta_historia_d_alueluokitus_historia] FOREIGN KEY([koulutuksen_maakunta_historia_id])
REFERENCES [dbo].[d_alueluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutuksen_maakunta_historia_d_alueluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutuslaji_d_koulutuslaji] FOREIGN KEY([koulutuslaji_id])
REFERENCES [dbo].[d_koulutuslaji] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutuslaji_d_koulutuslaji]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutusluokitus_aiti_historia_d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_aiti_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutusluokitus_aiti_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutusluokitus_historia_d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutusluokitus_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_koulutusluokitus_isa_historia_d_koulutusluokitus_historia] FOREIGN KEY([koulutusluokitus_isa_historia_id])
REFERENCES [dbo].[d_koulutusluokitus_historia] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_koulutusluokitus_isa_historia_d_koulutusluokitus_historia]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_opetushallinnon_koulutus_d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_opetushallinnon_koulutus_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_opetushallinnon_koulutus2_d_opetushallinnon_koulutus] FOREIGN KEY([opetushallinnon_koulutus2_id])
REFERENCES [dbo].[d_opetushallinnon_koulutus] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_opetushallinnon_koulutus2_d_opetushallinnon_koulutus]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_opiskelijan_olo_syys_d_opiskelijan_olo] FOREIGN KEY([opiskelijan_olo_syys_id])
REFERENCES [dbo].[d_opiskelijan_olo] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_opiskelijan_olo_syys_d_opiskelijan_olo]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_sosioekonominen_asema_1_aiti_d_sosioekonominen_asema] FOREIGN KEY([sosioekonominen_asema_1_aiti_id])
REFERENCES [dbo].[d_sosioekonominen_asema] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_sosioekonominen_asema_1_aiti_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_sosioekonominen_asema_1_isa_d_sosioekonominen_asema] FOREIGN KEY([sosioekonominen_asema_1_isa_id])
REFERENCES [dbo].[d_sosioekonominen_asema] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_sosioekonominen_asema_1_isa_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_sosioekonominen_asema_2_aiti_d_sosioekonominen_asema] FOREIGN KEY([sosioekonominen_asema_2_aiti_id])
REFERENCES [dbo].[d_sosioekonominen_asema] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_sosioekonominen_asema_2_aiti_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_sosioekonominen_asema_2_isa_d_sosioekonominen_asema] FOREIGN KEY([sosioekonominen_asema_2_isa_id])
REFERENCES [dbo].[d_sosioekonominen_asema] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_sosioekonominen_asema_2_isa_d_sosioekonominen_asema]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_sukupuoli_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_sukupuoli_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_syntymavuosi_d_kausi] FOREIGN KEY([syntymavuosi_id])
REFERENCES [dbo].[d_kausi] ([kausi_id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_syntymavuosi_d_kausi]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_tulodesiili_aiti_d_tulodesiili] FOREIGN KEY([tulodesiili_aiti_id])
REFERENCES [dbo].[d_tulodesiili] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_tulodesiili_aiti_d_tulodesiili]
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]  WITH CHECK ADD  CONSTRAINT [FK_2_23_tulodesiili_isa_d_tulodesiili] FOREIGN KEY([tulodesiili_isa_id])
REFERENCES [dbo].[d_tulodesiili] ([id])
GO

ALTER TABLE [dbo].[f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] CHECK CONSTRAINT [FK_2_23_tulodesiili_isa_d_tulodesiili]
GO


USE [ANTERO]