USE [ANTERO]
GO

/****** Object:  Table [dw].[d_horizon_projektit]    Script Date: 25.10.2021 8:38:40 ******/
DROP TABLE [dw].[d_horizon_projektit]
GO

/****** Object:  Table [dw].[d_horizon_projektit]    Script Date: 25.10.2021 8:38:40 ******/
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
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


