USE [Arvo_SA]
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_v2_vastaukset_avop]') AND type in (N'U'))
BEGIN

	CREATE TABLE [sa].[sa_arvo_v2_vastaukset_avop](
		[id] [int] IDENTITY(1,1) NOT NULL,
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
		[koodi] [nvarchar](100) NULL,
	 CONSTRAINT [PK__sa_arvo_v2_vastaukset_avop] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY];

	CREATE NONCLUSTERED INDEX [NC__sa_arvo_v2_vastaukset_avop] ON [sa].[sa_arvo_v2_vastaukset_avop]
	(
		[kysymysid] ASC
	)
	INCLUDE([vastaajaid],[vastaajatunnusid],[kyselyid],[numerovalinta]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY];

	CREATE UNIQUE NONCLUSTERED INDEX [NC2__sa_arvo_v2_vastaukset_avop] ON [sa].[sa_arvo_v2_vastaukset_avop]
	(
	[vastausid] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY];

	ALTER TABLE [sa].[sa_arvo_v2_vastaukset_avop] ADD  CONSTRAINT [DF__sa_arvo_v2_vastaukset_avop__loadtime]  DEFAULT (getdate()) FOR [loadtime]

	ALTER TABLE [sa].[sa_arvo_v2_vastaukset_avop] ADD  CONSTRAINT [DF__sa_arvo_v2_vastaukset_avop__username]  DEFAULT (suser_name()) FOR [username]

END
GO

USE ANTERO
