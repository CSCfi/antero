USE [Arvo_SA]

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_kyselykerrat')

BEGIN
CREATE TABLE [sa].[sa_arvo_kyselykerrat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kyselykertaid] [int] NULL,
	[kyselykerta] [nvarchar](max) NULL,
	[kyselykerta_vuosi] [nvarchar](max) NULL,
	[kyselyid] [int] NULL,
	[kysely_fi] [nvarchar](max) NULL,
	[kysely_sv] [nvarchar](max) NULL,
	[kysely_en] [nvarchar](max) NULL,
	[koulutustoimija] [nvarchar](max) NULL,
	[tyyppi] [nvarchar](max) NULL,
	[kysely_tila] [nvarchar](max) NULL,
	[kyselypohjaid] [int] NULL,
	[kyselypohja_nimi] [nvarchar](max) NULL,
	[kyselypohja_tarkenne] [nvarchar](max) NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_arvo_kyselykerrat] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_arvo_kyselykerrat] ADD  CONSTRAINT [DF__sa_arvo_kyselykerrat__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_kyselykerrat] ADD  CONSTRAINT [DF__sa_arvo_kyselykerrat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

-------------
USE [Arvo_SA]

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_kysymykset')
BEGIN
CREATE TABLE [sa].[sa_arvo_kysymykset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kysymysryhmaid] [int] NULL,
	[kysymysryhma_fi] [nvarchar](max) NULL,
	[kysymysryhma_en] [nvarchar](max) NULL,
	[kysymysryhma_sv] [nvarchar](max) NULL,
	[kysymysid] [int] NULL,
	[kysymys_fi] [nvarchar](max) NULL,
	[kysymys_sv] [nvarchar](max) NULL,
	[kysymys_en] [nvarchar](max) NULL,
	[jatkokysymys] [bit] NULL,
	[jatkokysymys_kysymysid] [int] NULL,
	[kategoria] [nvarchar](max) NULL,
	[rahoitusmallikysymys] [bit] NULL,
	[taustakysymyksen_tyyppi] [nvarchar](max) NULL,
	[vastaustyyppi] [nvarchar](max) NULL,
	[valtakunnallinen] [bit] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_arvo_kysymykset] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_arvo_kysymykset] ADD  CONSTRAINT [DF__sa_arvo_kysymykset__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_kysymykset] ADD  CONSTRAINT [DF__sa_arvo_kysymykset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

-------------------
USE [Arvo_SA]
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_kyselykerrat')
BEGIN
CREATE TABLE [sa].[sa_arvo_vastaajat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnusid] [int] NULL,
	[vastaajatunnus] [nvarchar](max) NULL,
	[oppilaitos] [nvarchar](max) NULL,
	[taustatiedot] [nvarchar](max) NULL,
	[haun_numero] [nvarchar](max) NULL,
	[kunta] [nvarchar](max) NULL,
	[toimipaikka] [nvarchar](max) NULL,
	[kieli] [nvarchar](max) NULL,
	[henkilonumero] [nvarchar](max) NULL,
	[hankintakoulutuksen_toteuttaja] [nvarchar](max) NULL,
	[tutkinto] [nvarchar](max) NULL,
	[koulutusmuoto] [nvarchar](max) NULL,
	[vastaajatunnus_alkupvm] [date] NULL,
	[vastaajatunnus_loppupvm] [date] NULL,
	[suorituskieli] [nvarchar](max) NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_arvo_vastaajat] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_arvo_vastaajat] ADD  CONSTRAINT [DF__sa_arvo_vastaajat__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_vastaajat] ADD  CONSTRAINT [DF__sa_arvo_vastaajat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

--------------------

USE [Arvo_SA]

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_vastaukset')
BEGIN
CREATE TABLE [sa].[sa_arvo_vastaukset](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vastausid] [int] NULL,
	[monivalintavaihtoehto_fi] [nvarchar](max) NULL,
	[monivalintavaihtoehto_sv] [nvarchar](max) NULL,
	[monivalintavaihtoehto_en] [nvarchar](max) NULL,
	[vastaajaid] [int] NULL,
	[kysymysid] [int] NULL,
	[kyselykertaid] [int] NULL,
	[koulutustoimija] [nvarchar](max) NULL,
	[numerovalinta] [int] NULL,
	[kyselyid] [int] NULL,
	[vastaajatunnusid] [int] NULL,
	[vapaateksti] [nvarchar](max) NULL,
	[loadtime] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL,
 CONSTRAINT [PK__sa_arvo_vastaukset] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_arvo_vastaukset] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
GO
