USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_expenditure]    Script Date: 27.4.2022 10:45:43 ******/
DROP TABLE [sa].[sa_eter_expenditure]
GO

/****** Object:  Table [sa].[sa_eter_expenditure]    Script Date: 27.4.2022 10:45:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_expenditure](
	[ETER_ID] [varchar](255) NULL,
	[Personnel expenditure (PPP)] [float] NULL,
	[Personnel expenditure (EURO)] [float] NULL,
	[Personnel expenditure (NC)] [float] NULL,
	[Flag Non-personnel expenditure] [varchar](255) NULL,
	[Flag Personnel expenditure] [varchar](255) NULL,
	[Non-personnel expenditure (NC)] [float] NULL,
	[Non-personnel expenditure (PPP)] [float] NULL,
	[Non-personnel expenditure (EURO)] [float] NULL,
	[Total Current expenditure (NC)] [float] NULL,
	[Total Current expenditure (EURO)] [float] NULL,
	[Total Current expenditure (PPP)] [float] NULL,
	[Expenditure unclassified (NC)] [float] NULL,
	[Expenditure unclassified (EURO)] [float] NULL,
	[Expenditure unclassified (PPP)] [float] NULL,
	[Flag Expenditure unclassified] [varchar](255) NULL,
	[Capital expenditure (EURO)] [float] NULL,
	[Capital expenditure (NC)] [float] NULL,
	[Capital expenditure (PPP)] [float] NULL,
	[Flag Capital expenditure] [varchar](255) NULL,
	[Notes on expenditure] [varchar](531) NULL,
	[Flag Total current expenditure] [varchar](255) NULL,
	[Accounting system of capital expenditure] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]