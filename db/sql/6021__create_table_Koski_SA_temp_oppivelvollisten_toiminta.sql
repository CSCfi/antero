USE [Koski_SA]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_oppivelvollisten_toiminta]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[temp_oppivelvollisten_toiminta](
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[suorittanut_perusopetuksen_oppimaaran] [int] NULL,
	[oppivelvollisen_toiminta] [int] NOT NULL,
	[oppivelvollisen_toiminta_min] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

GO

USE [ANTERO]