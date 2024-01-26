USE [ANTERO]
GO

/****** Object:  Table [dbo].[data_model]    Script Date: 28.7.2022 14:57:44 ******/
DROP TABLE [dbo].[data_model]
GO

/****** Object:  Table [dbo].[data_model]    Script Date: 28.7.2022 14:57:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[data_model](
	[database] [nvarchar](128) NULL,
	[schema] [sysname] NULL,
	[view] [sysname] NULL,
	[view_table_database] [nvarchar](128) NULL,
	[view_table_schema] [nvarchar](128) NULL,
	[view_table] [nvarchar](128) NULL,
	[database_proc] [nvarchar](128) NULL,
	[schema_proc] [sysname] NULL,
	[procedure] [sysname] NULL,
	[procedure_table_database] [nvarchar](128) NULL,
	[procedure_table_schema] [nvarchar](128) NULL,
	[procedure_table] [nvarchar](128) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](23) NULL,
	[username] [nvarchar](128) NULL
) ON [PRIMARY]

GO

USE [ANTERO]