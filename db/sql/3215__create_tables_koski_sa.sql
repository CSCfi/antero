USE [Koski_SA]
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_paatason_suoritus]    Script Date: 21.8.2020 10:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_paatason_suoritus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_paatason_suoritus](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[tutkinto_koodiarvo] [varchar](max) NULL,
	[osaamisala_koodiarvo] [varchar](max) NULL,
	[koulutusluokitus_koodi] [varchar](6) NULL,
	[kustannusryhma_oa] [varchar](10) NULL,
	[kustannusryhma_tutk] [varchar](10) NULL,
	[toimipiste_oid] [varchar](max) NULL,
	[rnk] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]    Script Date: 21.8.2020 10:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_aikajaksot](
	[oppija_oid] [varchar](150) NULL,
	[opiskeluoikeus_oid] [varchar](150) NULL,
	[alkamispaiva] [datetime] NULL,
	[sisaltyy_toiseen] [int] NOT NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_osaamisala_koodi] [int] NULL,
	[tila] [varchar](100) NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[oppisopimus] [int] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[erityisopetus_koodi] [int] NOT NULL,
	[vankilaopetuksessa] [int] NULL,
	[paatason_suoritus_id] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]    Script Date: 21.8.2020 10:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_liputa_ei_vos_rahoitettu_koulutus](
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[osasuoritus_id] [bigint] NULL,
	[vaatimus] [varchar](167) NOT NULL,
	[tieto] [varchar](14) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]    Script Date: 21.8.2020 10:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_osasuoritus_pl_eivos](
	[osasuoritus_id] [bigint] NULL,
	[ylempi_osasuoritus_id] [bigint] NULL,
	[koulutusmoduuli_koodisto_ylempi] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [varchar](30) NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_yksikko] [varchar](max) NULL,
	[koulutusmoduuli_paikallinen] [bit] NULL,
	[koulutusmoduuli_pakollinen] [bit] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[arviointi_arvosana_koodiarvo] [varchar](max) NULL,
	[arviointi_arvosana_koodisto] [varchar](max) NULL,
	[arviointi_hyvaksytty] [bit] NULL,
	[arviointi_paiva] [datetime] NULL,
	[nayton_arviointi_paiva] [datetime] NULL,
	[osasuoritus_hylataan] [int] NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[data] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 21.8.2020 10:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]    Script Date: 21.8.2020 10:43:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_tutkinnot_ja_tutkinnonosat_tutkinnon_osien_suoritukset]') AND type in (N'U'))
BEGIN
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
END
GO
USE [ANTERO]