USE [Koski_SA]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_mitatoity_opiskeluoikeus]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_koski_mitatoity_opiskeluoikeus]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_mitatoity_opiskeluoikeus]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_mitatoity_opiskeluoikeus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[opiskeluoikeus_oid] [nvarchar](255) NULL,
	[versionumero] [int] NULL,
	[aikaleima] [varchar](100) NULL,
	[oppija_oid] [varchar](100) NULL,
	[mitatoitu] [datetime] NULL,
	[suostumus_peruttu] [datetime] NULL,
	[tyyppi] [varchar](100) NULL,
	[paatason_suoritus_tyypit] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitos_nimi] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[koulutustoimija_nimi] [varchar](100) NULL,
	[imp_created] [datetime] NULL,
	[username] [varchar](100) NULL,
	[source] [varchar](100) NULL
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_koski_mitatoity_opiskeluoikeus] ADD  CONSTRAINT [DF__ssa_koski_mitatoity_opiskeluoikeus_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_mitatoity_opiskeluoikeus] ADD  CONSTRAINT [DF__sa_koski_mitatoity_opiskeluoikeus_username]  DEFAULT (suser_sname()) FOR [username]
GO
USE [ANTERO]
