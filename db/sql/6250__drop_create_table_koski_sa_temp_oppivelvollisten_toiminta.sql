USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_oppivelvollisten_toiminta]    Script Date: 3.6.2022 14:36:17 ******/
DROP TABLE [sa].[temp_oppivelvollisten_toiminta]
GO

/****** Object:  Table [sa].[temp_oppivelvollisten_toiminta]    Script Date: 3.6.2022 14:36:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_oppivelvollisten_toiminta](
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[koulutusmoduuli_koodiarvo] [varchar](250) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[suorittanut_perusopetuksen_oppimaaran] [int] NULL,
	[perusopetuksen_oppimaara_suoritettu_pvm] [date] NULL,
	[oppivelvollisen_toiminta] [int] NOT NULL,
	[oppivelvollisen_toiminta_min] [int] NULL
) ON [PRIMARY] 

GO


