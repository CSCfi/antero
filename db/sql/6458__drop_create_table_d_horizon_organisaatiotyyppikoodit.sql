USE [ANTERO]
GO

ALTER TABLE [dw].[d_horizon_organisaatiotyyppikoodit] DROP CONSTRAINT IF EXISTS [DF__d_horizon_organisaatiotyyppikoodit__username__531856C7]
GO 

ALTER TABLE [dw].[d_horizon_organisaatiotyyppikoodit] DROP CONSTRAINT IF EXISTS [DF__d_horizon_organisaatiotyyppikoodit__loadtime__5224328E]
GO

/****** Object:  Table [dw].[d_horizon_organisaatiotyyppikoodit]    Script Date: 23.9.2022 14:01:25 ******/
DROP TABLE [dw].[d_horizon_organisaatiotyyppikoodit]
GO

/****** Object:  Table [dw].[d_horizon_organisaatiotyyppikoodit]    Script Date: 23.9.2022 14:01:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_organisaatiotyyppikoodit](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[organisaatiotyyppi_koodi] [varchar](3) NULL,
	[Organisaatiotyyppi] [varchar](97) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK_d_horizon_organisaatiotyyppikoodit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dw].[d_horizon_organisaatiotyyppikoodit] ADD  CONSTRAINT [DF__d_horizon_organisaatiotyyppikoodit__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_horizon_organisaatiotyyppikoodit] ADD  CONSTRAINT [DF__d_horizon_organisaatiotyyppikoodit__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO



USE [ANTERO]