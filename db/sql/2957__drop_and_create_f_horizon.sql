USE [ANTERO]

GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_horizon]') AND type in (N'U'))

BEGIN



DROP TABLE [dw].[f_horizon]


/****** Object:  Table [dw].[f_horizon]    Script Date: 2.4.2020 11:36:49 ******/
SET ANSI_NULLS ON


SET QUOTED_IDENTIFIER ON


CREATE TABLE [dw].[f_horizon](
	[projectRcn] [bigint] NULL,
	[projectID] [bigint] NULL,
	[id] [bigint] NULL,
	[projectAcronym] [varchar](36) NULL,
	[role] [varchar](14) NULL,
	[name] [varchar](400) NULL,
	[shortName] [varchar](300) NULL,
	[activityType] [varchar](3) NULL,
	[endOfParticipation] [varchar](10) NULL,
	[ecContribution] [bigint] NULL,
	[country] [varchar](2) NULL
) ON [PRIMARY]

END


