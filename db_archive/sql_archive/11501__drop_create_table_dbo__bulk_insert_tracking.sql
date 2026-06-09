USE ANTERO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[_bulk_insert_tracking]') AND type in (N'U'))
DROP TABLE [dbo].[_bulk_insert_tracking]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[_bulk_insert_tracking](
	[table_name] [nvarchar](255) NOT NULL,
	[rows_before] [int] NULL,
	[rows_after] [int] NULL,
	[before_timestamp] [datetime] NULL,
	[after_timestamp] [datetime] NULL,
PRIMARY KEY CLUSTERED
(
	[table_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
