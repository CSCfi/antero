USE [ANTERO]
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tabular_variables_and_measures]') AND type in (N'U'))
BEGIN

CREATE TABLE [dbo].[tabular_variables_and_measures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](1000) NULL,
	[tabular] [varchar](1000) NULL,
	[perspective] [varchar](1000) NULL,
	[tyyppi] [varchar](1000) NULL,
	[suojattu] [varchar](1000) NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]

