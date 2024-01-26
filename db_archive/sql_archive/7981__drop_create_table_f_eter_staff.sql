USE [ANTERO]
GO

/****** Object:  Table [dw].[f_eter_staff]    Script Date: 25.8.2023 15:38:25 ******/
DROP TABLE [dw].[f_eter_staff]
GO

/****** Object:  Table [dw].[f_eter_staff]    Script Date: 25.8.2023 15:38:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_eter_staff](
	[ETER_ID] [varchar](255) NULL,
	[Total academic personnel (FTE)] [float] NULL,
	[Flag Academic personnel (HC) - gender] [varchar](255) NULL,
	[Academic personnel - Generic programmes and qualifications (HC)] [float] NULL,
	[Academic personnel - men (HC)] [float] NULL,
	[Academic personnel - gender unclassified (HC)] [float] NULL,
	[Flag Total academic personnel (FTE)] [varchar](255) NULL,
	[Academic personnel - Natural sciences, mathematics and statistics (HC)] [float] NULL,
	[Academic personnel - foreigner (HC)] [float] NULL,
	[Flag Academic personnel (HC) - citizenship] [varchar](255) NULL,
	[Academic personnel - national (HC)] [float] NULL,
	[Academic personnel - Arts and Humanities (HC)] [float] NULL,
	[Academic personnel - Business, administration and law (HC)] [float] NULL,
	[Academic personnel - Services (HC)] [float] NULL,
	[Academic personnel - Education (HC)] [float] NULL,
	[Academic personnel - Engineering, manufacturing and construction (HC)] [float] NULL,
	[Academic personnel - Health and welfare (HC)] [float] NULL,
	[Number of full professors - men] [float] NULL,
	[Academic personnel - Information and Communication Technologies (HC)] [float] NULL,
	[Flag Total academic personnel (HC)] [varchar](255) NULL,
	[Flag Academic personnel (HC) - ISCED-FoE] [varchar](255) NULL,
	[Number of research and teaching assistants (FTE)] [float] NULL,
	[Number of full professors - unclassified] [float] NULL,
	[Academic personnel - ISCED-FoE unclassified] [float] NULL,
	[Flag Number of full professors] [varchar](255) NULL,
	[Number of support and administrative personnel (FTE)] [float] NULL,
	[Number of research and teaching assistants (HC)] [float] NULL,
	[Number of full professors - women] [float] NULL,
	[Notes on academic personnel] [varchar](max) NULL,
	[Total personnel (FTE)] [float] NULL,
	[Number of support and administrative personnel (HC)] [float] NULL,
	[Flag Number of research and teaching assistants (FTE)] [varchar](255) NULL,
	[Notes on support and administrative personnel] [varchar](max) NULL,
	[Total personnel (HC)] [float] NULL,
	[Flag Number of support and administrative personnel (FTE)] [varchar](255) NULL,
	[Notes on total personnel] [varchar](max) NULL,
	[Flag Total personnel (FTE)] [varchar](255) NULL,
	[Academic personnel - women (HC)] [float] NULL,
	[Academic personnel - citizenship unclassified] [float] NULL,
	[Academic personnel - Social sciences, journalism and information (HC)] [float] NULL,
	[Academic personnel - Agriculture, forestry, fisheries and veterinary (HC)] [float] NULL,
	[Total academic personnel (HC)] [float] NULL,
	[Total number of full professors] [float] NULL,
	[Flag Number of research and teaching assistants (HC)] [varchar](255) NULL,
	[Flag Number of support and administrative personnel (HC)] [varchar](255) NULL,
	[Flag Total personnel (HC)] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]