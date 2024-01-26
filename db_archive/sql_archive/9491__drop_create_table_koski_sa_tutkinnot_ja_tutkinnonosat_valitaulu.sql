USE [Koski_SA]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 17.1.2024 12:37:30 ******/
DROP TABLE [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]
GO

/****** Object:  Table [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu]    Script Date: 17.1.2024 12:37:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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
	[oppija_oid] [varchar](100) NOT NULL,
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
	[suorituksen_tyyppi] [varchar](250) NOT NULL,
	[oppisopimus_koodi] [int] NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetus_koodi] [int] NOT NULL,
	[paataso] [int] NOT NULL,
	[duplikaatti] [int] NULL,
	[paallekkainen_tuva] [int] NULL,
	[duplikaatti_rahoituskausittain] [int] NULL,
 CONSTRAINT [PK_tutkinnot_ja_tutkinnonosat_valitaulu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
