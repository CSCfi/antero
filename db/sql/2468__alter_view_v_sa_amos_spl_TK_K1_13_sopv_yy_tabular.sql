USE [ANTERO]
GO

/****** Object:  View [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular]    Script Date: 7.10.2019 12:26:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular] AS 

--Päivitetty 8.8.2019, jhe, 20.8.2019

--drop table [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
--go
--select * 
--into [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
--from [sa].[v_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
--go

--select count(*) from [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]
--select top 10 * from [sa].[d_sa_amos_spl_TK_K1_13_sopv_yy_tabular]


SELECT 
-- Karin speksi meilissä 19.8.2019
--"Ja siinä 2.7.2017 lähettämässäni muutokset ja lisäykset exceliissä oli myös pyyntö lisätä Rah.per: tutk. suor. työll. ja jatko-opisk painotetut -raportille
--muuttuja Tutkinnon suoritusvuosi (joka siis saa arvon 2016) sekä muuttuja Tilastovuosi (saa arvon 2017). Viedään nämä molemmat myös suodattimeksi."

--Joten alla tilv-kenttä tulee näkymään raportilla Tutkinnon suoritusvuotena ja kovakoodattu arvo '2017' puolestaan tilastovuotena.


  tilv, 
  '2017' as tilastovuosi,
  aineisto, 
  jarj_opisk, 
  jarjnimi_opisk, 
  jarj_opisk + ' ' + jarjnimi_opisk as ytunnus_jarjnimi_opisk, 

--jhe 26.6.2019 Valtterin ja Ainon PBI-näkymiin pari kenttää lisää
  omistajatyyppi_koodi,
  omistajatyyppi,

  --jhe 22.5.2019 kommentoitu pois aluetietoa, jota ei ainakaan toistaiseksi raportilla tarvita 
  --jarj_tutk,
    --     jarjnimi_tutk,
 
  jarjmaak, 
  jarjmaaknimi, 
  
  --tutkmaak,
     --    tutkmaaknimi,
  alvv, 
  allk, 
  allk_kytkin, 
  amas_tilvseur, 
  amas_tilvseur_kytkin, 
  amase, 
  amase_kytkin, 
  amash, 
  amash_kytkin, 
  maassaolo_tilvseur, 
  maassaolo_tilvseur_kytkin, 
  oppis, 
  oppis_kytkin, 
  prioriteetti, 
  prioriteetti_kytkin, 
  ptoim1r2e, 
  ptoim1r2e_kytkin, 
  ptoim1r2h, 
  ptoim1r2h_kytkin, 
  ptoim1r2_tilvseur, 
  ptoim1r2_tilvseur_kytkin, 
  toteuma_tutk, 
  toteuma_tutk_kytkin, 
  tutklaja, 
  tutklaja_kytkin, 
  tyov, 
  tyov_kytkin, 
  kaste_t2, 
  kaste_t2ni, 
  iscfibroad2013, 
  kala_t1ni, 
  kaste_t2_e, 
  kaste_t2ni_e, 
  kaste_t2_evj, 
  kaste_t2ni_evj, 
  kaste_t2_avh, 
  kaste_t2ni_avh, 
  kaste_t2_tilvseur, 
  kaste_t2ni_tilvseur, 
  iscfibroad2013_tilvseur, 
  kala_t1ni_tilvseur, 
  suor_koko_tutk_yhteensa, 
  tyolliset_opiskelijat_ja_tyottomat_yhteensa, 
  jarjestajakerroin, 
  suor_koko_tutk, 
  suor_tutk_osia, 
  tutk_suor_1, 
  tutk_suor_2, 
  tutk_suor_3, 
  tutk_suor_4, 
  tutk_osia_suor_1, 
  tutk_osia_suor_2, 
  tutk_osia_suor_3, 
  tutk_osia_suor_4, 
  tutk_suor_5, 
  tutk_suor_6, 
  tutk_suor_7, 
  tutk_suor_8, 
  tutk_osia_suor_5, 
  tutk_osia_suor_6, 
  tutk_osia_suor_7, 
  tutk_osia_suor_8, 
  lkm, 
  tyolliset_ja_opiskelijat, 
  tyolliset, 
  opiskelijat, 
  tyolliset_opiskelijat_ja_tyottomat, 
  statuskerroin, 
  aluekerroin, 
  statuskerroin * aluekerroin * jarjestajakerroin * tyolliset AS tyollisten_painotetut_pisteet, 
  statuskerroin * jarjestajakerroin * opiskelijat AS opiskelijoiden_painotetut_pisteet, 
  tyollistyneet_ei_tyollisena_ennen_koulutusta, 
  tyollistyneet_tyollisena_ennen_koulutusta, 
  jatko_opiskelijat_ei_tyollisena_ennen_koulutusta, 
  jatko_opiskelijat_tyollisena_ennen_koulutusta, 
  --lisätty 8.8.2019 jhe
  tyoton,
  muu_tai_tuntematon,

  luontipvm 
FROM 
  (
    SELECT 
      t.tilv, 
      t.aineisto, 
      t.jarj_opisk, 
      t.jarjnimi_opisk, 
	  okm8.omistajatyyppi_koodi,
      okm8.omistajatyyppi,
      --t.jarj_tutk,
        --        t.jarjnimi_tutk,
      t.jarjmaak, 
      t.jarjmaaknimi, 
      
      --t.tutkmaak,
         --       t.tutkmaaknimi,
      t.alvv, 
      t.allk, 
      t.allk_kytkin, 
      t.amas_tilvseur, 
      t.amas_tilvseur_kytkin, 
      t.amase, 
      t.amase_kytkin, 
      t.amash, 
      t.amash_kytkin, 
      t.maassaolo_tilvseur, 
      t.maassaolo_tilvseur_kytkin, 
      t.oppis, 
      t.oppis_kytkin, 
      t.prioriteetti, 
      t.prioriteetti_kytkin, 
      t.ptoim1r2e, 
      t.ptoim1r2e_kytkin, 
      t.ptoim1r2h, 
      t.ptoim1r2h_kytkin, 
      t.ptoim1r2_tilvseur, 
      t.ptoim1r2_tilvseur_kytkin, 
      t.toteuma_tutk, 
      t.toteuma_tutk_kytkin, 
      t.tutklaja, 
      t.tutklaja_kytkin, 
      t.tyov, 
      t.tyov_kytkin, 
      t.kaste_t2, 
      t.kaste_t2ni, 
      t.iscfibroad2013, 
      t.kala_t1ni, 
      t.kaste_t2_e, 
      t.kaste_t2ni_e, 
      t.kaste_t2_evj, 
      t.kaste_t2ni_evj, 
      t.kaste_t2_avh, 
      t.kaste_t2ni_avh, 
      t.kaste_t2_tilvseur, 
      t.kaste_t2ni_tilvseur, 
      t.iscfibroad2013_tilvseur, 
      t.kala_t1ni_tilvseur, 
      j.suor_koko_tutk_yhteensa, 
      j.tyolliset_opiskelijat_ja_tyottomat_yhteensa, 
      j.jarjestajakerroin, 
      t.suor_koko_tutk, 
      t.suor_tutk_osia, 
      t.tutk_suor_1, 
      t.tutk_suor_2, 
      t.tutk_suor_3, 
      t.tutk_suor_4, 
      t.tutk_osia_suor_1, 
      t.tutk_osia_suor_2, 
      t.tutk_osia_suor_3, 
      t.tutk_osia_suor_4, 
      t.tutk_suor_5, 
      t.tutk_suor_6, 
      t.tutk_suor_7, 
      t.tutk_suor_8, 
      t.tutk_osia_suor_5, 
      t.tutk_osia_suor_6, 
      t.tutk_osia_suor_7, 
      t.tutk_osia_suor_8, 
      t.lkm, 
      t.tyolliset_ja_opiskelijat, 
      t.tyolliset, 
      t.opiskelijat, 
      t.tyolliset_opiskelijat_ja_tyottomat, 
      t.tyollistyneet_ei_tyollisena_ennen_koulutusta, 
      t.tyollistyneet_tyollisena_ennen_koulutusta, 
      t.jatko_opiskelijat_ei_tyollisena_ennen_koulutusta, 
      t.jatko_opiskelijat_tyollisena_ennen_koulutusta, 
	  --lisätty kaksi kenttaa 8.8.2019, jhe
	  t.tyoton,
	  t.muu_tai_tuntematon,

      t.statuskerroin, 
      t.aluekerroin, 
      t.luontipvm 
    FROM 
      sa.d_sa_amos_spl_TK_K1_13_sopv_yy_piirteet AS t 
      INNER JOIN sa.v_sa_amos_spl_TK_K1_13_sopv_yy_jarjestajakerroin AS j ON t.jarj_opisk = j.jarj_opisk
  LEFT JOIN [sa].[sa_amos_siirtotiedosto_okm8] as okm8
  on t.jarj_opisk=okm8.koul_jarj

  ) AS t_1
 




