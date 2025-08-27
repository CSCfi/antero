USE KOSKI_SA
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (
	SELECT * FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = '_bulk_insert_tracking' AND TABLE_SCHEMA = 'dbo'
	)
BEGIN
	CREATE TABLE [dbo].[_bulk_insert_tracking](
		[table_name] [nvarchar](128) NOT NULL,
		[rows_before] [int] NULL,
		[rows_after] [int] NULL,
		[before_timestamp] [datetime] NULL,
		[after_timestamp] [datetime] NULL,
	PRIMARY KEY CLUSTERED
	(
		[table_name] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
	) ON [PRIMARY]
END

USE ANTERO
