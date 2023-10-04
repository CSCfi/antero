USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_arvo_vastaajat_jaadytetty]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[sa_arvo_vastaajat_jaadytetty](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[vastaajaid] [int] NULL,
	[vastaajatunnusid] [int] NULL,
	[vastaajatunnus] [varchar](100) NULL,
	[oppilaitoskoodi] [nvarchar](max) NULL,
	[vastaajatunnus_alkupvm] [date] NULL,
	[vastaajatunnus_loppupvm] [date] NULL,
	[suorituskieli] [nvarchar](max) NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[tutkintokoodi] [varchar](100) NULL,
	[toimipaikka] [varchar](100) NULL,
	[kuntakoodi] [varchar](100) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[kieli] [varchar](100) NULL,
	[henkilonumero] [varchar](100) NULL,
	[haun_numero] [varchar](100) NULL,
	[hankintakoulutuksen_toteuttaja] [varchar](100) NULL,
 CONSTRAINT [PK__sa_arvo_vastaajat_jaadytetty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [sa].[sa_arvo_vastaajat_jaadytetty] ADD  CONSTRAINT [DF__sa_arvo_vastaajat_jaadytetty__username]  DEFAULT (suser_name()) FOR [username]

ALTER TABLE [sa].[sa_arvo_vastaajat_jaadytetty] ADD  CONSTRAINT [DF__sa_arvo_vastaajat_jaadytetty__loadtime]  DEFAULT (getdate()) FOR [loadtime]

END

USE [ANTERO]

