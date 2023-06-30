USE ARVO_SA
IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset_amis'
    )
BEGIN
	CREATE TABLE [sa].[sa_arvo_vastaukset_amis](
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
		[source] [varchar](255) NULL,
		[username] [nvarchar](30) NULL,
		[vaihtoehto] [varchar](100) NULL,
		[vastausaika] [datetime] NULL,
		[kysymysversio] [int] NULL,
	 CONSTRAINT [PK__sa_arvo_vastaukset_amis] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset_amk_uraseuranta'
    )
BEGIN
	CREATE TABLE [sa].[sa_arvo_vastaukset_amk_uraseuranta](
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
		[source] [varchar](255) NULL,
		[username] [nvarchar](30) NULL,
		[vaihtoehto] [varchar](100) NULL,
		[vastausaika] [datetime] NULL,
		[kysymysversio] [int] NULL,
	 CONSTRAINT [PK__sa_arvo_vastaukset_amk_uraseuranta] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset_avop'
    )
BEGIN

	CREATE TABLE [sa].[sa_arvo_vastaukset_avop](
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
		[source] [varchar](255) NULL,
		[username] [nvarchar](30) NULL,
		[vaihtoehto] [varchar](100) NULL,
		[vastausaika] [datetime] NULL,
		[kysymysversio] [int] NULL,
	 CONSTRAINT [PK__sa_arvo_vastaukset_avop] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset_kandi'
    )
BEGIN

	CREATE TABLE [sa].[sa_arvo_vastaukset_kandi](
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
		[source] [varchar](255) NULL,
		[username] [nvarchar](30) NULL,
		[vaihtoehto] [varchar](100) NULL,
		[vastausaika] [datetime] NULL,
		[kysymysversio] [int] NULL,
	 CONSTRAINT [PK__sa_arvo_vastaukset_kandi] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset_muut'
    )
BEGIN


CREATE TABLE [sa].[sa_arvo_vastaukset_muut](
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
	[source] [varchar](255) NULL,
	[username] [nvarchar](30) NULL,
	[vaihtoehto] [varchar](100) NULL,
	[vastausaika] [datetime] NULL,
	[kysymysversio] [int] NULL,
 CONSTRAINT [PK__sa_arvo_vastaukset_muut] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

GO

IF NOT EXISTS (
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = 'sa' AND TABLE_NAME = 'sa_arvo_vastaukset_tep'
    )
BEGIN


CREATE TABLE [sa].[sa_arvo_vastaukset_tep](
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
	[source] [varchar](255) NULL,
	[username] [nvarchar](30) NULL,
	[vaihtoehto] [varchar](100) NULL,
	[vastausaika] [datetime] NULL,
	[kysymysversio] [int] NULL,
 CONSTRAINT [PK__sa_arvo_vastaukset_tep] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END


ALTER TABLE [sa].[sa_arvo_vastaukset_amis] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_amis__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_amis] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_amis__username]  DEFAULT (suser_name()) FOR [username]

GO

ALTER TABLE [sa].[sa_arvo_vastaukset_amk_uraseuranta] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_amk_uraseuranta__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_amk_uraseuranta] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_amk_uraseuranta__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_avop] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_avop__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_avop] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_avop__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_kandi] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_kandi__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_kandi] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_kandi__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_muut] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_muut__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_muut] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_muut__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_tep] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_tep__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_arvo_vastaukset_tep] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_tep__username]  DEFAULT (suser_name()) FOR [username]
GO

USE ANTERO
