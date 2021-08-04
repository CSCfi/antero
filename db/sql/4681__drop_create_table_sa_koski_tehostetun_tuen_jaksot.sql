USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_tehostetun_tuen_jaksot]') AND type in (N'U'))
BEGIN
	DROP TABLE [sa].[sa_koski_tehostetun_tuen_jaksot]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_tehostetun_tuen_jaksot]') AND type in (N'U'))
BEGIN

CREATE TABLE [sa].[sa_koski_tehostetun_tuen_jaksot](
	[id] int NOT NULL,
	[opiskeluoikeus_oid] varchar(255) NULL,
	[alku] varchar(100) NULL,
	[loppu] varchar(100) NULL,
	[kentta] varchar(100) NULL,
	[imp_created] Date NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]
END
GO

ALTER TABLE [sa].[sa_koski_tehostetun_tuen_jaksot] ADD  CONSTRAINT [DF__sa_koski_tehostetun_tuen_jaksot_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_tehostetun_tuen_jaksot] ADD  CONSTRAINT [DF__sa_koski_tehostetun_tuen_jaksot_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE ANTERO
