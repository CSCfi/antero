USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_horizon_organisaatioiden_rahoitus]    Script Date: 12.8.2022 9:50:11 ******/
DROP TABLE [sa].[sa_horizon_organisaatioiden_rahoitus]
GO

/****** Object:  Table [sa].[sa_horizon_organisaatioiden_rahoitus]    Script Date: 12.8.2022 9:50:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_horizon_organisaatioiden_rahoitus](
	[projectRcn] [varchar](50) NULL,
	[projectID] [varchar](50) NULL,
	[projectAcronym] [varchar](50) NULL,
	[role] [varchar](100) NULL,
	[id] [varchar](50) NULL,
	[name] [varchar](400) NULL,
	[shortName] [varchar](400) NULL,
	[activityType] [varchar](3) NULL,
	[endOfParticipation] [varchar](10) NULL,
	[ecContribution] [varchar](50) NULL,
	[country] [varchar](2) NULL
) ON [PRIMARY]

GO


USE [ANTERO]