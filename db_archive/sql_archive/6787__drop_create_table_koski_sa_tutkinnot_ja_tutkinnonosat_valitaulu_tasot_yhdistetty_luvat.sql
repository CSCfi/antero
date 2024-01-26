USE [Koski_SA]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 20.12.2022 17:41:59 ******/
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 20.12.2022 17:41:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat](
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
	[osaamispisteet] [float] NULL,
	[lupa_koulutus] [int] NOT NULL,
	[lupa_korotustekija] [int] NOT NULL,
	[lupa_suorituskieli] [varchar](10) NULL,
	[verrataan_lupatietoihin] [nvarchar](10) NULL,
	[lupa_jarj_nimi] [nvarchar](255) NULL,
	[lupa_jarj_ytunnus] [varchar](20) NULL,
	[lupa_tutk_nimi] [varchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


