USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_ytr_update]    Script Date: 30.7.2025 7.53.06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_ytr_update]') AND type in (N'U'))
DROP TABLE [sa].[sa_ytr_update]
GO

/****** Object:  Table [sa].[sa_ytr_update]    Script Date: 30.7.2025 7.53.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_ytr_update](
	[master_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tutkintokerta] [nvarchar](13) NOT NULL,
	[suorituskieli_koodiarvo] [varchar](20) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](150) NULL,
	[arviointi_arvosana_koodiarvo] [varchar](150) NULL,
	[arviointi_pisteet] [int] NULL,
	[d_organisaatioluokitus_yo_id] [bigint] NULL,
	[d_organisaatioluokitus_koulutustoimija_yo_id] [bigint] NULL
) ON [PRIMARY]
GO


