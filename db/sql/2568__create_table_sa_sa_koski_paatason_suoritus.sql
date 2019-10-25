USE [Koski_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_koski_paatason_suoritus')
BEGIN
	DROP TABLE [sa].[sa_koski_paatason_suoritus]
END

GO

/****** Object:  Table [sa].[sa_koski_paatason_suoritus]    Script Date: 25.10.2019 8:00:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_koski_paatason_suoritus](
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koulutustyyppi] [varchar](max) NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_yksikko] [varchar](max) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[arviointi_arvosana_koodiarvo] [varchar](max) NULL,
	[arviointi_arvosana_koodisto] [varchar](max) NULL,
	[arviointi_hyvaksytty] [bit] NULL,
	[arviointi_paiva] [datetime] NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[toimipiste_nimi] [varchar](256) NULL,
	[data] [varchar](max) NULL,
	[tutkinto_koodiarvo] [varchar](max) NULL,
	[osaamisala_koodiarvo] [varchar](max) NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[imp_created] [datetime] NULL CONSTRAINT [DF__sa_koski_paatason_suoritus_imp_created]  DEFAULT (getdate()),
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL CONSTRAINT [DF__sa_koski_paatason_suoritus_username]  DEFAULT (suser_sname())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
USE [Antero]
