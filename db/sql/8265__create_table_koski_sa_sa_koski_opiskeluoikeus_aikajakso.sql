USE [Koski_SA]
GO

DROP TABLE IF EXISTS [sa].[sa_koski_opiskeluoikeus_aikajakso]
GO

/****** Object:  Table [sa].[sa_koski_opiskeluoikeus_aikajakso]    Script Date: 7.11.2023 13:31:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[tila] [varchar](50) NULL,
	[tila_alkanut] [datetime] NULL,
	[opiskeluoikeus_paattynyt] [bit] NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [int] NULL,
	[erityinen_tuki] [int] NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [int] NULL,
	[hojks] [int] NULL,
	[vaikeasti_vammainen] [int] NULL,
	[vammainen_ja_avustaja] [int] NULL,
	[osa_aikaisuus] [int] NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[vankilaopetuksessa] [int] NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [int] NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL,
	[majoitusetu] [int] NULL,
	[kuljetusetu] [int] NULL,
	[vammainen] [int] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[joustava_perusopetus] [int] NULL,
	[koulukoti] [int] NULL,
	[oppimaaran_suorittaja] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [bit] NULL
) ON [PRIMARY] 

GO

ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_aikajakso_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_aikajakso_username]  DEFAULT (suser_sname()) FOR [username]
GO
