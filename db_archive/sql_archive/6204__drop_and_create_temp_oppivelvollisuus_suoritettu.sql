USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_oppivelvollisuus_suoritettu]    Script Date: 9.5.2022 15:17:58 ******/
DROP TABLE [sa].[temp_oppivelvollisuus_suoritettu]
GO

/****** Object:  Table [sa].[temp_oppivelvollisuus_suoritettu]    Script Date: 9.5.2022 15:17:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_oppivelvollisuus_suoritettu](
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](200) NULL,
	[oppivelvollisen_toiminta] [varchar](150) NULL,
	[oppivelvollisen_toiminta_min] [varchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

USE [ANTERO]