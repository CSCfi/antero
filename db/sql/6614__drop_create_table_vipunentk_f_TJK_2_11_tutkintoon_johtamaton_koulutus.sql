USE [VipunenTK]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] DROP CONSTRAINT IF EXISTS [FK_2_11_yllapitajan_sijaintikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] DROP CONSTRAINT IF EXISTS [FK_2_11_oppilaitoksen_sijaintikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] DROP CONSTRAINT IF EXISTS [FK_2_11_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] DROP CONSTRAINT IF EXISTS [FK_2_11_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] DROP CONSTRAINT IF EXISTS [FK_2_11_d_opetustunti]
GO

/****** Object:  Table [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]    Script Date: 3.2.2022 8:02:14 ******/
DROP TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]
GO

/****** Object:  Table [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]    Script Date: 3.2.2022 8:02:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus](
	[tilastointivuosi] [varchar](4) NULL,
	[opetustunti_avain] [varchar](10) NULL,
	[opetustunti_id] [int] NOT NULL,
	[oppilaitos_avain] [nvarchar](5) NULL,
	[oppilaitos_id] [int] NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](10) NULL,
	[oppilaitoksen_sijaintikunta_id] [int] NOT NULL,
	[yllapitajan_sijaintikunta_id] [int] NOT NULL,
	[sukupuoli_koodi] [nvarchar](10) NOT NULL,
	[sukupuoli_id] [int] NOT NULL,
	[eikoul_id] [int] NOT NULL,
	[Opetustuntien lukumäärä] [int] NULL,
	[Osallistuneiden lukumäärä] [int] NULL,
	[Osallistuneiden lukumäärä (netto)] [int] NULL,
	[Suorittaneiden lukumäärä] [int] NULL,
	[Koulutusten lukumäärä] [int] NULL,
	[tietolahde] [nvarchar](50) NULL,
	[rivinumero] [int] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_2_11_d_opetustunti] FOREIGN KEY([opetustunti_id])
REFERENCES [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] CHECK CONSTRAINT [FK_2_11_d_opetustunti]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_2_11_d_oppilaitoksen_taustatiedot] FOREIGN KEY([oppilaitos_id])
REFERENCES [dbo].[d_oppilaitoksen_taustatiedot] ([id])
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] CHECK CONSTRAINT [FK_2_11_d_oppilaitoksen_taustatiedot]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_2_11_d_sukupuoli] FOREIGN KEY([sukupuoli_id])
REFERENCES [dbo].[d_sukupuoli] ([id])
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] CHECK CONSTRAINT [FK_2_11_d_sukupuoli]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_2_11_oppilaitoksen_sijaintikunta_d_alueluokitus] FOREIGN KEY([oppilaitoksen_sijaintikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] CHECK CONSTRAINT [FK_2_11_oppilaitoksen_sijaintikunta_d_alueluokitus]
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]  WITH CHECK ADD  CONSTRAINT [FK_2_11_yllapitajan_sijaintikunta_d_alueluokitus] FOREIGN KEY([yllapitajan_sijaintikunta_id])
REFERENCES [dbo].[d_alueluokitus] ([id])
GO

ALTER TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus] CHECK CONSTRAINT [FK_2_11_yllapitajan_sijaintikunta_d_alueluokitus]
GO


