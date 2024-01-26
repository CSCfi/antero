USE [Koski_SA]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_oppivelvollisuus_suoritettu]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[temp_oppivelvollisuus_suoritettu](
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[oppivelvollisen_toiminta] [varchar](150) NULL,
	[oppivelvollisen_toiminta_min] [varchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

GO

USE [ANTERO]