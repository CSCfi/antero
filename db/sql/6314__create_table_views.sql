USE [ANTERO]
GO

/****** Object:  Table [dbo].[views]    Script Date: 27.7.2022 8:12:18 ******/
DROP TABLE IF EXISTS [dbo].[views]
GO

/****** Object:  Table [dbo].[views]    Script Date: 27.7.2022 8:12:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[views](
	[database] [nvarchar](128) NULL,
	[schema] [sysname] NOT NULL,
	[view] [sysname] NOT NULL,
	[referenced_database_name] [nvarchar](128) NULL,
	[referenced_schema_name] [nvarchar](128) NULL,
	[referenced_entity_name] [nvarchar](128) NULL,
	[column] [nvarchar](128) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]

GO


