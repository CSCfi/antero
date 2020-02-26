USE [Koski_SA]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_koski_ammatillisen_koulutuksen_sopimusjaksot')
BEGIN
	DROP TABLE [sa].[sa_koski_ammatillisen_koulutuksen_sopimusjaksot]
END

GO

/****** Object:  Table [sa].[sa_koski_ammatillisen_koulutuksen_sopimusjaksot]    Script Date: 25.10.2019 8:00:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [sa].[sa_koski_ammatillisen_koulutuksen_sopimusjaksot](
	[id] [int] IDENTITY(1,1),
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[sopimusmuoto] [varchar](256) NULL, 
	[tunnistekoodiarvo] [varchar](256) NULL, 
	[alku] [datetime] NULL, 
	[loppu] [datetime] NULL, 
	[sijainti] [varchar](256) NULL, 
	[ytunnus] [varchar](256) NULL, 
	[maakoodiarvo] [varchar](256) NULL, 
	[paikkakuntakoodiarvo] [varchar](256) NULL, 
	[paikkakuntanimi] [varchar](256) NULL, 
	[imp_created] [datetime] NULL CONSTRAINT [DF__sa_koski_ammatillisen_koulutuksen_sopimusjaksot_imp_created]  DEFAULT (getdate()),
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL CONSTRAINT [DF__sa_koski_ammatillisen_koulutuksen_sopimusjaksot_username]  DEFAULT (suser_sname())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO
USE [ANTERO]
