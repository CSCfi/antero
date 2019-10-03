USE [ANTERO]
GO
/****** Object:  Table [dbo].[VipunenTK_laatu]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[VipunenTK_laatu]
GO
/****** Object:  Table [dbo].[tutkintolaji_tyollistymiseen]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[tutkintolaji_tyollistymiseen]
GO
/****** Object:  Table [dbo].[SSIS Configurations]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[SSIS Configurations]
GO
/****** Object:  Table [dbo].[Sarakeleveys]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[Sarakeleveys]
GO
/****** Object:  Table [dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit]
GO
/****** Object:  Table [dbo].[sa_R4_19_Tyollisten_ammattisiirtymat]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_R4_19_Tyollisten_ammattisiirtymat]
GO
/****** Object:  Table [dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
GO
/****** Object:  Table [dbo].[sa_K3_16_Moninkertainen_haku]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_K3_16_Moninkertainen_haku]
GO
/****** Object:  Table [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]
GO
/****** Object:  Table [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys]
GO
/****** Object:  Table [dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys]
GO
/****** Object:  Table [dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]
GO
/****** Object:  Table [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
GO
/****** Object:  Table [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
GO
/****** Object:  Table [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 7.7.2017 16:34:43 ******/
DROP TABLE IF EXISTS [dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
GO
/****** Object:  Table [dbo].[sa_4_9_Vaestorakenne_kunnittain]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_9_Vaestorakenne_kunnittain]
GO
/****** Object:  Table [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
GO
/****** Object:  Table [dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
GO
/****** Object:  Table [dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan]
GO
/****** Object:  Table [dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain]
GO
/****** Object:  Table [dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen]
GO
/****** Object:  Table [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]
GO
/****** Object:  Table [dbo].[sa_3_2_Oppisopimuskoulutus_talteen]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_2_Oppisopimuskoulutus_talteen]
GO
/****** Object:  Table [dbo].[sa_3_2_Oppisopimuskoulutus]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_2_Oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[sa_3_1b_Oppisopimuskoulutus]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_1b_Oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[sa_3_1a_Oppisopimuskoulutus]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_1a_Oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]
GO
/****** Object:  Table [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_3_14_Lukio_ja_amm_opisk_mediaani_iat]
GO
/****** Object:  Table [dbo].[sa_2_9_Korkeakoulut_tutkinnot]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_9_Korkeakoulut_tutkinnot]
GO
/****** Object:  Table [dbo].[sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_8_Korkeakoulut_opiskelijat]
GO
/****** Object:  Table [dbo].[sa_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_5_Lukiokoulutuksen_ainevalinnat]
GO
/****** Object:  Table [dbo].[sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]
GO
/****** Object:  Table [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_4_Amm_koulutuksen_tutkinnot]
GO
/****** Object:  Table [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]
GO
/****** Object:  Table [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 7.7.2017 16:34:44 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]
GO
/****** Object:  Table [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat]
GO
/****** Object:  Table [dbo].[sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]
GO
/****** Object:  Table [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]
GO
/****** Object:  Table [dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]
GO
/****** Object:  Table [dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]
GO
/****** Object:  Table [dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]
GO
/****** Object:  Table [dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton]
GO
/****** Object:  Table [dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
GO
/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]
GO
/****** Object:  Table [dbo].[f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7]
GO
/****** Object:  Table [dbo].[f_R4_19_R4_20_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_19_R4_20_Tyollisten_ammattisiirtymat_ja_aiemmat_ammatit]
GO
/****** Object:  Table [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
GO
/****** Object:  Table [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
GO
/****** Object:  Table [dbo].[f_R4_16_Tyossakayvat_ammateittain]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_16_Tyossakayvat_ammateittain]
GO
/****** Object:  Table [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
GO
/****** Object:  Table [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
GO
/****** Object:  Table [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
GO
/****** Object:  Table [dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_R2_22_Oppilaitostason_oppil_ja_opisk]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_uudet_haut]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_Moninkertainen_haku_uudet_haut]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_hakijat]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_Moninkertainen_haku_hakijat]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_edelliset_haut]    Script Date: 7.7.2017 16:34:45 ******/
DROP TABLE IF EXISTS [dbo].[f_Moninkertainen_haku_edelliset_haut]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_Moninkertainen_haku_edellisen_vuoden_opiskelut]
GO
/****** Object:  Table [dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_Moninkertainen_haku_aiemmat_tutkinnot]
GO
/****** Object:  Table [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot]
GO
/****** Object:  Table [dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat]
GO
/****** Object:  Table [dbo].[f_K3_16_Moninkertainen_haku]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_K3_16_Moninkertainen_haku]
GO
/****** Object:  Table [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk]
GO
/****** Object:  Table [dbo].[f_K_3_11_Keskeyttaneet]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_K_3_11_Keskeyttaneet]
GO
/****** Object:  Table [dbo].[f_aloittaneiden_lapaisy_TEST20160217_JN]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_aloittaneiden_lapaisy_TEST20160217_JN]
GO
/****** Object:  Table [dbo].[f_aloittaneiden_lapaisy_KAJAANI_JKL_TESTI]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_aloittaneiden_lapaisy_KAJAANI_JKL_TESTI]
GO
/****** Object:  Table [dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_Ainevalinnat_R2_22_Oppilaitostason_oppil_ja_opisk]
GO
/****** Object:  Table [dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_Ainevalinnat_2_5_Lukiokoulutuksen_ainevalinnat]
GO
/****** Object:  Table [dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_Ainevalinnat_2_1_Peruskoulutiedosto]
GO
/****** Object:  Table [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
GO
/****** Object:  Table [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
GO
/****** Object:  Table [dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
GO
/****** Object:  Table [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]
GO
/****** Object:  Table [dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
GO
/****** Object:  Table [dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
GO
/****** Object:  Table [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]
GO
/****** Object:  Table [dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
GO
/****** Object:  Table [dbo].[f_7_13_Vapaan_sivistystyön_opettajat_kelpoisuus_kouljarj]    Script Date: 7.7.2017 16:34:46 ******/
DROP TABLE IF EXISTS [dbo].[f_7_13_Vapaan_sivistystyön_opettajat_kelpoisuus_kouljarj]
GO
/****** Object:  Table [dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
GO
/****** Object:  Table [dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
GO
/****** Object:  Table [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_rahoitus]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_yosairaaloiden_tutkimus_ja_kehitys_rahoitus]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 7.7.2017 16:34:47 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]
GO
/****** Object:  Table [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus]
GO
/****** Object:  Table [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain]
GO
/****** Object:  Table [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain]
GO
/****** Object:  Table [dbo].[f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain]
GO
/****** Object:  Table [dbo].[f_4_9_Vaestorakenne_kunnittain]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_4_9_Vaestorakenne_kunnittain]
GO
/****** Object:  Table [dbo].[f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
GO
/****** Object:  Table [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
GO
/****** Object:  Table [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[f_4_21_Vaestoennuste]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_4_21_Vaestoennuste]
GO
/****** Object:  Table [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]    Script Date: 7.7.2017 16:34:48 ******/
DROP TABLE IF EXISTS [dbo].[f_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat]
GO
/****** Object:  Table [dbo].[f_3_2_Oppisopimus_jatko_opinnot]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_3_2_Oppisopimus_jatko_opinnot]
GO
/****** Object:  Table [dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_3_1b_Oppisopimus_koulutuksen_kesto]
GO
/****** Object:  Table [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_3_1a_Oppisopimus_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[f_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat]
GO
/****** Object:  Table [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat]
GO
/****** Object:  Table [dbo].[f_2_9_Korkeakoulututkinnot_joinavaimet]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_9_Korkeakoulututkinnot_joinavaimet]
GO
/****** Object:  Table [dbo].[f_2_9_Korkeakoulututkinnot]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_9_Korkeakoulututkinnot]
GO
/****** Object:  Table [dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_8_Korkeakouluopiskelijat_joinavaimet]
GO
/****** Object:  Table [dbo].[f_2_8_Korkeakouluopiskelijat]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_8_Korkeakouluopiskelijat]
GO
/****** Object:  Table [dbo].[f_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_5_Lukiokoulutuksen_ainevalinnat]
GO
/****** Object:  Table [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_4_Ammatillisen_koulutuksen_tutkinnot]
GO
/****** Object:  Table [dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
GO
/****** Object:  Table [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat]
GO
/****** Object:  Table [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]
GO
/****** Object:  Table [dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan]
GO
/****** Object:  Table [dbo].[f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan]
GO
/****** Object:  Table [dbo].[f_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan]
GO
/****** Object:  Table [dbo].[f_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan]
GO
/****** Object:  Table [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_11_Oppilaitosten_tutkintoon_johtamaton_unpivot]
GO
/****** Object:  Table [dbo].[f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]    Script Date: 7.7.2017 16:34:49 ******/
DROP TABLE IF EXISTS [dbo].[f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
GO
/****** Object:  Table [dbo].[f_2_1_Peruskoulutiedosto]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[f_2_1_Peruskoulutiedosto]
GO
/****** Object:  Table [dbo].[d_yrityksen_koko_tthv]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_yrityksen_koko_tthv]
GO
/****** Object:  Table [dbo].[d_yrittajan_oppisopimuskoulutus]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_yrittajan_oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[d_yosairaala]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_yosairaala]
GO
/****** Object:  Table [dbo].[d_yllapitajan_kieli]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_yllapitajan_kieli]
GO
/****** Object:  Table [dbo].[d_yliopisto]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_yliopisto]
GO
/****** Object:  Table [dbo].[d_virkaryhma]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_virkaryhma]
GO
/****** Object:  Table [dbo].[d_vieraskielisyys]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_vieraskielisyys]
GO
/****** Object:  Table [dbo].[d_vayla_nayttotutkintoon]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_vayla_nayttotutkintoon]
GO
/****** Object:  Table [dbo].[d_valtio]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_valtio]
GO
/****** Object:  Table [dbo].[d_valiaikainen_amk]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_valiaikainen_amk]
GO
/****** Object:  Table [dbo].[d_vahintaan_55_op_suorittanut]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_vahintaan_55_op_suorittanut]
GO
/****** Object:  Table [dbo].[d_vahintaan_45_op_suorittanut]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_vahintaan_45_op_suorittanut]
GO
/****** Object:  Table [dbo].[d_uusi_vanha_opiskelija]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_uusi_vanha_opiskelija]
GO
/****** Object:  Table [dbo].[d_tyovoimapoliittinen_koulutus]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_tyovoimapoliittinen_koulutus]
GO
/****** Object:  Table [dbo].[d_tyovoimapoliittinen]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_tyovoimapoliittinen]
GO
/****** Object:  Table [dbo].[d_tyossakayntitilaston_tyonantajasektori]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_tyossakayntitilaston_tyonantajasektori]
GO
/****** Object:  Table [dbo].[d_tyopaikan_sijainti_v_tilastovuonna]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_tyopaikan_sijainti_v_tilastovuonna]
GO
/****** Object:  Table [dbo].[d_tyonantajasektori2]    Script Date: 7.7.2017 16:34:50 ******/
DROP TABLE IF EXISTS [dbo].[d_tyonantajasektori2]
GO
/****** Object:  Table [dbo].[d_tyonantajasektori_sama_kuin_ed_vuonna]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tyonantajasektori_sama_kuin_ed_vuonna]
GO
/****** Object:  Table [dbo].[d_tyonantajasektori]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tyonantajasektori]
GO
/****** Object:  Table [dbo].[d_tutkintotaso]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintotaso]
GO
/****** Object:  Table [dbo].[d_tutkintoryhma]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintoryhma]
GO
/****** Object:  Table [dbo].[d_tutkintonimike_ammpk]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintonimike_ammpk]
GO
/****** Object:  Table [dbo].[d_tutkintolaji_tyollistymiseen]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintolaji_tyollistymiseen]
GO
/****** Object:  Table [dbo].[d_tutkintojen_maara]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintojen_maara]
GO
/****** Object:  Table [dbo].[d_tutkintoasetus]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkintoasetus]
GO
/****** Object:  Table [dbo].[d_tutkinto_yo]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_yo]
GO
/****** Object:  Table [dbo].[d_tutkinto_suoritettu]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_suoritettu]
GO
/****** Object:  Table [dbo].[d_tutkinto_muussa_oppilaitoksessa]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muussa_oppilaitoksessa]
GO
/****** Object:  Table [dbo].[d_tutkinto_muussa_maakunnassa]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muussa_maakunnassa]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_opintoalalla_2002]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muulla_opintoalalla_2002]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutussektorilla]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muulla_koulutussektorilla]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutusasteella_2002]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muulla_koulutusasteella_2002]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutusalalla_2002]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muulla_koulutusalalla_2002]
GO
/****** Object:  Table [dbo].[d_tutkinto_muulla_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_muulla_koulutuksen_jarjestajalla]
GO
/****** Object:  Table [dbo].[d_tutkinto_amk]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_amk]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisessa_oppilaitoksessa]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisessa_oppilaitoksessa]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisessa_maakunnassa]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisessa_maakunnassa]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_opintoalalla_2002]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisella_opintoalalla_2002]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutussektorilla]    Script Date: 7.7.2017 16:34:51 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisella_koulutussektorilla]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutusasteella_2002]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisella_koulutusasteella_2002]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutusalalla_2002]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisella_koulutusalalla_2002]
GO
/****** Object:  Table [dbo].[d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]
GO
/****** Object:  Table [dbo].[d_tutkinto]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinto]
GO
/****** Object:  Table [dbo].[d_tutkinnon_toteuma]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinnon_toteuma]
GO
/****** Object:  Table [dbo].[d_tutkinnon_tavoite]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkinnon_tavoite]
GO
/****** Object:  Table [dbo].[d_tutkimusmenojen_kohde]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkimusmenojen_kohde]
GO
/****** Object:  Table [dbo].[d_tutkimus_tehtava]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkimus_tehtava]
GO
/****** Object:  Table [dbo].[d_tutkimuksen_rahoituslahde]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tutkimuksen_rahoituslahde]
GO
/****** Object:  Table [dbo].[d_tulodesiili]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tulodesiili]
GO
/****** Object:  Table [dbo].[d_toimiala_tthv2_sama_kuin_ed_vuonna]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_toimiala_tthv2_sama_kuin_ed_vuonna]
GO
/****** Object:  Table [dbo].[d_toimiala_tthv1_sama_kuin_ed_vuonna]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_toimiala_tthv1_sama_kuin_ed_vuonna]
GO
/****** Object:  Table [dbo].[d_toimiala_tthv]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_toimiala_tthv]
GO
/****** Object:  Table [dbo].[d_toimiala_tk]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_toimiala_tk]
GO
/****** Object:  Table [dbo].[d_toimiala_2008]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_toimiala_2008]
GO
/****** Object:  Table [dbo].[d_todistus_oppisopimuskoulutuksen_suorittamisesta]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_todistus_oppisopimuskoulutuksen_suorittamisesta]
GO
/****** Object:  Table [dbo].[d_tilauskoulutuksen_sijaintimaa]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tilauskoulutuksen_sijaintimaa]
GO
/****** Object:  Table [dbo].[d_tietojen_ajankohta]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tietojen_ajankohta]
GO
/****** Object:  Table [dbo].[d_tieteenala]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tieteenala]
GO
/****** Object:  Table [dbo].[d_tiedekunta_yo]    Script Date: 7.7.2017 16:34:52 ******/
DROP TABLE IF EXISTS [dbo].[d_tiedekunta_yo]
GO
/****** Object:  Table [dbo].[d_tarkastelujakso]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_tarkastelujakso]
GO
/****** Object:  Table [dbo].[d_suuntautumisvaihtoehto_amk]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_suuntautumisvaihtoehto_amk]
GO
/****** Object:  Table [dbo].[d_suorlk]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_suorlk]
GO
/****** Object:  Table [dbo].[d_suoritettu_tutkinto]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_suoritettu_tutkinto]
GO
/****** Object:  Table [dbo].[d_sukupuoli]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_sukupuoli]
GO
/****** Object:  Table [dbo].[d_suhteellinen_ajankohta]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_suhteellinen_ajankohta]
GO
/****** Object:  Table [dbo].[d_sosioekonominen_asema]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_sosioekonominen_asema]
GO
/****** Object:  Table [dbo].[d_siirtyman_tarkastelusuunta]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_siirtyman_tarkastelusuunta]
GO
/****** Object:  Table [dbo].[d_sektoritutkimuslaitos]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_sektoritutkimuslaitos]
GO
/****** Object:  Table [dbo].[d_sama_koulutusala]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_sama_koulutusala]
GO
/****** Object:  Table [dbo].[d_rahoituslahde_amm]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_rahoituslahde_amm]
GO
/****** Object:  Table [dbo].[d_rahoituslahde]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_rahoituslahde]
GO
/****** Object:  Table [dbo].[d_pohjoismaa]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_pohjoismaa]
GO
/****** Object:  Table [dbo].[d_pohjakoulutuksen_tila]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_pohjakoulutuksen_tila]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_yleisopetuksen_osuus]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_yleisopetuksen_osuus]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_vuosiluokat]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_vuosiluokat]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_tukimuoto]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_tukimuoto]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_tehostettu_tuki]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_tehostettu_tuki]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_pidennetty_oppivelvollisuus]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_pidennetty_oppivelvollisuus]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_oppimaaran_yksilollistaminen]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_oppimaaran_yksilollistaminen]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_majoitusetuus]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_majoitusetuus]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_kuljetusetuus]    Script Date: 7.7.2017 16:34:53 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_kuljetusetuus]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_kieltenmaara]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_kieltenmaara]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_erityisen_tuen_paatos]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_erityisen_tuen_paatos]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_aloitusika]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_aloitusika]
GO
/****** Object:  Table [dbo].[d_perusopetuksen_ainevalinnat]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_perusopetuksen_ainevalinnat]
GO
/****** Object:  Table [dbo].[d_perusjoukko_tyolliset]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_perusjoukko_tyolliset]
GO
/****** Object:  Table [dbo].[d_perusjoukko]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_perusjoukko]
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_versio3]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_paaasiallinen_toiminta_versio3]
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_versio2]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_paaasiallinen_toiminta_versio2]
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_okm]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_paaasiallinen_toiminta_okm]
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta_ja_maasta_muuttaneet]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_paaasiallinen_toiminta_ja_maasta_muuttaneet]
GO
/****** Object:  Table [dbo].[d_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_paaasiallinen_toiminta]
GO
/****** Object:  Table [dbo].[d_osatutkinto]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_osatutkinto]
GO
/****** Object:  Table [dbo].[d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]
GO
/****** Object:  Table [dbo].[d_oppisopimuskoulutus]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_oppisopimuskoulutus]
GO
/****** Object:  Table [dbo].[d_oppisopimus_yrityksen_koko]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_oppisopimus_yrityksen_koko]
GO
/****** Object:  Table [dbo].[d_oppisopimus_purkautunut]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_oppisopimus_purkautunut]
GO
/****** Object:  Table [dbo].[d_oppilaitostyyppi]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_oppilaitostyyppi]
GO
/****** Object:  Table [dbo].[d_oppilaitos]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_oppilaitos]
GO
/****** Object:  Table [dbo].[d_opiskelumuoto]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_opiskelumuoto]
GO
/****** Object:  Table [dbo].[d_opiskelu_toiminta]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_opiskelu_toiminta]
GO
/****** Object:  Table [dbo].[d_opiskelijan_olo_tamm]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_opiskelijan_olo_tamm]
GO
/****** Object:  Table [dbo].[d_opiskelijan_olo]    Script Date: 7.7.2017 16:34:54 ******/
DROP TABLE IF EXISTS [dbo].[d_opiskelijan_olo]
GO
/****** Object:  Table [dbo].[d_opiskelijan_fte_tieto]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opiskelijan_fte_tieto]
GO
/****** Object:  Table [dbo].[d_opiskelijan_aikaisempi_yleissivistava_koulutus]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opiskelijan_aikaisempi_yleissivistava_koulutus]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan_versio2]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_oppilaitoksen_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan_versio2]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_opintoalan_2002_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_maakunnan_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_maakunnan_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutussektorin_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_koulutussektorin_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan_versio2]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO
/****** Object:  Table [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan]
GO
/****** Object:  Table [dbo].[d_opintoala2002]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opintoala2002]
GO
/****** Object:  Table [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetustuntien_sisalto_ja_tavoiteluokitus]
GO
/****** Object:  Table [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO
/****** Object:  Table [dbo].[d_opetuskieli2]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetuskieli2]
GO
/****** Object:  Table [dbo].[d_opetuskieli]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetuskieli]
GO
/****** Object:  Table [dbo].[d_opetushallinnon_koulutusala]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetushallinnon_koulutusala]
GO
/****** Object:  Table [dbo].[d_opetushallinnon_koulutus]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetushallinnon_koulutus]
GO
/****** Object:  Table [dbo].[d_opetuksen_jarjestajan_tiedoantajatyyppi]    Script Date: 7.7.2017 16:34:55 ******/
DROP TABLE IF EXISTS [dbo].[d_opetuksen_jarjestajan_tiedoantajatyyppi]
GO
/****** Object:  Table [dbo].[d_opettajat_tyosuhteen_luonne]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_tyosuhteen_luonne]
GO
/****** Object:  Table [dbo].[d_opettajat_osa_aikaisuuden_syy]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_osa_aikaisuuden_syy]
GO
/****** Object:  Table [dbo].[d_opettajat_luokka_aste]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_luokka_aste]
GO
/****** Object:  Table [dbo].[d_opettajat_koulutusaste_amm]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_koulutusaste_amm]
GO
/****** Object:  Table [dbo].[d_opettajat_koulutusaste]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_koulutusaste]
GO
/****** Object:  Table [dbo].[d_opettajat_koko_osa_aikainen]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_koko_osa_aikainen]
GO
/****** Object:  Table [dbo].[d_opettajat_aine_vst]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_aine_vst]
GO
/****** Object:  Table [dbo].[d_opettajat_aine_amm]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_aine_amm]
GO
/****** Object:  Table [dbo].[d_opettajat_aine_2016_lukio]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_aine_2016_lukio]
GO
/****** Object:  Table [dbo].[d_opettajat_aine_2016]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_aine_2016]
GO
/****** Object:  Table [dbo].[d_opettajat_aine]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajat_aine]
GO
/****** Object:  Table [dbo].[d_opettajankelpoisuus2]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajankelpoisuus2]
GO
/****** Object:  Table [dbo].[d_opettajankelpoisuus]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajankelpoisuus]
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajan_tehtavatyyppi_perusopetuksessa]
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajan_tehtavatyyppi_lukiokoulutuksessa]
GO
/****** Object:  Table [dbo].[d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]
GO
/****** Object:  Table [dbo].[d_nuorten_aikuisten_koulutus_amm]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_nuorten_aikuisten_koulutus_amm]
GO
/****** Object:  Table [dbo].[d_nuorten_aikuisten_koulutus]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_nuorten_aikuisten_koulutus]
GO
/****** Object:  Table [dbo].[d_moninkertainen_haku]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_moninkertainen_haku]
GO
/****** Object:  Table [dbo].[d_mitenna_toimiala]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_mitenna_toimiala]
GO
/****** Object:  Table [dbo].[d_mitenna_ammatti]    Script Date: 7.7.2017 16:34:56 ******/
DROP TABLE IF EXISTS [dbo].[d_mitenna_ammatti]
GO
/****** Object:  Table [dbo].[d_maassaolo]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_maassaolo]
GO
/****** Object:  Table [dbo].[d_maahantulo_ja_opiskelun_aloittaminen]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_maahantulo_ja_opiskelun_aloittaminen]
GO
/****** Object:  Table [dbo].[d_lukion_kieltenmaara]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_lukion_kieltenmaara]
GO
/****** Object:  Table [dbo].[d_lukion_ainevalinnat]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_lukion_ainevalinnat]
GO
/****** Object:  Table [dbo].[d_lukiokoulutuksen_koulutuslaji]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_lukiokoulutuksen_koulutuslaji]
GO
/****** Object:  Table [dbo].[d_lahde]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_lahde]
GO
/****** Object:  Table [dbo].[d_kylla_ei]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_kylla_ei]
GO
/****** Object:  Table [dbo].[d_koulutustyyppi]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutustyyppi]
GO
/****** Object:  Table [dbo].[d_koulutussektori]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutussektori]
GO
/****** Object:  Table [dbo].[d_koulutusryhma]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusryhma]
GO
/****** Object:  Table [dbo].[d_koulutusohjelma_ammpk]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusohjelma_ammpk]
GO
/****** Object:  Table [dbo].[d_koulutusohjelma_amk]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusohjelma_amk]
GO
/****** Object:  Table [dbo].[d_koulutusmuoto]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusmuoto]
GO
/****** Object:  Table [dbo].[d_koulutusluokitus_TEST_20160205_JN]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusluokitus_TEST_20160205_JN]
GO
/****** Object:  Table [dbo].[d_koulutusluokitus]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusluokitus]
GO
/****** Object:  Table [dbo].[d_koulutuslaji3]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuslaji3]
GO
/****** Object:  Table [dbo].[d_koulutuslaji2]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuslaji2]
GO
/****** Object:  Table [dbo].[d_koulutuslaji_okm]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuslaji_okm]
GO
/****** Object:  Table [dbo].[d_koulutuslaji]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuslaji]
GO
/****** Object:  Table [dbo].[d_koulutusaste_2002]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutusaste_2002]
GO
/****** Object:  Table [dbo].[d_koulutuksesta_kulunut_aika]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksesta_kulunut_aika]
GO
/****** Object:  Table [dbo].[d_koulutuksen_tavoite_toteuma]    Script Date: 7.7.2017 16:34:57 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_tavoite_toteuma]
GO
/****** Object:  Table [dbo].[d_koulutuksen_paattaneiden_toiminta]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_paattaneiden_toiminta]
GO
/****** Object:  Table [dbo].[d_koulutuksen_kieli_versio1]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_kieli_versio1]
GO
/****** Object:  Table [dbo].[d_koulutuksen_kesto]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_kesto]
GO
/****** Object:  Table [dbo].[d_koulutuksen_jarjestamismuoto]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_jarjestamismuoto]
GO
/****** Object:  Table [dbo].[d_koulutuksen_jarjestajan_koko]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_jarjestajan_koko]
GO
/****** Object:  Table [dbo].[d_koulutuksen_jarjestaja]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_koulutuksen_jarjestaja]
GO
/****** Object:  Table [dbo].[d_kieli2]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_kieli2]
GO
/****** Object:  Table [dbo].[d_kieli]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_kieli]
GO
/****** Object:  Table [dbo].[d_kausi]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_kausi]
GO
/****** Object:  Table [dbo].[d_kansalaisuus_versio2]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_kansalaisuus_versio2]
GO
/****** Object:  Table [dbo].[d_kansalaisuus_versio1]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_kansalaisuus_versio1]
GO
/****** Object:  Table [dbo].[d_joustava_perusopetus]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_joustava_perusopetus]
GO
/****** Object:  Table [dbo].[d_jatko_opiskelu]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatko_opiskelu]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muussa_oppilaitoksessa]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muussa_oppilaitoksessa]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muussa_maakunnassa]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muussa_maakunnassa]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_opintoalalla_2002]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muulla_opintoalalla_2002]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutussektorilla]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muulla_koulutussektorilla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutusasteella_2002]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muulla_koulutusasteella_2002]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutusalalla_2002]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muulla_koulutusalalla_2002]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:34:58 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisessa_maakunnassa]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisessa_maakunnassa]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]
GO
/****** Object:  Table [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]
GO
/****** Object:  Table [dbo].[d_ika]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_ika]
GO
/****** Object:  Table [dbo].[d_hetu_ok]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hetu_ok]
GO
/****** Object:  Table [dbo].[d_hallinnonala2]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hallinnonala2]
GO
/****** Object:  Table [dbo].[d_hallinnonala]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hallinnonala]
GO
/****** Object:  Table [dbo].[d_hakukohteen_tutkinnon_taso]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hakukohteen_tutkinnon_taso]
GO
/****** Object:  Table [dbo].[d_hakukohteen_tulos]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hakukohteen_tulos]
GO
/****** Object:  Table [dbo].[d_hakukohteen_prioriteetti]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hakukohteen_prioriteetti]
GO
/****** Object:  Table [dbo].[d_hakukohde_erillisvalinta]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hakukohde_erillisvalinta]
GO
/****** Object:  Table [dbo].[d_hakukohde]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_hakukohde]
GO
/****** Object:  Table [dbo].[d_eu_etamaat]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_eu_etamaat]
GO
/****** Object:  Table [dbo].[d_erityisoppilaan_opetusryhma]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_erityisoppilaan_opetusryhma]
GO
/****** Object:  Table [dbo].[d_erityisopetuksen_peruste]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_erityisopetuksen_peruste]
GO
/****** Object:  Table [dbo].[d_ensisijainen_opintooikeus]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_ensisijainen_opintooikeus]
GO
/****** Object:  Table [dbo].[d_elakkeelle_siirtynyt_tai_kuollut]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_elakkeelle_siirtynyt_tai_kuollut]
GO
/****** Object:  Table [dbo].[d_edeltavan_vuoden_asuinpaikka]    Script Date: 7.7.2017 16:34:59 ******/
DROP TABLE IF EXISTS [dbo].[d_edeltavan_vuoden_asuinpaikka]
GO
/****** Object:  Table [dbo].[d_edellisen_vuoden_opiskelu]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_edellisen_vuoden_opiskelu]
GO
/****** Object:  Table [dbo].[d_avoinvayla]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_avoinvayla]
GO
/****** Object:  Table [dbo].[d_asuinmaakunta_sama_kuin_tyopaikan]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_asuinmaakunta_sama_kuin_tyopaikan]
GO
/****** Object:  Table [dbo].[d_asuinkunta_sama_vai_eri_kuin_aiemmin]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_asuinkunta_sama_vai_eri_kuin_aiemmin]
GO
/****** Object:  Table [dbo].[d_ammattiluokitus_2010_talteen]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammattiluokitus_2010_talteen]
GO
/****** Object:  Table [dbo].[d_ammattiluokitus_2010]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammattiluokitus_2010]
GO
/****** Object:  Table [dbo].[d_ammattiluokitus_2001]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammattiluokitus_2001]
GO
/****** Object:  Table [dbo].[d_ammattiasema]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammattiasema]
GO
/****** Object:  Table [dbo].[d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]
GO
/****** Object:  Table [dbo].[d_ammatillisen_koulutuksen_koulutuslaji]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammatillisen_koulutuksen_koulutuslaji]
GO
/****** Object:  Table [dbo].[d_ammatillinen_peruskoulutus_lisakoulutus]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammatillinen_peruskoulutus_lisakoulutus]
GO
/****** Object:  Table [dbo].[d_ammatillinen_koulutus_luokittelu]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_ammatillinen_koulutus_luokittelu]
GO
/****** Object:  Table [dbo].[d_alueluokitus]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_alueluokitus]
GO
/****** Object:  Table [dbo].[d_aineisto_OTV]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aineisto_OTV]
GO
/****** Object:  Table [dbo].[d_aineisto]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aineisto]
GO
/****** Object:  Table [dbo].[d_aikuisopiskelija]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aikuisopiskelija]
GO
/****** Object:  Table [dbo].[d_aikalkk]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aikalkk]
GO
/****** Object:  Table [dbo].[d_aikaisempi_korkein_tutkinto]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aikaisempi_korkein_tutkinto]
GO
/****** Object:  Table [dbo].[d_aikaisemmat_tutkinnot]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aikaisemmat_tutkinnot]
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio3]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aidinkieli_versio3]
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio2]    Script Date: 7.7.2017 16:35:00 ******/
DROP TABLE IF EXISTS [dbo].[d_aidinkieli_versio2]
GO
/****** Object:  Table [dbo].[d_aidinkieli_versio1]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[d_aidinkieli_versio1]
GO
/****** Object:  Table [dbo].[_VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_VipunenTK_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]
GO
/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet_UNPIVOT]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet_UNPIVOT]
GO
/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_surrogaattiavaimet]
GO
/****** Object:  Table [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_9_Tutk_suor_osuus_aloittaneista_toinen_aste_nykytila]
GO
/****** Object:  Table [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_UNPIVOT]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_UNPIVOT]
GO
/****** Object:  Table [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_PIVOT]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_9_ja_K3_10_surrogaattiavaimet_PIVOT]
GO
/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_UNPIVOT]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet_UNPIVOT]
GO
/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_surrogaattiavaimet]
GO
/****** Object:  Table [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_sa_K3_10_Tutk_suor_osuus_aloittaneista_korkeakoulut_nykytila]
GO
/****** Object:  Table [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_koulutukseen_sijoittuneet_6v_tarkastelu]
GO
/****** Object:  Table [dbo].[_koulutukseen_sijoittuneet_2v_tarkastelu]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_koulutukseen_sijoittuneet_2v_tarkastelu]
GO
/****** Object:  Table [dbo].[_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8]
GO
/****** Object:  Table [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_f_koulutukseen_sijoittuneet_6v_tarkastelu]
GO
/****** Object:  Table [dbo].[_f_koulutukseen_sijoittuneet_2v_tarkastelu]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_f_koulutukseen_sijoittuneet_2v_tarkastelu]
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_aloittaneiden_lapaisy_tiivistetty_ja_lasketut_sarakkeet]
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_tiivistetty]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_aloittaneiden_lapaisy_tiivistetty]
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_sarakeryhmat]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_aloittaneiden_lapaisy_sarakeryhmat]
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_aloittaneiden_lapaisy_lasketut_sarakkeet]
GO
/****** Object:  Table [dbo].[_aloittaneiden_lapaisy_avaimet]    Script Date: 7.7.2017 16:35:01 ******/
DROP TABLE IF EXISTS [dbo].[_aloittaneiden_lapaisy_avaimet]
GO
/****** Object:  View [dbo].[v_yrityksen_koko_tthv]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_yrityksen_koko_tthv]
GO
/****** Object:  View [dbo].[v_yrittajan_oppisopimuskoulutus]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_yrittajan_oppisopimuskoulutus]
GO
/****** Object:  View [dbo].[v_yllapitajan_kieli]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_yllapitajan_kieli]
GO
/****** Object:  View [dbo].[v_yliopisto]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_yliopisto]
GO
/****** Object:  View [dbo].[v_virkaryhma]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_virkaryhma]
GO
/****** Object:  View [dbo].[v_vieraskielisyys]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_vieraskielisyys]
GO
/****** Object:  View [dbo].[v_vayla_nayttotutkintoon]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_vayla_nayttotutkintoon]
GO
/****** Object:  View [dbo].[v_valtio]    Script Date: 7.7.2017 16:35:01 ******/
DROP VIEW IF EXISTS [dbo].[v_valtio]
GO
/****** Object:  View [dbo].[v_valiaikainen_amk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_valiaikainen_amk]
GO
/****** Object:  View [dbo].[v_uusi_vanha_opiskelija]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_uusi_vanha_opiskelija]
GO
/****** Object:  View [dbo].[v_tyovoimapoliittinen_koulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyovoimapoliittinen_koulutus]
GO
/****** Object:  View [dbo].[v_tyovoimapoliittinen]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyovoimapoliittinen]
GO
/****** Object:  View [dbo].[v_tyossakayntitilaston_tyonantajasektori]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyossakayntitilaston_tyonantajasektori]
GO
/****** Object:  View [dbo].[v_tyopaikan_sijainti_v_tilastovuonna]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyopaikan_sijainti_v_tilastovuonna]
GO
/****** Object:  View [dbo].[v_tyonantajasektori2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyonantajasektori2]
GO
/****** Object:  View [dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyonantajasektori_sama_kuin_ed_vuonna]
GO
/****** Object:  View [dbo].[v_tyonantajasektori]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tyonantajasektori]
GO
/****** Object:  View [dbo].[v_tutkintotaso]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkintotaso]
GO
/****** Object:  View [dbo].[v_tutkintoryhma]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkintoryhma]
GO
/****** Object:  View [dbo].[v_tutkintonimike_ammpk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkintonimike_ammpk]
GO
/****** Object:  View [dbo].[v_tutkintolaji_tyollistymiseen]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkintolaji_tyollistymiseen]
GO
/****** Object:  View [dbo].[v_tutkintojen_maara]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkintojen_maara]
GO
/****** Object:  View [dbo].[v_tutkintoasetus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkintoasetus]
GO
/****** Object:  View [dbo].[v_tutkinto_yo]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_yo]
GO
/****** Object:  View [dbo].[v_tutkinto_suoritettu]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_suoritettu]
GO
/****** Object:  View [dbo].[v_tutkinto_muussa_oppilaitoksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muussa_oppilaitoksessa]
GO
/****** Object:  View [dbo].[v_tutkinto_muussa_maakunnassa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muussa_maakunnassa]
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_opintoalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muulla_opintoalalla_2002]
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutussektorilla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muulla_koulutussektorilla]
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutusasteella_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muulla_koulutusasteella_2002]
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutusalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muulla_koulutusalalla_2002]
GO
/****** Object:  View [dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_muulla_koulutuksen_jarjestajalla]
GO
/****** Object:  View [dbo].[v_tutkinto_amk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_amk]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisessa_oppilaitoksessa]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisessa_maakunnassa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisessa_maakunnassa]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisella_opintoalalla_2002]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutussektorilla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisella_koulutussektorilla]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisella_koulutusasteella_2002]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisella_koulutusalalla_2002]
GO
/****** Object:  View [dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]
GO
/****** Object:  View [dbo].[v_tutkinto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinto]
GO
/****** Object:  View [dbo].[v_tutkinnon_toteuma]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinnon_toteuma]
GO
/****** Object:  View [dbo].[v_tutkinnon_tavoite]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkinnon_tavoite]
GO
/****** Object:  View [dbo].[v_tutkimusmenojen_kohde]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkimusmenojen_kohde]
GO
/****** Object:  View [dbo].[v_tutkimus_tehtava]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tutkimus_tehtava]
GO
/****** Object:  View [dbo].[v_tulodesiili]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tulodesiili]
GO
/****** Object:  View [dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_toimiala_tthv2_sama_kuin_ed_vuonna]
GO
/****** Object:  View [dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_toimiala_tthv1_sama_kuin_ed_vuonna]
GO
/****** Object:  View [dbo].[v_toimiala_tthv]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_toimiala_tthv]
GO
/****** Object:  View [dbo].[v_toimiala_tk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_toimiala_tk]
GO
/****** Object:  View [dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_todistus_oppisopimuskoulutuksen_suorittamisesta]
GO
/****** Object:  View [dbo].[v_tilauskoulutuksen_sijaintimaa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tilauskoulutuksen_sijaintimaa]
GO
/****** Object:  View [dbo].[v_tietojen_ajankohta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tietojen_ajankohta]
GO
/****** Object:  View [dbo].[v_tieteenala]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tieteenala]
GO
/****** Object:  View [dbo].[v_tiedekunta_yo]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tiedekunta_yo]
GO
/****** Object:  View [dbo].[v_tarkastelujakso]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tarkastelujakso]
GO
/****** Object:  View [dbo].[v_tabular_prosessointi]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_tabular_prosessointi]
GO
/****** Object:  View [dbo].[v_suorlk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_suorlk]
GO
/****** Object:  View [dbo].[v_suoritettu_tutkinto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_suoritettu_tutkinto]
GO
/****** Object:  View [dbo].[v_sukupuoli]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_sukupuoli]
GO
/****** Object:  View [dbo].[v_suhteellinen_ajankohta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_suhteellinen_ajankohta]
GO
/****** Object:  View [dbo].[v_sosioekonominen_asema]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_sosioekonominen_asema]
GO
/****** Object:  View [dbo].[v_siirtyman_tarkastelusuunta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_siirtyman_tarkastelusuunta]
GO
/****** Object:  View [dbo].[v_sarakeleveys]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_sarakeleveys]
GO
/****** Object:  View [dbo].[v_sama_koulutusala]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_sama_koulutusala]
GO
/****** Object:  View [dbo].[v_rahoituslahde_amm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_rahoituslahde_amm]
GO
/****** Object:  View [dbo].[v_rahoituslahde]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_rahoituslahde]
GO
/****** Object:  View [dbo].[v_pohjoismaa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_pohjoismaa]
GO
/****** Object:  View [dbo].[v_pohjakoulutuksen_tila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_pohjakoulutuksen_tila]
GO
/****** Object:  View [dbo].[v_perusopetuksen_yleisopetuksen_osuus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_yleisopetuksen_osuus]
GO
/****** Object:  View [dbo].[v_perusopetuksen_vuosiluokat]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_vuosiluokat]
GO
/****** Object:  View [dbo].[v_perusopetuksen_tukimuoto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_tukimuoto]
GO
/****** Object:  View [dbo].[v_perusopetuksen_tehostettu_tuki]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_tehostettu_tuki]
GO
/****** Object:  View [dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_pidennetty_oppivelvollisuus]
GO
/****** Object:  View [dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_oppimaaran_yksilollistaminen]
GO
/****** Object:  View [dbo].[v_perusopetuksen_majoitusetuus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_majoitusetuus]
GO
/****** Object:  View [dbo].[v_perusopetuksen_kuljetusetuus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_kuljetusetuus]
GO
/****** Object:  View [dbo].[v_perusopetuksen_kieltenmaara]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_kieltenmaara]
GO
/****** Object:  View [dbo].[v_perusopetuksen_erityisen_tuen_paatos]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_erityisen_tuen_paatos]
GO
/****** Object:  View [dbo].[v_perusopetuksen_aloitusika]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_aloitusika]
GO
/****** Object:  View [dbo].[v_perusopetuksen_ainevalinnat]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusopetuksen_ainevalinnat]
GO
/****** Object:  View [dbo].[v_perusjoukko_tyolliset]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusjoukko_tyolliset]
GO
/****** Object:  View [dbo].[v_perusjoukko]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_perusjoukko]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_versio3]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_paaasiallinen_toiminta_versio3]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_paaasiallinen_toiminta_versio2]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_okm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_paaasiallinen_toiminta_okm]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_paaasiallinen_toiminta_ja_maasta_muuttaneet]
GO
/****** Object:  View [dbo].[v_paaasiallinen_toiminta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_paaasiallinen_toiminta]
GO
/****** Object:  View [dbo].[v_osatutkinto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_osatutkinto]
GO
/****** Object:  View [dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_oppisopimuskoulutus_osallistuneet_ja_tutk_suorittaneet]
GO
/****** Object:  View [dbo].[v_oppisopimuskoulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_oppisopimuskoulutus]
GO
/****** Object:  View [dbo].[v_oppisopimus_yrityksen_koko]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_oppisopimus_yrityksen_koko]
GO
/****** Object:  View [dbo].[v_oppisopimus_purkautunut]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_oppisopimus_purkautunut]
GO
/****** Object:  View [dbo].[v_oppilaitostyyppi]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_oppilaitostyyppi]
GO
/****** Object:  View [dbo].[v_opiskelumuoto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opiskelumuoto]
GO
/****** Object:  View [dbo].[v_opiskelu_toiminta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opiskelu_toiminta]
GO
/****** Object:  View [dbo].[v_opiskelijan_olo_tamm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opiskelijan_olo_tamm]
GO
/****** Object:  View [dbo].[v_opiskelijan_olo]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opiskelijan_olo]
GO
/****** Object:  View [dbo].[v_opiskelijan_fte_tieto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opiskelijan_fte_tieto]
GO
/****** Object:  View [dbo].[v_opiskelijan_aikaisempi_yleissivistava_koulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opiskelijan_aikaisempi_yleissivistava_koulutus]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan_versio2]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_oppilaitoksen_mukaan]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan_versio2]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_opintoalan_2002_mukaan]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_maakunnan_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_maakunnan_mukaan]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutussektorin_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_koulutussektorin_mukaan]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_koulutusasteen_2002_mukaan]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan_versio2]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_koulutusalan_2002_mukaan]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2]
GO
/****** Object:  View [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintojen_kulku_koulutuksen_jarjestajan_mukaan]
GO
/****** Object:  View [dbo].[v_opintoala2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opintoala2002]
GO
/****** Object:  View [dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opetustuntien_sisalto_ja_tavoiteluokitus]
GO
/****** Object:  View [dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus]
GO
/****** Object:  View [dbo].[v_opetuskieli2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opetuskieli2]
GO
/****** Object:  View [dbo].[v_opetuskieli]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opetuskieli]
GO
/****** Object:  View [dbo].[v_opetushallinnon_koulutusala]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opetushallinnon_koulutusala]
GO
/****** Object:  View [dbo].[v_opetushallinnon_koulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opetushallinnon_koulutus]
GO
/****** Object:  View [dbo].[v_opettajat_tyosuhteen_luonne]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_tyosuhteen_luonne]
GO
/****** Object:  View [dbo].[v_opettajat_osa_aikaisuuden_syy]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_osa_aikaisuuden_syy]
GO
/****** Object:  View [dbo].[v_opettajat_luokka_aste]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_luokka_aste]
GO
/****** Object:  View [dbo].[v_opettajat_koulutusaste_amm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_koulutusaste_amm]
GO
/****** Object:  View [dbo].[v_opettajat_koulutusaste]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_koulutusaste]
GO
/****** Object:  View [dbo].[v_opettajat_koko_osa_aikainen]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_koko_osa_aikainen]
GO
/****** Object:  View [dbo].[v_opettajat_aine_vst]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_aine_vst]
GO
/****** Object:  View [dbo].[v_opettajat_aine_amm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_aine_amm]
GO
/****** Object:  View [dbo].[v_opettajat_aine_2016_lukio]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_aine_2016_lukio]
GO
/****** Object:  View [dbo].[v_opettajat_aine_2016]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_aine_2016]
GO
/****** Object:  View [dbo].[v_opettajat_aine]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajat_aine]
GO
/****** Object:  View [dbo].[v_opettajankelpoisuus2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajankelpoisuus2]
GO
/****** Object:  View [dbo].[v_opettajankelpoisuus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajankelpoisuus]
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajan_tehtavatyyppi_vapaassa_sivistystyossa]
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajan_tehtavatyyppi_perusopetuksessa]
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajan_tehtavatyyppi_lukiokoulutuksessa]
GO
/****** Object:  View [dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_opettajan_tehtavatyyppi_ammatillisessa_koulutuksessa]
GO
/****** Object:  View [dbo].[v_nuorten_aikuisten_koulutus_amm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_nuorten_aikuisten_koulutus_amm]
GO
/****** Object:  View [dbo].[v_nuorten_aikuisten_koulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_nuorten_aikuisten_koulutus]
GO
/****** Object:  View [dbo].[v_moninkertainen_haku]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_moninkertainen_haku]
GO
/****** Object:  View [dbo].[v_mitenna_toimiala]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_mitenna_toimiala]
GO
/****** Object:  View [dbo].[v_mitenna_ammatti]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_mitenna_ammatti]
GO
/****** Object:  View [dbo].[v_maassaolo]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_maassaolo]
GO
/****** Object:  View [dbo].[v_maahantulo_ja_opiskelun_aloittaminen]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_maahantulo_ja_opiskelun_aloittaminen]
GO
/****** Object:  View [dbo].[v_lukion_kieltenmaara]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_lukion_kieltenmaara]
GO
/****** Object:  View [dbo].[v_lukion_ainevalinnat]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_lukion_ainevalinnat]
GO
/****** Object:  View [dbo].[v_lukiokoulutuksen_koulutuslaji]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_lukiokoulutuksen_koulutuslaji]
GO
/****** Object:  View [dbo].[v_lahde]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_lahde]
GO
/****** Object:  View [dbo].[v_kylla_ei]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_kylla_ei]
GO
/****** Object:  View [dbo].[v_koulutustyyppi]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutustyyppi]
GO
/****** Object:  View [dbo].[v_koulutussektori]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutussektori]
GO
/****** Object:  View [dbo].[v_koulutusryhma]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutusryhma]
GO
/****** Object:  View [dbo].[v_koulutusohjelma_ammpk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutusohjelma_ammpk]
GO
/****** Object:  View [dbo].[v_koulutusohjelma_amk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutusohjelma_amk]
GO
/****** Object:  View [dbo].[v_koulutusmuoto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutusmuoto]
GO
/****** Object:  View [dbo].[v_koulutusluokitus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutusluokitus]
GO
/****** Object:  View [dbo].[v_koulutuslaji_okm]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuslaji_okm]
GO
/****** Object:  View [dbo].[v_koulutuslaji]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuslaji]
GO
/****** Object:  View [dbo].[v_koulutusaste_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutusaste_2002]
GO
/****** Object:  View [dbo].[v_koulutuksesta_kulunut_aika]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksesta_kulunut_aika]
GO
/****** Object:  View [dbo].[v_koulutuksen_tavoite_toteuma]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_tavoite_toteuma]
GO
/****** Object:  View [dbo].[v_koulutuksen_paattaneiden_toiminta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_paattaneiden_toiminta]
GO
/****** Object:  View [dbo].[v_koulutuksen_kieli_versio1]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_kieli_versio1]
GO
/****** Object:  View [dbo].[v_koulutuksen_kesto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_kesto]
GO
/****** Object:  View [dbo].[v_koulutuksen_jarjestamismuoto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_jarjestamismuoto]
GO
/****** Object:  View [dbo].[v_koulutuksen_jarjestajan_koko]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_koulutuksen_jarjestajan_koko]
GO
/****** Object:  View [dbo].[v_kieli2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_kieli2]
GO
/****** Object:  View [dbo].[v_kausi]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_kausi]
GO
/****** Object:  View [dbo].[v_kansalaisuus_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_kansalaisuus_versio2]
GO
/****** Object:  View [dbo].[v_kansalaisuus_versio1]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_kansalaisuus_versio1]
GO
/****** Object:  View [dbo].[v_joustava_perusopetus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_joustava_perusopetus]
GO
/****** Object:  View [dbo].[v_jatko_opiskelu]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatko_opiskelu]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muussa_oppilaitoksessa]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muussa_maakunnassa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muussa_maakunnassa]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muulla_opintoalalla_2002]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muulla_koulutussektorilla]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muulla_koulutusasteella_2002]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muulla_koulutusalalla_2002]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisessa_maakunnassa]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]
GO
/****** Object:  View [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]
GO
/****** Object:  View [dbo].[v_ika]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ika]
GO
/****** Object:  View [dbo].[v_hetu_ok]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hetu_ok]
GO
/****** Object:  View [dbo].[v_hallinnonala2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hallinnonala2]
GO
/****** Object:  View [dbo].[v_hallinnonala]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hallinnonala]
GO
/****** Object:  View [dbo].[v_hakukohteen_tutkinnon_taso]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hakukohteen_tutkinnon_taso]
GO
/****** Object:  View [dbo].[v_hakukohteen_tulos]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hakukohteen_tulos]
GO
/****** Object:  View [dbo].[v_hakukohteen_prioriteetti]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hakukohteen_prioriteetti]
GO
/****** Object:  View [dbo].[v_hakukohde_erillisvalinta]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hakukohde_erillisvalinta]
GO
/****** Object:  View [dbo].[v_hakukohde]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_hakukohde]
GO
/****** Object:  View [dbo].[v_eu_etamaat]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_eu_etamaat]
GO
/****** Object:  View [dbo].[v_erityisoppilaan_opetusryhma]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_erityisoppilaan_opetusryhma]
GO
/****** Object:  View [dbo].[v_erityisopetuksen_peruste]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_erityisopetuksen_peruste]
GO
/****** Object:  View [dbo].[v_ensisijainen_opintooikeus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ensisijainen_opintooikeus]
GO
/****** Object:  View [dbo].[v_elakkeelle_siirtynyt_tai_kuollut]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_elakkeelle_siirtynyt_tai_kuollut]
GO
/****** Object:  View [dbo].[v_edeltavan_vuoden_asuinpaikka]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_edeltavan_vuoden_asuinpaikka]
GO
/****** Object:  View [dbo].[v_edellisen_vuoden_opiskelu]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_edellisen_vuoden_opiskelu]
GO
/****** Object:  View [dbo].[v_avoinvayla]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_avoinvayla]
GO
/****** Object:  View [dbo].[v_asuinmaakunta_sama_kuin_tyopaikan]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_asuinmaakunta_sama_kuin_tyopaikan]
GO
/****** Object:  View [dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_asuinkunta_sama_vai_eri_kuin_aiemmin]
GO
/****** Object:  View [dbo].[v_ammattiasema]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ammattiasema]
GO
/****** Object:  View [dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ammatillisen_koulutuksen_koulutuslaji_tutkintorekisterissa]
GO
/****** Object:  View [dbo].[v_ammatillisen_koulutuksen_koulutuslaji]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ammatillisen_koulutuksen_koulutuslaji]
GO
/****** Object:  View [dbo].[v_ammatillinen_peruskoulutus_lisakoulutus]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ammatillinen_peruskoulutus_lisakoulutus]
GO
/****** Object:  View [dbo].[v_ammatillinen_koulutus_luokittelu]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_ammatillinen_koulutus_luokittelu]
GO
/****** Object:  View [dbo].[v_AL_K3_9_koulutusluokitus_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_9_koulutusluokitus_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_9_koulutuksen_jarjestaja_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_9_alueluokitus_maakunta_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_9_alueluokitus_kunta_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_9_alueluokitus_kunta_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_10_koulutusluokitus_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_10_koulutusluokitus_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_10_koulutuksen_jarjestaja_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_10_alueluokitus_maakunta_nykytila]
GO
/****** Object:  View [dbo].[v_AL_K3_10_alueluokitus_kunta_nykytila]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_AL_K3_10_alueluokitus_kunta_nykytila]
GO
/****** Object:  View [dbo].[v_aineisto_OTV]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aineisto_OTV]
GO
/****** Object:  View [dbo].[v_aineisto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aineisto]
GO
/****** Object:  View [dbo].[v_aikuisopiskelija]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aikuisopiskelija]
GO
/****** Object:  View [dbo].[v_aikalkk]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aikalkk]
GO
/****** Object:  View [dbo].[v_aikaisempi_korkein_tutkinto]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aikaisempi_korkein_tutkinto]
GO
/****** Object:  View [dbo].[v_aikaisemmat_tutkinnot]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aikaisemmat_tutkinnot]
GO
/****** Object:  View [dbo].[v_aidinkieli_versio3]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aidinkieli_versio3]
GO
/****** Object:  View [dbo].[v_aidinkieli_versio2]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aidinkieli_versio2]
GO
/****** Object:  View [dbo].[v_aidinkieli_versio1]    Script Date: 7.7.2017 16:35:02 ******/
DROP VIEW IF EXISTS [dbo].[v_aidinkieli_versio1]
GO
