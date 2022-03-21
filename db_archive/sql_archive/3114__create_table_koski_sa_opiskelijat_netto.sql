USE [Koski_SA]
GO
/****** Object:  Table [dbo].[amm_opiskelijat_netto_valitaulu]    Script Date: 4.6.2020 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[amm_opiskelijat_netto_valitaulu]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[amm_opiskelijat_netto_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](2) NULL,
	[ika] [varchar](3) NULL,
	[kansalaisuus] [varchar](25) NULL,
	[erityisopetus] [int] NULL,
	[opintojen_rahoitus] [int] NULL,
	[majoitus] [int] NULL,
	[tutkinto_koodi] [char](6) NULL,
	[osaamisala_koodiarvo] [char](4) NULL,
	[suorituskieli_koodiarvo] [char](2) NULL,
	[oppisopimus] [int] NULL,
	[koulutussopimus] [int] NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[henkilostokoulutus] [int] NULL,
	[suorituksen_tyyppi] [varchar](500) NULL,
	[ka] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[sa_amm_paatason_suoritus]    Script Date: 4.6.2020 17:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_amm_paatason_suoritus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[sa_amm_paatason_suoritus](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[tutkinto_koodiarvo] [varchar](max) NULL,
	[osaamisala_koodiarvo] [varchar](max) NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[koulutussopimusjaksojen_paivat] [int] NULL,
	[oppisopimusjaksojen_paivat] [int] NULL,
	[suorituskieli_koodiarvo] [nvarchar](255) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[suorituksen_alkamispaiva] [date] NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE [ANTERO]