USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_yo_uraseuranta]    Script Date: 5.12.2019 9:13:04 ******/
DROP TABLE [dw].[f_arvo_yo_uraseuranta]
GO

/****** Object:  Table [dw].[f_arvo_yo_uraseuranta]    Script Date: 5.12.2019 9:13:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_yo_uraseuranta](
	[kysymysid] [int] NULL,
	[d_organisaatio_id] [bigint] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_alueluokitus_id] [int] NULL,
	[d_arvokysymys_id] [int] NULL,
	[d_arvokyselykerta_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_valmistuessa_id] [bigint] NULL,
	[d_maatjavaltiot_kansalaisuus_id] [int] NULL,
	[d_alueluokitus_asuinkunta_id] [int] NULL,
	[kyselypohja] [varchar](500) NULL,
	[kyselyvuosi] [varchar](500) NULL,
	[kysymysryhma] [varchar](500) NULL,
	[kysymys] [varchar](500) NULL,
	[vastaustyyppi] [varchar](500) NULL,
	[monivalintavaihtoehto_fi] [varchar](500) NULL,
	[monivalintavaihtoehto_sv] [varchar](500) NULL,
	[monivalintavaihtoehto_en] [varchar](500) NULL,
	[numerovalinta] [int] NULL,
	[vaihtoehto] [bit] NULL,
	[vapaateksti] [varchar](max) NULL,
	[laajuus] [varchar](250) NULL,
	[paaaine] [varchar](250) NULL,
	[arvosana] [varchar](250) NULL,
	[asteikko] [varchar](250) NULL,
	[valintavuosi] [int] NULL,
	[valmistumisvuosi] [int] NULL,
	[lasnaolo_lukukausia] [text] NULL,
	[kirjoilla_olo_kuukausia] [int] NULL,
	[valtakunnallinen] [bit] NULL,
	[vastaajaid] [varchar](250) NULL,
	[lukumaara] [int] NULL,
	[source] [varchar](31) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]