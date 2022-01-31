USE [ANTERO]
GO

ALTER TABLE [dw].[f_arvo_kandi] DROP CONSTRAINT [DF__f_arvo_kandi__username]
GO

ALTER TABLE [dw].[f_arvo_kandi] DROP CONSTRAINT [DF__f_arvo_kandi__loadtime]
GO

/****** Object:  Table [dw].[f_arvo_kandi]    Script Date: 31.1.2022 8:54:06 ******/
DROP TABLE [dw].[f_arvo_kandi]
GO

/****** Object:  Table [dw].[f_arvo_kandi]    Script Date: 31.1.2022 8:54:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_arvo_kandi](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
	[d_kieli_suorituskieli_id] [int] NULL,
	[d_arvovastaus_taustakysymys_sukupuoli_id] [nvarchar](50) NOT NULL,
	[d_arvovastaus_taustakysymys_ika_id] [int] NULL,
	[d_arvovastaus_taustakysymys_pohjakoulutus_id] [int] NULL,
	[d_alueluokitus_henkilon_kotikunta_id] [int] NOT NULL,
	[d_kalenteri_tunnus_luotu_id] [int] NOT NULL,
	[d_kalenteri_vastaus_id] [int] NULL,
	[d_arvokysymys_id] [int] NOT NULL,
	[d_arvokysymys_vanha_id] [int] NOT NULL,
	[d_arvokyselykerta_id] [int] NOT NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[d_arvoteema_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NOT NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](30) NOT NULL,
	[source] [varchar](100) NOT NULL,
	[numerovalinta] [nvarchar](50) NULL,
 CONSTRAINT [PK__f_arvo_kandi] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[f_arvo_kandi] ADD  CONSTRAINT [DF__f_arvo_kandi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[f_arvo_kandi] ADD  CONSTRAINT [DF__f_arvo_kandi__username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]