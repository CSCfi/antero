USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[virta_opettajakelpoisuus_priorisointi]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[virta_opettajakelpoisuus_priorisointi](
	[koodi] [nvarchar](50) NOT NULL,
	[nimi] [nvarchar](250) NULL,
	[sija] [int] NOT NULL
) ON [PRIMARY]


END

GO

USE [ANTERO]