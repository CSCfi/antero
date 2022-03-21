USE [ANTERO]
GO

ALTER TABLE [dw].[f_arvo_amis] DROP CONSTRAINT [DF__f_arvo_amis__username]
GO

ALTER TABLE [dw].[f_arvo_amis] DROP CONSTRAINT [DF__f_arvo_amis__loadtime]
GO

/****** Object:  Table [dw].[f_arvo_amis]    Script Date: 20.3.2019 22:10:25 ******/
DROP TABLE [dw].[f_arvo_amis]
GO

/****** Object:  Table [dw].[f_arvo_amis]    Script Date: 20.3.2019 22:10:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_amis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_sukupuoli_id] [nvarchar](50) NOT NULL,
	[d_arvovastaus_taustakysymys_aidinkieli_id] [int] NOT NULL,
	[d_arvovastaus_taustakysymys_ika_id] [int] NULL,
	[d_arvovastaus_taustakysymys_hakeutumisvayla_id] [int] NULL,
	[d_oppisopimuskoulutus_id] [int] NULL,
	[d_arvovastaus_taustakysymys_arvio_tilanteesta_id] [int] NULL,
	[d_alueluokitus_henkilon_kotikunta_id] [int] NOT NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
	[d_suoritus_kieli_id] [int] NULL,
 CONSTRAINT [PK__f_arvo_amis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [DF__f_arvo_amis__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [DF__f_arvo_amis__username]  DEFAULT (suser_sname()) FOR [username]



