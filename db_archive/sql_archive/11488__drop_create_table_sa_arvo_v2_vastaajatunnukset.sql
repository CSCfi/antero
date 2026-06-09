USE [Arvo_SA]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_vastaajatunnukset]') AND type in (N'U'))
	DROP TABLE [sa].[sa_arvo_v2_vastaajatunnukset]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_v2_vastaajatunnukset](
	[vastaajatunnusid] [int] NULL,
	[vastaajatunnus] [varchar](100) NULL,
	[tiedonkeruu] [varchar](100) NULL,
	[kyselyid] [int] NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitoskoodi] [varchar](10) NULL,
	[koulutustoimija_oid] [varchar](255) NULL,
	[kohteiden_lkm] [int] NULL,
	[nippu] [varchar](500) NULL,
	[taustatiedot] [varchar](max) NULL,
	[voimassa_alkupvm] [datetime] NULL,
	[voimassa_loppupvm] [datetime] NULL,
	[aidinkieli] [varchar](100) NULL,
	[aloituspvm] [date] NULL,
	[arvosana] [varchar](100) NULL,
	[asteikko] [varchar](100) NULL,
	[asuinkunta_koodi] [varchar](10) NULL,
	[hankintakoulutuksen_toteuttaja] [varchar](100) NULL,
	[haun_numero] [varchar](100) NULL,
	[henkilonumero] [varchar](100) NULL,
	[heratepvm] [varchar](100) NULL,
	[ika_valmistuessa] [varchar](100) NULL,
	[kansalaisuus] [varchar](100) NULL,
	[kieli] [varchar](100) NULL,
	[kirjoilla_olo_kuukausia] [varchar](100) NULL,
	[koulutusala] [varchar](100) NULL,
	[koulutusalakoodi] [varchar](100) NULL,
	[koulutuskieli] [varchar](100) NULL,
	[koulutusmoduuli] [varchar](500) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[koulutussektori] [varchar](100) NULL,
	[koulutustoimija] [varchar](100) NULL,
	[koulutustoimija_nimi] [varchar](100) NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[kunta] [varchar](100) NULL,
	[laajuus] [int] NULL,
	[lasnaolo_lukukausia] [varchar](100) NULL,
	[opintooikeusjakso_nimi] [varchar](1000) NULL,
	[opiskelupaikkakunta_koodi] [varchar](100) NULL,
	[oppilaitoskoodi_taustatieto] [varchar](100) NULL,
	[oppisopimuksen_perusta] [varchar](100) NULL,
	[osa_aikaisuus] [varchar](100) NULL,
	[osaamisala] [varchar](100) NULL,
	[osaamisen_hankkimistapa] [varchar](100) NULL,
	[paaaine] [varchar](1000) NULL,
	[paikallinen_tutkinnon_osa] [varchar](1000) NULL,
	[rahoituslahde] [varchar](100) NULL,
	[rahoitusryhma] [varchar](100) NULL,
	[sahkoposti] [varchar](100) NULL,
	[sukupuoli] [int] NULL,
	[suorituskieli] [varchar](100) NULL,
	[tiedonkeruu_alkupvm] [date] NULL,
	[tiedonkeruu_loppupvm] [date] NULL,
	[toimipiste] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[tutkinnon_osa] [varchar](100) NULL,
	[tutkinnon_osat] [varchar](max) NULL,
	[tutkinnon_suorituskieli] [varchar](100) NULL,
	[tutkinnon_taso] [varchar](100) NULL,
	[tutkinto] [varchar](100) NULL,
	[tutkintomuoto] [varchar](100) NULL,
	[tutkintonimike] [varchar](100) NULL,
	[tyonantaja] [varchar](100) NULL,
	[tyopaikka] [varchar](1000) NULL,
	[tyopaikka_normalisoitu] [varchar](1000) NULL,
	[tyopaikkajakson_alkupvm] [date] NULL,
	[tyopaikkajakson_kesto] [varchar](100) NULL,
	[tyopaikkajakson_loppupvm] [date] NULL,
	[valintavuosi] [varchar](100) NULL,
	[valmistumisajankohta] [varchar](30) NULL,
	[valmistumisvuosi] [int] NULL,
	[tutkinnon_osat_oppilaitosmuotoinenkoulutus] [varchar](1000) NULL,
	[tutkinnon_osat_oppisopimus] [varchar](1000) NULL,
	[tutkinnon_osat_koulutussopimus] [varchar](1000) NULL,
	[source] [varchar](255) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [NC__sa_arvo_v2_vastaajatunnukset] ON [sa].[sa_arvo_v2_vastaajatunnukset]
(
	[vastaajatunnusid] ASC
)
INCLUDE([voimassa_alkupvm],[oppilaitoskoodi],[suorituskieli],[tutkinto],[kunta]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


CREATE NONCLUSTERED INDEX [NC2__sa_arvo_v2_vastaajatunnukset] ON [sa].[sa_arvo_v2_vastaajatunnukset]
(
	[vastaajatunnusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


USE ANTERO
