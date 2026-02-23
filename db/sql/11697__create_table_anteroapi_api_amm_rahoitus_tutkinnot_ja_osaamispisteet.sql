USE [AnteroAPI]
GO

DROP TABLE IF EXISTS [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[api_amm_rahoitus_tutkinnot_ja_osaamispisteet](
	[defaultorder] [bigint] NULL,
	[koulutuksen_jarjestaja] [nvarchar](255) NULL,
	[hankintakoulutuksen_jarjestaja] [nvarchar](500) NULL,
	[oppilaitos] [nvarchar](500) NULL,
	[toimipiste] [nvarchar](500) NULL,
	[varainhoitovuosi] [int] NULL,
	[rahoituskausi] [varchar](24) NULL,
	[tilastokausi] [varchar](24) NULL,
	[tilastovuosi] [int] NULL,
	[tilastokuukausi] [int] NULL,
	[koulutuksen_alkamisvuosi] [int] NULL,
	[koulutuksen_alkamiskuukausi] [int] NULL,
	[ika_maksuttomuusraja] [varchar](11) NOT NULL,
	[ikaryhma] [nvarchar](100) NULL,
	[sukupuoli] [nvarchar](100) NULL,
	[aidinkieli_ryhma] [nvarchar](100) NULL,
	[suorituksen_tyyppi] [varchar](255) NULL,
	[tutkinto] [nvarchar](200) NULL,
	[osaamisala] [nvarchar](200) NULL,
	[suorituskieli] [nvarchar](100) NULL,
	[rahoitusmuoto] [nvarchar](100) NULL,
	[luvaton_koulutus] [varchar](255) NULL,
	[luvanmukainen_suorituskieli] [varchar](36) NOT NULL,
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
	[tutkinnot_painotettu_ja_tutkinnon_osien_laskentaan_hyvaksytyt_osaamispisteet_osuus] [decimal](30, 29) NULL
) ON [PRIMARY]
GO
