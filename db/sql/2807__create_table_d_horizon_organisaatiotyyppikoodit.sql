USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_horizon_organisaatiotyyppikoodit]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[d_horizon_organisaatiotyyppikoodit](
	[organisaatiotyyppi_koodi] [varchar](3) NULL,
	[Organisaatiotyyppi] [varchar](97) NULL
) ON [PRIMARY]

END


