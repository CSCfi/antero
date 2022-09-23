USE [ANTERO]
GO

ALTER TABLE [dw].[d_horizon_pilari] DROP CONSTRAINT IF EXISTS [DF__d_horizon_pilari__username__531856C7]
GO

ALTER TABLE [dw].[d_horizon_pilari] DROP CONSTRAINT IF EXISTS [DF__d_horizon_pilari__loadtime__5224328E]
GO

/****** Object:  Table [dw].[d_horizon_pilari]    Script Date: 23.9.2022 14:04:42 ******/
DROP TABLE [dw].[d_horizon_pilari]
GO

/****** Object:  Table [dw].[d_horizon_pilari]    Script Date: 23.9.2022 14:04:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_pilari](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[ohjelma_koodi] [varchar](50) NULL,
	[Pilari] [varchar](200) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK_d_horizon_pilari] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_horizon_pilari] ADD  CONSTRAINT [DF__d_horizon_pilari__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_horizon_pilari] ADD  CONSTRAINT [DF__d_horizon_pilari__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]