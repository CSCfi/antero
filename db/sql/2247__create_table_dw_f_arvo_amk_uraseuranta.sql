USE [ANTERO]
GO
/****** Object:  Table [dw].[f_arvo_amk_uraseuranta]    Script Date: 9.5.2019 15:42:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amk_uraseuranta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_amk_uraseuranta](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NOT NULL,
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
	[d_suoritus_kieli_id] [int] NULL,
	[d_virta_taustatiedot_sukupuoli_id] [int] NULL,
	[d_virta_taustatiedot_aidinkieli_id] [int] NULL,
	[d_virta_taustatiedot_ika_id] [int] NULL,
	[d_pohjakoulutus_vastaus_monivalinta_id] [int] NULL,
	[d_tyokokemus_arvovastaus_id] [int] NULL,
	[numerovalinta] [nvarchar](50) NULL,
	[valmistumisvuosi] [int] NULL,
 CONSTRAINT [PK__f_arvo_amk_uraseuranta] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amk_uraseuranta_loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amk_uraseuranta] ADD  CONSTRAINT [DF__f_arvo_amk_uraseuranta_loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amk_uraseuranta_username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amk_uraseuranta] ADD  CONSTRAINT [DF__f_arvo_amk_uraseuranta_username]  DEFAULT (suser_sname()) FOR [username]
END