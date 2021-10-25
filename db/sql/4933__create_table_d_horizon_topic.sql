USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_horizon_topic]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[d_horizon_topic](
	[topic_id] [varchar](100) NULL,
	[topic_koodi] [varchar](100) NULL,
	[Topic] [varchar](300) NULL,
	[call] [varchar](100) NULL,
	[rcn] [varchar](2000) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]

END