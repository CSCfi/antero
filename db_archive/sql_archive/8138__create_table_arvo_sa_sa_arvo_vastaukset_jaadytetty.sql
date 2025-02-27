USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_vastaukset_jaadytetty]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[sa_arvo_vastaukset_jaadytetty](
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
	[source] [nvarchar](255) NULL,
	[username] [nvarchar](30) NULL,
	[vaihtoehto] [varchar](100) NULL,
	[vastausaika] [datetime] NULL,
	[kysymysversio] [int] NULL,
 CONSTRAINT [PK__sa_arvo_vastaukset_jaadytetty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [sa].[sa_arvo_vastaukset_jaadytetty] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_jaadytetty__loadtime]  DEFAULT (getdate()) FOR [loadtime]

ALTER TABLE [sa].[sa_arvo_vastaukset_jaadytetty] ADD  CONSTRAINT [DF__sa_arvo_vastaukset_jaadytetty__username]  DEFAULT (suser_name()) FOR [username]

END

USE [ANTERO]