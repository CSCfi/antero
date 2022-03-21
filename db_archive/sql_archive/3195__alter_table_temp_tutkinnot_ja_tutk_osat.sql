USE [Koski_SA]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 22.7.2020 17:56:31 ******/
DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 22.7.2020 17:56:31 ******/
DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 22.7.2020 17:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset](
	[toimipiste_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[koulutustoimija_oid_hist] [varchar](max) NULL,
	[koulutustoimija_oid_pihvi] [varchar](max) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[ylempi_opiskeluoikeus_oid] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[tutkinto_ja_osaamisala_koodi] [int] NULL,
	[eper_tutkinto_ja_osaamisala_koodi] [varchar](41) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [int] NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[alkup_kustannusryhmakoodi] [varchar](10) NULL,
	[suorittaa_koko_tutkintoa] [int] NOT NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tutkintotyyppi_fi] [nvarchar](60) NULL,
	[koulutusluokitus_fi] [nvarchar](200) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[vahvistus_paiva_muokattu] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 22.7.2020 17:56:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset](
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[koulutustoimija_oid_hist] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[ylempi_opiskeluoikeus_oid] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suoritustason_tunniste] [bigint] NULL,
	[arviointi_paiva] [datetime] NULL,
	[arviointi_paiva_muokattu] [datetime] NOT NULL,
	[usean_tutkinnon_tutkinnonosa] [int] NOT NULL,
	[usean_tutkinnon_tutkinnonosa_usea_kustannusryhma] [int] NULL,
	[kustannusryhma_usean_tutkinnon_tutkinnonosa_yksi_kustannusryhmia] [int] NULL,
	[tutkinto_johon_tutkinnonosa_kuuluu] [varchar](50) NULL,
	[osaamisala_johon_tutkinnonosa_kuuluu] [varchar](50) NULL,
	[yhteinen_tutkinnon_osa] [int] NOT NULL,
	[toisesta_tutkinnosta_sisallytetty_tutkinnonosa] [int] NOT NULL,
	[kuuluu_kaatoluokkaan] [int] NOT NULL,
	[koulutus_moduuli_laajuus_alle_yhden] [int] NOT NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo_paataso] [varchar](6) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [varchar](30) NULL,
	[laajuus_puuttuu_eperusteista] [int] NOT NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_arvo_alkup] [float] NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[suorittaa_koko_tutkintoa] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [ANTERO]