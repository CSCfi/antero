USE [Koski_SA]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_koski_opiskeluoikeus]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus]') AND type in (N'U'))
BEGIN


CREATE TABLE [sa].[sa_koski_opiskeluoikeus](
	[osasuoritus_id] [bigint] NULL,
	[ylempi_osasuoritus_id] [bigint] NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_yksikko] [varchar](max) NULL,
	[koulutusmoduuli_paikallinen] [bit] NULL,
	[koulutusmoduuli_pakollinen] [bit] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[arviointi_arvosana_koodiarvo] [varchar](max) NULL,
	[arviointi_arvosana_koodisto] [varchar](max) NULL,
	[arviointi_hyvaksytty] [bit] NULL,
	[arviointi_paiva] [datetime] NULL,
	[nayton_arviointi_paiva] [datetime] NULL,
	[data] [varchar](max) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

GO

ALTER TABLE [sa].[sa_koski_opiskeluoikeus] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_opiskeluoikeus] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
