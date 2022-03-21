USE [Koski_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_koski_osasuoritus')
BEGIN
	DROP TABLE [sa].[sa_koski_osasuoritus]
END

GO
/****** Object:  Table [sa].[sa_koski_osasuoritus]    Script Date: 5.3.2020 13:57:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_koski_osasuoritus](
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
	[rahoituksen_piirissa] [bit] NULL,
	[liittyy_tutkinnonosaan_koodiarvo] [varchar](MAX) NULL,
	[imp_created] [datetime] NULL CONSTRAINT [DF__sa_koski_osasuoritus_imp_created]  DEFAULT (getdate()),
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL CONSTRAINT [DF__sa_koski_osasuoritus_username]  DEFAULT (suser_sname())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
USE [ANTERO]

