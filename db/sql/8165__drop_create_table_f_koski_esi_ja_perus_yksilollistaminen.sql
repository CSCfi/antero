USE [ANTERO]
GO

/****** Object:  Table [dw].[f_koski_esi_ja_perus_yksilollistaminen]    Script Date: 24.8.2023 23:32:57 ******/
DROP TABLE IF EXISTS [dw].[f_koski_esi_ja_perus_yksilollistaminen]
GO

/****** Object:  Table [dw].[f_koski_esi_ja_perus_yksilollistaminen]    Script Date: 24.8.2023 23:32:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dw].[f_koski_esi_ja_perus_yksilollistaminen](
	[tilastovuosi] [int] NOT NULL,
	[opiskeluoikeus_oid] [varchar](100) NOT NULL,
	[paatason_suoritus_id] [varchar](100) NOT NULL,
	[oppija_oid] [varchar](50) NOT NULL,
	[oppiaineita_yksilollistetty_lkm] [int] NULL,
	[ei_oppiainesuorituksia] [int] NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[d_sukupuoli_id] [int] NULL,
	[d_ika_id] [bigint] NULL,
	[d_kieli_id] [bigint] NULL,
	[d_maatjavaltiot2_id] [int] NULL,
	[d_erityinen_tuki_johdettu_id] [int] NULL,
	[d_kytkin_id_erityisen_tuen_paatos] [int] NULL,
	[d_kytkin_id_pidennetty_oppivelvollisuus] [int] NULL,
	[d_kytkin_id_opiskelee_toiminta_alueittain] [int] NULL,
	[d_vuosiluokka_tai_koulutus_id] [int] NULL,
	[d_perusopetus_oppiaine_ja_oppimaara_id_AI_oppimaara] [int] NULL,
	[d_kytkin_id_AI_oppimaara_yksilollistetty] [int] NULL,
	[d_kytkin_id_AI_yksilollistetty] [int] NULL,
	[d_kytkin_id_MA_yksilollistetty] [int] NULL,
	[d_perusopetuksen_oppimaaran_yksilollistaminen_id] [int] NULL,
	[d_organisaatioluokitus_id_oppilaitos] [bigint] NULL
) ON [PRIMARY]

GO
