USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_horizon_projektit]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[d_horizon_projektit](
	[acronym] [varchar](1722) NULL,
	[call] [varchar](100) NULL,
	[coordinator] [varchar](500) NULL,
	[coordinatorCountry] [varchar](45) NULL,
	[ecMaxContribution] [float] NULL,
	[endDate] [varchar](254) NULL,
	[frameworkProgramme] [varchar](633) NULL,
	[fundingScheme] [varchar](34) NULL,
	[id] [varchar](1623) NULL,
	[objective] [varchar](max) NULL,
	[programme] [varchar](856) NULL,
	[startDate] [varchar](259) NULL,
	[status] [varchar](1160) NULL,
	[title] [varchar](max) NULL,
	[topics] [varchar](1320) NULL,
	[totalCost] [float] NULL,
	[rcn] [varchar](1989) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END


