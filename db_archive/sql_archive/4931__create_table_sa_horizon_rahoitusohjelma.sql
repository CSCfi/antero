USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_horizon_rahoitusohjelma]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_horizon_rahoitusohjelma](
	[code] [varchar](50) NULL,
	[title] [varchar](200) NULL
) ON [PRIMARY]

END