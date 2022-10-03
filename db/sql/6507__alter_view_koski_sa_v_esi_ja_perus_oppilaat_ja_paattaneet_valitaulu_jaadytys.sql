USE [Koski_SA]
GO

/****** Object:  View [dbo].[v_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu_jaadytys]    Script Date: 3.10.2022 18:04:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu_jaadytys] AS

--lisää ylimmäksi uusi vuosi

SELECT [opisk]
    ,[tutk]
    ,[vuosi]
    ,[kuukausi]
    ,[vuosiluokka_tai_koulutus]
    ,[suorituksen_tyyppi]
    ,[suoritustapa]
    ,[suorituskieli]
    ,[muu_suorituskieli]
    ,[kielikylpykieli]
    ,[toimipiste_oid]
    ,[oppilaitos_oid]
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kotiopetus]
    ,[kuljetusetu]
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[tehostettu_tuki]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_03102022].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]

UNION ALL

SELECT [opisk]
    ,[tutk]
    ,[vuosi]
    ,[kuukausi]
    ,[vuosiluokka_tai_koulutus]
    ,[suorituksen_tyyppi]
    ,[suoritustapa]
    ,[suorituskieli]
    ,[muu_suorituskieli]
    ,[kielikylpykieli]
    ,[toimipiste_oid]
    ,[oppilaitos_oid]
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kotiopetus]
    ,[kuljetusetu]
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[tehostettu_tuki]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_31102021].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]

UNION ALL

SELECT [opisk]
    ,[tutk]
    ,[vuosi]
    ,[kuukausi]
    ,[vuosiluokka_tai_koulutus]
    ,[suorituksen_tyyppi]
    ,[suoritustapa]
    ,[suorituskieli]
    ,[muu_suorituskieli]
    ,[kielikylpykieli]
    ,[toimipiste_oid]
    ,[oppilaitos_oid]
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kotiopetus]
    ,[kuljetusetu]
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[tehostettu_tuki]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_01112020].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu]


GO


