USE [Koski_SA]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' and TABLE_NAME='sa_koski_perusopetuksen_kotiopetusjaksot')
BEGIN

	CREATE TABLE [sa].[sa_koski_perusopetuksen_kotiopetusjaksot](
		[id] [bigint] IDENTITY(0,1) NOT NULL,
		[opiskeluoikeus_oid] [varchar](100) NULL,
		[kotiopetus_alku] [datetime] NULL,
		[kotiopetus_loppu] [datetime] NULL,
		[kentta] [varchar](30) NULL,
		[source] [varchar](30) NULL,
		[username] [varchar](30) NULL,
		[imp_created] [datetime] NULL,
	PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

END
GO

IF NOT EXISTS(SELECT * FROM SYS.OBJECTS WHERE TYPE_DESC =  'DEFAULT_CONSTRAINT' AND NAME = 'DF__sa_koski_perusopetuksen_kotiopetusjaksot_imp_created')
BEGIN
	ALTER TABLE [sa].[sa_koski_perusopetuksen_kotiopetusjaksot] ADD  CONSTRAINT [DF__sa_koski_perusopetuksen_kotiopetusjaksot_imp_created]  DEFAULT (getdate()) FOR [imp_created]
END
GO

IF NOT EXISTS(SELECT * FROM SYS.OBJECTS WHERE TYPE_DESC =  'DEFAULT_CONSTRAINT' AND NAME = 'DF__sa_koski_perusopetuksen_kotiopetusjaksot_username')
BEGIN
	ALTER TABLE [sa].[sa_koski_perusopetuksen_kotiopetusjaksot] ADD  CONSTRAINT [DF__sa_koski_perusopetuksen_kotiopetusjaksot_username]  DEFAULT (suser_sname()) FOR [username]
END
GO

USE ANTERO
