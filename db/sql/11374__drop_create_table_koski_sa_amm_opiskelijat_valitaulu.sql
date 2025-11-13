USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[amm_opiskelijat_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[amm_opiskelijat_valitaulu]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[amm_opiskelijat_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[op_alkamispaiva] [date] NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](2) NULL,
	[ika] [varchar](3) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[kotikunta] [varchar](3) NULL,
	[erityisopetus] [int] NULL,
	[opintojen_rahoitus] [int] NULL,
	[koulutusvienti] [int] NULL,
	[majoitus] [int] NULL,
	[tutkinto_koodi] [char](6) NULL,
	[osaamisala_koodiarvo] [char](4) NULL,
	[tutkintonimike_koodiarvo] [char](5) NULL,
	[suorituskieli_koodiarvo] [char](2) NULL,
	[oppisopimus] [int] NULL,
	[koulutussopimus] [int] NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[hankintakoulutuksen_toimipiste_oid] [varchar](100) NULL,
	[hankintakoulutuksen_oppilaitos_oid] [varchar](100) NULL,
	[hankintakoulutuksen_koulutustoimija_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[henkilostokoulutus] [int] NULL,
	[suorituksen_tyyppi] [varchar](500) NULL,
	[uusi] [int] NULL,
	[uusi_rahoitus] [int] NULL,
	[master_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[oppivelvollinen] [int] NULL,
	[tilastopaiva_20_9] [int] NULL
) ON [PRIMARY]
GO


