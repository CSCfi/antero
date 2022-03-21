USE [Koski_SA]
GO
/****** Object:  Table [dw].[d_osaamisala]    Script Date: 23.5.2019 11:10:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus_aikajakso]') AND type in (N'U'))
BEGIN
DROP TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_koski_opiskeluoikeus_aikajakso]') AND type in (N'U'))
BEGIN


CREATE TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso](
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[tila] [varchar](max) NULL,
	[tila_alkanut] [datetime] NULL,
	[opiskeluoikeus_paattynyt] [bit] NULL,
	[opintojen_rahoitus] [varchar](max) NULL,
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
	[username] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END
GO

ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_aikajakso_imp_created]  DEFAULT (getdate()) FOR [imp_created]
GO

ALTER TABLE [sa].[sa_koski_opiskeluoikeus_aikajakso] ADD  CONSTRAINT [DF__sa_koski_opiskeluoikeus_aikajakso_username]  DEFAULT (suser_sname()) FOR [username]
GO

USE [ANTERO]
