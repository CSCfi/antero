USE [Koski_SA]
GO
/****** Object:  Table [sa].[opiskelijavuodet_valitaulu]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[opiskelijavuodet_valitaulu]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[opiskelijavuodet_valitaulu](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[osa_aikaisuus] [int] NOT NULL,
	[oppis] [varchar](50) NULL,
	[erityisopetus] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[vankilaopetus] [varchar](50) NULL,
	[henkilostokoulutus] [int] NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[koulk] [varchar](50) NULL,
	[tunn_oid] [varchar](max) NULL,
	[jarj_oid] [varchar](max) NULL,
	[toim_oid] [varchar](100) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[opiskelijavuosi_lasna] [decimal](20, 10) NULL,
	[opiskelijavuosi_loma] [decimal](20, 10) NULL,
	[opiskelijavuosi_opva] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_loma] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_amm] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_paallekkainen_lukio] [decimal](20, 10) NULL,
	[hylatty_opiskelijavuosi_sisaltyy_toiseen] [decimal](20, 10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[opiskelijavuodet_valitaulu_unpivot]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[opiskelijavuodet_valitaulu_unpivot]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[opiskelijavuodet_valitaulu_unpivot](
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[tilv_date] [date] NULL,
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[sukupuoli] [varchar](1) NULL,
	[aidinkieli] [varchar](50) NULL,
	[ika] [int] NULL,
	[osa_aikaisuus] [int] NOT NULL,
	[oppis] [varchar](50) NULL,
	[erityisopetus] [int] NOT NULL,
	[majoitus] [int] NOT NULL,
	[vankilaopetus] [varchar](50) NULL,
	[henkilostokoulutus] [int] NULL,
	[tyovoimakoulutus] [int] NOT NULL,
	[koulk] [varchar](50) NULL,
	[tunn_oid] [varchar](max) NULL,
	[jarj_oid] [varchar](max) NULL,
	[toim_oid] [varchar](100) NULL,
	[suorituksen_tyyppi] [int] NOT NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[osaamisala] [varchar](50) NULL,
	[kustannusryhma] [varchar](50) NULL,
	[hylkaamisen_peruste] [int] NULL,
	[hyvaksytaan] [int] NULL,
	[op_vuodet] [numeric](27, 11) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[osasuoritus_kustannusryhma]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[osasuoritus_kustannusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[osasuoritus_kustannusryhma](
	[tutkinnonosa_koodi] [varchar](10) NULL,
	[tutkinnonosa_nimi_fi] [varchar](500) NULL,
	[tutkinto_koodi] [varchar](10) NULL,
	[tutkinto_nimi_fi] [varchar](500) NULL,
	[osaamisala_koodi] [varchar](10) NULL,
	[osaamisala_nimi_fi] [varchar](500) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut](
	[pvm] [date] NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[tila] [varchar](50) NOT NULL,
	[alku] [date] NOT NULL,
	[loppu] [date] NOT NULL,
	[alku_ei_muokattu] [date] NULL,
	[loppu_ei_muokattu] [date] NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[majoitus] [varchar](50) NULL,
	[sisaoppilaitosmainen_majoitus] [varchar](50) NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [varchar](50) NULL,
	[erityinen_tuki] [varchar](50) NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [varchar](50) NULL,
	[hojks] [varchar](50) NULL,
	[vaikeasti_vammainen] [varchar](50) NULL,
	[vammainen_ja_avustaja] [varchar](50) NULL,
	[osa_aikaisuus] [varchar](50) NULL,
	[vankilaopetuksessa] [varchar](50) NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [varchar](50) NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[toisen_opiskeluoikeuden_sisalla] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL,
	[aiempi_koulutusmuoto] [varchar](50) NULL,
	[lasna_pv_hyv] [decimal](18, 12) NULL,
	[lasna_pv_hyv_ei_muokattu] [decimal](18, 12) NULL,
	[loma_pv_hyv] [int] NULL,
	[loma_pv_hyv_ei_muokattu] [int] NULL,
	[loma_pv_nyk] [int] NULL,
	[loma_pv_nyk_ei_muokattu] [int] NULL,
	[loma_pv_hist] [int] NULL,
	[loma_pv_hist_ei_muokattu] [int] NULL,
	[opva_pv_hyv] [int] NULL,
	[opva_pv_hyv_ei_muokattu] [int] NULL,
	[opva_pv_nyk] [int] NULL,
	[opva_pv_nyk_ei_muokattu] [int] NULL,
	[opva_pv_hist] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma](
	[pvm] [date] NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[tila] [varchar](50) NOT NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[alku_ei_muokattu] [date] NULL,
	[loppu_ei_muokattu] [date] NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[majoitus] [varchar](50) NULL,
	[sisaoppilaitosmainen_majoitus] [varchar](50) NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [varchar](50) NULL,
	[erityinen_tuki] [varchar](50) NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [varchar](50) NULL,
	[hojks] [varchar](50) NULL,
	[vaikeasti_vammainen] [varchar](50) NULL,
	[vammainen_ja_avustaja] [varchar](50) NULL,
	[osa_aikaisuus] [varchar](50) NULL,
	[vankilaopetuksessa] [varchar](50) NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [varchar](50) NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[toisen_opiskeluoikeuden_sisalla] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL,
	[aiempi_koulutusmuoto] [varchar](50) NULL,
	[lasna_pv_hyv] [int] NULL,
	[lasna_pv_hyv_ei_muokattu] [int] NULL,
	[loma_pv_hyv] [decimal](18, 12) NULL,
	[loma_pv_hyv_ei_muokattu] [decimal](18, 12) NULL,
	[loma_pv_nyk] [decimal](18, 12) NULL,
	[loma_pv_nyk_ei_muokattu] [decimal](18, 12) NULL,
	[loma_pv_hist] [decimal](18, 12) NULL,
	[loma_pv_hist_ei_muokattu] [decimal](18, 12) NULL,
	[opva_pv_hyv] [int] NULL,
	[opva_pv_hyv_ei_muokattu] [int] NULL,
	[opva_pv_nyk] [int] NULL,
	[opva_pv_nyk_ei_muokattu] [int] NULL,
	[opva_pv_hist] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva](
	[pvm] [date] NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[tila] [varchar](50) NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[alku_ei_muokattu] [date] NULL,
	[loppu_ei_muokattu] [date] NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[majoitus] [varchar](50) NULL,
	[sisaoppilaitosmainen_majoitus] [varchar](50) NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [varchar](50) NULL,
	[erityinen_tuki] [varchar](50) NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [varchar](50) NULL,
	[hojks] [varchar](50) NULL,
	[vaikeasti_vammainen] [varchar](50) NULL,
	[vammainen_ja_avustaja] [varchar](50) NULL,
	[osa_aikaisuus] [varchar](50) NULL,
	[vankilaopetuksessa] [varchar](50) NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [varchar](50) NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[toisen_opiskeluoikeuden_sisalla] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL,
	[aiempi_koulutusmuoto] [varchar](50) NULL,
	[lasna_pv_hyv] [decimal](18, 10) NULL,
	[lasna_pv_hyv_ei_muokattu] [decimal](18, 10) NULL,
	[loma_pv_hyv] [decimal](18, 10) NULL,
	[loma_pv_hyv_ei_muokattu] [decimal](18, 10) NULL,
	[loma_pv_nyk] [decimal](18, 10) NULL,
	[loma_pv_nyk_ei_muokattu] [decimal](18, 10) NULL,
	[loma_pv_hist] [decimal](18, 10) NULL,
	[loma_pv_hist_ei_muokattu] [decimal](18, 10) NULL,
	[opva_pv_hyv] [decimal](18, 10) NULL,
	[opva_pv_hyv_ei_muokattu] [decimal](18, 10) NULL,
	[opva_pv_nyk] [decimal](18, 10) NULL,
	[opva_pv_nyk_ei_muokattu] [decimal](18, 10) NULL,
	[opva_pv_hist] [decimal](18, 10) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_oidit](
	[pvm] [date] NULL,
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[alkamispaiva] [date] NULL,
	[paattymispaiva] [date] NULL,
	[tila] [varchar](50) NULL,
	[osatutkinto] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma](
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[paatason_suoritus_id] [nchar](10) NULL,
	[kr1] [varchar](50) NULL,
	[kr2] [varchar](50) NULL,
	[kr3] [varchar](50) NULL,
	[kr4] [varchar](50) NULL,
	[kr5] [varchar](50) NULL,
	[kr] [varchar](50) NULL,
	[kr_jarj] [varchar](50) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_paallekkaiset_opiskeluoikeudet](
	[pvm] [date] NULL,
	[oppija_oid] [varchar](50) NULL,
	[opiskeluoikeus_oid] [varchar](50) NOT NULL,
	[aiempi_koulutusmuoto] [varchar](50) NULL,
	[tila] [varchar](50) NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[alku_tod] [date] NULL,
	[ed_paattyi] [date] NULL,
	[ed_paattyi_ennen_jakson_alkua] [int] NULL,
	[ed_jatkuu] [int] NULL,
	[valiaikainen_keskeytys] [int] NULL,
	[toisen_opiskeluoikeuden_sisalla] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_paatason_suoritus]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_paatason_suoritus]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_paatason_suoritus](
	[opiskeluoikeus_oid] [varchar](100) NOT NULL,
	[paatason_suoritus_id] [nchar](20) NULL,
	[suorituksen_tyyppi] [varchar](50) NOT NULL,
	[koulutusmoduuli_koodiarvo] [varchar](500) NOT NULL,
	[tutkinto_koodiarvo] [varchar](50) NULL,
	[osaamisala_koodiarvo] [varchar](50) NULL,
	[koulutusluokitus_koodi] [varchar](50) NULL,
	[kustannusryhma_oa] [varchar](50) NULL,
	[kustannusryhma_tutk] [varchar](50) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[rnk] [int] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [sa].[temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]    Script Date: 2.8.2019 15:20:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat]') AND type in (N'U'))
BEGIN
CREATE TABLE [sa].[temp_opiskelijavuodet_samana_paivana_alkaneet_hylattavat](
	[oppija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid_hylataan] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
USE ANTERO
