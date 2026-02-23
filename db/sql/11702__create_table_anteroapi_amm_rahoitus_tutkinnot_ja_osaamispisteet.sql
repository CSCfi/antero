USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [api].[amm_rahoitus_tutkinnot_ja_osaamispisteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [api].[amm_rahoitus_tutkinnot_ja_osaamispisteet](
	[defaultorder] [bigint] NOT NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NOT NULL,
	[hankintakoulutuksen_jarjestaja] [nvarchar](255) NULL,
	[oppilaitos] [nvarchar](255) NULL,
	[toimipiste] [nvarchar](255) NULL,
	[varainhoitovuosi] [int] NOT NULL,
	[rahoituskausi] [varchar](24) NULL,
	[tilastokausi] [varchar](24) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskuukausi] [int] NULL,
	[ika_maksuttomuusraja] [varchar](100) NULL,
	[ikaryhma] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](100) NULL,
	[aidinkieli_ryhma] [nvarchar](100) NULL,
	[suorituksen_tyyppi] [varchar](100) NULL,
	[tutkinto] [nvarchar](100) NULL,
	[osaamisala] [nvarchar](100) NULL,
	[suorituskieli] [nvarchar](100) NULL,
	[rahoitusmuoto] [nvarchar](100) NULL,
	[luvaton_koulutus] [varchar](100) NULL,
	[luvanmukainen_suorituskieli] [varchar](100) NULL,
	[huomioidaan_rahoituksessa_kylla_ei] [bit] NULL,
	[jarjestajarakenne_viimeisin_suoritepaatos_kylla_ei] [bit] NULL,
	[maksuttomuus_rahoitus_kylla_ei] [bit] NULL,
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
	[tutkinnot_painottamaton_lkm] [decimal](30, 20) NULL,
	[tutkinnot_painotettu_lkm] [decimal](30, 20) NULL,
	[tutkinnon_osien_osaamispisteet_lkm] [decimal](30, 20) NULL,
	[tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm] [decimal](38, 26) NULL,
	[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_lkm] [decimal](38, 26) NULL,
	[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus] [decimal](30, 29) NULL,
	[tietojoukko_paivitetty_pvm] [date] NOT NULL,
	CONSTRAINT [PK__amm_rahoitus_tutkinnot_ja_osaamispisteet] PRIMARY KEY CLUSTERED (
		[defaultorder] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) 
	ON [PRIMARY]
) ON [PRIMARY]
GO
