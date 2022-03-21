USE [VipunenTK_lisatiedot]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto_fakta_proseduuri]    Script Date: 4.1.2019 11:42:58 ******/
DROP TABLE IF EXISTS [dbo].[Vipunen_aineisto_fakta_proseduuri]
GO
/****** Object:  Table [dbo].[Vipunen_aineisto_fakta_proseduuri]    Script Date: 4.1.2019 11:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vipunen_aineisto_fakta_proseduuri]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vipunen_aineisto_fakta_proseduuri](
	[aineisto_avain] [varchar](255) NULL,
	[fakta] [varchar](255) NULL,
	[proseduuri] [varchar](255) NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_1', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_10', N'f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus', N'p_lataa_KAK_f_2_10')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_11', N'f_TJK_2_11_tutkintoon_johtamaton_koulutus', N'p_lataa_f_tutkintoon_johtamaton_koulutus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_12', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_13', N'f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15', N'p_lataa_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_14', N'f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15', N'p_lataa_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_15', N'f_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15', N'p_lataa_ulkomaalaiset_maan_kansalaisuuden_aidinkielen_mukaan_2_13_14_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_16', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_18', N'f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto', N'p_lataa_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_2', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_20', N'f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan', N'p_lataa_TOAK_f_2_20')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_21', N'f_Lukion_ja_ammatillisen_peruskoulutuksen_opiskelijat_tutkinnot', N'p_lataa_f_Lukion_ja_ammatillisen_kaksoistutkinto')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_23', N'f_SA_2_23_Opisk_ja_tutksuor_vanh_aseman_muk', N'p_lataa_SA_f_2_23')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3a', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3b', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3c', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3d', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3e', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3f', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3g', N'f_2_3efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_3h', N'f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_f_2_3h')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4a', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4b', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4c', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4d', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4e', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4f', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_4g', N'f_2_4efg_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_tutkinnot', N'p_lataa_f_2_4efg')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_5', N'f_ainevalinnat_lukiossa', N'p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_5', N'f_AVL_ainevalinnat', N'p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_5', N'f_AVL_kieltenmaarat', N'p_lataa_AVL_f_2_5_ainevalinnat_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_6', N'f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet', N'p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_7', N'f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain', N'p_lataa_f_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8a', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8b', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8c', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_8d', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_9a', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_9b', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_2_9c', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_14', N'f_OTV_3_14_Lukio_ja_ammatillisen_koulutuksen_opiskelijoiden_mediaani_iat', N'p_lataa_OTV_f_3_14')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_15', N'f_OTV_3_15_Lukio_ja_ammatillisen_koulutuksen_tutkintojen_mediaani_iat', N'p_lataa_OTV_f_3_15')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_1a', N'f_3_1a_Oppisopimus_paaasiallinen_toiminta', N'p_lataa_f_3_1a')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_1b', N'f_3_1b_Oppisopimus_koulutuksen_kesto', N'p_lataa_f_3_1b')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_2', N'f_3_2_Oppisopimus_jatko_opinnot', N'p_lataa_f_3_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_3', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_4', N'f_OTV_3_4_Korkeakoulututkinnon_suorittaneiden_mediaani_iat_ja_tutkinnon_suorittamiseen_kuluneet_mediaaniajat', N'p_lataa_OTV_f_3_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_5', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_6', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_7', N'f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat', N'p_lataa_f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_3_8', N'f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat', N'p_lataa_f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_1', N'f_4_1_Perusopetuksen_lisaopetuksen_paattaneiden_sijoittuminen', N'p_lataa_f_4_1_Perusopetuksen_lisaopetuksen_paattaneiden_sijoittuminen')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_10', N'f_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain', N'p_lataa_f_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_11', N'f_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan', N'p_lataa_f_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_12a', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_12b', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_21', N'f_Vaestoennuste', N'p_lataa_f_vaestoennuste')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_2a', N'f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta', N'p_lataa_VKP_f_4_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_2b', N'f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta', N'p_lataa_VKP_f_4_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_2c', N'f_VKP_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta', N'p_lataa_VKP_f_4_2')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_3', N'f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta', N'p_lataa_TJ_f_4_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_4', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_7', N'f_tab_tutkinnon_suorittaneiden_aiempi_koulutus_4_7_yhteiset', N'p_lataa_f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_7', N'f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7', N'p_lataa_f_tutkinnon_suorittaneiden_aiempi_koulutus_4_7')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_8', N'f_tab_tutkinnon_suorittaneiden_myohempi_koulutus_4_8_yhteiset', N'p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_8', N'f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8', N'p_lataa_f_tutkinnon_suorittaneiden_myohempi_koulutus_4_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_9', N'f_4_9_Vaestorakenne_kunnittain', N'p_lataa_f_4_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_4_9', N'f_OTV_4_9_Vaestorakenne_kunnittain', N'p_lataa_OTV_f_4_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_3', N'f_korkeakoulujen_tutkimus_kehitys_5_3_menot', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_3', N'f_korkeakoulujen_tutkimus_kehitys_5_3_rahoitus', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_rahoitus', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain', N'p_lataa_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_rahoitus', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_alueittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain', N'p_lataa_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_rahoitus', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_alueittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_5_4', N'f_Yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain', N'p_lataa_f_5_4_Yosairaaloiden_tutkimus_ja_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_1', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_10', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_11', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_12', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_13', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_14', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_15', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_2', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_3', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_4', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_5', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_6', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_7', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_8', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_6_9', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_1', N'f_Opettajat_perusopetus_kelpoisuus_opetusryhmakoot', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_2', N'f_Opettajat_perusopetus_koulutuksen_jarjestaja_opetusryhmakoot', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_3', N'f_Opettajat_perusopetus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_4', N'f_Opettajat_lukiokoulutus_kelpoisuus_aine', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_5', N'f_Opettajat_lukiokoulutus_koulutuksen_jarjestaja', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_6', N'f_Opettajat_lukiokoulutus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_7', N'f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus_jarjkieli', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_8', N'f_Opettajat_ammatillinen_koulutus_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_7_9', N'f_Opettajat_vapaa_sivistystyo_osallistuminen_taydennyskoulutukseen', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_1', N'f_OTV_2_4_Ammatillisen_koulutuksen_tutkinnot', N'p_lataa_OTV_f_2_4')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_1', N'f_OTV_2_9_Korkeakoulututkinnot', N'p_lataa_OTV_f_2_9')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_2', N'f_OTV_2_3_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat', N'p_lataa_OTV_f_2_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_2', N'f_OTV_2_8_Korkeakouluopiskelijat', N'p_lataa_OTV_f_2_8')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_8_3', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_17a', N'f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk', N'p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_17b', N'f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk', N'p_lataa_f_K2_17_ulkomaalaistaustaiset_opisk_ja_tutk')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_8b', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_10', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_11a', N'f_keskeyttaneet', N'p_lataa_K_f_3_11')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_11b', N'f_keskeyttaneet', N'p_lataa_K_f_3_11')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_12', N'f_koulutukseen_sijoittuneet_2v', N'p_lataa_f_koulutukseen_sijoittuneet_2v')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_13', N'f_koulutukseen_sijoittuneet_6v', N'p_lataa_f_koulutukseen_sijoittuneet_6v')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_aiemmat_tutkinnot', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_edellisen_vuoden_opiskelut', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_edelliset_haut', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_hakijat', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_16', N'f_Moninkertainen_haku_uudet_haut', N'p_lataa_MKH_f_K3_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_9', N'f_aloittaneiden_lapaisy', N'p_lataa_f_aloittaneiden_lapaisy_esivalmistelu')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K3_9', N'f_aloittaneiden_lapaisy', N'p_lataa_f_aloittaneiden_lapaisy')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_22', N'f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan', N'p_lataa_f_yli_15-vuotiaat_koulutuksen_kielen_ja_asuinkunnan_mukaan')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K4_3', N'f_TJ_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta', N'p_lataa_TJ_f_4_3')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_1', N'f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_2', N'f_korkeakoulujen_tutkimus_kehitys_5_1_henkilot_5_2_tyovuodet', N'p_lataa_korkeakoulujen_tutkimus_kehitys')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K5_5', N'f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat', N'p_lataa_f_K5_5_Tieteen_ja_teknologian_henkilovoimavarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_10', N'f_Opettajat_ammatillinen_koulutus_kelpoisuus_koulutus', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_11', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_12', N'f_Opettajat_vapaa_sivistystyo_kelpoisuus_aine', N'p_lataa_OPE')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K7_13', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R1_12', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R1_13', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_ainevalinnat_perusopetuksessa', N'p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_OTV_2_1_R2_22_Peruskoulutiedosto_Oppilaitostason_oppil_ja_opisk', N'p_lataa_OTV_f_2_1_R2_22')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_opetus', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_erityisen_tuen_oppilaiden_oppimaara', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_jopo_oppilaat', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_kuljetusetuutta_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_majoitusetuutta_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_peruskoulun_aloittaneiden_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_peruskoulun_ilman_todistusta_paattaneiden_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_tehostetun_tuen_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_tukea_saavien_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_Perusasteen_erityisopetus_vieraskielisten_tehostetun_tuen_oppilaiden_lkm', N'p_lataa_perusopetuksen_erityisopetus')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_perusopetuksen_kieltenmaara', N'p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R2_22', N'f_perusopetuksen_oppilasmaarat', N'p_lataa_AP_f_2_1_R2_22_Peruskoulutiedosto_kieltenmaara_oppilasmaarat')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_14', N'f_alueella_tyossakayvat', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_14a', N'f_alueella_tyossakayvat', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_14b', N'f_alueella_tyossakayvat_toimialoittain', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_15', N'f_alueella_tyossakayvat_1v', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_16', N'f_tyossakayvat_ammateittain', N'p_lataa_tyossakayvat_4_14_4_15_4_16')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_17a', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_17b', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_18a', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_18b', N'f_elakkeelle_siirtyneet_ja_kuolleet', N'p_lataa_f_elakkeelle_siirtyneet_ja_kuolleet_R_4_17_4_18')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_19', N'f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit', N'p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_20', N'f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit', N'p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_23', N'f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit', N'p_lataa_f_tyollisten_ammattisiirtymat_ja_aiemmat_ammatit')
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_5', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_6a', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_6b', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_R4_8', NULL, NULL)
GO
INSERT [dbo].[Vipunen_aineisto_fakta_proseduuri] ([aineisto_avain], [fakta], [proseduuri]) VALUES (N'TK_K2_8e', N'f_2_8e_Korkeakoulun_aloittaneiden_mediaani_iat', N'p_lataa_f_2_8e')
GO
USE [ANTERO]