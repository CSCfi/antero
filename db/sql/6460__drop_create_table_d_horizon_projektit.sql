USE [ANTERO]
GO

ALTER TABLE [dw].[d_horizon_projektit] DROP CONSTRAINT [DF__d_horizon_projektit__username__531856C7]
GO

ALTER TABLE [dw].[d_horizon_projektit] DROP CONSTRAINT [DF__d_horizon_projektit__loadtime__5224328E]
GO

/****** Object:  Table [dw].[d_horizon_projektit]    Script Date: 23.9.2022 14:07:03 ******/
DROP TABLE [dw].[d_horizon_projektit]
GO

/****** Object:  Table [dw].[d_horizon_projektit]    Script Date: 23.9.2022 14:07:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[d_horizon_projektit](
	[id] [bigint] IDENTITY(0,1) NOT NULL,
	[acronym] [varchar](1722) NULL,
	[call] [varchar](100) NULL,
	[coordinator] [varchar](500) NULL,
	[coordinatorCountry] [varchar](45) NULL,
	[ecMaxContribution] [float] NULL,
	[endDate] [varchar](254) NULL,
	[frameworkProgramme] [varchar](633) NULL,
	[fundingScheme] [varchar](34) NULL,
	[project_id] [varchar](1623) NULL,
	[objective] [varchar](max) NULL,
	[programme] [varchar](856) NULL,
	[startDate] [varchar](259) NULL,
	[status] [varchar](1160) NULL,
	[title] [varchar](max) NULL,
	[topics] [varchar](1320) NULL,
	[totalCost] [float] NULL,
	[rcn] [varchar](1989) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL,
	[source] [varchar](100) NOT NULL,
 CONSTRAINT [PK_d_horizon_projektit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dw].[d_horizon_projektit] ADD  CONSTRAINT [DF__d_horizon_projektit__loadtime__5224328E]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [dw].[d_horizon_projektit] ADD  CONSTRAINT [DF__d_horizon_projektit__username__531856C7]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]