USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ytl_aine]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[sa_ytl_aine](
	[koodi] [nvarchar](500) NULL,
	[aine_selite_fi] [nvarchar](500) NULL,
	[aine_selite_sv] [nvarchar](500) NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]

END 

GO

USE [ANTERO]
