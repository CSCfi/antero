USE [Koski_SA]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 5.12.2022 18:40:13 ******/
DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]    Script Date: 5.12.2022 18:40:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[suorituksen_tyyppi_koodi] [int] NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[tutkinnot] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


