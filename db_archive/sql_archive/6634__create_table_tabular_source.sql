USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tabular_source]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[tabular_source](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tabular] [nvarchar](250) NULL,
	[source_avain] [varchar](100) NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]

