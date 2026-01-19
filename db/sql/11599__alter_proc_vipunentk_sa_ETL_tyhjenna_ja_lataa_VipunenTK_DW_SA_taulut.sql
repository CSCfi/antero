USE [VipunenTK_SA]
GO

/****** Object:  StoredProcedure [dbo].[ETL_tyhjenna_ja_lataa_VipunenTK_DW_SA_taulut]    Script Date: 19.1.2026 16.13.15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












/****** Script for SelectTopNRows command from SSMS  ******/


ALTER PROCEDURE [dbo].[ETL_tyhjenna_ja_lataa_VipunenTK_DW_SA_taulut] AS 

/** sa-tauluihin ladattavat DW-kannassa **/

PRINT N'Starting 1_21_1_22 load';
truncate table VipunenTK_DW.dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat;
insert VipunenTK_DW.dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat select * from [dbo].[v_sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat];
PRINT N'1_21_1_22 ok';

PRINT N'Starting 2_11 load';
truncate table VipunenTK_DW.[dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton];
insert into VipunenTK_DW.[dbo].[sa_2_11_Oppilaitosten_tutkintoon_johtamaton] select * from [v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton];
--vst-oppilaitostyyppi
Truncate table VipunenTK_DW.[dbo].sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi
Insert into VipunenTK_DW.[dbo].sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi Select * from VipunenTK_SA.[dbo].v_sa_2_11_Oppilaitosten_tutkintoon_johtamaton_vst_oppilaitostyyppi
PRINT N'2_11 ok';

PRINT N'Starting 2_11b load';
truncate table VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili;
insert into VipunenTK_DW.[dbo].sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili select * from [v_sa_2_11b_Vapaan_sivistystyon_opiskelijaprofiili];
PRINT N'2_11 ok';

PRINT N'Starting 2_13 load';
truncate table VipunenTK_DW.[dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan];
insert into VipunenTK_DW.[dbo].[sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan] select * from [VipunenTK_SA].dbo.[v_sa_2_13_Tutkintoon_johtavan_koulutuksen_opiskelijat_kansalaisuuden_mukaan];
PRINT N'2_13 ok';

PRINT N'Starting 2_14 load';
truncate table VipunenTK_DW.[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan];
insert into VipunenTK_DW.[dbo].[sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan] select * from [VipunenTK_SA].dbo.[v_sa_2_14_Tutkintoon_johtavan_koulutuksen_opiskelijat_syntymamaan_mukaan];
PRINT N'2_14 ok';

PRINT N'Starting 2_15 load';
truncate table VipunenTK_DW.[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan];
insert into VipunenTK_DW.[dbo].[sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan] select * from [VipunenTK_SA].dbo.[v_sa_2_15_Tutkintoon_johtavan_koulutuksen_opiskelijat_aidinkielen_mukaan];
PRINT N'2_15 ok';


PRINT N'Starting K2_17a load';
truncate table [VipunenTK_DW].[dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk];
INSERT INTO [VipunenTK_DW].[dbo].[sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_K2_17a_Ulkomaalaistaustaiset_opisk_ja_tutk];
PRINT N'K2_17a ok';

PRINT N'Starting K2_17b load';
truncate table [VipunenTK_DW].[dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk];
INSERT INTO [VipunenTK_DW].[dbo].[sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_K2_17b_Ulkomaalaistaustaiset_opisk_ja_tutk];
PRINT N'K2_17b ok';


PRINT N'Starting 2_23 load';
truncate table vipunentk_dw..sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk;
insert into vipunentk_dw..sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk select * from v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk;
PRINT N'2_23 ok';

PRINT N'Starting 2_24 load';
truncate table vipunentk_dw..sa_2_24_Tuva_osallistuneet_ja_suorittaneet;
insert into vipunentk_dw..sa_2_24_Tuva_osallistuneet_ja_suorittaneet select * from v_sa_2_24_Tuva_osallistuneet_ja_suorittaneet;
PRINT N'2_24 ok';

PRINT N'Starting 2_27a load';
truncate table vipunentk_dw..sa_2_27a_perusopetuksen_katsomusaineet_maakunta;
insert into vipunentk_dw..sa_2_27a_perusopetuksen_katsomusaineet_maakunta select * from v_sa_2_27a_perusopetuksen_katsomusaineet_maakunta;
PRINT N'2_27a ok';

PRINT N'Starting 2_27b load';
truncate table vipunentk_dw..sa_2_27b_perusopetuksen_katsomusaineet_jarjestaja;
insert into vipunentk_dw..sa_2_27b_perusopetuksen_katsomusaineet_jarjestaja select * from v_sa_2_27b_perusopetuksen_katsomusaineet_jarjestaja;
PRINT N'2_27b ok';

PRINT N'Starting 2_3 load';
truncate table vipunentk_dw..sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat;
insert into vipunentk_dw..sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3_Lukio_ja_amm_koulutuksen_opiskelijat;
PRINT N'2_3 ok';

PRINT N'Starting 2_3h load';
truncate table vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat
insert into vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat
PRINT N'2_3h ok';

PRINT N'Starting 2_3efg load';
truncate table vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat
insert into vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat
PRINT N'2_3efg ok';

PRINT N'Starting 2_4efg load';
truncate table vipunentk_dw..sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot
insert into vipunentk_dw..sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot select * from v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot
PRINT N'2_4efg ok';

PRINT N'Starting 2_4 load';
truncate table vipunentk_dw..sa_2_4_Amm_koulutuksen_tutkinnot;
insert into vipunentk_dw..sa_2_4_Amm_koulutuksen_tutkinnot select * from v_sa_2_4_Amm_koulutuksen_tutkinnot;
PRINT N'2_4 ok';

PRINT N'Starting 2_5 load';

truncate table VipunenTK_DW.dbo.sa_2_5_Lukiokoulutuksen_ainevalinnat;
insert into VipunenTK_DW.dbo.sa_2_5_Lukiokoulutuksen_ainevalinnat Select * from VipunenTK_SA.dbo.v_sa_2_5_Lukiokoulutuksen_ainevalinnat;

PRINT N'2_5 ok';

PRINT N'Starting 2_8e load';
truncate table vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat;
insert into vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat select * from v_sa_2_8e_Korkeakoulut_opiskelijat;
PRINT N'2_8e ok';

PRINT N'Starting 2_8 load';
truncate table vipunentk_dw..sa_2_8_Korkeakoulut_opiskelijat;
insert into vipunentk_dw..sa_2_8_Korkeakoulut_opiskelijat select * from v_sa_2_8_Korkeakoulut_opiskelijat;
PRINT N'2_8 ok';

PRINT N'Starting 2_9 load';
truncate table vipunentk_dw..sa_2_9_Korkeakoulut_tutkinnot;
insert into vipunentk_dw..sa_2_9_Korkeakoulut_tutkinnot select * from v_sa_2_9_Korkeakoulut_tutkinnot;
PRINT N'2_9 ok';

PRINT N'Starting 2_8f_2_9d load';
truncate table vipunentk_dw..sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan;
insert into vipunentk_dw..sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan select * from v_sa_2_8f_2_9d_Korkeakouluopiskelijat_ja_tutkinnot_syntyperan_mukaan;
PRINT N'2_8f_2_9d ok';

PRINT N'Starting 3_14 load';

truncate table vipunentk_dw..sa_3_14_Lukio_ja_amm_opisk_mediaani_iat;
insert into vipunentk_dw..sa_3_14_Lukio_ja_amm_opisk_mediaani_iat select * from v_sa_3_14_Lukio_ja_amm_opisk_mediaani_iat;

PRINT N'3_14 ok';
PRINT N'Starting 3_15 load';

truncate table vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat;
insert into vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat select * from v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat;

PRINT N'3_15 ok';

PRINT N'Starting K3_16 load';
truncate table vipunentk_dw..sa_K3_16_Moninkertainen_haku;
insert into vipunentk_dw..sa_K3_16_Moninkertainen_haku select * from v_sa_K3_16_Moninkertainen_haku;
PRINT N'K3_16 ok';

PRINT N'Starting 3_4 load';

truncate table vipunentk_dw..sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat;
insert into vipunentk_dw..sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat select * from v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat;

PRINT N'3_4 ok';

PRINT N'Starting 4_1 load';
truncate table vipunentk_dw..[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen];
insert into vipunentk_dw..[sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen] select * from [v_sa_4_1_Perusopetuksen_lisäopetuksen_päättäneiden_sijoittuminen];
PRINT N'4_1 ok';

PRINT N'Starting 4_2 load';
truncate table vipunentk_dw..sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta;
insert into vipunentk_dw..sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta select * from v_sa_4_2_Vaeston_koulutusrakenne_ja_paaasiallinen_toiminta;
PRINT N'4_2 ok';

PRINT N'Starting 4_2d load';
truncate table vipunentk_dw..sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan;
insert into vipunentk_dw..sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan select * from v_sa_4_2d_Vaeston_koulutusrakenne_syntyperan_mukaan;
PRINT N'4_2d ok';

PRINT N'Starting 4_3 load';
truncate table vipunentk_dw..sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta;
insert into vipunentk_dw..sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta select * from v_sa_4_3_Tutkinnon_suorittaneiden_paaasiallinen_toiminta;
PRINT N'4_3 ok';

PRINT N'Starting 4_3b load';
truncate table vipunentk_dw..sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan;
insert into vipunentk_dw..sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan select * from v_sa_4_3b_Tutkinnon_suorittaneiden_paaasiallinen_toiminta_syntyperan_mukaan;
PRINT N'4_3b ok';

PRINT N'Starting 4_5 load';
Truncate table [VipunenTK_DW].[dbo].[sa_4_5_Tyovoimatutkimus_tyolliset]
Insert into [VipunenTK_DW].[dbo].[sa_4_5_Tyovoimatutkimus_tyolliset]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_5_Tyovoimatutkimus_tyolliset]
PRINT N'4_5 ok';

PRINT N'Starting 4_6ab load';
Truncate table [VipunenTK_DW].[dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]
Insert into [VipunenTK_DW].[dbo].[sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat]
PRINT N'4_6ab ok';

PRINT N'Starting 4_7 load';
Truncate table [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_7_Tutkinnon_suorittaneiden_aiempi_koulutus]
PRINT N'4_7 ok';

PRINT N'Starting 4_8 load';
Truncate table [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
Insert into [VipunenTK_DW].[dbo].[sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_4_8_Tutkinnon_suorittaneiden_myohempi_koulutus]
PRINT N'4_8 ok';

PRINT N'Starting 4_9 load';

truncate table vipunentk_dw..sa_4_9_Vaestorakenne_kunnittain;
insert into vipunentk_dw..sa_4_9_Vaestorakenne_kunnittain select * from v_sa_4_9_Vaestorakenne_kunnittain;

PRINT N'4_9 ok';

PRINT N'Starting 4_10 load';
truncate table vipunentk_dw..[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain];
insert into vipunentk_dw..[sa_4_10_Vaestorakenne_aidinkielen_mukaan_maakunnittain] select * from [v_sa_4_10_Väestörakenne_äidinkielen_mukaan_maakunnittain];
PRINT N'4_10 ok';

PRINT N'Starting 4_11 load';
truncate table vipunentk_dw..[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan];
insert into vipunentk_dw..[sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan] select * from [v_sa_4_11_Vaeston_maassamuutto_asuinmaakunnan_ja_koulutuksen_mukaan];
PRINT N'4_11 ok';

PRINT N'Starting R4_19 load';
truncate table [VipunenTK_DW].[dbo].[sa_R4_19_Tyollisten_ammattisiirtymat];
INSERT INTO [VipunenTK_DW].[dbo].[sa_R4_19_Tyollisten_ammattisiirtymat] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_R4_19_Tyollisten_ammattisiirtymat];
PRINT N'R4_19 ok';

PRINT N'Starting R4_20 load';
truncate table [VipunenTK_DW].[dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit];
INSERT INTO [VipunenTK_DW].[dbo].[sa_R4_20_Tyollisten_aiemmat_ammatit] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_R4_20_Tyollisten_aiemmat_ammatit];
PRINT N'R4_20 ok';

PRINT N'Starting R4_23 load';
truncate table [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat];
INSERT INTO [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat];
PRINT N'R4_23 ok';

PRINT N'Starting 5_1 load';
Truncate table [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain];
Insert into [VipunenTK_DW].[dbo].[sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain] Select * FROM VipunenTK_SA.[dbo].[v_sa_5_1_Yliopistojen_tutkimushenkilökunta_yliopistoittain];
PRINT N'5_1 ok';

PRINT N'Starting 5_2 load';
Truncate table [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain];
Insert into [VipunenTK_DW].[dbo].[sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain] Select * FROM VipunenTK_SA.[dbo].[v_sa_5_2_Yliopistojen_tutkimustyovuodet_yliopistoittain];
PRINT N'5_2 ok';

PRINT N'Starting 5_3 load';
Truncate table [VipunenTK_DW].[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain];
Insert into [VipunenTK_DW].[dbo].[sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain] Select * FROM VipunenTK_SA.[dbo].[v_sa_5_3_Yliopistojen_tutkimustyovuodet_ja_tutkimusmenot_rahoituslahteittain_menolajeittain_yliopistoittain];
PRINT N'5_3 ok';

PRINT N'Starting 5_4 load';
Truncate table [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]
Insert into [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]
  Select * FROM VipunenTK_SA.[dbo].[v_sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys]
PRINT N'5_4 ok';

PRINT N'Starting 5_4 sekt load';
Truncate table [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys];
Insert into [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] Select * FROM VipunenTK_SA.[dbo].[v_sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys];
PRINT N'5_4 sekt ok';

PRINT N'Starting 5_4 yosair load';
Truncate table [VipunenTK_DW].[dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys];
Insert into [VipunenTK_DW].[dbo].[sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys] Select * FROM VipunenTK_SA.[dbo].[v_sa_5_4_Yosairaaloiden_tutkimus_ja_kehitys];
PRINT N'5_4 yosair ok';

PRINT N'Starting 5_5 load';
Truncate table [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat];
Insert into [VipunenTK_DW].[dbo].[sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat] Select * FROM VipunenTK_SA.[dbo].[v_sa_K5_5_Tieteen_ja_teknologian_henkilovoimavarat];
PRINT N'5_5 ok';

/** f-tauluihin ladattavat DW-kannassa **/
PRINT N'Starting 2_1 load';
truncate table VipunenTK_DW.[dbo].[f_2_1_Peruskoulutiedosto];
insert into VipunenTK_DW.[dbo].[f_2_1_Peruskoulutiedosto] select * from [v_sa_2_1_Peruskoulutiedosto];
PRINT N'2_1 ok';

PRINT N'Starting 2_10 load';
truncate table [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus];
INSERT INTO [VipunenTK_DW].[dbo].[sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus];
PRINT N'2_10 ok';

PRINT N'Starting R2_20 load';
truncate table [VipunenTK_DW].[dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan];
INSERT INTO [VipunenTK_DW].[dbo].[sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan];
PRINT N'2_20 ok';

PRINT N'Starting R2_22 load';
truncate table VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk;
insert into VipunenTK_DW.dbo.f_R2_22_Oppilaitostason_oppil_ja_opisk select * from v_sa_R2_22_Oppilaitostason_oppil_ja_opisk;
PRINT N'R2_22 ok';

PRINT N'Starting R4_14 load';
Truncate table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan];
Insert into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] Select * from [VipunenTK_SA].[dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan];
PRINT N'R4_14 ok';

PRINT N'Starting R4_14b load';
Truncate table [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan];
Insert into [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] Select * from [VipunenTK_SA].[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan];
PRINT N'R4_14b ok';

PRINT N'Starting R4_15 load';
Truncate table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh];
Insert into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] Select * from [VipunenTK_SA].[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh];
PRINT N'R4_15 ok';

PRINT N'Starting R4_16 load';
Truncate table [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain];
Insert into [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain] Select * from [VipunenTK_SA].[dbo].[v_sa_R4_16_Tyossakayvat_ammateittain];
PRINT N'R4_16 ok';

PRINT N'Starting R4_17 load';
truncate table [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti];
insert into [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti] SELECT *   FROM [VipunenTK_SA].[dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti];
PRINT N'R4_17 ok';

PRINT N'Starting R4_18 load';
truncate table [VipunenTK_DW].[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin];
INSERT INTO [VipunenTK_DW].[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin] SELECT * FROM [VipunenTK_SA].[dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin];
PRINT N'R4_18 ok';

PRINT N'Starting 7_1 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
Insert into [VipunenTK_DW].[dbo].[f_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot] Select * from [VipunenTK_SA].[dbo].[v_sa_7_1_Perusopetuksen_opettajat_kelpoisuus_opetusryhmakoot]
PRINT N'7_1 ok';

PRINT N'Starting 7_2 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
Insert into [VipunenTK_DW].[dbo].[f_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot] Select * from [VipunenTK_SA].[dbo].[v_sa_7_2_Perusopetuksen_opettajat_koulutuksen_jarjestaja_opetusryhmakoot]
PRINT N'7_2 ok';

PRINT N'Starting 7_3 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_3_Perusopetuksen_opettajat_osallistuminen_taydennyskoulutukseen] Select * from [VipunenTK_SA].[dbo].[v_sa_7_3_Perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
PRINT N'7_3 ok';

PRINT N'Starting 7_4 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
Insert into [VipunenTK_DW].[dbo].[f_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine] Select * from [VipunenTK_SA].[dbo].[v_sa_7_4_Lukiokoulutuksen_opettajat_kelpoisuus_aine]
PRINT N'7_4 ok';

PRINT N'Starting 7_5 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
Insert into [VipunenTK_DW].[dbo].[f_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja] Select * from [VipunenTK_SA].[dbo].[v_sa_7_5_Lukiokoulutuksen_opettajat_koulutuksen_jarjestaja]
PRINT N'7_5 ok';

PRINT N'Starting 7_6 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_6_Lukiokoulutuksen_opettajat_osallistuminen_taydennyskoulutukseen] Select * from [VipunenTK_SA].[dbo].[v_sa_7_6_Lukiokoulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
PRINT N'7_6 ok';

PRINT N'Starting 7_7 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
Insert into [VipunenTK_DW].[dbo].[f_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] Select * from [VipunenTK_SA].[dbo].[v_sa_7_7_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
PRINT N'7_7 ok';

PRINT N'Starting 7_8 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen] Select * from [VipunenTK_SA].[dbo].[v_sa_7_8_Ammatillisen_koulutuksen_opettajat_osallistuminen_täydennyskoulutukseen]
PRINT N'7_8 ok';

PRINT N'Starting 7_9 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen] Select * from [VipunenTK_SA].[dbo].[v_sa_7_9_Vapaan_sivistystyön_opettajat_osallistuminen_täydennyskoulutukseen]
PRINT N'7_9 ok';

PRINT N'Starting 7_10 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
Insert into [VipunenTK_DW].[dbo].[f_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus] Select * from [VipunenTK_SA].[dbo].[v_sa_7_10_Ammatillisen_koulutuksen_opettajat_kelpoisuus_koulutus]
PRINT N'7_10 ok';

PRINT N'Starting 7_12 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
Insert into [VipunenTK_DW].[dbo].[f_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine] Select * from [VipunenTK_SA].[dbo].[v_sa_7_12_Vapaan_sivistystyön_opettajat_kelpoisuus_aine]
PRINT N'7_12 ok';

PRINT N'Starting 7_15 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
Insert into [VipunenTK_DW].[dbo].[f_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine] Select * from [VipunenTK_SA].[dbo].[v_sa_7_15_Taiteen_perusopetuksen_opettajat_kelpoisuus_aine]
PRINT N'7_15 ok';

PRINT N'Starting 7_17 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
Insert into [VipunenTK_DW].[dbo].[f_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen] Select * from [VipunenTK_SA].[dbo].[v_sa_7_17_Taiteen_perusopetuksen_opettajat_osallistuminen_täydennyskoulutukseen]
PRINT N'7_17 ok';

PRINT N'Starting 7_18 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
Insert into [VipunenTK_DW].[dbo].[f_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto] Select * from [VipunenTK_SA].[dbo].[v_sa_7_18_Perus_ja_lukioasteen_opettajat_kelpoisuus_kokonaisaineisto]
PRINT N'7_18 ok';

PRINT N'Starting 7_19 load';
Truncate table [VipunenTK_DW].[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
Insert into [VipunenTK_DW].[dbo].[f_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto] Select * from [VipunenTK_SA].[dbo].[v_sa_7_19_Ammatillisen_koulutuksen_opettajat_kelpoisuus_kokonaisaineisto]
PRINT N'7_19 ok';

PRINT N'Starting 3_1a load';
Truncate table [VipunenTK_DW].[dbo].[sa_3_1a_Oppisopimuskoulutus]
Insert into [VipunenTK_DW].[dbo].[sa_3_1a_Oppisopimuskoulutus] Select * from [VipunenTK_SA].[dbo].[v_sa_3_1a_Oppisopimuskoulutus]
PRINT N'3_1a ok';


PRINT N'Starting 3_1b load';
Truncate table [VipunenTK_DW].[dbo].[sa_3_1b_Oppisopimuskoulutus]
Insert into [VipunenTK_DW].[dbo].[sa_3_1b_Oppisopimuskoulutus] Select * from [VipunenTK_SA].[dbo].[v_sa_3_1b_Oppisopimuskoulutus]
PRINT N'3_1b ok';

PRINT N'Starting 3_2 load';
Truncate table [VipunenTK_DW].[dbo].[sa_3_2_Oppisopimuskoulutus]
Insert into [VipunenTK_DW].[dbo].[sa_3_2_Oppisopimuskoulutus] Select * from [VipunenTK_SA].[dbo].[v_sa_3_2_Oppisopimuskoulutus_jatko_opinnot]
PRINT N'3_2 ok';

PRINT N'Starting K3_11 load';
Truncate table [VipunenTK_DW].[dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]
Insert into [VipunenTK_DW].[dbo].[sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta] Select * from [VipunenTK_SA].[dbo].[v_sa_K3_11_ Tutkinnon suorittaneiden osuus poistumasta]
PRINT N'K3_11 ok';

PRINT N'Starting 3_7 load';
Truncate table [VipunenTK_DW].[dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
Insert into [VipunenTK_DW].[dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] Select * from [VipunenTK_SA].[dbo].[v_sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
PRINT N'K3_7 ok';

PRINT N'Starting 3_8 load';
Truncate table [VipunenTK_DW].[dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
Insert into [VipunenTK_DW].[dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] Select * from [VipunenTK_SA].[dbo].[v_sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
PRINT N'K3_8 ok';


GO


