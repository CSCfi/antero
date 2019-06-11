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
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[versionumero] [int] NULL,
	[aikaleima] [datetime] NULL,
	[sisaltyy_opiskeluoikeuteen_oid] [varchar](max) NULL,
	[oppija_oid] [varchar](max) NULL,
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
