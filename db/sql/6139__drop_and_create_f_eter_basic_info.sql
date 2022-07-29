USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_basic_info]    Script Date: 27.4.2022 10:51:21 ******/
DROP TABLE [dw].[f_eter_basic_info]
GO

/****** Object:  Table [dw].[f_eter_basic_info]    Script Date: 27.4.2022 10:51:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_basic_info](
	[ETER_ID] [varchar](255) NULL,
	[ETER ID Year] [varchar](255) NULL,
	[ETER ID] [varchar](255) NULL,
	[National identifier] [varchar](255) NULL,
	[Institution Acronym] [varchar](1000) NULL,
	[Reference year] [varchar](255) NULL,
	[Country Code] [varchar](255) NULL,
	[English Institution Name] [varchar](1000) NULL,
	[Institution Category - National Language] [varchar](255) NULL,
	[Institution Category standardized] [varchar](255) NULL,
	[Notes on institution name] [varchar](255) NULL,
	[Institution Category - English] [varchar](255) NULL,
	[Institution Name] [varchar](1000) NULL,
	[Notes on foundation year] [varchar](1200) NULL,
	[Foundation year] [varchar](255) NULL,
	[Legal status year] [varchar](255) NULL,
	[University hospital] [varchar](255) NULL,
	[Notes on legal status year] [varchar](255) NULL,
	[University hospital OrgReg ID] [varchar](255) NULL,
	[Notes on ancestor year] [varchar](846) NULL,
	[Notes on institutional website] [varchar](255) NULL,
	[Legal status] [varchar](255) NULL,
	[RISIS-OrgReg institutional page] [varchar](255) NULL,
	[Institutional website] [varchar](255) NULL,
	[University hospital name] [varchar](1000) NULL,
	[Notes on institution category] [varchar](255) NULL,
	[Ancestor year] [varchar](255) NULL,
	[Notes on university hospital] [varchar](339) NULL,
	[ROR ID] [varchar](255) NULL,
	[WHED ID] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]