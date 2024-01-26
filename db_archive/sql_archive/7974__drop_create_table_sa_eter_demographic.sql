USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_demographic]    Script Date: 25.8.2023 15:20:06 ******/
DROP TABLE [sa].[sa_eter_demographic]
GO

/****** Object:  Table [sa].[sa_eter_demographic]    Script Date: 25.8.2023 15:20:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_demographic](
	[ETER_ID] [varchar](255) NULL,
	[Demographic event between past year and reference year] [varchar](255) NULL,
	[RISIS-OrgReg demographic event ID] [varchar](255) NULL,
	[Affected institutions (past)] [varchar](255) NULL,
	[Demographic events between reference year and following year] [varchar](255) NULL,
	[Short description of event] [varchar](max) NULL,
	[Affected institutions (following year)] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO


USE [ANTERO]