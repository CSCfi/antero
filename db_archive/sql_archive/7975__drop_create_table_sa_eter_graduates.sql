USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_graduates]    Script Date: 25.8.2023 15:24:10 ******/
DROP TABLE [sa].[sa_eter_graduates]
GO

/****** Object:  Table [sa].[sa_eter_graduates]    Script Date: 25.8.2023 15:24:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_graduates](
	[ETER_ID] [varchar](255) NULL,
	[Graduates at ISCED 5 - men] [varchar](255) NULL,
	[Graduates at ISCED 5 - foreigner] [varchar](255) NULL,
	[Graduates at ISCED 5 - women] [varchar](255) NULL,
	[Graduates at ISCED 5 - mobility unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5 - citizenship unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5 - Social sciences, journalism and information] [varchar](255) NULL,
	[Flag Graduates ISCED 5 - mobility] [varchar](255) NULL,
	[Graduates at ISCED 5 - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Graduates at ISCED 5 - Business, administration and law] [varchar](255) NULL,
	[Graduates at ISCED 5 - under 20 years old] [varchar](255) NULL,
	[Graduates at ISCED 5 - Health and welfare] [varchar](255) NULL,
	[Graduates at ISCED 5 - Age goup unclassified] [varchar](255) NULL,
	[Flag Graduates ISCED 5 - gender] [varchar](255) NULL,
	[Graduates at ISCED 6 - men] [varchar](255) NULL,
	[Flag Graduates at ISCED 5 - Age group] [varchar](255) NULL,
	[Graduates at ISCED 5 - resident] [varchar](255) NULL,
	[Graduates at ISCED 6 - foreigner] [varchar](255) NULL,
	[Graduates at ISCED 5 - Education] [varchar](255) NULL,
	[Graduates at ISCED 6 - women] [varchar](255) NULL,
	[Graduates at ISCED 6 - mobility unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5 - gender unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5 - Information and Communication Technologies] [varchar](255) NULL,
	[Graduates at ISCED 5 - ISCED-FoE unclassified] [varchar](255) NULL,
	[Graduates at ISCED 6 - Social sciences, journalism and information] [varchar](255) NULL,
	[Flag Graduates ISCED 5 - citizenship] [varchar](255) NULL,
	[Graduates at ISCED 5 - between 25 and 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 6 - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Graduates at ISCED 6 - citizenship unclassified] [varchar](255) NULL,
	[Flag Graduates ISCED 6 - mobility] [varchar](255) NULL,
	[Graduates at ISCED 6 - under 20 years old] [varchar](255) NULL,
	[Flag Total graduates ISCED 5] [varchar](255) NULL,
	[Graduates at ISCED 6 - Business, administration and law] [varchar](255) NULL,
	[Graduates at ISCED 6 - Age goup unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5 - Generic programmes and qualifications] [varchar](255) NULL,
	[Graduates at ISCED 5 - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Flag Graduates ISCED 6 - gender] [varchar](255) NULL,
	[Graduates at ISCED 6 - Health and welfare] [varchar](255) NULL,
	[Graduates at ISCED 7 - men] [varchar](255) NULL,
	[Graduates at ISCED 6 - resident] [varchar](255) NULL,
	[Graduates at ISCED 5 - Services] [varchar](255) NULL,
	[Graduates at ISCED 7 - foreigner] [varchar](255) NULL,
	[Graduates at ISCED 5 - between 22 and 24 years old] [varchar](255) NULL,
	[Graduates at ISCED 6 - Education] [varchar](255) NULL,
	[Total graduates at ISCED 5] [varchar](255) NULL,
	[Graduates at ISCED 6 - Information and Communication Technologies] [varchar](255) NULL,
	[Flag Graduates at ISCED 6 - Age group] [varchar](255) NULL,
	[Graduates at ISCED 6 - ISCED-FoE unclassified] [varchar](255) NULL,
	[Graduates at ISCED 6 - between 25 and 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 7 - mobility unclassified] [varchar](255) NULL,
	[Flag Total graduates ISCED 6] [varchar](255) NULL,
	[Graduates at ISCED 7 - Social sciences, journalism and information] [varchar](255) NULL,
	[Graduates at ISCED 6 - gender unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 - women] [varchar](255) NULL,
	[Flag Graduates ISCED 6 - citizenship] [varchar](255) NULL,
	[Flag Graduates ISCED 7 - gender] [varchar](255) NULL,
	[Graduates at ISCED 7 - citizenship unclassified] [varchar](255) NULL,
	[Graduates at ISCED 6 - Generic programmes and qualifications] [varchar](255) NULL,
	[Graduates at ISCED 7 - resident] [varchar](255) NULL,
	[Graduates at ISCED 7 - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Graduates at ISCED 6 - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Graduates at ISCED 6 - Services] [varchar](255) NULL,
	[Graduates at ISCED 7 - Education] [varchar](255) NULL,
	[Graduates at ISCED 6 - between 22 and 24 years old] [varchar](255) NULL,
	[Graduates at ISCED 7 - under 20 years old] [varchar](255) NULL,
	[Graduates at ISCED 7 - Information and Communication Technologies] [varchar](255) NULL,
	[Flag Graduates ISCED 7 - mobility] [varchar](255) NULL,
	[Total graduates at ISCED 6] [varchar](255) NULL,
	[Graduates at ISCED 7 - gender unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 - Business, administration and law] [varchar](255) NULL,
	[Graduates at ISCED 7 - Age goup unclassified] [varchar](255) NULL,
	[Flag Graduates ISCED 7 - citizenship] [varchar](255) NULL,
	[Graduates at ISCED 5 - national] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - men] [varchar](255) NULL,
	[Graduates at ISCED 7 - ISCED-FoE unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 - Generic programmes and qualifications] [varchar](255) NULL,
	[Graduates at ISCED 7 - between 25 and 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 7 - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Graduates at ISCED 7 - Health and welfare] [varchar](255) NULL,
	[Graduates at ISCED 7 - Services] [varchar](255) NULL,
	[Graduates at ISCED 5 - mobile] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - foreigner] [varchar](255) NULL,
	[Graduates at ISCED 7 - between 22 and 24 years old] [varchar](255) NULL,
	[Graduates at ISCED 5 - Arts and Humanities] [varchar](255) NULL,
	[Flag Total graduates ISCED 7] [varchar](255) NULL,
	[Flag Graduates at ISCED 7 - Age group] [varchar](255) NULL,
	[Total graduates at ISCED 7] [varchar](255) NULL,
	[Graduates at ISCED 5 - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Graduates ISCED7 long degree-mobility unclassified] [varchar](255) NULL,
	[Flag Graduates ISCED 7 long degree - gender] [varchar](255) NULL,
	[Graduates ISCED 7 long degree-gender unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Social sciences, journalism and information] [varchar](255) NULL,
	[Flag Graduates ISCED 7 long degree - citizenship] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Generic programmes and qualifications] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - women] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - resident] [varchar](255) NULL,
	[Flag Graduates ISCED 5 - ISCED-FoE] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Services] [varchar](255) NULL,
	[Graduates ISCED 7 long degree-citiz. unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - under 20 years old] [varchar](255) NULL,
	[Graduates at ISCED 5 - over 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Education] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Age goup unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - between 22 and 24 years old] [varchar](255) NULL,
	[Flag Graduates ISCED 7 long degree - mobility] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - men] [varchar](255) NULL,
	[Notes on graduates at ISCED 5] [varchar](275) NULL,
	[Total graduates at ISCED 7 long degree] [varchar](max) NULL,
	[Graduates at ISCED 7 long degree - Business, administration and law] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - foreigner] [varchar](255) NULL,
	[Graduates at ISCED 6 - national] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - gender unclassified] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Health and welfare] [varchar](255) NULL,
	[Graduates at ISCED 6 - mobile] [varchar](255) NULL,
	[Flag Graduates at ISCED 5-7 - citizenship] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Information and Communication Technologies] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - mobility unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Generic programmes and qualifications] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Natural sciences, mathematics and statistics] [varchar](255) NULL,
	[Graduates ISCED7 long degree-ISCED-FoE unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Services] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - between 25 and 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - between 22 and 24 years old] [varchar](255) NULL,
	[Flag Total graduates ISCED 7 long degree] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Social sciences, journalism and information] [varchar](255) NULL,
	[Graduates at ISCED 6 - Arts and Humanities] [varchar](255) NULL,
	[Flag Graduates at ISCED 7 long degree - Age group] [varchar](255) NULL,
	[Total graduates ISCED 5-7] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - women] [varchar](255) NULL,
	[Flag Graduates at ISCED 5-7 - gender] [varchar](255) NULL,
	[Graduates at ISCED 6 - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - resident] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Agriculture, forestry, fisheries and veterinary] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Education] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - under 20 years old] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Information and Communication Technologies] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - citizenship unclassified] [varchar](255) NULL,
	[Flag Graduates ISCED 6 - ISCED-FoE] [varchar](255) NULL,
	[Flag Graduates at ISCED 5-7 - mobility] [varchar](255) NULL,
	[Graduates at ISCED 6 - over 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Business, administration and law] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Age goup unclassified] [varchar](255) NULL,
	[Notes on graduates at ISCED 6] [varchar](max) NULL,
	[Graduates at ISCED 5-7 - ISCED-FoE unclassified] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Health and welfare] [varchar](255) NULL,
	[Graduates at ISCED 7 - national] [varchar](255) NULL,
	[Notes on educational activities (Graduates)] [varchar](max) NULL,
	[Graduates at ISCED 5-7 - between 25 and 29 years old] [varchar](255) NULL,
	[Graduates at ISCED 7 - mobile] [varchar](255) NULL,
	[Flag Graduates at ISCED 5-7 - Age group] [varchar](255) NULL,
	[Graduates at ISCED 7 - Arts and Humanities] [varchar](255) NULL,
	[Graduates at ISCED 7 - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Flag Total graduates ISCED 5-7] [varchar](255) NULL,
	[Flag Graduates ISCED 7 - ISCED-FoE] [varchar](255) NULL,
	[Graduates at ISCED 7 - over 29 years old] [varchar](255) NULL,
	[Notes on graduates at ISCED 7] [varchar](max) NULL,
	[Graduates at ISCED 7 long degree - national] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - mobile] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Arts and Humanities] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Flag Graduates ISCED 7 long degree - ISCED-FoE] [varchar](255) NULL,
	[Graduates at ISCED 7 long degree - over 29 years old] [varchar](255) NULL,
	[Notes on graduates at ISCED 7 long degree] [varchar](max) NULL,
	[Graduates at ISCED 5-7 - national] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - mobile] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Arts and Humanities] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - Engineering, manufacturing and construction] [varchar](255) NULL,
	[Flag Graduates at ISCED 5-7 - ISCED-FoE] [varchar](255) NULL,
	[Graduates at ISCED 5-7 - over 29 years old] [varchar](255) NULL,
	[Notes on total graduates ISCED 5-7] [varchar](max) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]