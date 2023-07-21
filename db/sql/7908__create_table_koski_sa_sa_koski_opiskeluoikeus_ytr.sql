USE [Koski_SA]
GO

/****** Object:  Table [sa].[sa_koski_opiskeluoikeus_ytr]    Script Date: 21.7.2023 14:55:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus_ytr]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_opiskeluoikeus_ytr](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[oppija_oid] [varchar](150) NULL,
	[tila_koodiarvo] [varchar](150) NULL,
	[tila_koodistoUri] [varchar](150) NULL,
	[alku] [datetime] NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]


ALTER TABLE [sa].[sa_koski_opiskeluoikeus_ytr] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_ytr_imp_created]  DEFAULT (getdate()) FOR [imp_created]
ALTER TABLE [sa].[sa_koski_opiskeluoikeus_ytr] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_ytr_username]  DEFAULT (suser_sname()) FOR [username]

END

USE [ANTERO]
