USE [Arvo_SA]
GO
DROP TABLE IF EXISTS [sa].[sa_arvo_vastaukset_errors]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_vastaukset_errors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fixed_status] [nvarchar](25) NULL,
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
	[source] [varchar](255) NULL,
	[username] [nvarchar](30) NULL,
	[vaihtoehto] [varchar](100) NULL,
	[vastausaika] [datetime] NULL,
	[kysymysversio] [int] NULL,
 CONSTRAINT [PK__sa_arvo_vastaukset_errors] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_arvo_vastaukset_errors] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_errors__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_errors] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_errors__username]  DEFAULT (suser_name()) FOR [username]
GO

CREATE UNIQUE NONCLUSTERED INDEX [NC2__sa_arvo_vastaukset_errors] ON [sa].[sa_arvo_vastaukset_errors]
(
	[vastausid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
