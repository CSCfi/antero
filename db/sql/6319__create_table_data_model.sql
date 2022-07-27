USE [ANTERO]
GO

/****** Object:  Table [dbo].[data_model]    Script Date: 27.7.2022 14:39:04 ******/
DROP TABLE IF EXISTS [dbo].[data_model]
GO

/****** Object:  Table [dbo].[data_model]    Script Date: 27.7.2022 14:39:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[data_model](
	[database] [nvarchar](128) NULL,
	[schema] [sysname] NOT NULL,
	[view] [sysname] NOT NULL,
	[view_table_database] [nvarchar](128) NULL,
	[view_table_schema] [nvarchar](128) NULL,
	[view_table] [nvarchar](128) NULL,
	[database_proc] [nvarchar](128) NULL,
	[schema_proc] [sysname] NOT NULL,
	[procedure] [sysname] NOT NULL,
	[procedure_table_database] [nvarchar](128) NULL,
	[procedure_table_schema] [nvarchar](128) NULL,
	[procedure_table] [nvarchar](128) NULL,
	[loadtime] [datetime] NOT NULL,
	[source] [varchar](23) NOT NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]

GO

USE [ANTERO]