USE [KOSKI_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE  IF  EXISTS[sa].[sa_valpas_oppivelvollisuudesta_vapautetut]
CREATE TABLE [sa].[sa_valpas_oppivelvollisuudesta_vapautetut](
		[id] INT IDENTITY(1,1) NOT NULL,
		[oppija_oid] VARCHAR(200) NULL,
		[virkailija_oid] VARCHAR(200) NULL,
		[kunta_koodiarvo] VARCHAR(10) NULL,
		[vapautettu] DATETIME NULL,
		[aikaleima] DATETIME NULL,
		[mitatoity] DATETIME2 NULL,
		[source] VARCHAR(500) NULL,
		[loadtime] DATETIME NULL,
		[username] VARCHAR(30) NULL,
	 CONSTRAINT [PK__sa_valpas_oppivelvollisuudesta_vapautetut] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]


GO

ALTER TABLE [sa].[sa_valpas_oppivelvollisuudesta_vapautetut] ADD  CONSTRAINT [DF__sa_valpas_oppivelvollisuudesta_vapautetut__loadtime]  DEFAULT (getdate()) FOR [loadtime]
GO

ALTER TABLE [sa].[sa_valpas_oppivelvollisuudesta_vapautetut] ADD  CONSTRAINT [DF__sa_valpas_oppivelvollisuudesta_vapautetut__username]  DEFAULT (suser_name()) FOR [username]
GO

USE [ANTERO]
