USE [ARVO_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_vastaajat')
BEGIN
	DROP TABLE [sa].[sa_arvo_vastaajat];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_vastaajat')

BEGIN
CREATE TABLE [sa].[sa_arvo_vastaajat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vastaajaid] int NULL,
  [vastaajatunnusid] int NULL,
  [vastaajatunnus] [nvarchar] (max) NULL,
  [oppilaitos] [nvarchar] (max) NULL,
  [vastaajatunnus_alkupvm] [date] NULL,
  [vastaajatunnus_loppupvm] [date] NULL,
	[suorituskieli] [nvarchar] (max) NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,


 CONSTRAINT [PK__sa_arvo_vastaajat] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_arvo_vastaajat] ADD  CONSTRAINT [DF__sa_arvo_vastaajat__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaajat] ADD  CONSTRAINT [DF__sa_arvo_vastaajat__username]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
