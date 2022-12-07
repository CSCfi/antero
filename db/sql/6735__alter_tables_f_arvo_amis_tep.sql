USE [ANTERO]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amis]') AND type in (N'U'))
ALTER TABLE [dw].[f_arvo_amis] DROP CONSTRAINT IF EXISTS [DF__f_arvo_amis__username]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amis]') AND type in (N'U'))
ALTER TABLE [dw].[f_arvo_amis] DROP CONSTRAINT IF EXISTS [DF__f_arvo_amis__loadtime]
GO
/****** Object:  Table [dw].[f_arvo_amis_tep]    Script Date: 7.12.2022 13:57:01 ******/
DROP TABLE IF EXISTS [dw].[f_arvo_amis_tep]
GO
/****** Object:  Table [dw].[f_arvo_amis]    Script Date: 7.12.2022 13:57:01 ******/
DROP TABLE IF EXISTS [dw].[f_arvo_amis]
GO
/****** Object:  Table [dw].[f_arvo_amis]    Script Date: 7.12.2022 13:57:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amis]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_amis](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[koulutustoimija] [varchar](10) NOT NULL,
	[d_organisaatio_oppilaitos_id] [int] NOT NULL,
	[d_organisaatio_koulutustoimija_id] [int] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
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
	[d_rahoitusryhma_id] [int] NULL,
	[vastaajaid] [nvarchar](50) NULL,
	[vastaajatunnus] [nvarchar](50) NULL,
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
END
GO
/****** Object:  Table [dw].[f_arvo_amis_tep]    Script Date: 7.12.2022 13:57:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_arvo_amis_tep]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_arvo_amis_tep](
	[d_organisaatio_oppilaitos_id] [bigint] NULL,
	[d_organisaatio_koulutustoimija_id] [bigint] NULL,
	[d_amos_spl_jarjestaja_linkki_id] [int] NULL,
	[d_alueluokitus_oppilaitos_id] [int] NULL,
	[d_alueluokitus_koulutustoimija_id] [int] NULL,
	[d_koulutusluokitus_id] [int] NULL,
	[d_alueluokitus_toimipaikka_id] [int] NULL,
	[d_maatjavaltiot2_toimipaikka_id] [int] NULL,
	[d_kalenteri_jakso_paattynyt_id] [bigint] NULL,
	[d_arvokysymys_id] [int] NULL,
	[d_arvokyselykerta_id] [int] NULL,
	[d_arvovastaus_taustakysymys_tehtava_id] [int] NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[d_suoritus_kieli_id] [bigint] NULL,
	[d_ytj_yritystiedot_tyonantaja_id] [int] NULL,
	[d_oppisopimuksen_perusta_id] [int] NULL,
	[d_tutkinnon_osa_id] [int] NULL,
	[d_osaamisen_hankkimistapa_id] [int] NULL,
	[d_rahoitusryhma_id] [int] NULL,
	[numerovalinta] [int] NULL,
	[vaihtoehto] [varchar](100) NULL,
	[tyopaikkajakson_kesto] [float] NULL,
	[vastaajaid] [varchar](30) NULL,
	[vastaajatunnus] [varchar](20) NULL,
	[tyopaikkaohjaajakysely_vastaajaid] [int] NULL,
	[tyopaikkaohjaajakysely_vastaajatunnus] [varchar](20) NULL,
	[tyopaikkakysely_vastaajaid] [int] NULL,
	[tyopaikkakysely_vastaajatunnus] [varchar](20) NULL,
	[tyopaikkakysely_liittyva_ohjaajatunnus] [varchar](20) NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amis__loadtime]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [DF__f_arvo_amis__loadtime]  DEFAULT (getdate()) FOR [loadtime]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[DF__f_arvo_amis__username]') AND type = 'D')
BEGIN
ALTER TABLE [dw].[f_arvo_amis] ADD  CONSTRAINT [DF__f_arvo_amis__username]  DEFAULT (suser_sname()) FOR [username]
END

