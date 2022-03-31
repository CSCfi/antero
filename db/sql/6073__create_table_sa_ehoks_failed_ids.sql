USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE IF EXISTS [sa].[sa_ehoks_failed_ids];
GO
CREATE TABLE [sa].[sa_ehoks_failed_ids](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ehoks_id] [bigint] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	 CONSTRAINT [PK_ehoks_failed_ids] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
 ON [PRIMARY]
GO

ALTER TABLE [sa].[sa_ehoks_failed_ids] ADD  CONSTRAINT [DF__sa_ehoks_failed_ids__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_ehoks_failed_ids] ADD  CONSTRAINT [DF__sa_ehoks_failed_ids__username]  DEFAULT (suser_name()) FOR [username]
GO
