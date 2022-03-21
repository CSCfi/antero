USE [ANTERO]
GO

/****** Object:  Table [dw].[f_horizon]    Script Date: 17.9.2021 14:04:20 ******/
DROP TABLE [dw].[f_horizon]
GO

/****** Object:  Table [dw].[f_horizon]    Script Date: 17.9.2021 14:04:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_horizon](
	[projectRcn] [bigint] NULL,
	[projectID] [bigint] NULL,
	[id] [bigint] NULL,
	[projectAcronym] [varchar](50) NULL,
	[name] [varchar](400) NULL,
	[shortName] [varchar](300) NULL,
	[role] [varchar](100) NULL,
	[activityType] [varchar](3) NULL,
	[endOfParticipation] [varchar](10) NULL,
	[country] [varchar](2) NULL,
	[ecContribution] [bigint] NULL
) ON [PRIMARY]

GO


