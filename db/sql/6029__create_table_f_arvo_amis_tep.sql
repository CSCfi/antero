USE [ANTERO]
GO
/****** Object:  Table [dw].[f_arvo_amis_tep]    Script Date: 10.3.2022 9:32:54 ******/
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
	[d_kalenteri_tunnus_luotu_id] [bigint] NULL,
	[d_kalenteri_vastaus_id] [bigint] NULL,
	[d_arvokysymys_id] [int] NULL,
	[d_arvokyselykerta_id] [int] NULL,
	[d_arvovastaus_taustakysymys_tehtava_id] [int] NULL,
	[d_arvovastaus_monivalinta_id] [int] NULL,
	[d_suoritus_kieli_id] [bigint] NULL,
	[d_ytj_yritystiedot_tyonantaja_id] [int] NULL,
	[d_oppisopimuksen_perusta_id] [int] NULL,
	[d_tutkinnon_osa_id] [int] NULL,
	[sopimustyyppi] [varchar](100) NULL,
	[numerovalinta] [int] NULL,
	[vaihtoehto] [varchar](100) NULL,
	[tyopaikkajakson_kesto] [float] NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnus] [varchar](20) NULL,
	[tyopaikkaohjaajakysely_vastaajatunnus] [varchar](20) NULL,
	[source] [varchar](250) NULL
) ON [PRIMARY]
END
