USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_eurostat]    Script Date: 27.4.2022 10:53:07 ******/
DROP TABLE [dw].[f_eter_eurostat]
GO

/****** Object:  Table [dw].[f_eter_eurostat]    Script Date: 27.4.2022 10:53:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_eurostat](
	[TIME] [bigint] NULL,
	[GEO] [varchar](5) NULL,
	[GEO_LABEL] [varchar](77) NULL,
	[SEX] [varchar](5) NULL,
	[UNIT] [varchar](2) NULL,
	[UNIT_LABEL] [varchar](6) NULL,
	[Flag and Footnotes] [varchar](1) NULL,
	[15-64 yr population] [float] NULL,
	[Total population] [float] NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY]

GO

USE [ANTERO]