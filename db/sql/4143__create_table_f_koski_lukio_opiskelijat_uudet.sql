USE [ANTERO]

GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_perusaste_keskiarvot]') AND type in (N'U'))
BEGIN

CREATE TABLE [dw].[f_koski_lukio_opiskelijat_uudet](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[sisaltyy_opiskeluoikeuteen_oid] [varchar](150) NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oppija_oid] [varchar](150) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[oppimaara] [varchar](255) NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[toimipiste_nimi] [varchar](256) NULL,
	[Sukupuoli] [varchar](1) NULL,
	[ika] [int] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](50) NULL,
	[syntymaaika] [date] NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END

USE [ANTERO]




