USE [Arvo_SA]
GO

DROP TABLE IF EXISTS [sa].[sa_arvo_kohteet]
GO

/****** Object:  Table [sa].[sa_arvo_kohteet]    Script Date: 8.12.2021 8.42.26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_kohteet](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
		[suorituskieli] [varchar](100) NULL,
		[vastaajaid] [varchar](15) NULL,
		[vastaajatunnus] [varchar](20) NULL,
		[vastaajatunnus_alkupvm] [datetime] NULL,
		[vastaajatunnus_loppupvm] [datetime] NULL,
		[vastaajatunnusid] [varchar](15) NULL,
		[kyselykertaid] [varchar](100) NULL,
		[kuntakoodi] [varchar](15) NULL,
		[tutkintokoodi] [varchar](15) NULL,
		[koulutusmuoto] [varchar](13) NULL,
		[toimipaikka] [varchar](15) NULL,
		[haun_numero] [varchar](100) NULL,
		[hankintakoulutuksen_toteuttaja] [varchar](100) NULL,
		[henkilonumero] [varchar](100) NULL,
		[kieli] [varchar](2) NULL,
		[oppilaitoskoodi] [varchar](100) NULL,
		[taustatiedot.heratepvm] [varchar](100) NULL,
		[taustatiedot.oppisopimuksen_perusta] [varchar](100) NULL,
		[taustatiedot.sopimustyyppi] [varchar](100) NULL,
		[taustatiedot.tutkinnon_osa] [varchar](100) NULL,
		[taustatiedot.tutkinnon_taso] [varchar](100) NULL,
		[taustatiedot.tutkintomuoto] [varchar](100) NULL,
		[taustatiedot.tutkintonimike] [varchar](200) NULL,
		[taustatiedot.tyonantaja] [varchar](300) NULL,
		[taustatiedot.tyopaikka] [varchar](300) NULL,
		[taustatiedot.tyopaikkajakson_alkupvm] [varchar](100) NULL,
		[taustatiedot.tyopaikkajakson_kesto] [varchar](100) NULL,
		[taustatiedot.tyopaikkajakson_loppupvm] [varchar](100) NULL,
		[taustatiedot.osa_aikaisuus] [varchar](100) NULL,
		[loadtime] [datetime] NULL,
		[username] [varchar](150) NULL,
		[source] [varchar](150) NULL,

 CONSTRAINT [PK__sa_arvo_kohteet] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_arvo_kohteet] ADD  CONSTRAINT [DF_sa_arvo_kohteet_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_kohteet] ADD  CONSTRAINT [DF_sa_arvo_kohteet_username]  DEFAULT (suser_sname()) FOR [username]
GO
