USE [VipunenTK]
GO


/****** Object:  Table [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]    Script Date: 12.1.2023 23:28:55 ******/
DROP TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]
GO

/****** Object:  Table [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]    Script Date: 12.1.2023 23:28:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet](
	[tilastovuosi] [nvarchar](4) NULL,
	[tilv_date] [date] NULL,
	[oppilaitos_avain] [nvarchar](10) NULL,
	[oppilaitos_id] [int] NOT NULL,
	[tieteenala_avain] [nvarchar](10) NULL,
	[tieteenala_id] [int] NOT NULL,
	[virkaryhma_avain] [nvarchar](10) NULL,
	[virkaryhma_id] [int] NOT NULL,
	[tutkijanuraporras_avain] [nvarchar](10) NULL,
	[tutkijanuraporras_id] [int] NOT NULL,
	[ika_avain] [nvarchar](10) NULL,
	[ika_id] [int] NOT NULL,
	[sukupuoli_avain] [nvarchar](10) NULL,
	[sukupuoli_id] [int] NOT NULL,
	[tutkintotaso_avain] [nvarchar](10) NULL,
	[tutkintotaso_id] [int] NOT NULL,
	[koulutusaste_taso2_avain] [nvarchar](10) NULL,
	[koulutusaste_taso2_id] [int] NOT NULL,
	[lkm_tutkimushenkilokunta] [int] NULL,
	[lkm_tutkimustyovuodet] [decimal](8, 4) NULL,
	[apuraha] [decimal](8, 4) NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika] FOREIGN KEY([ika_id])
REFERENCES [dbo].[d_ika] ([id])
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_ika]
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_oppilaitos]
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala] FOREIGN KEY([tieteenala_id])
REFERENCES [dbo].[d_tieteenala] ([id])
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tieteenala]
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso] FOREIGN KEY([tutkintotaso_id])
REFERENCES [dbo].[d_koulutusluokitus] ([id])
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_tutkintotaso]
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]  WITH CHECK ADD  CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma] FOREIGN KEY([virkaryhma_id])
REFERENCES [dbo].[d_virkaryhma] ([id])
GO

ALTER TABLE [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet] CHECK CONSTRAINT [FK_f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet_d_virkaryhma]
GO
