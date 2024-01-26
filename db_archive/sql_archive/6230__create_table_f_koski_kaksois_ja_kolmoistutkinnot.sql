USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_kaksois_ja_kolmoistutkinnot]    Script Date: 24.5.2022 14:27:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[f_koski_kaksois_ja_kolmoistutkinnot]') AND type in (N'U'))

BEGIN

CREATE TABLE [dw].[f_koski_kaksois_ja_kolmoistutkinnot](
	[d_kalenteri_id] [int] NULL,
	[d_kalenteri_amm_id] [int] NULL,
	[d_kalenteri_lukio_id] [int] NULL,
	[d_kalenteri_yo_id] [int] NULL,
	[oppija_oid] [varchar](150) NULL,
	[oppija_oid_tiedossa] [int] NOT NULL,
	[hetu_tiedossa] [int] NOT NULL,
	[d_koulutusluokitus_amm_id] [int] NULL,
	[d_ika_id] [int] NULL,
	[d_kansalaisuus_id] [int] NULL,
	[d_aidinkieli_id] [bigint] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_organisaatioluokitus_amm_id] [bigint] NULL,
	[d_organisaatioluokitus_lukio_id] [bigint] NULL,
	[d_organisaatioluokitus_yo_id] [bigint] NULL,
	[d_organisaatioluokitus_koulutustoimija_amm_id] [bigint] NULL,
	[d_organisaatioluokitus_koulutustoimija_lukio_id] [bigint] NULL,
	[d_organisaatioluokitus_koulutustoimija_yo_id] [bigint] NULL,
	[suoritetut_kurssit_lukio] [int] NULL,
	[d_opintojenlaajuusyksikko_id] [int] NULL,
	[kaksoistutkinto_sama_lk] [int] NOT NULL,
	[kaksoistutkinto_1_lk] [int] NOT NULL,
	[kaksoistutkinto_2_lk] [int] NOT NULL,
	[kaksoistutkinto_3_lk] [int] NOT NULL,
	[kolmoistutkinto_sama_lk] [int] NOT NULL,
	[kolmoistutkinto_1_lk] [int] NOT NULL,
	[kolmoistutkinto_2_lk] [int] NOT NULL,
	[kolmoistutkinto_3_lk] [int] NOT NULL,
	[amm_yo_ero] [float] NULL,
	[amm_lukio_ero] [float] NULL,
	[lukio_yo_ero] [float] NULL,
	[suorittanut_ammatillisen_perustutkinnon] [int] NULL,
	[suorittanut_lukion_oppimaaran] [int] NULL,
	[suorittanut_ylioppilastutkinnon] [int] NULL,
	[yo_aine_koodi] [varchar](5) NULL
) ON [PRIMARY]

END 

GO

USE [ANTERO]
