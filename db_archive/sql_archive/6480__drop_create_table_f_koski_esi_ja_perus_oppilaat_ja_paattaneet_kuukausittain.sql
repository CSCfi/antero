USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain]    Script Date: 23.9.2022 18:01:06 ******/
DROP TABLE [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain]
GO

/****** Object:  Table [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain]    Script Date: 23.9.2022 18:01:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_kuukausittain](
	[opisk] [int] NULL,
	[tutk] [int] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[oppija_oid] [varchar](100) NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oo_alkamisajankohta] [varchar](33) NULL,
	[oo_alkanut_kuussa_1_0] [int] NULL,
	[aidinkieli] [varchar](3) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[ika] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[suorituksen_tyyppi] [varchar](100) NULL,
	[suoritustapa] [varchar](100) NULL,
	[suorituskieli] [varchar](3) NULL,
	[muu_suorituskieli] [varchar](3) NULL,
	[kielikylpykieli] [varchar](3) NULL,
	[erityinen_tuki_johdettu] [varchar](20) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[vuosiluokkiin_sitoutumaton_opetus] [int] NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[joustava_perusopetus] [int] NULL,
	[koulukoti] [int] NULL,
	[kotiopetus] [int] NULL,
	[kuljetusetu] [int] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[tehostettu_tuki] [int] NULL,
	[ulkomailla] [int] NULL,
	[aikuisten_alkuvaihe_1_0] [int] NULL,
	[tilastopaiva_1_0] [int] NULL,
	[kuluva_lv_1_0] [int] NOT NULL,
	[kuutioon_1_0] [int] NOT NULL,
	[d_kalenteri_id] [bigint] NULL,
	[d_kalenteri_oo_id] [bigint] NULL,
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
	[d_organisaatioluokitus_jarj_id] [bigint] NULL
) ON [PRIMARY]

GO

