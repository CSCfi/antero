USE [ANTERO]
GO

/****** Object:  Table [dbo].[procedures]    Script Date: 29.7.2022 12:57:40 ******/
DROP TABLE [dbo].[procedures]
GO

/****** Object:  Table [dbo].[procedures]    Script Date: 29.7.2022 12:57:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[procedures](
	[database] [nvarchar](128) NULL,
	[schema] [sysname] NOT NULL,
	[procedure] [sysname] NOT NULL,
	[referenced_database_name] [nvarchar](128) NULL,
	[referenced_schema_name] [nvarchar](128) NULL,
	[referenced_entity_name] [nvarchar](128) NULL,
	[column] [nvarchar](128) NULL,
	[manual_load] [int] NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](100) NOT NULL,
	[username] [varchar](30) NOT NULL
) ON [PRIMARY]

GO


USE [ANTERO]