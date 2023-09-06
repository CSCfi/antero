USE [Koski_SA]
GO

/****** Object:  Table [dbo].[amm_opiskelijat_netto_valitaulu]    Script Date: 6.9.2023 11:59:57 ******/
DROP TABLE [dbo].[amm_opiskelijat_netto_valitaulu]
GO

/****** Object:  Table [dbo].[amm_opiskelijat_netto_valitaulu]    Script Date: 6.9.2023 11:59:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[amm_opiskelijat_netto_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](2) NULL,
	[ika] [varchar](3) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[erityisopetus] [int] NULL,
	[opintojen_rahoitus] [int] NULL,
	[koulutusvienti] [int] NULL,
	[majoitus] [int] NULL,
	[tutkinto_koodi] [char](6) NULL,
	[osaamisala_koodiarvo] [char](4) NULL,
	[suorituskieli_koodiarvo] [char](2) NULL,
	[oppisopimus] [int] NULL,
	[koulutussopimus] [int] NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[hankintakoulutuksen_koulutustoimija_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[henkilostokoulutus] [int] NULL,
	[suorituksen_tyyppi] [varchar](500) NULL,
	[ika_oo_alk] [varchar](3) NULL,
	[ika_oo_alk_tarkka] [varchar](3) NULL,
	[oo_aloitusvuosi] [int] NULL,
	[oo_aloituskuukausi] [int] NULL,
	[ika_opsoj_alk] [varchar](3) NULL,
	[ika_opsoj_alk_tarkka] [varchar](3) NULL,
	[opsoj_aloitusvuosi] [int] NULL,
	[opsoj_aloituskuukausi] [int] NULL,
	[ka] [float] NULL
) ON [PRIMARY]

GO


