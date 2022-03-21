USE [ANTERO]
GO
/****** Object:  Table [dw].[f_koski_opiskeluoikeus_piirteet_spl]    Script Date: 9.8.2019 16:45:24 ******/
DROP TABLE IF EXISTS [dw].[f_koski_opiskeluoikeus_piirteet_spl]
GO
/****** Object:  Table [dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset]    Script Date: 9.8.2019 16:45:24 ******/
DROP TABLE IF EXISTS [dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset]
GO
/****** Object:  Table [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]    Script Date: 9.8.2019 16:45:24 ******/
DROP TABLE IF EXISTS [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]
GO
/****** Object:  Table [dw].[f_amos_spl_koski_osasuoritus_pl_eivos]    Script Date: 9.8.2019 16:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_spl_koski_osasuoritus_pl_eivos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_spl_koski_osasuoritus_pl_eivos](
	[osasuoritus_id] [bigint] NULL,
	[ylempi_osasuoritus_id] [bigint] NULL,
	[koulutusmoduuli_koodisto_ylempi] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[koulutusmoduuli_koodisto] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [bigint] NULL,
	[koulutusmoduuli_laajuus_yksikko] [varchar](max) NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_paikallinen] [bit] NULL,
	[koulutusmoduuli_pakollinen] [bit] NULL,
	[vahvistus_paiva] [datetime] NULL,
	[arviointi_arvosana_koodiarvo] [varchar](max) NULL,
	[arviointi_arvosana_koodisto] [varchar](max) NULL,
	[arviointi_hyvaksytty] [bit] NULL,
	[arviointi_paiva] [datetime] NULL,
	[nayton_arviointi_paiva] [datetime] NULL,
	[data] [varchar](max) NULL,
	[imp_created] [datetime] NULL,
	[source] [nvarchar](100) NULL,
	[username] [nvarchar](30) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset]    Script Date: 9.8.2019 16:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_amos_spl_koski_tutkinnon_osien_suoritukset](
	[oppilaitos_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suoritustason_tunniste] [bigint] NULL,
	[arviointi_paiva] [datetime] NULL,
	[arviointi_paiva_kohdevuonna] [int] NOT NULL,
	[ep_usean_tutkinnon_tutkinnonosa] [int] NOT NULL,
	[yhteinen_tutkinnon_osa] [int] NOT NULL,
	[toisesta_tutkinnosta_sisallytetty_tutkinnonosa] [int] NOT NULL,
	[kuuluu_kaatoluokkaan] [int] NOT NULL,
	[koulutus_moduuli_laajuus_alle_yhden] [int] NOT NULL,
	[koulutusmoduuli_koodiarvo] [varchar](max) NULL,
	[koulutusmoduuli_koodiarvo_numeerinen] [bigint] NULL,
	[laajuus_puuttuu_eperusteista] [int] NOT NULL,
	[koulutusmoduuli_laajuus_arvo] [float] NULL,
	[koulutusmoduuli_laajuus_arvo_alkup] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dw].[f_koski_opiskeluoikeus_piirteet_spl]    Script Date: 9.8.2019 16:45:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_opiskeluoikeus_piirteet_spl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dw].[f_koski_opiskeluoikeus_piirteet_spl](
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[sisaltyy_toiseen] [int] NOT NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[tutkinto_koodi] [varchar](6) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_osaamisala_koodi] [int] NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[opintojen_rahoitus_koodi] [varchar](max) NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tila] [int] NULL,
	[koulutusmuoto] [varchar](max) NULL,
	[tila_alkanut] [int] NULL,
	[alku] [datetime] NULL,
	[loppu] [datetime] NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[kustannusryhma] [varchar](10) NULL,
	[valma_telma] [int] NOT NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[muu_ammatillinen_koul_pl_telma_ja_valma] [int] NOT NULL,
	[perustutkinnot_ml_oppisopimuskoulutus] [int] NOT NULL,
	[ammatti_ja_erikoisammattitutkinnot_ml_oppisopimuskoulutus] [int] NOT NULL,
	[perustutkinnot_tutkinnonosat_pl_oppisopimuskoulutus] [int] NOT NULL,
	[ammatti_ja_erikoisammattitutkinnot_tutkinnonosat_pl_oppisopimuskoulutus] [int] NOT NULL,
	[tutkintotyypin_ryhma] [varchar](42) NOT NULL,
	[tutkintotyyppi] [nvarchar](60) NULL,
	[perustutkinnot_tutkinnonosat_ml_oppisopimuskoulutus] [int] NOT NULL,
	[ammatti_ja_erikoisammattitutkinnot_tutkinnonosat_ml_oppisopimuskoulutus] [int] NOT NULL,
	[erityisopiskelija_ilman_erit_tuen_tehtävaa_tutkintoon_johtava] [int] NOT NULL,
	[erityisopiskelija_ilman_erit_tuen_tehtävaa_tutkintoon_valmentava] [int] NOT NULL,
	[erityisopiskelija_tutkintoon_johtava] [int] NOT NULL,
	[erityisopiskelija_vaikeasti_vammainen_tutkintoon_johtava] [int] NOT NULL,
	[erityisopiskelija_vammainen_ja_avustaja_tutkintoon_johtava] [int] NOT NULL,
	[erityisopiskelija_telma_ja_valma_ei_tutkintoon_johtava] [int] NOT NULL,
	[erityisopiskelija_vaikeasti_vammainen_ei_tutkintoon_johtava] [int] NOT NULL,
	[erityisopiskelija_vammainen_ja_avustaja_ei_tutkintoon_johtava] [int] NOT NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [int] NULL,
	[vankilaopetus] [int] NULL,
	[henkilostokoulutus_tutkintoon_johtava] [int] NOT NULL,
	[henkilostokoulutus_muu_kuin_tutkintoon_johtava] [int] NOT NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[erityinen_tuki] [int] NULL,
	[hojks] [int] NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [int] NULL,
	[vaikeasti_vammainen] [int] NULL,
	[vammainen_ja_avustaja] [int] NULL,
	[ammatillinen_tutkinto] [int] NOT NULL,
	[tutkinnon_osa_tai_osia] [int] NOT NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[oppisopimus] [int] NULL,
	[telma] [int] NOT NULL,
	[valma] [int] NOT NULL,
	[vahvistus_paiva] [datetime] NULL,
	[paatason_suoritus_id] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
