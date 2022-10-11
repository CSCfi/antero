USE [ANTERO]
GO

ALTER TABLE [dw].[f_arvo_amk_uraseuranta] DROP CONSTRAINT [DF__f_arvo_amk_uraseuranta_username]
GO

ALTER TABLE [dw].[f_arvo_amk_uraseuranta] DROP CONSTRAINT [DF__f_arvo_amk_uraseuranta_loadtime]
GO

/****** Object:  Table [dw].[f_arvo_amk_uraseuranta]    Script Date: 6.10.2022 8:18:07 ******/
DROP TABLE [dw].[f_arvo_amk_uraseuranta]
GO

/****** Object:  Table [dw].[f_arvo_amk_uraseuranta]    Script Date: 6.10.2022 8:18:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_amk_uraseuranta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_pohjakoulutus_id] [int] NULL,
	[d_arvovastaus_taustakysymys_tyokokemus_id] [int] NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[d_alueluokitus_henkilon_kotikunta_id] [int] NOT NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_suoritus_kieli_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_aidinkieli_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NULL,
	[numerovalinta] [nvarchar](50) NULL,
	[rahoituskysymys_paino] [float] NULL,
	[d_kylla_ei_valinta_id] [int] NULL,
	[valmistumisvuosi] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[tilastovuosi] [int] NULL,
 CONSTRAINT [PK__f_arvo_amk_uraseuranta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_arvo_amk_uraseuranta] ADD  CONSTRAINT [DF__f_arvo_amk_uraseuranta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_amk_uraseuranta] ADD  CONSTRAINT [DF__f_arvo_amk_uraseuranta_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]