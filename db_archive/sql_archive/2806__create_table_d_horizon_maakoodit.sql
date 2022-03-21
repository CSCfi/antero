USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_horizon_maakoodit]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[d_horizon_maakoodit](
	[eu_koodi] [varchar](2) NULL,
	[iso_koodi] [varchar](4) NULL,
	[Maa] [varchar](44) NULL
) ON [PRIMARY]

END