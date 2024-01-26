USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_staff]    Script Date: 25.8.2023 15:11:45 ******/
DROP TABLE [sa].[sa_eter_staff]
GO

/****** Object:  Table [sa].[sa_eter_staff]    Script Date: 25.8.2023 15:11:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_staff](
	[ETER_ID] [varchar](255) NULL,
	[Total academic personnel (FTE)] [varchar](255) NULL,
	[Flag Academic personnel (HC) - gender] [varchar](255) NULL,
	[Academic personnel - Generic programmes and qualifications (HC)] [varchar](255) NULL,
	[Academic personnel - men (HC)] [varchar](255) NULL,
	[Academic personnel - gender unclassified (HC)] [varchar](255) NULL,
	[Flag Total academic personnel (FTE)] [varchar](255) NULL,
	[Academic personnel - Natural sciences, mathematics and statistics (HC)] [varchar](255) NULL,
	[Academic personnel - foreigner (HC)] [varchar](255) NULL,
	[Flag Academic personnel (HC) - citizenship] [varchar](255) NULL,
	[Academic personnel - national (HC)] [varchar](255) NULL,
	[Academic personnel - Arts and Humanities (HC)] [varchar](255) NULL,
	[Academic personnel - Business, administration and law (HC)] [varchar](255) NULL,
	[Academic personnel - Services (HC)] [varchar](255) NULL,
	[Academic personnel - Education (HC)] [varchar](255) NULL,
	[Academic personnel - Engineering, manufacturing and construction (HC)] [varchar](255) NULL,
	[Academic personnel - Health and welfare (HC)] [varchar](255) NULL,
	[Number of full professors - men] [varchar](255) NULL,
	[Academic personnel - Information and Communication Technologies (HC)] [varchar](255) NULL,
	[Flag Total academic personnel (HC)] [varchar](255) NULL,
	[Flag Academic personnel (HC) - ISCED-FoE] [varchar](255) NULL,
	[Number of research and teaching assistants (FTE)] [varchar](255) NULL,
	[Number of full professors - unclassified] [varchar](255) NULL,
	[Academic personnel - ISCED-FoE unclassified] [varchar](255) NULL,
	[Flag Number of full professors] [varchar](255) NULL,
	[Number of support and administrative personnel (FTE)] [varchar](255) NULL,
	[Number of research and teaching assistants (HC)] [varchar](255) NULL,
	[Number of full professors - women] [varchar](255) NULL,
	[Notes on academic personnel] [varchar](max) NULL,
	[Total personnel (FTE)] [varchar](255) NULL,
	[Number of support and administrative personnel (HC)] [varchar](255) NULL,
	[Flag Number of research and teaching assistants (FTE)] [varchar](255) NULL,
	[Notes on support and administrative personnel] [varchar](max) NULL,
	[Total personnel (HC)] [varchar](255) NULL,
	[Flag Number of support and administrative personnel (FTE)] [varchar](255) NULL,
	[Notes on total personnel] [varchar](max) NULL,
	[Flag Total personnel (FTE)] [varchar](255) NULL,
	[Academic personnel - women (HC)] [varchar](255) NULL,
	[Academic personnel - citizenship unclassified] [varchar](255) NULL,
	[Academic personnel - Social sciences, journalism and information (HC)] [varchar](255) NULL,
	[Academic personnel - Agriculture, forestry, fisheries and veterinary (HC)] [varchar](255) NULL,
	[Total academic personnel (HC)] [varchar](255) NULL,
	[Total number of full professors] [varchar](255) NULL,
	[Flag Number of research and teaching assistants (HC)] [varchar](255) NULL,
	[Flag Number of support and administrative personnel (HC)] [varchar](255) NULL,
	[Flag Total personnel (HC)] [varchar](255) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]