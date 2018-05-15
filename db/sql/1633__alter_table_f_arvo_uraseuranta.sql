USE [ANTERO]
GO
/****** Object:  Table [dw].[f_arvo_uraseuranta]    Script Date: 15.5.2018 15:58:18 ******/
DROP TABLE IF EXISTS [dw].[f_arvo_uraseuranta]
GO
/****** Object:  Table [dw].[f_arvo_uraseuranta]    Script Date: 15.5.2018 15:58:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_uraseuranta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_uraseuranta](
	[d_organisaatio_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_alueluokitus_id] [int] NULL,
	[d_arvokysymys_id] [int] NULL,
	[d_arvokyselykerta_id] [int] NULL,
	[vaihtoehto] [bit] NULL,
	[monivalintavaihtoehto_fi] [varchar](250) NULL,
	[monivalintavaihtoehto_sv] [varchar](250) NULL,
	[monivalintavaihtoehto_en] [varchar](250) NULL,
	[numerovalinta] [int] NULL,
	[vapaateksti] [varchar](250) NULL,
	[laajuus] [varchar](250) NULL,
	[paaaine] [varchar](250) NULL,
	[arvosana] [varchar](250) NULL,
	[asteikko] [varchar](250) NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[valintavuosi] [int] NULL,
	[d_alueluokitus_asuinkunta_id] [int] NULL,
	[d_ika_valmistuessa_id] [bigint] NULL,
	[valmistumisvuosi] [int] NULL,
	[lasnaolo_lukukausia] [text] NULL,
	[kirjoilla_olo_kuukausia] [int] NULL,
	[valtakunnallinen] [bit] NULL,
	[vastaajaid] [varchar](250) NULL,
	[lukumaara] [int] NULL,
	[source] [varchar](31) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
