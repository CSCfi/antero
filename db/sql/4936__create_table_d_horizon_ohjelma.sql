USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_horizon_ohjelma]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[d_horizon_ohjelma](
	[ohjelma_koodi] [varchar](100) NULL,
	[Ohjelma] [varchar](1000) NULL,
	[Ohjelman lyhenne] [varchar](1000) NULL,
	[rcn] [varchar](2000) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]

END