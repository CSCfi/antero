USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]
GO

CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitos_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NOT NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[master_oid] [varchar](100) NOT NULL,
	[opiskeluoikeus_oid] [varchar](100) NOT NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[paatason_suoritus_id] [bigint] NOT NULL,
	[suoritustason_tunniste] [bigint] NULL,
	[koulutusmoduuli_koodiarvo] [varchar](250) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [varchar](250) NULL,
	[diaarinumero] [varchar](250) NULL,
	[diaarinumero_tutkinnonosa_koodi] [int] NULL,
	[koulutusmoduuli_laajuus_arvo_alkup] [float] NULL,
	[tos_koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [int] NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[ep_usean_tutkinnon_tutkinnonosa] [int] NULL,
	[yhteinen_tutkinnon_osa] [int] NULL,
	[toisesta_tutkinnosta_sisallytetty_tutkinnonosa] [int] NULL,
	[suorittaa_koko_tutkintoa] [int] NULL,
	[arviointi_paiva] [datetime] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[opintojen_rahoitus_koodi] [varchar](10) NULL,
	[maksuton] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [int] NULL,
	[suorituksen_tyyppi] [varchar](250) NOT NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NOT NULL,
	[paataso] [int] NOT NULL,
	[duplikaatti] [int] NULL,
	[paallekkainen_tuva] [int] NULL,
	[duplikaatti_suorituskausittain] [int] NULL,
 CONSTRAINT [PK_tutkinnot_ja_tutkinnonosat_valitaulu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]') AND type in (N'U'))
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty]
GO

CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty](
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[keskiarvoluokka] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NOT NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitos_oid_pihvi] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[opintojen_rahoitus_koodi] [varchar](10) NULL,
	[maksuttomuus] [int] NULL,
	[suorituksen_tyyppi_koodi] [int] NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NOT NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[tutkinnot] [int] NULL,
	[tutkinnon_osat] [int] NULL,
	[osaamispisteet] [float] NULL
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]') AND type in (N'U'))
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]
GO

CREATE TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat](
	[vuosi] [int] NOT NULL,
	[kuukausi] [int] NOT NULL,
	[sukupuoli] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[keskiarvoluokka] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NOT NULL,
	[koulutustoimija_oid_hist] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi] [varchar](100) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitos_oid_pihvi] [varchar](100) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[hankintakoulutus] [int] NULL,
	[alkamispaiva] [date] NULL,
	[opintojen_rahoitus_koodi] [varchar](10) NULL,
	[maksuttomuus] [int] NULL,
	[suorituksen_tyyppi_koodi] [int] NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[suorituskieli_koodiarvo] [varchar](10) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NOT NULL,
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
) ON [PRIMARY]
GO
