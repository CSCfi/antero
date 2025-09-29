USE [Koski_SA]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut]') AND type in (N'U'))
DROP TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_opiskelijavuodet_opiskeluoikeus_aikajakso_lasna_loma_valmistunut](
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
	[lasna_loma_valmistunut_pv_hyv] [numeric](28, 6) NULL,
	[lasna_loma_valmistunut_pv_hyv_ei_muokattu] [numeric](28, 6) NULL
) ON [PRIMARY]
GO
