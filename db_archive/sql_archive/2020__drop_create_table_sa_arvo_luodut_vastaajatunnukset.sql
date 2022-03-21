USE [Arvo_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_luodut_vastaajatunnukset')
BEGIN
	DROP TABLE [sa].[sa_arvo_luodut_vastaajatunnukset];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_luodut_vastaajatunnukset')

BEGIN
CREATE TABLE [sa].[sa_arvo_luodut_vastaajatunnukset](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kyselykertaid] [int] NULL,
	[oppilaitoskoodi] [varchar](30) NULL,
	[tutkintokoodi] [varchar](30) NULL,
	[kuukausi] [varchar] (30) NULL,
	[vastaajatunnukset_lkm] [int] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	CONSTRAINT [PK__sa_arvo_luodut_vastaajatunnukset] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END

GO

ALTER TABLE [sa].[sa_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__sa_arvo_luodut_vastaajatunnukset__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_luodut_vastaajatunnukset] ADD  CONSTRAINT [DF__sa_arvo_luodut_vastaajatunnukset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

USE [ANTERO]
