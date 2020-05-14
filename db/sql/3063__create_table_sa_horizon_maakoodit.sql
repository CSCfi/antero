USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_maakoodit]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_maakoodit](
	[eu_koodi] [varchar](2) NULL,
	[isoCode] [varchar](4) NULL,
	[name] [varchar](44) NULL
) ON [PRIMARY]

END