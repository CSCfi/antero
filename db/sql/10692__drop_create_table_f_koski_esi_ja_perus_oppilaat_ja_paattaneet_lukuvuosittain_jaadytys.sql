USE [ANTERO]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain_jaadytys]') AND type in (N'U'))
DROP TABLE [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain_jaadytys]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_esi_ja_perus_oppilaat_ja_paattaneet_lukuvuosittain_jaadytys](
	[opisk] [int] NULL,
	[tutk] [int] NULL,
	[oppija_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitos_kotipaikka] [varchar](3) NULL,
	[vuosi] [int] NULL,
	[lukuvuosi] [nvarchar](20) NULL,
	[tilastopaiva_1_0] [int] NULL,
	[vuosiluokkiin_sitoutumaton_opetus] [int] NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[joustava_perusopetus] [int] NULL,
	[koulukoti] [int] NULL,
	[kuljetusetu] [int] NULL,
	[majoitusetu] [int] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[ulkomailla] [int] NULL,
	[jaa_luokalle] [int] NULL,
	[aikuisten_alkuvaihe_1_0] [int] NULL,
	[kuluva_lv_1_0] [int] NULL,
	[kuutioon_1_0] [int] NOT NULL,
	[suoritustapa] [varchar](100) NULL,
	[d_kausi_id] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_kieli_aidinkieli_id] [bigint] NULL,
	[d_ika_id] [bigint] NULL,
	[d_maatjavaltiot2_kansalaisuus_id] [int] NULL,
	[d_kieli_suorituskieli_id] [bigint] NULL,
	[d_kieli_muu_suorituskieli_id] [bigint] NULL,
	[d_kieli_kielikylpykieli_id] [bigint] NULL,
	[d_vuosiluokka_id] [int] NULL,
	[d_organisaatioluokitus_toimipiste_id] [bigint] NULL,
	[d_organisaatioluokitus_oppilaitos_id] [bigint] NULL,
	[d_organisaatioluokitus_jarj_id] [bigint] NULL
) ON [PRIMARY]
GO
