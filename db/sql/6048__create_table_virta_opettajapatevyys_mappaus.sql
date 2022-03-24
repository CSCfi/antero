USE [ANTERO]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[virta_opettajapatevyys_mappaus]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[virta_opettajapatevyys_mappaus](
	[patevyyskoodi] [char](2) NOT NULL,
	[kelpoisuuskoodi] [char](2) NOT NULL
) ON [PRIMARY]


END

GO

USE [ANTERO]