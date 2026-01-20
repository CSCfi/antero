USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_uudet]    Script Date: 30.7.2025 10.29.50 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_lukio_opiskelijat_uudet]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_lukio_opiskelijat_uudet]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_uudet]    Script Date: 30.7.2025 10.29.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_lukio_opiskelijat_uudet](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[sisaltyy_opiskeluoikeuteen_oid] [varchar](150) NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[master_oid] [varchar](150) NULL,
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
	[Sukupuoli] [varchar](50) NULL,
	[ika] [int] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](50) NULL,
	[syntymaaika] [date] NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


