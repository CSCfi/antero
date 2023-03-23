USE KOSKI_SA
GO
DROP TABLE IF EXISTS [sa].[sa_koski_osasuoritus]
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
	[rahoituksen_piirissa] [bit] NULL,
	[liittyy_tutkinnonosaan_koodiarvo] [varchar](max) NULL,
	[suorituskieli_koodiarvo] [varchar](max) NULL,
	[kieli_koodiarvo] [varchar](max) NULL,
	[kurssin_tyyppi_koodiarvo] [varchar](max) NULL,
	[matematiikan_oppimaara_koodiarvo] [varchar](max) NULL,
	[uskonnon_oppimaara_koodi] [varchar](max) NULL,
	[yksilollistetty_oppimaara] [bit] NULL,
	[data] [varchar](max) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_koski_osasuoritus] ADD  CONSTRAINT [DF__sa_koski_osasuoritus_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_osasuoritus] ADD  CONSTRAINT [DF__sa_koski_osasuoritus_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE ANTERO
