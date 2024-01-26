USE [Koski_SA]
GO

/****** Object:  Table [dbo].[esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara]    Script Date: 24.8.2023 23:50:39 ******/
DROP TABLE IF EXISTS [dbo].[esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara]
GO

/****** Object:  Table [dbo].[esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara]    Script Date: 24.8.2023 23:50:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[esi_ja_perus_yksilollistaminen_perusjoukko_ja_aidinkielen_oppimaara](
	[tilastovuosi] [int] NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[vuosiluokka] [varchar](50) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppija_oid] [varchar](50) NULL,
	[aidinkieli] [varchar](50) NULL,
	[sukupuoli] [varchar](50) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[ika] [int] NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[erityinen_tuki_johdettu] [varchar](9) NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[AI_oppimaara] [varchar](100) NULL,
	[AI_oppimaara_yksilollistetty] [int] NULL
) ON [PRIMARY]

GO


