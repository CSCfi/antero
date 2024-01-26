USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_demographic]    Script Date: 27.4.2022 10:51:57 ******/
DROP TABLE [dw].[f_eter_demographic]
GO

/****** Object:  Table [dw].[f_eter_demographic]    Script Date: 27.4.2022 10:51:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_demographic](
	[ETER_ID] [varchar](255) NULL,
	[Demographic event between past year and reference year] [varchar](255) NULL,
	[RISIS-OrgReg demographic event ID] [varchar](255) NULL,
	[Affected institutions (past)] [varchar](255) NULL,
	[Demographic events between reference year and following year] [varchar](255) NULL,
	[Short description of event] [varchar](446) NULL,
	[Affected institutions (following year)] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]