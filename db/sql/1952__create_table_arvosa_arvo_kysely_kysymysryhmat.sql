USE [Arvo_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_arvo_kysely_kysymysryhma](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[kyselyid] [int] NULL,
	[kysymysryhmaid] [int] NULL,
	[jarjestys] [int] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
 CONSTRAINT [PK__sa_arvo_kysely_kysymysryhma] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_arvo_kysely_kysymysryhma] ADD  CONSTRAINT [DF__sa_arvo_kysely_kysymysryhma__username]  DEFAULT (suser_name()) FOR [username]
GO

ALTER TABLE [sa].[sa_arvo_kysely_kysymysryhma] ADD  CONSTRAINT [DF__sa_arvo_kysely_kysymysryhma__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO
USE [ANTERO]
GO
