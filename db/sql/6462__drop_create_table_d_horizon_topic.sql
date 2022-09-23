USE [ANTERO]
GO

ALTER TABLE [dw].[d_horizon_topic] DROP CONSTRAINT IF EXISTS [DF__d_horizon_topic__username__531856C7]
GO

ALTER TABLE [dw].[d_horizon_topic] DROP CONSTRAINT IF EXISTS [DF__d_horizon_topic__loadtime__5224328E]
GO

/****** Object:  Table [dw].[d_horizon_topic]    Script Date: 23.9.2022 14:12:59 ******/
DROP TABLE [dw].[d_horizon_topic]
GO

/****** Object:  Table [dw].[d_horizon_topic]    Script Date: 23.9.2022 14:12:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_topic](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[topic_id] [varchar](100) NULL,
	[topic_koodi] [varchar](100) NULL,
	[Topic] [varchar](300) NULL,
	[call] [varchar](100) NULL,
	[rcn] [varchar](2000) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK_d_horizon_topic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_horizon_topic] ADD  CONSTRAINT [DF__d_horizon_topic__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_horizon_topic] ADD  CONSTRAINT [DF__d_horizon_topic__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]