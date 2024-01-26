USE [Koski_SA]
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_oppivelvolliset_esirajaukset]') AND type in (N'U'))

BEGIN

CREATE TABLE [sa].[temp_oppivelvolliset_esirajaukset](
	[oppija_oid] [varchar](50) NULL,
	[syntymaaika] [date] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](50) NULL,
	[sukupuoli] [varchar](50) NULL,
	[kotikunta] [varchar](50) NULL,
	[tutkinto_suoritettu] [datetime] NULL,
	[oppivelvollisuus_suoritettu] [datetime] NULL,
	[perusopetuksen_oppilaitos_oid] [varchar](50) NULL,
	[perusopetus_suoritettu] [datetime] NULL
) ON [PRIMARY]

END

GO

USE [ANTERO]