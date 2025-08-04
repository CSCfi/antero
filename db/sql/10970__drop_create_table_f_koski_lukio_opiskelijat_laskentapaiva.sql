USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_laskentapaiva]    Script Date: 30.7.2025 10.42.06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_lukio_opiskelijat_laskentapaiva]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_lukio_opiskelijat_laskentapaiva]
GO

/****** Object:  Table [dw].[f_koski_lukio_opiskelijat_laskentapaiva]    Script Date: 30.7.2025 10.42.06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_lukio_opiskelijat_laskentapaiva](
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[tilastovuosi] [int] NULL,
	[tilastopaiva_20_1] [int] NOT NULL,
	[tilastopaiva_20_9] [int] NOT NULL,
	[aloitusvuosi] [int] NULL,
	[aloituskuukausi] [int] NULL,
	[sisaltyy_opiskeluoikeuteen_oid] [varchar](150) NULL,
	[master_oid] [varchar](150) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](200) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[alkamispaiva] [datetime] NULL,
	[paattymispaiva] [datetime] NULL,
	[oppimaara] [varchar](38) NOT NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[tavoitetutkinto] [nvarchar](200) NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[toimipiste_nimi] [varchar](256) NULL,
	[Sukupuoli] [varchar](50) NULL,
	[Ika] [int] NULL,
	[aidinkieli] [varchar](50) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[syntymaaika] [date] NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[jarj_tavoitetutkinto] [int] NOT NULL,
	[yhdistelmatutkinto] [varchar](27) NOT NULL,
	[oppivelvollinen] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


