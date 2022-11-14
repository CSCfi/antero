USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sources]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[sources](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[source_avain] [varchar](100) NULL,
	[source] [varchar](400) NULL,
	[source2] [varchar](100) NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]

