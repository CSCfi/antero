USE [ANTERO]
GO

/****** Object:  Table [sa].[sa_eter_geographic]    Script Date: 27.4.2022 10:46:21 ******/
DROP TABLE [sa].[sa_eter_geographic]
GO

/****** Object:  Table [sa].[sa_eter_geographic]    Script Date: 27.4.2022 10:46:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_eter_geographic](
	[ETER_ID] [varchar](255) NULL,
	[Name of the city] [varchar](max) NULL,
	[Notes on region of establishment] [varchar](max) NULL,
	[Multi-site institution] [varchar](max) NULL,
	[Geographic coordinates - latitude] [varchar](max) NULL,
	[Region of establishment (NUTS 2)] [varchar](max) NULL,
	[NUTS 3 codes of other campuses] [varchar](max) NULL,
	[Multi-site institution - Postcode] [varchar](max) NULL,
	[Geographic coordinates - longitude] [varchar](max) NULL,
	[Notes on city, postcode or coordinates] [varchar](max) NULL,
	[Multi-site institution - City] [varchar](max) NULL,
	[Notes on multisite institution] [varchar](max) NULL,
	[Multi-site institution - Longitude] [varchar](max) NULL,
	[Flag geographic information] [varchar](max) NULL,
	[Region of establishment (NUTS 3)] [varchar](max) NULL,
	[Postcode] [varchar](max) NULL,
	[Multi-site institution - Latitude] [varchar](max) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]