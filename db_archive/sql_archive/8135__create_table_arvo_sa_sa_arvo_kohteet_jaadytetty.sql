USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_kohteet_jaadytetty]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[sa_arvo_kohteet_jaadytetty](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[suorituskieli] [varchar](100) NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnus] [varchar](100) NULL,
	[vastaajatunnus_alkupvm] [datetime] NULL,
	[vastaajatunnus_loppupvm] [datetime] NULL,
	[vastaajatunnusid] [int] NULL,
	[kyselykertaid] [int] NULL,
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
 CONSTRAINT [PK__sa_arvo_kohteet_jaadytetty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [sa].[sa_arvo_kohteet_jaadytetty] ADD  CONSTRAINT [DF_sa_arvo_kohteet_jaadytetty_loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [sa].[sa_arvo_kohteet_jaadytetty] ADD  CONSTRAINT [DF_sa_arvo_kohteet_jaadytetty_username]  DEFAULT (suser_sname()) FOR [username]

END

USE [ANTERO]