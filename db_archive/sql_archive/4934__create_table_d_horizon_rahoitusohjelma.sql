USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[d_horizon_rahoitusohjelma]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[d_horizon_rahoitusohjelma](
	[rahoitusohjelma_koodi] [varchar](50) NULL,
	[Rahoitusohjelma] [varchar](200) NULL,
	[loadtime] [datetime] NOT NULL,
	[username] [varchar](100) NOT NULL
) ON [PRIMARY]

END