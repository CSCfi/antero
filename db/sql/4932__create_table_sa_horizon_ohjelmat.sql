USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_ohjelmat]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_ohjelmat](
	[programme_id] [varchar](50) NULL,
	[title] [varchar](500) NULL,
	[shortTitle] [varchar](200) NULL,
	[rcn] [varchar](2000) NULL
) ON [PRIMARY]

END