USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP TABLE IF EXISTS [sa].[sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos]

CREATE TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso_erityisen_tuen_paatos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[opiskeluoikeus_oid] [nvarchar](255) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[erityisryhmassa] [int] NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[tarkenne] [varchar](30) NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[imp_created] [datetime] NULL
) ON [PRIMARY]

GO

USE ANTERO
