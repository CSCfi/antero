USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_research]    Script Date: 27.4.2022 10:48:13 ******/
DROP TABLE [sa].[sa_eter_research]
GO

/****** Object:  Table [sa].[sa_eter_research]    Script Date: 27.4.2022 10:48:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_research](
	[ETER_ID] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - men] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - foreigner] [varchar](255) NULL,
	[Students enrolled ISCED 8-mobility unclassified] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Social sciences, journalism and information] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - part-time] [varchar](255) NULL,
	[Flag Students ISCED 8 - gender] [varchar](255) NULL,
	[Research active institution] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - national] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - resident] [varchar](255) NULL,
	[Flag Students ISCED 8 - Age group] [varchar](255) NULL,
	[Graduates at ISCED 8 - women] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - women] [varchar](255) NULL,
	[Graduates at ISCED 8 - citizenship unclassified] [varchar](255) NULL,
	[Flag Graduates ISCED 8 - mobility] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Education] [varchar](255) NULL,
	[Students enrolled ISCED 8-citizenship unclassified] [varchar](255) NULL,
	[Graduates at ISCED 8 - Business, administration and law] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - mobile] [varchar](255) NULL,
	[Graduates at ISCED 8 - Health and welfare] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Arts and Humanities] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Information and Communication Technologies] [varchar](255) NULL,
	[Flag Students ISCED 8 - mobility] [varchar](255) NULL,
	[Flag Students ISCED 8 - ISCED-FoE] [varchar](255) NULL,
	[Flag Graduates at ISCED 8 - Age group] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - under 20 years old] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Business, administration and law] [varchar](255) NULL,
	[Students enrolled ISCED 8 - ISCED-FoE unclassified] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Age goup unclassified] [varchar](255) NULL,
	[R&D Expenditure (NC)] [float] NULL,
	[R&D Expenditure (EURO)] [float] NULL,
	[R&D Expenditure (PPP)] [float] NULL,
	[Graduates at ISCED 8 - men] [varchar](255) NULL,
	[Flag Students ISCED 8 - part-time, full-time] [varchar](255) NULL,
	[Graduates at ISCED 8 - foreigner] [varchar](255) NULL,
	[Graduates at ISCED 8 - mobility unclassified] [varchar](255) NULL,
	[Graduates at ISCED 8 - Social sciences, journalism and information] [varchar](255) NULL,
	[Graduates at ISCED 8 - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Health and welfare] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - over 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 8 - under 20 years old] [varchar](255) NULL,
	[Graduates at ISCED 8 - Age goup unclassified] [varchar](255) NULL,
	[Included in official R&D statistics] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - full-time] [varchar](255) NULL,
	[Notes on students enrolled at ISCED 8] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - between 22 and 24 years old] [varchar](255) NULL,
	[Graduates at ISCED 8 - national] [varchar](255) NULL,
	[Total students enrolled at ISCED 8] [varchar](255) NULL,
	[Graduates at ISCED 8 - mobile] [varchar](255) NULL,
	[Graduates at ISCED 8 - gender unclassified] [varchar](255) NULL,
	[Graduates at ISCED 8 - Arts and Humanities] [varchar](255) NULL,
	[Flag Graduates ISCED 8 - citizenship] [varchar](255) NULL,
	[Graduates at ISCED 8 - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Flag Graduates ISCED 8 - ISCED-FoE] [varchar](255) NULL,
	[Graduates at ISCED 8 - Generic programmes and qualifications] [varchar](255) NULL,
	[Graduates at ISCED 8 - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Graduates at ISCED 8 - over 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 8 - Services] [varchar](255) NULL,
	[Notes on graduates at ISCED 8] [varchar](1138) NULL,
	[Graduates at ISCED 8 - between 22 and 24 years old] [varchar](255) NULL,
	[Flag R&D Expenditure] [varchar](255) NULL,
	[Total graduates at ISCED 8] [varchar](255) NULL,
	[Notes on research activities] [varchar](325) NULL,
	[Students enrolled ISCED 8 - gender unclassified] [varchar](255) NULL,
	[Flag Students ISCED 8 - citizenship] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Generic programmes and qualifications] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - Services] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - part-, full-time unclassified] [varchar](255) NULL,
	[Students enrolled at ISCED 8 - between 25 and 29 years old] [varchar](255) NULL,
	[Flag Total students ISCED 8] [varchar](255) NULL,
	[Flag Graduates ISCED 8 - gender] [varchar](255) NULL,
	[Graduates at ISCED 8 - resident] [varchar](255) NULL,
	[Graduates at ISCED 8 - Education] [varchar](255) NULL,
	[Graduates at ISCED 8 - Information and Communication Technologies] [varchar](255) NULL,
	[Graduates at ISCED 8 - ISCED-FoE unclassified] [varchar](255) NULL,
	[Graduates at ISCED 8 - between 25 and 29 years old] [varchar](255) NULL,
	[Flag Total graduates ISCED 8] [varchar](255) NULL,
	[EU-FP Staff mobility] [varchar](255) NULL,
	[EU-FP Researchers mobility] [varchar](255) NULL,
	[EU-FP Research training cooperation] [varchar](255) NULL,
	[Flag Researchers mobility] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]