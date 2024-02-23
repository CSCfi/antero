USE [Koski_SA]
GO

/****** Object:  Table [dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]    Script Date: 21.2.2024 14:00:38 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]') AND type in (N'U'))
DROP TABLE [dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]
GO

/****** Object:  Table [dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]    Script Date: 21.2.2024 14:00:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu](
	[opisk] [int] NULL,
	[tutk] [int] NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[oo_alkamispaiva] [date] NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[vuosiluokka_tai_koulutus] [varchar](6) NULL,
	[suorituksen_tyyppi] [varchar](100) NULL,
	[suoritustapa] [varchar](100) NULL,
	[suorituskieli] [varchar](3) NULL,
	[muu_suorituskieli] [varchar](3) NULL,
	[kielikylpykieli] [varchar](3) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[vuosiluokkiin_sitoutumaton_opetus] [int] NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[erityinen_tuki_johdettu] [varchar](20) NULL,
	[joustava_perusopetus] [int] NULL,
	[koulukoti] [int] NULL,
	[kuljetusetu] [int] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[tehostettu_tuki] [int] NULL,
	[ulkomailla] [int] NULL,
	[opiskelee_toiminta_alueittain] [int] NULL,
	[oppija_oid] [varchar](100) NULL,
	[aidinkieli] [varchar](3) NULL,
	[kotikunta] [varchar](3) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[ika] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[tilastopaiva_1_0] [int] NULL,
	[aikuisten_alkuvaihe_1_0] [int] NULL,
	[oppivelvollinen] [int] NULL
) ON [PRIMARY]
GO

USE [ANTERO]