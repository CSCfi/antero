USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_topics]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_topics](
	[topic_id] [varchar](100) NULL,
	[code] [varchar](100) NULL,
	[title] [varchar](300) NULL,
	[call] [varchar](100) NULL,
	[rcn] [varchar](2000) NULL
) ON [PRIMARY]

END