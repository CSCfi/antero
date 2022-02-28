USE [Koski_SA]
GO

ALTER TABLE [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso] DROP CONSTRAINT IF EXISTS [DF__sa_koski_esiopetus_opiskeluoikeus_aikajakso_username]
GO

ALTER TABLE [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso] DROP CONSTRAINT IF EXISTS [DF__sa_koski_esiopetus_opiskeluoikeus_aikajakso_imp_created]
GO

/****** Object:  Table [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso]    Script Date: 25.2.2022 22:11:32 ******/
DROP TABLE IF EXISTS [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso]
GO

/****** Object:  Table [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso]    Script Date: 25.2.2022 22:11:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[tila] [varchar](100) NULL,
	[tila_alkanut] [datetime] NULL,
	[opiskeluoikeus_paattynyt] [int] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[tukimuodot] [varchar](100) NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[erityisen_tuen_paatos_opiskelee_toiminta_alueittain] [int] NULL,
	[erityisen_tuen_paatos_erityisryhmassa] [int] NULL,
	[erityisen_tuen_paatos_toteutuspaikka] [varchar](100) NULL,
	[vammainen] [int] NULL,
	[vaikeasti_vammainen] [int] NULL,
	[majoitusetu] [int] NULL,
	[kuljetusetu] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[koulukoti] [int] NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY]

GO

ALTER TABLE [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso] ADD  CONSTRAINT [DF__sa_koski_esiopetus_opiskeluoikeus_aikajakso_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_esiopetus_opiskeluoikeus_aikajakso] ADD  CONSTRAINT [DF__sa_koski_esiopetus_opiskeluoikeus_aikajakso_username]  DEFAULT (suser_sname()) FOR [username]
GO


