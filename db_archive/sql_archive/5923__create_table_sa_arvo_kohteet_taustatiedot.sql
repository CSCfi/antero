USE [ANTERO]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

DROP TABLE IF EXISTS [sa].[sa_arvo_kohteet_taustatiedot]
--drop debug table
DROP TABLE IF EXISTS [sa].[sa_arvo_kohteet_taustatiedot2]

GO
CREATE TABLE [sa].[sa_arvo_kohteet_taustatiedot]
 (
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[vastaajatunnusid] [bigint] NOT NULL,
	[aidinkieli] [varchar](100) NULL,
	[arvosana] [varchar](100) NULL,
	[asteikko] [varchar](100) NULL,
	[asuinkunta_koodi] [varchar](100) NULL,
	[hankintakoulutuksen_toteuttaja] [varchar](100) NULL,
	[haun_numero] [varchar](100) NULL,
	[henkilonumero] [varchar](100) NULL,
	[heratepvm] [varchar](100) NULL,
	[ika_valmistuessa] [varchar](100) NULL,
	[kansalaisuus] [varchar](100) NULL,
	[kieli] [varchar](100) NULL,
	[kirjoilla_olo_kuukausia] [varchar](100) NULL,
	[koulutusalakoodi] [varchar](100) NULL,
	[koulutuskieli] [varchar](100) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[koulutustoimija] [varchar](300) NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[kunta] [varchar](100) NULL,
	[laajuus] [varchar](100) NULL,
	[lasnaolo_lukukausia] [varchar](100) NULL,
	[opiskelupaikkakunta_koodi] [varchar](100) NULL,
	[oppilaitoskoodi] [varchar](100) NULL,
	[oppisopimuksen_perusta] [varchar](100) NULL,
	[osa_aikaisuus] [varchar](100) NULL,
	[osaamisala] [varchar](100) NULL,
	[paaaine] [varchar](500) NULL,
	[paikallinen_tutkinnon_osa] [varchar](300) NULL,
	[sopimustyyppi] [varchar](100) NULL,
	[sukupuoli] [varchar](100) NULL,
	[tiedonkeruu_alkupvm] [varchar](100) NULL,
	[tiedonkeruu_loppupvm] [varchar](100) NULL,
	[toimipaikka] [varchar](200) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[tutkinnon_osa] [varchar](100) NULL,
	[tutkinnon_taso] [varchar](100) NULL,
	[tutkinto] [varchar](100) NULL,
	[tutkintomuoto] [varchar](100) NULL,
	[tutkintonimike] [varchar](100) NULL,
	[tyonantaja] [varchar](300) NULL,
	[tyopaikka] [varchar](300) NULL,
	[tyopaikka_normalisoitu] [varchar](300) NULL,
	[tyopaikkajakson_alkupvm] [varchar](100) NULL,
	[tyopaikkajakson_kesto] [varchar](100) NULL,
	[tyopaikkajakson_loppupvm] [varchar](100) NULL,
	[valintavuosi] [varchar](100) NULL,
	[valmistumisajankohta] [varchar](100) NULL,
	[valmistumisvuosi] [varchar](100) NULL,
	[taustatiedot] [varchar](max) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](150) NULL,
	[source] [varchar](150) NULL,
 CONSTRAINT [PK__sa_arvo_kohteet_taustatiedot] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot] ADD  CONSTRAINT [DF_sa_arvo_kohteet_taustatiedot_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_kohteet_taustatiedot] ADD  CONSTRAINT [DF_sa_arvo_kohteet_taustatiedot_username]  DEFAULT (suser_sname()) FOR [username]
GO
