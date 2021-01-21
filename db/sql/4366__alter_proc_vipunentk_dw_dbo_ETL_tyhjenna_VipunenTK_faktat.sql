USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[ETL_tyhjenna_VipunenTK_faktat]    Script Date: 12.1.2021 12:51:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[ETL_tyhjenna_VipunenTK_faktat] AS

--truncate table  [VipunenTK].[dbo].f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta ?
truncate table  [VipunenTK].[dbo].f_ainevalinnat_lukiossa
truncate table  [VipunenTK].[dbo].f_ainevalinnat_perusopetuksessa
truncate table  [VipunenTK].[dbo].f_aloittaneiden_lapaisy
truncate table  [VipunenTK].[dbo].f_alueella_tyossakayvat
truncate table  [VipunenTK].[dbo].f_alueella_tyossakayvat_1v
truncate table  [VipunenTK].[dbo].f_alueella_tyossakayvat_toimialoittain
truncate table  [VipunenTK].[dbo].f_AVL_ainevalinnat
truncate table  [VipunenTK].[dbo].f_AVL_kieltenmaarat
truncate table  [VipunenTK].[dbo].f_elakkeelle_siirtyneet_ja_kuolleet
truncate table  [VipunenTK].[dbo].f_koulutukseen_sijoittuneet_2v
truncate table  [VipunenTK].[dbo].f_koulutukseen_sijoittuneet_6v
truncate table  [VipunenTK].[dbo].f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk
truncate table  [VipunenTK].[dbo].f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat
truncate table  [VipunenTK].[dbo].f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot
truncate table  [VipunenTK].[dbo].f_OTV_2_8_Korkeakouluopiskelijat
truncate table  [VipunenTK].[dbo].f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat;
truncate table  [VipunenTK].[dbo].f_OTV_2_9_Korkeakoulututkinnot
truncate table  [VipunenTK].[dbo].f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat
truncate table  [VipunenTK].[dbo].f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat
truncate table  [VipunenTK].[dbo].f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat
truncate table  [VipunenTK].[dbo].f_OTV_4_9_Vaestorakenne_kunnittain
truncate table  [VipunenTK].[dbo].f_perusopetuksen_kieltenmaara
truncate table  [VipunenTK].[dbo].f_perusopetuksen_oppilasmaarat
truncate table  [VipunenTK].[dbo].f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk
truncate table  [VipunenTK].[dbo].f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta
truncate table  [VipunenTK].[dbo].f_TJK_2_11_tutkintoon_johtamaton_koulutus
truncate table  [VipunenTK].[dbo].f_tyossakayvat_ammateittain
truncate table  [VipunenTK].[dbo].f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta

truncate table [VipunenTK].[dbo].f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan

Truncate table [VipunenTK].[dbo].[f_Moninkertainen_haku_hakijat]
Truncate table [VipunenTK].[dbo].[f_Moninkertainen_haku_uudet_haut]
Truncate table [VipunenTK].[dbo].[f_Moninkertainen_haku_edelliset_haut]
Truncate table [VipunenTK].[dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot]
Truncate table [VipunenTK].[dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut]

truncate table [VipunenTK].[dbo].f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit

truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_oppimaara
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_jopo_oppilaat
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_kuljetusetuutta_saavien_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_majoitusetuutta_saavien_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_peruskoulun_aloittaneiden_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_peruskoulun_ilman_todistusta_paattaneiden_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_tukea_saavien_oppilaiden_lkm
truncate table [VipunenTK].dbo.f_Perusasteen_erityisopetus_vieraskielisten_tehostetun_tuen_oppilaiden_lkm

truncate table [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet]
truncate table [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_menot]
truncate table [VipunenTK].[dbo].[f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]
truncate table [VipunenTK].[dbo].[f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]
truncate table [VipunenTK].[dbo].[f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]
truncate table [VipunenTK].[dbo].[f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]
truncate table [VipunenTK].[dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]

truncate table [VipunenTK].[dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]

truncate table [VipunenTK].[dbo].[f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]

truncate table [VipunenTK].[dbo].[f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot]
truncate table [VipunenTK].[dbo].[f_Opettajat_perusopetus_koulutuksen_jarjestaja_opetusryhmakoot]
truncate table [VipunenTK].[dbo].[f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen]
truncate table [VipunenTK].[dbo].[f_Opettajat_lukiokoulutus_kelpoisuus_aine]
truncate table [VipunenTK].[dbo].[f_Opettajat_lukiokoulutus_koulutuksen_jarjestaja]
truncate table [VipunenTK].[dbo].[f_Opettajat_lukiokoulutus_osallistuminen_taydennyskoulutukseen]
truncate table [VipunenTK].[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus]
truncate table [VipunenTK].[dbo].[f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen]
truncate table [VipunenTK].[dbo].[f_Opettajat_vapaa_sivistystyo_osallistuminen_taydennyskoulutukseen]
truncate table [VipunenTK].[dbo].[f_Opettajat_vapaa_sivistystyo_kelpoisuus_aine]
truncate table [VipunenTK].[dbo].[f_Opettajat_taiteen_perusopetus_kelpoisuus_aine]
truncate table [VipunenTK].[dbo].[f_Opettajat_taiteen_perusopetus_osallistuminen_taydennyskoulutukseen]
truncate table [VipunenTK].[dbo].[f_Opettajat_perus_ja_lukioaste_kelpoisuus_kokonaisaineisto]
truncate table [VipunenTK].[dbo].[f_Opettajat_ammatillinen_koulutus_kelpoisuus_kokonaisaineisto]

truncate table [VipunenTK].[dbo].[f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]
truncate table [VipunenTK].[dbo].[f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]


truncate table [VipunenTK].[dbo].[f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15]

truncate table [VipunenTK].[dbo].[f_keskeyttaneet]

truncate table [VipunenTK].[dbo].f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk

truncate table [VipunenTK].[dbo].[f_Lukion_ja_ammatillisen_peruskoulutuksen_opiskelijat_tutkinnot]

truncate table [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
truncate table [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
truncate table [VipunenTK].[dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]
truncate table [VipunenTK].[dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto]
truncate table [VipunenTK].[dbo].[f_3_2_Oppisopimus_jatko_opinnot]

truncate table [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7]
truncate table [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]

truncate table [VipunenTK].[dbo].[f_4_1_Perusopetuksen_lisaopetuksen_paattaneiden_sijoittuminen]
truncate table [VipunenTK].[dbo].[f_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
truncate table [VipunenTK].[dbo].[f_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]

truncate table [VipunenTK].[dbo].[f_4_5_Tyovoimatutkimus_tyolliset]
truncate table [VipunenTK].[dbo].[f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]

GO

USE [ANTERO]