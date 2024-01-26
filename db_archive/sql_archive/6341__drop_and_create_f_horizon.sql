USE [ANTERO]
GO

/****** Object:  Table [dw].[f_horizon]    Script Date: 12.8.2022 9:41:29 ******/
DROP TABLE [dw].[f_horizon]
GO

/****** Object:  Table [dw].[f_horizon]    Script Date: 12.8.2022 9:41:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_horizon](
	[projectRcn] [varchar](50) NULL,
	[projectID] [varchar](50) NULL,
	[id] [varchar](50) NULL,
	[projectAcronym] [varchar](50) NULL,
	[name] [varchar](500) NULL,
	[shortName] [varchar](400) NULL,
	[role] [varchar](100) NULL,
	[activityType] [varchar](3) NULL,
	[endOfParticipation] [varchar](10) NULL,
	[country] [varchar](2) NULL,
	[ecContribution] [float] NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]

GO



USE [ANTERO]