USE [ANTERO]
GO

ALTER TABLE [dw].[d_horizon_maakoodit] DROP CONSTRAINT IF EXISTS [DF__d_horizon_maakoodit__username__531856C7]
GO

ALTER TABLE [dw].[d_horizon_maakoodit] DROP CONSTRAINT IF EXISTS [DF__d_horizon_maakoodit__loadtime__5224328E]
GO

/****** Object:  Table [dw].[d_horizon_maakoodit]    Script Date: 23.9.2022 13:56:02 ******/
DROP TABLE [dw].[d_horizon_maakoodit]
GO

/****** Object:  Table [dw].[d_horizon_maakoodit]    Script Date: 23.9.2022 13:56:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_maakoodit](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[eu_koodi] [varchar](2) NULL,
	[iso_koodi] [varchar](4) NULL,
	[Maa] [varchar](44) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK_d_horizon_maakoodit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_horizon_maakoodit] ADD  CONSTRAINT [DF__d_horizon_maakoodit__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_horizon_maakoodit] ADD  CONSTRAINT [DF__d_horizon_maakoodit__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]