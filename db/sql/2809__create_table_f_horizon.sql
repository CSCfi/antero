USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_horizon]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[f_horizon](
	[activityType] [varchar](3) NULL,
	[city] [varchar](42) NULL,
	[country] [varchar](2) NULL,
	[ecContribution] [bigint] NULL,
	[endOfParticipation] [bit] NULL,
	[id] [bigint] NULL,
	[name] [varchar](783) NULL,
	[postCode] [varchar](20) NULL,
	[projectAcronym] [varchar](36) NULL,
	[role] [varchar](14) NULL,
	[projectID] [varchar](14) NULL,
	[shortName] [varchar](268) NULL,
	[street] [varchar](136) NULL,
	[vatNumber] [varchar](16) NULL,
	[projectRcn] [varchar](47) NULL
) ON [PRIMARY]

END


