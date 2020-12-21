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

/****** Object:  Table [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]    Script Date: 16.12.2020 19:46:01 ******/
DROP TABLE [dbo].[f_TJK_2_11_tutkintoon_johtamaton_koulutus]
GO

DROP TABLE [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus]
GO

/****** Object:  Table [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus]    Script Date: 16.12.2020 23:22:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus](
	[id] [int] NOT NULL,
	[Opetustuntikoodi] [varchar](10) NULL,
	[Koulutusala_lajittelu] [int] NULL,
	[Koulutusala] [varchar](250) NULL,
	[Koulutusala_SV] [varchar](250) NULL,
	[Koulutusala_EN] [varchar](250) NULL,
	[Opintoala_lajittelu] [int] NULL,
	[Opintoala] [varchar](250) NULL,
	[Opintoala_SV] [varchar](250) NULL,
	[Opintoala_EN] [varchar](250) NULL,
	[Koulutustyyppi_lajittelu] [int] NULL,
	[Koulutustyyppi] [varchar](250) NULL,
	[Koulutustyyppi_SV] [varchar](250) NULL,
	[Koulutustyyppi_EN] [varchar](250) NULL,
	[Opetustunti_lajittelu] [int] NULL,
	[Opetustunti] [varchar](250) NULL,
	[Opetustunti_SV] [varchar](250) NULL,
	[Opetustunti_EN] [varchar](250) NULL,
 CONSTRAINT [PK_d_opetustuntien_sisalto_ja_tavoiteluokitus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

INSERT INTO VipunenTK..d_opetustuntien_sisalto_ja_tavoiteluokitus
SELECT * FROM VipunenTK_DW.[dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus]
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

USE [ANTERO]
