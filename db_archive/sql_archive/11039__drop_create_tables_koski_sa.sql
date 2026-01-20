USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi]    Script Date: 22.8.2025 20.27.32 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi]
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[kr_uusi] [nvarchar](10) NULL
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma]
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_osatutkinnot_kustannusryhma](
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[kr] [nvarchar](10) NULL,
	[kr_uusi] [varchar](10) NULL
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut]
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_valmistunut](
	[pvm] [date] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[tila] [varchar](50) NULL,
	[tila_alkanut] [date] NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[alku_ei_muokattu] [date] NULL,
	[loppu_ei_muokattu] [date] NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[maksuton] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [bit] NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [int] NULL,
	[erityinen_tuki] [int] NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [int] NULL,
	[hojks] [int] NULL,
	[vaikeasti_vammainen] [int] NULL,
	[vammainen_ja_avustaja] [int] NULL,
	[osa_aikaisuus] [int] NULL,
	[vankilaopetuksessa] [int] NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [int] NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL,
	[aiempi_koulutusmuoto] [varchar](100) NULL,
	[aiempi_tuva_jarjestamislupa] [varchar](100) NULL,
	[valiaikainen_keskeytys] [int] NULL,
	[lasna_pv_hyv] [numeric](28, 6) NULL,
	[lasna_pv_hyv_ei_muokattu] [numeric](28, 6) NULL,
	[loma_pv_hyv] [int] NOT NULL,
	[loma_pv_hyv_ei_muokattu] [int] NOT NULL,
	[loma_pv_nyk] [int] NOT NULL,
	[loma_pv_nyk_ei_muokattu] [int] NOT NULL,
	[loma_pv_hist] [int] NOT NULL,
	[loma_pv_hist_ei_muokattu] [int] NOT NULL,
	[opva_pv_hyv] [int] NOT NULL,
	[opva_pv_hyv_ei_muokattu] [int] NOT NULL,
	[opva_pv_nyk] [int] NOT NULL,
	[opva_pv_nyk_ei_muokattu] [int] NOT NULL,
	[opva_pv_hist] [int] NOT NULL
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma]
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_loma](
	[pvm] [date] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[tila] [varchar](50) NULL,
	[tila_alkanut] [date] NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[alku_ei_muokattu] [date] NULL,
	[loppu_ei_muokattu] [date] NULL,
	[opintojen_rahoitus] [varchar](50) NULL,
	[maksuton] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [bit] NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [int] NULL,
	[erityinen_tuki] [int] NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [int] NULL,
	[hojks] [int] NULL,
	[vaikeasti_vammainen] [int] NULL,
	[vammainen_ja_avustaja] [int] NULL,
	[osa_aikaisuus] [int] NULL,
	[vankilaopetuksessa] [int] NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [int] NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL,
	[aiempi_koulutusmuoto] [varchar](100) NULL,
	[aiempi_tuva_jarjestamislupa] [varchar](100) NULL,
	[valiaikainen_keskeytys] [int] NULL,
	[lasna_pv_hyv] [int] NOT NULL,
	[lasna_pv_hyv_ei_muokattu] [int] NOT NULL,
	[loma_pv_hyv] [numeric](28, 6) NULL,
	[loma_pv_hyv_ei_muokattu] [numeric](28, 6) NULL,
	[loma_pv_nyk] [numeric](28, 6) NULL,
	[loma_pv_nyk_ei_muokattu] [numeric](28, 6) NULL,
	[loma_pv_hist] [numeric](28, 6) NULL,
	[loma_pv_hist_ei_muokattu] [numeric](28, 6) NULL,
	[opva_pv_hyv] [int] NOT NULL,
	[opva_pv_hyv_ei_muokattu] [int] NOT NULL,
	[opva_pv_nyk] [int] NOT NULL,
	[opva_pv_nyk_ei_muokattu] [int] NOT NULL,
	[opva_pv_hist] [int] NOT NULL
) ON [PRIMARY]
GO


IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva](
	[pvm] [date] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[tila] [varchar](50) NULL,
	[tila_alkanut] [date] NULL,
	[alku] [date] NULL,
	[loppu] [date] NULL,
	[alku_ei_muokattu] [date] NULL,
	[loppu_ei_muokattu] [date] NULL,
	[opintojen_rahoitus] [int] NULL,
	[maksuton] [int] NULL,
	[oikeutta_maksuttomuuteen_pidennetty] [bit] NULL,
	[majoitus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[vaativan_erityisen_tuen_yhteydessa_jarjestettäva_majoitus] [int] NULL,
	[erityinen_tuki] [int] NULL,
	[vaativan_erityisen_tuen_erityinen_tehtava] [int] NULL,
	[hojks] [int] NULL,
	[vaikeasti_vammainen] [int] NULL,
	[vammainen_ja_avustaja] [int] NULL,
	[osa_aikaisuus] [int] NULL,
	[vankilaopetuksessa] [int] NULL,
	[oppisopimus_jossain_paatason_suorituksessa] [int] NULL,
	[opiskeluvalmiuksia_tukevat_opinnot] [int] NULL,
	[alkanut_samana_paivana_hylataan] [int] NULL,
	[sisaltyy_toiseen_opiskeluoikeuteen] [int] NULL,
	[aiempi_koulutusmuoto] [varchar](100) NULL,
	[aiempi_tuva_jarjestamislupa] [varchar](100) NULL,
	[valiaikainen_keskeytys] [int] NULL,
	[lasna_pv_hyv] [numeric](38, 6) NULL,
	[lasna_pv_hyv_ei_muokattu] [numeric](38, 6) NULL,
	[loma_pv_hyv] [int] NOT NULL,
	[loma_pv_hyv_ei_muokattu] [int] NOT NULL,
	[loma_pv_nyk] [int] NOT NULL,
	[loma_pv_nyk_ei_muokattu] [int] NOT NULL,
	[loma_pv_hist] [int] NOT NULL,
	[loma_pv_hist_ei_muokattu] [int] NOT NULL,
	[opva_pv_hyv] [numeric](38, 6) NULL,
	[opva_pv_hyv_ei_muokattu] [numeric](38, 6) NULL,
	[opva_nyk] [numeric](28, 6) NULL,
	[opva_nyk_ei_muokattu] [numeric](28, 6) NULL,
	[opva_hyv_hist] [decimal](38, 20) NULL
) ON [PRIMARY]
GO
