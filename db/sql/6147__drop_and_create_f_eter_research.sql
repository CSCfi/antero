USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_research]    Script Date: 27.4.2022 10:56:46 ******/
DROP TABLE [dw].[f_eter_research]
GO

/****** Object:  Table [dw].[f_eter_research]    Script Date: 27.4.2022 10:56:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_research](
	[ETER_ID] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - men] [float] NULL,
	[Students enrolled at ISCED 8 - foreigner] [float] NULL,
	[Students enrolled ISCED 8-mobility unclassified] [float] NULL,
	[Students enrolled at ISCED 8 - Social sciences, journalism and information] [float] NULL,
	[Students enrolled at ISCED 8 - Agriculture, forestry, fisheries and veterinary] [float] NULL,
	[Students enrolled at ISCED 8 - part-time] [float] NULL,
	[Flag Students ISCED 8 - gender] [varchar](255) NULL,
	[Research active institution] [float] NULL,
	[Students enrolled at ISCED 8 - national] [float] NULL,
	[Students enrolled at ISCED 8 - resident] [float] NULL,
	[Flag Students ISCED 8 - Age group] [varchar](255) NULL,
	[Graduates at ISCED 8 - women] [float] NULL,
	[Students enrolled at ISCED 8 - women] [float] NULL,
	[Graduates at ISCED 8 - citizenship unclassified] [float] NULL,
	[Flag Graduates ISCED 8 - mobility] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Education] [float] NULL,
	[Students enrolled ISCED 8-citizenship unclassified] [float] NULL,
	[Graduates at ISCED 8 - Business, administration and law] [float] NULL,
	[Students enrolled at ISCED 8 - mobile] [float] NULL,
	[Graduates at ISCED 8 - Health and welfare] [float] NULL,
	[Students enrolled at ISCED 8 - Arts and Humanities] [float] NULL,
	[Students enrolled at ISCED 8 - Engineering, manufacturing and construction] [float] NULL,
	[Students enrolled at ISCED 8 - Information and Communication Technologies] [float] NULL,
	[Flag Students ISCED 8 - mobility] [varchar](255) NULL,
	[Flag Students ISCED 8 - ISCED-FoE] [varchar](255) NULL,
	[Flag Graduates at ISCED 8 - Age group] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - under 20 years old] [float] NULL,
	[Students enrolled at ISCED 8 - Business, administration and law] [float] NULL,
	[Students enrolled ISCED 8 - ISCED-FoE unclassified] [float] NULL,
	[Students enrolled at ISCED 8 - Age goup unclassified] [float] NULL,
	[R&D Expenditure (NC)] [float] NULL,
	[R&D Expenditure (EURO)] [float] NULL,
	[R&D Expenditure (PPP)] [float] NULL,
	[Graduates at ISCED 8 - men] [float] NULL,
	[Flag Students ISCED 8 - part-time, full-time] [varchar](255) NULL,
	[Graduates at ISCED 8 - foreigner] [float] NULL,
	[Graduates at ISCED 8 - mobility unclassified] [float] NULL,
	[Graduates at ISCED 8 - Social sciences, journalism and information] [float] NULL,
	[Graduates at ISCED 8 - Agriculture, forestry, fisheries and veterinary] [float] NULL,
	[Students enrolled at ISCED 8 - Health and welfare] [float] NULL,
	[Students enrolled at ISCED 8 - over 29 years old] [float] NULL,
	[Graduates at ISCED 8 - under 20 years old] [float] NULL,
	[Graduates at ISCED 8 - Age goup unclassified] [float] NULL,
	[Included in official R&D statistics] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - full-time] [float] NULL,
	[Notes on students enrolled at ISCED 8] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - between 22 and 24 years old] [float] NULL,
	[Graduates at ISCED 8 - national] [float] NULL,
	[Total students enrolled at ISCED 8] [float] NULL,
	[Graduates at ISCED 8 - mobile] [float] NULL,
	[Graduates at ISCED 8 - gender unclassified] [float] NULL,
	[Graduates at ISCED 8 - Arts and Humanities] [float] NULL,
	[Flag Graduates ISCED 8 - citizenship] [varchar](255) NULL,
	[Graduates at ISCED 8 - Engineering, manufacturing and construction] [float] NULL,
	[Flag Graduates ISCED 8 - ISCED-FoE] [varchar](255) NULL,
	[Graduates at ISCED 8 - Generic programmes and qualifications] [float] NULL,
	[Graduates at ISCED 8 - Natural sciences, mathematics and statistics] [float] NULL,
	[Graduates at ISCED 8 - over 29 years old] [float] NULL,
	[Graduates at ISCED 8 - Services] [float] NULL,
	[Notes on graduates at ISCED 8] [varchar](1138) NULL,
	[Graduates at ISCED 8 - between 22 and 24 years old] [float] NULL,
	[Flag R&D Expenditure] [varchar](255) NULL,
	[Total graduates at ISCED 8] [float] NULL,
	[Notes on research activities] [varchar](325) NULL,
	[Students enrolled ISCED 8 - gender unclassified] [float] NULL,
	[Flag Students ISCED 8 - citizenship] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Generic programmes and qualifications] [float] NULL,
	[Students enrolled at ISCED 8 - Natural sciences, mathematics and statistics] [float] NULL,
	[Students enrolled at ISCED 8 - Services] [float] NULL,
	[Students enrolled at ISCED 8 - part-, full-time unclassified] [float] NULL,
	[Students enrolled at ISCED 8 - between 25 and 29 years old] [float] NULL,
	[Flag Total students ISCED 8] [varchar](255) NULL,
	[Flag Graduates ISCED 8 - gender] [varchar](255) NULL,
	[Graduates at ISCED 8 - resident] [float] NULL,
	[Graduates at ISCED 8 - Education] [float] NULL,
	[Graduates at ISCED 8 - Information and Communication Technologies] [float] NULL,
	[Graduates at ISCED 8 - ISCED-FoE unclassified] [float] NULL,
	[Graduates at ISCED 8 - between 25 and 29 years old] [float] NULL,
	[Flag Total graduates ISCED 8] [varchar](255) NULL,
	[EU-FP Staff mobility] [float] NULL,
	[EU-FP Researchers mobility] [float] NULL,
	[EU-FP Research training cooperation] [float] NULL,
	[Flag Researchers mobility] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]