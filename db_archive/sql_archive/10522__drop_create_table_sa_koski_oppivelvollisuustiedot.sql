USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_oppivelvollisuustiedot]') AND type in (N'U'))
DROP TABLE [sa].[sa_koski_oppivelvollisuustiedot]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koski_oppivelvollisuustiedot](
	[oppija_oid] [varchar] NOT NULL,
	[oppivelvollisuusvoimassaalkaen] DATE  NULL,
	[oppivelvollisuusvoimassaasti] DATE  NULL,
	[oikeuskoulutuksenmaksuttomuuteenvoimassaasti] DATE  NULL,
	[kotikuntasuomessaalkaen] DATE  NULL,
	[imp_created] [datetime] NULL,
	[source] nvarchar (100) NULL,
	[username] nvarchar(30) NULL
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_koski_oppivelvollisuustiedot] ADD  CONSTRAINT [DF__sa_koski_oppivelvollisuustiedot_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_oppivelvollisuustiedot] ADD  CONSTRAINT [DF__sa_koski_oppivelvollisuustiedot_username]  DEFAULT (suser_sname()) FOR [username]
GO


USE [ANTERO]
