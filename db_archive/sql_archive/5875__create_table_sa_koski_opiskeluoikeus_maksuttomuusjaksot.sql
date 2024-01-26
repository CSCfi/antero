USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='sa' AND TABLE_NAME='sa_koski_opiskeluoikeus_maksuttomuusjaksot')
BEGIN
CREATE TABLE [sa].[sa_koski_opiskeluoikeus_maksuttomuusjaksot](
	[opiskeluoikeus_oid] [nvarchar] (255) NULL,
	[maksuttomuus_maksuton] [int] NULL,
	[maksuttomuus_alku] [datetime] NULL,
	[maksuttomuus_loppu] [datetime] NULL,
	[soure] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[imp_created] [datetime] NULL
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF

GO

USE [ANTERO]