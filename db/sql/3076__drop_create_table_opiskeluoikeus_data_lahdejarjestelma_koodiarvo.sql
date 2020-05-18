USE [Koski_SA]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF NOT EXISTS(
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'sa_koski_opiskeluoikeus' AND TABLE_SCHEMA = 'sa' AND COLUMN_NAME = 'lahdejarjestelma_koodiarvo' AND COLUMN_NAME = 'data' AND COLUMN_NAME = 'vanha_koulutustoimija_oid' AND COLUMN_NAME = 'vanha_koulutustoimija_nimi'
)
BEGIN
DROP TABLE [sa].[sa_koski_opiskeluoikeus]

CREATE TABLE [sa].[sa_koski_opiskeluoikeus](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[versionumero] [int] NULL,
	[aikaleima] [datetime] NULL,
	[sisaltyy_opiskeluoikeuteen_oid] [varchar](150) NULL,
	[oppija_oid] [varchar](150) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[oppilaitos_nimi] [varchar](max) NULL,
	[oppilaitos_kotipaikka] [varchar](max) NULL,
	[oppilaitosnumero] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[koulutustoimija_nimi] [varchar](max) NULL,
	[koulutusmuoto] [varchar](max) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[viimeisin_tila] [varchar](max) NULL,
	[lisatiedot_henkilostokoulutus] [int] NULL,
	[lisatiedot_koulutusvienti] [int] NULL,
	[lahdejarjestelma_koodiarvo] [varchar] (255) NULL,
	[vanha_koulutustoimija_oid] [varchar] (255) NULL,
	[vanha_koulutustoimija_nimi] [varchar] (255) NULL,
	[data] [varchar] (MAX) NULL, 
	[imp_created] [datetime] NULL CONSTRAINT [DF__sa_koski_opiskeluoikeus_imp_created]  DEFAULT (getdate()),
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL CONSTRAINT [DF__sa_koski_opiskeluoikeus_username]  DEFAULT (suser_sname())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
USE ANTERO

