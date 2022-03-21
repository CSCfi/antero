USE [ANTERO]
GO

/****** Object:  Table [dw].[d_horizon_projektit]    Script Date: 15.6.2020 17:27:17 ******/
DROP TABLE [dw].[d_horizon_projektit]
GO

/****** Object:  Table [dw].[d_horizon_projektit]    Script Date: 15.6.2020 17:27:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	[rcn] [varchar](1989) NULL,
	[pillar] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




