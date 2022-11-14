USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tabular_db_sources]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[tabular_db_sources](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabular] [varchar](100) NULL,
	[source] [varchar](400) NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]

