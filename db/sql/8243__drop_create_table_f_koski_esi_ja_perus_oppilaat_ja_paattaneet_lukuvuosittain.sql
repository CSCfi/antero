USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain]    Script Date: 27.10.2023 18:22:33 ******/
DROP TABLE IF EXISTS [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain]
GO

/****** Object:  Table [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain]    Script Date: 27.10.2023 18:22:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain](
	[opisk] [int] NULL,
	[tutk] [int] NULL,
	[oppija_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[suoritustapa] [varchar](100) NULL,
	[vuosi] [int] NULL,
	[lukuvuosi] [nvarchar](20) NULL,
	[d_kausi_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kieli_muu_suorituskieli_id] [bigint] NULL,
	[d_kieli_kielikylpykieli_id] [bigint] NULL,
	[d_erityinen_tuki_johdettu_id] [int] NULL,
	[d_vuosiluokka_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL,
	[vuosiluokkiin_sitoutumaton_opetus] [int] NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[joustava_perusopetus] [int] NULL,
	[koulukoti] [int] NULL,
	--[kotiopetus] [int] NULL,
	[kuljetusetu] [int] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[tehostettu_tuki] [int] NULL,
	[ulkomailla] [int] NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[aikuisten_alkuvaihe_1_0] [int] NULL,
	[tilastopaiva_1_0] [int] NULL,
	[kuluva_lv_1_0] [int] NULL,
	[kuutioon_1_0] [int] NULL
) ON [PRIMARY]

GO
