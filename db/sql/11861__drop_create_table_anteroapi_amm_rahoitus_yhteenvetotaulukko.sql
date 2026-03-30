USE [AnteroAPI]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[api].[amm_rahoitus_yhteenvetotaulukko]') AND type in (N'U'))
DROP TABLE [api].[amm_rahoitus_yhteenvetotaulukko]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_rahoitus_yhteenvetotaulukko](
	[defaultorder] [bigint] NOT NULL,
	[varainhoitovuosi] [int] NOT NULL,
	[toteuma_estimaatti] [varchar](20) NOT NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](10) NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NOT NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka] [decimal](20, 10) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka] [decimal](20, 10) NULL,
	[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka] [decimal](20, 10) NULL,
	[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka] [decimal](20, 10) NULL,
	[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm] [decimal](20, 10) NULL,
	[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm] [decimal](20, 10) NULL,
	[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm] [decimal](20, 10) NULL,
	[tyopaikkakyselyn_pisteet_lkm] [decimal](20, 10) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka_osuus] [decimal](30, 29) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka_osuus] [decimal](30, 29) NULL,
	[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka_osuus] [decimal](30, 29) NULL,
	[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka_osuus] [decimal](30, 29) NULL,
	[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm_osuus] [decimal](30, 29) NULL,
	[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm_osuus] [decimal](30, 29) NULL,
	[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm_osuus] [decimal](30, 29) NULL,
	[tyopaikkakyselyn_pisteet_lkm_osuus] [decimal](30, 29) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_ka_osuus_paino] [numeric](4, 4) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_ka_osuus_paino] [numeric](4, 4) NULL,
	[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_ka_osuus_paino] [numeric](4, 4) NULL,
	[koulutuksen_suorittaneet_tyollistyneet_ja_jatkoopiskelijat_ei_tyollinen_ennen_koulutusta_ka_osuus_paino] [numeric](4, 4) NULL,
	[opiskelunsa_aloittaneiden_palautteen_painotetut_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL,
	[opiskelunsa_paattaneiden_palautteen_painotetut_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL,
	[tyopaikkaohjaajakyselyn_painotetut_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL,
	[tyopaikkakyselyn_pisteet_lkm_osuus_paino] [numeric](4, 4) NULL,
	[laskennallinen_rahoitus_osuus_ilman_rajoitteita] [decimal](30, 29) NOT NULL,
	[laskennallinen_rahoitus_ed_v] [int] NULL,
	[laskennallinen_rahoitus_osuus_ed_v] [decimal](30, 29) NULL,
	[laskennallinen_rahoitus_muutos_ed_v_osuuteen_ilman_rajoitteita] [decimal](30, 20) NULL,
	[laskennallinen_rahoitus_muutos_minimikerroin] [decimal](15, 14) NULL,
	[laskennallinen_rahoitus_muutos_maksimikerroin] [decimal](15, 14) NULL,
	[laskennallinen_rahoitus_rajoitekerroin] [decimal](30, 27) NULL,
	[laskennallinen_rahoitus_muutos_ed_v_osuuteen] [decimal](30, 20) NULL,
	[laskennallinen_rahoitus_osuus] [decimal](30, 29) NOT NULL,
	[tietojoukko_paivitetty_pvm] [date] NULL,
 CONSTRAINT [PK__amm_rahoitus_yhteenvetotaulukko] PRIMARY KEY CLUSTERED 
(
	[defaultorder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
