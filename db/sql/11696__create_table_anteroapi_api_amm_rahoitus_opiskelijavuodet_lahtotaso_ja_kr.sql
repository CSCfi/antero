USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amm_rahoitus_opiskelijavuodet_lahtotaso_ja_kr](
	[defaultorder] [bigint] NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[hankintakoulutuksen_jarjestaja] [nvarchar](500) NULL,
	[oppilaitos] [nvarchar](500) NULL,
	[toimipiste] [nvarchar](500) NULL,
	[varainhoitovuosi] [int] NULL,
	[rahoituskausi] [nvarchar](24) NULL,
	[tilastokausi] [nvarchar](24) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskuukausi] [int] NULL,
	[ika_maksuttomuusraja] [varchar](11) NOT NULL,
	[ikaryhma] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](100) NULL,
	[aidinkieli_ryhma] [nvarchar](100) NULL,
	[toisen_asteen_pohjakoulutus_2018] [varchar](255) NULL,
	[suoritettu_tutkinto_maksuttomuus_2018] [varchar](255) NULL,
	[perusopetuksen_suoritusvuosi] [int] NULL,
	[perusopetuksen_keskiarvoluokka] [varchar](20) NULL,
	[perusopetuksen_yksilollistaminen] [varchar](13) NOT NULL,
	[suorituksen_tyyppi] [varchar](255) NULL,
	[suorituskieli] [nvarchar](100) NULL,
	[tutkintotyyppi_rahoitus] [varchar](41) NULL,
	[tutkinto] [nvarchar](200) NULL,
	[osaamisala] [nvarchar](200) NULL,
	[kustannusryhma] [nvarchar](117) NULL,
	[rahoitusmuoto] [nvarchar](100) NULL,
	[majoitus] [varchar](100) NULL,
	[vaativa_erityinen_tuki] [varchar](27) NOT NULL,
	[luvaton_koulutus] [varchar](255) NULL,
	[luvaton_majoitus] [varchar](255) NULL,
	[luvaton_korotustekija] [varchar](255) NULL,
	[luvanmukainen_suorituskieli] [varchar](33) NOT NULL,
	[hyvaksytyt_hylatyt_opiskelijavuodet] [nvarchar](100) NULL,
	[huomioidaan_rahoituksessa_kylla_ei] [bit] NULL,
	[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei] [bit] NULL,
	[maksuttomuus_rahoitus_kylla_ei] [bit] NULL,
	[maksuttomuus_koski_kylla_ei] [bit] NULL,
	[osa_aikaisuus_kylla_ei] [bit] NULL,
	[oppisopimuskoulutus_kylla_ei] [bit] NULL,
	[tyovoimakoulutus_kylla_ei] [bit] NULL,
	[vankilaopetus_kylla_ei] [bit] NULL,
	[hankintakoulutus_kylla_ei] [bit] NULL,
	[toiminnanohjauksen_kokeilu_kylla_ei] [bit] NULL,
	[koodit_koulutuksen_jarjestajan_pilke_alue_kokeilu] [nvarchar](1) NULL,
	[koodit_koulutuksen_jarjestaja] [varchar](20) NULL,
	[koodit_hankintakoulutuksen_jarjestaja] [varchar](20) NULL,
	[koodit_oppilaitos] [varchar](20) NULL,
	[koodit_toimipiste_oid] [varchar](200) NULL,
	[koodit_tutkinto] [varchar](6) NULL,
	[koodit_osaamisala] [nvarchar](5) NULL,
	[opiskelijavuodet_painottamaton_lkm] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_lahtotaso_lkm] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_kustannusryhma_lkm] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_erityistuki_lkm] [decimal](30, 20) NULL,
	[opiskelijavuodet_painotettu_majoitus_lkm] [decimal](30, 20) NULL,
	[enimmaismaaran_mukaiset_opiskelijavuodet_painottamaton_lkm] [decimal](38, 17) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_lkm] [decimal](38, 17) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_lkm] [decimal](38, 17) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_erityistuki_lkm] [decimal](38, 17) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_korotus_majoitus_lkm] [decimal](38, 17) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_lkm] [decimal](38, 15) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_lahtotaso_osuus] [decimal](30, 29) NULL,
	[rahoituksen_perusteena_olevat_opiskelijavuodet_painotettu_kustannusryhma_tutkintotyyppi_korotukset_osuus] [decimal](30, 29) NULL
) ON [PRIMARY]
GO
