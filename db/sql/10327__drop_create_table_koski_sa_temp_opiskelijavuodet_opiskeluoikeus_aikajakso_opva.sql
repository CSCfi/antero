USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 29.10.2024 14:02:44 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]
GO

/****** Object:  Table [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_opva]    Script Date: 29.10.2024 14:02:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
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


