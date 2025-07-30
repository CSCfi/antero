USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_hoivaavustajat]    Script Date: 29.7.2025 18.01.58 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_hoivaavustajat]') AND type in (N'U'))
DROP TABLE [sa].[sa_hoivaavustajat]
GO

/****** Object:  Table [sa].[sa_hoivaavustajat]    Script Date: 29.7.2025 18.01.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_hoivaavustajat](
	[master_oid] [varchar](150) NULL,
	[tutkinnon_perusteiden_voimaantulo] [varchar](8) NULL,
	[paatason_suoritus_id_patevyys] [bigint] NULL,
	[paatason_suoritus_id_tutkinto] [bigint] NULL,
	[pvm_patevyys] [datetime] NULL,
	[pvm_tutkinto] [datetime] NULL
) ON [PRIMARY]
GO
