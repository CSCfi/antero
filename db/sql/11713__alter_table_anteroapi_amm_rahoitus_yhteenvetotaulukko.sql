USE [AnteroAPI]
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [laskennallinen_rahoitus_ed_v] int NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL
GO

ALTER TABLE api.[amm_rahoitus_yhteenvetotaulukko]
ALTER COLUMN [tyopaikkakyselyn_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL
GO

