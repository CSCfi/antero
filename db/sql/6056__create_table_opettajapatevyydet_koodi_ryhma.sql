USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[opettajapatevyydet_koodi_ryhma]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[opettajapatevyydet_koodi_ryhma](
	[patevyys_koodi] [nchar](2) NOT NULL,
	[patevyys_ryhma] [nvarchar](250) NOT NULL
) ON [PRIMARY]


END

GO

USE [ANTERO]