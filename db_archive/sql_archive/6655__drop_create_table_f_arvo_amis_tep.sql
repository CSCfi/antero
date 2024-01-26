USE [ANTERO]
GO

/****** Object:  Table [dw].[f_arvo_amis_tep]    Script Date: 17.11.2022 11:30:44 ******/
DROP TABLE [dw].[f_arvo_amis_tep]
GO

/****** Object:  Table [dw].[f_arvo_amis_tep]    Script Date: 17.11.2022 11:30:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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

GO


