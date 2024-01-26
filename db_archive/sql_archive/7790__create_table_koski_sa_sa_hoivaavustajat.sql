USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_hoivaavustajat]    Script Date: 27.6.2023 19:14:24 ******/
DROP TABLE IF EXISTS [sa].[sa_hoivaavustajat]
GO

/****** Object:  Table [sa].[sa_hoivaavustajat]    Script Date: 27.6.2023 19:14:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_hoivaavustajat](
	[oppija_oid] [varchar](150) NULL,
	[paatason_suoritus_id_106233] [bigint] NULL,
	[paatason_suoritus_id_106228] [bigint] NULL,
	[paatason_suoritus_id_patevyys] [bigint] NULL,
	[paatason_suoritus_id_tutkinto] [bigint] NULL,
	[pvm_106233] [datetime] NULL,
	[pvm_106228] [datetime] NULL,
	[pvm_patevyys] [datetime] NULL,
	[pvm_tutkinto] [datetime] NULL
) ON [PRIMARY]

GO


