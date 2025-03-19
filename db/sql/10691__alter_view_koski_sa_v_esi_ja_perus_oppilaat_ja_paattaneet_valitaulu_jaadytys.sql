USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_esi_ja_perus_oppilaat_ja_paattaneet_valitaulu_jaadytys] AS

/*
Kokoaa tiedot jäädytyspalvelimella populoiduista välitauluista. Lisää ja päivitä ylimmäksi uusi vuosi. HUOM. Sisältää s24 alkaen kaksi poimintaa.
*/

--1/2: Tilastopäivä 20.9.
SELECT 
	[opisk]
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
	,ca2.oppilaitos_kotipaikka --HUOM. katsotaan suoraan välitaulusta s25 jäädytyksestä alkaen
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kuljetusetu]
	,majoitusetu = 0 --ei 20.9. havaintoja; HUOM. katsotaan suoraan välitaulusta s25 jäädytyksestä alkaen
	,jaa_luokalle = null
	,vahvistus_paiva = null
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_02102024].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] vt
OUTER APPLY (
	select oppilaitos_kotipaikka
	from [DWIVIPUARCH].[Koski_SA_02102024].[sa].[sa_koski_opiskeluoikeus]
	where [opiskeluoikeus_oid] = vt.[opiskeluoikeus_oid]
) ca2
WHERE opisk=1
AND [tilastopaiva_1_0]=1
AND vuosi=2024 --päivitä vvvv

UNION ALL

--2/2: Päättynyt lukuvuosi (luokalle jääneet)
SELECT 
	[opisk]
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
	,ca2.oppilaitos_kotipaikka --HUOM. katsotaan suoraan välitaulusta s25 jäädytyksestä alkaen
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,kuljetusetu = 0
	,majoitusetu = 0
	,jaa_luokalle = --HUOM. eb/ish luokalle jääneet katsotaan suoraan välitaulusta s25 jäädytyksestä alkaen
		case 
			when paatason_suoritus_id in (100363673, 100367935) then 1 
			else jaa_luokalle 
		end 
	,vahvistus_paiva
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0] = -1 --tarvittaessa kuution mittareita tai raportin piilosuodatusta varten
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_02102024].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] vt
OUTER APPLY (
	select oppilaitos_kotipaikka
	from [DWIVIPUARCH].[Koski_SA_02102024].[sa].[sa_koski_opiskeluoikeus]
	where [opiskeluoikeus_oid] = vt.[opiskeluoikeus_oid]
) ca2
WHERE opisk=1 
AND year(dateadd(month, 5, datefromparts(vuosi, kuukausi, 1))) = 2024 --päivitä vvvv

UNION ALL

--
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
	,ca2.oppilaitos_kotipaikka --ei välitaulussa jäädytyksen aikaan
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kuljetusetu]
	,majoitusetu = 0 --ei 20.9. havaintoja
	,jaa_luokalle = 0
	,vahvistus_paiva = null
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_02102023].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] vt
OUTER APPLY (
	select oppilaitos_kotipaikka
	from [DWIVIPUARCH].[Koski_SA_02102023].[sa].[sa_koski_opiskeluoikeus]
	where [opiskeluoikeus_oid] = vt.[opiskeluoikeus_oid]
) ca2
WHERE vuosi=2023 and [tilastopaiva_1_0]=1

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
	,ca2.oppilaitos_kotipaikka --ei välitaulussa jäädytyksen aikaan
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kuljetusetu]
	,majoitusetu = 0 --ei 20.9. havaintoja
	,jaa_luokalle = 0
	,vahvistus_paiva = null
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_03102022].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] vt
OUTER APPLY (
	select oppilaitos_kotipaikka
	from [DWIVIPUARCH].[Koski_SA_03102022].[sa].[sa_koski_opiskeluoikeus]
	where [opiskeluoikeus_oid] = vt.[opiskeluoikeus_oid]
) ca2
WHERE vuosi=2022 and [tilastopaiva_1_0]=1

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
	,ca2.oppilaitos_kotipaikka --ei välitaulussa jäädytyksen aikaan
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kuljetusetu]
	,majoitusetu = coalesce(ca.majoitusetu, 0) --ei välitaulussa jäädytyksen aikaan
	,jaa_luokalle = 0
	,vahvistus_paiva = null
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0]
FROM [DWIVIPUARCH].[Koski_SA_31102021].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] vt
OUTER APPLY (
	select majoitusetu
	from [DWIVIPUARCH].[Koski_SA_31102021].[sa].[sa_koski_opiskeluoikeus_aikajakso] 
	where majoitusetu = 1
	and opiskeluoikeus_oid = vt.opiskeluoikeus_oid
	and vt.[tilastopaiva_1_0] = 1
	and datefromparts(vt.vuosi, 9, 20) between alku and loppu
) ca
OUTER APPLY (
	select oppilaitos_kotipaikka
	from [DWIVIPUARCH].[Koski_SA_31102021].[sa].[sa_koski_opiskeluoikeus]
	where [opiskeluoikeus_oid] = vt.[opiskeluoikeus_oid]
) ca2
WHERE vuosi=2021 and [tilastopaiva_1_0]=1

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
	,ca2.oppilaitos_kotipaikka --ei välitaulussa jäädytyksen aikaan
    ,[koulutustoimija_oid]
    ,[opiskeluoikeus_oid]
    ,[koulutusmuoto]
    ,[vuosiluokkiin_sitoutumaton_opetus]
    ,[erityisen_tuen_paatos]
    ,[erityinen_tuki_johdettu]
    ,[joustava_perusopetus]
    ,[koulukoti]
    ,[kuljetusetu]
	,majoitusetu = coalesce(ca.majoitusetu, 0) --purettu jäädytyksen jälkeen
	,jaa_luokalle = 0
	,vahvistus_paiva = null
    ,[pidennetty_oppivelvollisuus]
    ,[sisaoppilaitosmainen_majoitus]
    ,[ulkomailla]
    ,[oppija_oid]
    ,[aidinkieli]
    ,[kansalaisuus]
    ,[ika]
    ,[sukupuoli]
    ,[tilastopaiva_1_0]
    ,[aikuisten_alkuvaihe_1_0] 
FROM [DWIVIPUARCH].[Koski_SA_01112020].[dbo].[esi_ja_perus_oppilaat_ja_paattaneet_valitaulu] vt
OUTER APPLY (
	select majoitusetu = 1
	from [DWIVIPUARCH].[Koski_SA_01112020].[sa].[sa_koski_opiskeluoikeus_majoitusetuusjaksot_json]
	where opiskeluoikeus_oid = vt.opiskeluoikeus_oid
	and vt.[tilastopaiva_1_0] = 1
	and datefromparts(vt.vuosi, 9, 20) between alku and loppu
) ca
OUTER APPLY (
	select oppilaitos_kotipaikka
	from [DWIVIPUARCH].[Koski_SA_01112020].[sa].[sa_koski_opiskeluoikeus]
	where [opiskeluoikeus_oid] = vt.[opiskeluoikeus_oid]
) ca2

WHERE vuosi=2020 and [tilastopaiva_1_0]=1

GO
