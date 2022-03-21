USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_organisaatiotyypit]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_organisaatiotyypit](
	[Code] [varchar](3) NULL,
	[Title] [varchar](97) NULL
) ON [PRIMARY]

END