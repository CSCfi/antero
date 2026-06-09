USE [VipunenTK_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TK_Koski_esi_ja_perusopetus_oppilaat]') AND type in (N'U'))
CREATE TABLE [dbo].[TK_Koski_esi_ja_perusopetus_oppilaat](
	[opisk] [int] NULL,
	[tutk] [int] NULL,
	[vuosi] [int] NULL,
	[kuukausi] [int] NULL,
	[vuosiluokka_tai_koulutus] [varchar](6) NULL,
	[suorituksen_tyyppi] [varchar](100) NULL,
	[suoritustapa] [varchar](100) NULL,
	[suorituskieli] [varchar](3) NULL,
	[muu_suorituskieli] [varchar](3) NULL,
	[kielikylpykieli] [varchar](3) NULL,
	[toimipiste_oid] [varchar](100) NULL,
	[oppilaitos_oid] [varchar](100) NULL,
	[oppilaitos_kotipaikka] [varchar](3) NULL,
	[koulutustoimija_oid] [varchar](100) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[koulutusmuoto] [varchar](100) NULL,
	[vuosiluokkiin_sitoutumaton_opetus] [int] NULL,
	[erityisen_tuen_paatos] [int] NULL,
	[erityinen_tuki_johdettu] [varchar](20) NULL,
	[joustava_perusopetus] [int] NULL,
	[koulukoti] [int] NULL,
	[kuljetusetu] [int] NULL,
	[majoitusetu] [int] NULL,
	[jaa_luokalle] [int] NULL,
	[vahvistus_paiva] [date] NULL,
	[pidennetty_oppivelvollisuus] [int] NULL,
	[sisaoppilaitosmainen_majoitus] [int] NULL,
	[ulkomailla] [int] NULL,
	[master_oid] [varchar](100) NULL,
	[aidinkieli] [varchar](3) NULL,
	[kansalaisuus] [varchar](3) NULL,
	[ika] [int] NULL,
	[sukupuoli] [varchar](1) NULL,
	[tilastopaiva_1_0] [int] NULL,
	[aikuisten_alkuvaihe_1_0] [int] NULL
) ON [PRIMARY]
GO
