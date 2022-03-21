USE [Koski_SA]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS(
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'sa_koski_paatason_suoritus' AND TABLE_SCHEMA = 'sa' AND COLUMN_NAME = 'suorituksen_alkamispaiva'
)
BEGIN 
DROP TABLE [sa].[sa_koski_paatason_suoritus]

CREATE TABLE [sa].[sa_koski_paatason_suoritus](
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
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
	[koulutussopimusjaksojen_paivat] [int] NULL,
	[oppisopimusjaksojen_paivat] [int] NULL,
	[suorituksen_alkamispaiva] [date] NULL,
	[imp_created] [datetime] NULL CONSTRAINT [DF__sa_koski_paatason_suoritus_imp_created]  DEFAULT (getdate()),
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL CONSTRAINT [DF__sa_koski_paatason_suoritus_username]  DEFAULT (suser_sname())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


SET ANSI_PADDING OFF
END
USE ANTERO