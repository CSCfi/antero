USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_yo_uraseuranta]    Script Date: 16.3.2026 10.45.03 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_yo_uraseuranta]') AND type in (N'U'))
DROP TABLE [dw].[f_arvo_yo_uraseuranta]
DROP TABLE IF EXISTS [dw].[f_arvo_yo_uraseuranta_2018]
GO

/****** Object:  Table [dw].[f_arvo_yo_uraseuranta]    Script Date: 16.3.2026 10.45.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_yo_uraseuranta](
	[tilastovuosi] [int] NULL,
	[vastaajaid] [int] NULL,
	[numerovalinta] [int] NULL,
	[rahoituskysymys_paino] [numeric](7, 6) NULL,
	[d_arvotiedonkeruu_id] [int] NULL,
	[d_arvokysymys_id] [int] NULL,
	[d_organisaatioluokitus_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[d_kytkin_vaihtoehto_id] [int] NULL,
	[d_virta_rahoituslahde_id] [int] NOT NULL,
	[source] [varchar](34) NOT NULL
) ON [PRIMARY]