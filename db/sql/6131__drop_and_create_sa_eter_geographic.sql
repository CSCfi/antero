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
	[Name of the city] [varchar](255) NULL,
	[Notes on region of establishment] [varchar](255) NULL,
	[Multi-site institution] [varchar](255) NULL,
	[Geographic coordinates - latitude] [varchar](255) NULL,
	[Region of establishment (NUTS 2)] [varchar](255) NULL,
	[NUTS 3 codes of other campuses] [varchar](465) NULL,
	[Multi-site institution - Postcode] [varchar](468) NULL,
	[Geographic coordinates - longitude] [varchar](255) NULL,
	[Notes on city, postcode or coordinates] [varchar](255) NULL,
	[Multi-site institution - City] [varchar](757) NULL,
	[Notes on multisite institution] [varchar](390) NULL,
	[Multi-site institution - Longitude] [varchar](1076) NULL,
	[Flag geographic information] [varchar](255) NULL,
	[Region of establishment (NUTS 3)] [varchar](255) NULL,
	[Postcode] [varchar](255) NULL,
	[Multi-site institution - Latitude] [varchar](1058) NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL,
	[loadtime] [datetime] NULL
) ON [PRIMARY]

GO

USE [ANTERO]