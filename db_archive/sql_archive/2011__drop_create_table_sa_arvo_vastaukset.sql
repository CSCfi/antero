USE [Arvo_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_arvo_vastaukset')
BEGIN
	DROP TABLE [sa].[sa_arvo_vastaukset];
END

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
	[vaihtoehto] [varchar](100) NULL,
	[vastausaika] [datetime] NULL,
 CONSTRAINT [PK__sa_arvo_vastaukset] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_arvo_vastaukset] ADD  CONSTRAINT [DF__sa_arvo_vastaukset__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset] ADD  CONSTRAINT [DF__sa_arvo_vastaukset__username]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
