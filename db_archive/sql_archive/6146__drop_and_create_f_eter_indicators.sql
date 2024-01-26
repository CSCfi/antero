USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_indicators]    Script Date: 27.4.2022 10:55:47 ******/
DROP TABLE [dw].[f_eter_indicators]
GO

/****** Object:  Table [dw].[f_eter_indicators]    Script Date: 27.4.2022 10:55:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_indicators](
	[ETER_ID] [varchar](255) NULL,
	[Flag Share of women students ISCED 6] [varchar](255) NULL,
	[Share of women students ISCED 6] [float] NULL,
	[Flag Share of women students ISCED 5-7] [varchar](255) NULL,
	[Flag Share of foreigners students ISCED 6] [varchar](255) NULL,
	[Share of foreigners students ISCED 6] [float] NULL,
	[Flag Share of foreigners students ISCED 5-7] [varchar](255) NULL,
	[Share of mobile students ISCED 7] [float] NULL,
	[Flag Share of mobile students ISCED 7] [varchar](255) NULL,
	[Flag Herfindahl index students ISCED 5-7] [varchar](255) NULL,
	[Share of women students ISCED 7] [float] NULL,
	[Share of women students ISCED 5-7] [float] NULL,
	[Share of foreigners students ISCED 7] [float] NULL,
	[Share of foreigners students ISCED 5-7] [float] NULL,
	[Flag Share of mobile students ISCED 6] [varchar](255) NULL,
	[Share of mobile students ISCED 5-7] [float] NULL,
	[Herfindahl index students ISCED 5-7] [float] NULL,
	[Flag STEM orientation (students)] [varchar](255) NULL,
	[Flag Share of women students ISCED 7] [varchar](255) NULL,
	[Flag Share of foreigners students ISCED 7] [varchar](255) NULL,
	[Share of mobile students ISCED 6] [float] NULL,
	[Flag Share of mobile students ISCED 5-7] [varchar](255) NULL,
	[STEM orientation (students)] [float] NULL,
	[Share of women graduates ISCED 6] [float] NULL,
	[Flag Share of women graduates ISCED 5-7] [varchar](255) NULL,
	[Share of women graduates ISCED 5-7] [float] NULL,
	[Share of foreigners graduates ISCED 6] [float] NULL,
	[Flag Share of foreigners graduates ISCED 5-7] [varchar](255) NULL,
	[Share of foreigners graduates ISCED 5-7] [float] NULL,
	[Flag Share of mobile graduates ISCED 6] [varchar](255) NULL,
	[Share of mobile graduates ISCED 7] [float] NULL,
	[STEM orientation (graduates)] [varchar](255) NULL,
	[Flag STEM orientation (graduates)] [varchar](255) NULL,
	[Flag Share of women graduates ISCED 6] [varchar](255) NULL,
	[Flag Share of women graduates ISCED 7] [varchar](255) NULL,
	[Flag Share of foreigners graduates ISCED 6] [varchar](255) NULL,
	[Flag Share of foreigners graduates ISCED 7] [varchar](255) NULL,
	[Share of mobile graduates ISCED 6] [float] NULL,
	[Flag Share of mobile graduates ISCED 7] [varchar](255) NULL,
	[Flag Share of mobile graduates ISCED 5-7] [varchar](255) NULL,
	[Master degree orientation] [varchar](255) NULL,
	[Share of women graduates ISCED 7] [float] NULL,
	[Share of foreigners graduates ISCED 7] [float] NULL,
	[Share of mobile graduates ISCED 5-7] [float] NULL,
	[Flag Master degree orientation] [varchar](255) NULL,
	[Share of women academic staff] [float] NULL,
	[Share of foreigners academic staff] [float] NULL,
	[Flag Academic staff / total staff (FTE)] [varchar](255) NULL,
	[Flag Share of women academic staff] [varchar](255) NULL,
	[Flag Share of women full professors] [varchar](255) NULL,
	[Flag Share of foreigners academic staff] [varchar](255) NULL,
	[Flag Herfindahl index academic staff] [varchar](255) NULL,
	[Full professors / academic staff (HC)] [float] NULL,
	[Academic staff / total staff (FTE)] [float] NULL,
	[Share of women full professors] [float] NULL,
	[Herfindahl index academic staff] [float] NULL,
	[Flag Full professors / academic staff (HC)] [varchar](255) NULL,
	[Flag Share of women PhD graduates] [varchar](255) NULL,
	[Flag Share of foreigners PhD graduates] [varchar](255) NULL,
	[Share of mobile PhD students] [float] NULL,
	[Flag Share of mobile PhD students] [varchar](255) NULL,
	[Herfindahl index PhD graduates] [float] NULL,
	[PhD intensity] [float] NULL,
	[Flag PhD intensity] [varchar](255) NULL,
	[Researchers mobility intensity] [float] NULL,
	[Share of women PhD students] [float] NULL,
	[Share of women PhD graduates] [float] NULL,
	[Share of foreigners PhD students] [float] NULL,
	[Share of foreigners PhD graduates] [float] NULL,
	[Share of mobile PhD graduates] [float] NULL,
	[Flag Herfindahl index PhD graduates] [varchar](255) NULL,
	[Flag Researchers mobility intensity] [varchar](255) NULL,
	[Flag Share of women PhD students] [varchar](255) NULL,
	[Flag Share of foreigners PhD students] [varchar](255) NULL,
	[Flag Share of mobile PhD graduates] [varchar](255) NULL,
	[Total core budget / Total current revenues] [float] NULL,
	[Student fees funding / Total current revenues] [float] NULL,
	[Flag Student fees funding / Total current revenues] [varchar](255) NULL,
	[Flag Total core budget / Total current revenues] [varchar](255) NULL,
	[Flag Total third party funding / Total current revenues] [varchar](255) NULL,
	[Total third party funding / Total current revenues] [float] NULL,
	[Flag Erasmus credit mobility outgoing] [varchar](255) NULL,
	[Erasmus credit mobility incoming] [float] NULL,
	[Erasmus credit mobility outgoing] [float] NULL,
	[Flag Erasmus credit mobility incoming] [varchar](255) NULL,
	[Notes on indicators] [varchar](537) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]