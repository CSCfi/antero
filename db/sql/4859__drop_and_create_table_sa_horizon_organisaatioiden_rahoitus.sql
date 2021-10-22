USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_horizon_organisaatioiden_rahoitus]    Script Date: 17.9.2021 14:03:33 ******/
DROP TABLE [sa].[sa_horizon_organisaatioiden_rahoitus]
GO

/****** Object:  Table [sa].[sa_horizon_organisaatioiden_rahoitus]    Script Date: 17.9.2021 14:03:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_horizon_organisaatioiden_rahoitus](
	[projectRcn] [bigint] NULL,
	[projectID] [bigint] NULL,
	[projectAcronym] [varchar](50) NULL,
	[role] [varchar](100) NULL,
	[id] [bigint] NULL,
	[name] [varchar](400) NULL,
	[shortName] [varchar](400) NULL,
	[activityType] [varchar](3) NULL,
	[endOfParticipation] [varchar](10) NULL,
	[ecContribution] [bigint] NULL,
	[country] [varchar](2) NULL
) ON [PRIMARY]

GO


