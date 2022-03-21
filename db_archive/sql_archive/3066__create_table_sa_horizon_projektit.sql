USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_projektit]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_projektit](
	[X.U.FEFF.rcn] [varchar](1989) NULL,
	[id] [varchar](1623) NULL,
	[acronym] [varchar](1722) NULL,
	[status] [varchar](1160) NULL,
	[programme] [varchar](856) NULL,
	[topics] [varchar](1320) NULL,
	[frameworkProgramme] [varchar](633) NULL,
	[title] [varchar](max) NULL,
	[startDate] [varchar](259) NULL,
	[endDate] [varchar](254) NULL,
	[objective] [varchar](max) NULL,
	[totalCost] [float] NULL,
	[ecMaxContribution] [float] NULL,
	[call] [varchar](100) NULL,
	[fundingScheme] [varchar](34) NULL,
	[coordinator] [varchar](500) NULL,
	[coordinatorCountry] [varchar](45) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END