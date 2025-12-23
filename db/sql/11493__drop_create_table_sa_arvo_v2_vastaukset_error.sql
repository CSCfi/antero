USE [Arvo_SA]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_vastaukset_error]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_arvo_v2_vastaukset_error](
	[vastausid] [int] NULL,
	[tiedonkeruu] [nvarchar](500) NULL,
	[kyselyid] [int] NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnusid] [int] NULL,
	[kysymysid] [int] NULL,
	[monivalintavaihtoehto_fi] [nvarchar](max) NULL,
	[monivalintavaihtoehto_sv] [nvarchar](max) NULL,
	[monivalintavaihtoehto_en] [nvarchar](max) NULL,
	[kyselykertaid] [int] NULL,
	[koulutustoimija] [nvarchar](max) NULL,
	[numerovalinta] [int] NULL,
	[vaihtoehto] [varchar](100) NULL,
	[vastausaika] [datetime] NULL,
	[kysymysversio] [int] NULL,
	[en_osaa_sanoa] [int] NULL,
	[luku] [varchar](100) NULL,
	[vapaateksti] [nvarchar](max) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](255) NULL,
	[username] [nvarchar](30) NULL,
	[fixed_status] [varchar](5) NULL,
	[koodi] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [idx_sa_arvo_v2_vastaukset_error_lookup] ON [sa].[sa_arvo_v2_vastaukset_error]
(
	[vastausid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_arvo_v2_vastaukset_error] ADD  CONSTRAINT [DF__sa_arvo_v2_vastaukset_error__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_v2_vastaukset_error] ADD  CONSTRAINT [DF__sa_arvo_v2_vastaukset_error__username]  DEFAULT (suser_name()) FOR [username]
GO

END
GO

USE ANTERO
