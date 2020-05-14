USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_organisaatioiden_rahoitus]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_organisaatioiden_rahoitus](
	[projectRcn] [bigint] NULL,
	[projectID] [bigint] NULL,
	[projectAcronym] [varchar](38) NULL,
	[role] [varchar](11) NULL,
	[id] [bigint] NULL,
	[name] [varchar](400) NULL,
	[shortName] [varchar](400) NULL,
	[activityType] [varchar](3) NULL,
	[endOfParticipation] [varchar](10) NULL,
	[ecContribution] [bigint] NULL,
	[country] [varchar](2) NULL
) ON [PRIMARY]

END