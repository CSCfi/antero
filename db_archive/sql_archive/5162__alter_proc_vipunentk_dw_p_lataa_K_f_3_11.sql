USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_K_f_3_11]    Script Date: 23.11.2021 14:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_K_f_3_11] AS

--Ennakkoaineisto poistunut sopv19, joten poistetu apumuuttuja sekä muokattu rajausehtoa. / CSC Juha 23.11.2021

--DECLARE @maxTilastovuosiL nvarchar(6);

--SET @maxTilastovuosiL = (select max(tilastovuosi) from [dbo].[f_K_3_11_Keskeyttaneet] WHERE aineisto = 'L')

truncate table  [VipunenTK].[dbo].[f_keskeyttaneet]
insert into [VipunenTK].[dbo].[f_keskeyttaneet]


SELECT 
	 --tilastovuosi = f.tilastovuosi
	 tilastovuosi =  coalesce(d1.lukuvuosi,'-1')
	,tilv_date = f.tilv_date
	,aineisto_id=  coalesce(d2.id,-1)
	,lahde_id = coalesce(d3.id,-1)
	,sukupuoli_id = coalesce(d4.id,-1)
	,aidinkieli_versio1x_id = coalesce(d5.id,-1)
    ,ika_1v_id = coalesce(d6.id,-1)
	,ika_5v_id = coalesce(d7.id,-1)
	,kotikunta_id = coalesce(d8.id,-1)
	,kansalaisuus_versio1_id = coalesce(d9.id,-1)
	,eumaa_id = coalesce(d10.id,-1)
	,etamaa_id = coalesce(d11.id,-1)
	,pohjoismaa_id = coalesce(d12.id,-1)
	,kirjoihintulovuosi_id = coalesce(d13.kausi_id,'-1')
	,kirjoihintulolukukausi_id = coalesce(d14.kausi_id,'-1')
	,opiskelijan_olo_lk_id = coalesce(d15.id,-1)
	,oppilaitoksen_taustatiedot_id = coalesce(d16.id,-1)
	,koulutusluokitus_id = coalesce(d17.id,-1)
	,koulutuksen_kieli_versio1_id = coalesce(d18.id,-1)
	,koulutuksen_kunta_id = coalesce(d19.id,-1)
	,opetushallinnon_koulutus_id = coalesce(d20.id,-1)
	,hallinnonala2_id = coalesce(d20b.id,-1)
	,koulutustyyppi_id = coalesce(d21.id,-1)
	,tutkinnon_suorittamismaakunta_id = coalesce(d22.id,-1)
	,tutkinnon_jarjestaja_id = coalesce(d23.id,-1)
	,tutkinnon_suorittamisoppilaitos_id = coalesce(d24.id,-1)
	,tutkinnon_koulutusluokitus_id = coalesce(d25.id,-1)
	,tutkinnon_koulutustyyppi_id = coalesce(d26.id,-1)
	,seuraavan_vuoden_maakunta_id = coalesce(d27.id,-1)
	,seuraavan_vuoden_jarjestaja_id = coalesce(d28.id,-1)
	,seuraavan_vuoden_oppilaitos_id = coalesce(d29.id,-1)
	,seuraavan_vuoden_koulutusluokitus_id = coalesce(d30.id,-1)
	,seuraavan_vuoden_koulutustyyppi_id = coalesce(d31.id,-1)
	,paaasiallinen_toiminta_versio2_id = coalesce(d32.id,-1)
	,ammattiasema_id = coalesce(d33.id,-1)
	,opiskelijat = f.opiskelijat
  --uudet
	--1
	,[1a_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id]  = coalesce(d0_34.id,-1)
	,[1b_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan_id] = coalesce(d0_35.id,-1)
	,[1c_tutkinto_alkuperaisella_kaste_t2ella_id] = coalesce(d0_36.id,-1)
	,[1d_tutkinto_muulla_kaste_t2ella_id] = coalesce(d0_37.id,-1)
	,[1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella_id] = coalesce(d0_38.id,-1)
	,[1f_jatkaa_opiskelua_muulla_kaste_t2ella_id] = coalesce(d0_39.id,-1)
	--2t1
	,[2a_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id] = coalesce(d1_40.id,-1)
	,[2b_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id] = coalesce(d1_41.id,-1)
	,[2bb_opiskelijoiden_opintojen_kulku_kala_t1_mukaan_id] = coalesce(d1_42.id,-1)
	,[2c_tutkinto_alkuperaisella_koulutualalla_id] = coalesce(d1_43.id,-1)
	,[2d_tutkinto_muulla_kala_t1lla_id] = coalesce(d1_44.id,-1)
	,[2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla_id] = coalesce(d1_45.id,-1)
	,[2f_jatkaa_opiskelua_muulla_kala_t1lla_id] = coalesce(d1_46.id,-1)
	--2t2
	,[2a_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id] = coalesce(d2_40.id,-1)
	,[2b_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id] = coalesce(d2_41.id,-1)
	,[2bb_opiskelijoiden_opintojen_kulku_kala_t2_mukaan_id] = coalesce(d2_42.id,-1)
	,[2c_tutkinto_alkuperaisella_koulutualalla_id] = coalesce(d2_43.id,-1)
	,[2d_tutkinto_muulla_kala_t2lla_id] = coalesce(d2_44.id,-1)
	,[2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla_id] = coalesce(d2_45.id,-1)
	,[2f_jatkaa_opiskelua_muulla_kala_t2lla_id] = coalesce(d2_46.id,-1)
	--2t3
	,[2a_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id] = coalesce(d3_40.id,-1)
	,[2b_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id] = coalesce(d3_41.id,-1)
	,[2bb_opiskelijoiden_opintojen_kulku_kala_t3_mukaan_id] = coalesce(d3_42.id,-1)
	,[2c_tutkinto_alkuperaisella_koulutualalla_id] = coalesce(d3_43.id,-1)
	,[2d_tutkinto_muulla_kala_t3lla_id] = coalesce(d3_44.id,-1)
	,[2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla_id] = coalesce(d3_45.id,-1)
	,[2f_jatkaa_opiskelua_muulla_kala_t3lla_id] = coalesce(d3_46.id,-1)
	--4bb
	,[4bb_opiskelijoiden_opintojen_kulku_jarj_ja_kaste_t2_mukaan_id] = coalesce(d4_56.id,-1)
  --vanhat
	,[1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id]  = coalesce(d34.id,-1)
	,[1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan_id] = coalesce(d35.id,-1)
	,[1c_tutkinto_alkuperaisella_koulutusasteella_2002_id] = coalesce(d36.id,-1)
	,[1d_tutkinto_muulla_koulutusasteella_2002_id] = coalesce(d37.id,-1)
	,[1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_id] = coalesce(d38.id,-1)
	,[1f_jatkaa_opiskelua_muulla_koulutusasteella_2002_id] = coalesce(d39.id,-1)
	,[2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id] = coalesce(d40.id,-1)
	,[2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id] = coalesce(d41.id,-1)
	,[2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan_id] = coalesce(d42.id,-1)
	,[2c_tutkinto_alkuperaisella_koulutualalla_2002_id] = coalesce(d43.id,-1)
	,[2d_tutkinto_muulla_koulutusalalla_2002_id] = coalesce(d44.id,-1)
	,[2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_id] = coalesce(d45.id,-1)
	,[2f_jatkaa_opiskelua_muulla_koulutusalalla_2002_id] = coalesce(d46.id,-1)
	,[3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id] = coalesce(d47.id,-1)
	,[3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id] = coalesce(d48.id,-1)
	,[3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan_id] = coalesce(d49.id,-1)
	,[3c_tutkinto_alkuperaisella_opintoalalla_2002_id] = coalesce(d50.id,-1)
	,[3d_tutkinto_muulla_opintoalalla_2002_id] = coalesce(d51.id,-1)
	,[3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_id] = coalesce(d52.id,-1)
	,[3f_jatkaa_opiskelua_muulla_opintoalalla_2002_id] = coalesce(d53.id,-1)
	,[4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id] = coalesce(d54.id,-1)
	,[4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id] = coalesce(d55.id,-1)
	,[4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan_id] = coalesce(d56.id,-1)
	,[4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla_id] = coalesce(d57.id,-1)
	,[4d_tutkinto_muulla_koulutuksen_jarjestajalla_id] = coalesce(d58.id,-1)
	,[4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_2002_id] = coalesce(d59.id,-1)
	,[4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_2002_id] = coalesce(d60.id,-1)
	,[5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id] =  coalesce(d61.id,-1)
	,[5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id] =  coalesce(d62.id,-1)
	,[5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan_id] =  coalesce(d63.id,-1)
	,[5c_tutkinto_alkuperaisessa_oppilaitoksella_id] = coalesce(d64.id,-1)
	,[5d_tutkinto_muussa_oppilaitoksella_id] = coalesce(d65.id,-1)
	,[5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_id] = coalesce(d66.id,-1)
	,[5f_jatkaa_opiskelua_muussa_oppilaitoksessa_id] = coalesce(d67.id,-1)
	,[6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id] =  coalesce(d68.id,-1)
	,[6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan_id] =  coalesce(d69.id,-1)
	,[6c_tutkinto_alkuperaisessa_maakunnassa_id] = coalesce(d70.id,-1)
	,[6d_tutkinto_muussa_maakunnassa_id] = coalesce(d71.id,-1)
	,[6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa_id] = coalesce(d72.id,-1)
	,[6f_jatkaa_opiskelua_muussa_maakunnassa_id] = coalesce(d73.id,-1)
	,[7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id] =  coalesce(d74.id,-1)
	,[7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan_id] =  coalesce(d75.id,-1)
	,[7c_tutkinto_alkuperaisella_koulutussektorilla_id] =  coalesce(d76.id,-1)
	,[7d_tutkinto_muulla_koulutussektorissa_id] = coalesce(d77.id,-1)
	,[7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla_id] = coalesce(d78.id,-1)
	,[7f_jatkaa_opiskelua_muulla_koulutussektorilla_id] = coalesce(d79.id,-1)
  --frm
FROM [VipunenTK_DW].[dbo].[f_K_3_11_Keskeyttaneet] f
LEFT JOIN VipunenTK..d_kausi   AS d1 ON d1.kausi_id  = f.tilastovuosi
LEFT JOIN VipunenTK..d_aineisto  AS d2 ON d2.aineisto_koodi=f.aineisto AND f.tilv_date between d2.alkaa and d2.paattyy
LEFT JOIN VipunenTK..d_lahde  AS d3 ON d3.lahde_koodi=f.lahde AND f.tilv_date between d3.alkaa and d3.paattyy
LEFT JOIN VipunenTK..d_sukupuoli  AS d4 ON d4.sukupuoli_koodi=f.sukupuoli AND f.tilv_date between d4.alkaa and d4.paattyy
LEFT JOIN VipunenTK..d_aidinkieli_versio1  AS d5 ON d5.aidinkieli_versio1_koodi=f.aidinkieli_versio1x AND f.tilv_date between d5.alkaa and d5.paattyy
LEFT JOIN VipunenTK..d_ika  AS d6 ON d6.ika_avain =f.ika_1v 
LEFT JOIN VipunenTK..d_ika  AS d7 ON d7.ika_avain =f.ika_5v 
LEFT JOIN VipunenTK..d_alueluokitus  AS d8 ON d8.alueluokitus_avain=f.kotikunta 
LEFT JOIN VipunenTK..d_kansalaisuus_versio1  AS d9 ON d9.kansalaisuus_versio1_koodi=f.kansalaisuus_versio1 AND f.tilv_date between d9.alkaa and d9.paattyy
LEFT JOIN VipunenTK..d_valtio AS d10 ON d10.valtio_avain   ='EU'+f.eumaa
LEFT JOIN VipunenTK..d_valtio AS d11 ON d11.valtio_avain   ='ETA'+f.eumaa
LEFT JOIN VipunenTK..d_pohjoismaa  AS d12 ON d12.pohjoismaa_koodi=f.pohjoismaa AND f.tilv_date between d12.alkaa and d12.paattyy
LEFT JOIN VipunenTK..d_kausi AS d13 ON d13.kausi_id  = f.kirjoihintulovuosi
LEFT JOIN VipunenTK..d_kausi AS d14 ON d14.kausi_id  = f.kirjoihintulolukukausi
LEFT JOIN VipunenTK..d_opiskelijan_olo  AS d15 ON d15.opiskelijan_olo_koodi=f.opiskelijan_olo_lk AND f.tilv_date between d15.alkaa and d15.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d16 ON d16.oppilaitos_avain=f.oppilaitoksen_taustatiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d17 ON d17.koulutusluokitus_avain=f.koulutusluokitus
LEFT JOIN VipunenTK..d_koulutuksen_kieli_versio1  AS d18 ON d18.koulutuksen_kieli_versio1_koodi=f.koulutuksen_kieli_versio1 AND f.tilv_date between d18.alkaa and d18.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d19 ON d19.alueluokitus_avain=f.koulutuksen_kunta 
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus  AS d20 ON d20.opetushallinnon_koulutus_koodi=f.opetushallinnon_koulutus AND f.tilv_date between d20.alkaa and d20.paattyy
LEFT JOIN VipunenTK..d_hallinnonala2  AS d20b ON d20b.hallinnonala_koodi=f.hallinnonala2
LEFT JOIN VipunenTK..d_koulutustyyppi  AS d21 ON d21.koulutustyyppi_koodi=f.koulutustyyppi AND f.tilv_date between d21.alkaa and d21.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d22 ON d22.alueluokitus_avain='MAAK'+f.tutkinnon_suorittamismaakunta 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d23 ON d23.oppilaitos_avain=f.tutkinnon_jarjestaja 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d24 ON d24.oppilaitos_avain=f.tutkinnon_suorittamisoppilaitos 
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d25 ON d25.koulutusluokitus_avain=f.tutkinnon_koulutusluokitus
LEFT JOIN VipunenTK..d_koulutustyyppi  AS d26 ON d26.koulutustyyppi_koodi=f.tutkinnon_koulutustyyppi AND f.tilv_date between d26.alkaa and d26.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d27 ON d27.alueluokitus_avain='MAAK'+f.seuraavan_vuoden_maakunta 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d28 ON d28.oppilaitos_avain=f.seuraavan_vuoden_jarjestaja 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d29 ON d29.oppilaitos_avain=f.seuraavan_vuoden_oppilaitos
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d30 ON d30.koulutusluokitus_avain=f.seuraavan_vuoden_koulutusluokitus
LEFT JOIN VipunenTK..d_koulutustyyppi  AS d31 ON d31.koulutustyyppi_koodi=f.seuraavan_vuoden_koulutustyyppi AND f.tilv_date between d31.alkaa and d31.paattyy
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta_versio2  AS d32 ON d32.paaasiallinen_toiminta_versio2_koodi=f.pääasiallinen_toiminta_versio2 AND f.tilv_date between d32.alkaa and d32.paattyy
LEFT JOIN VipunenTK..d_ammattiasema  AS d33 ON d33.ammattiasema_koodi=f.ammattiasema AND f.tilv_date between d33.alkaa and d33.paattyy
--uudet
--1
LEFT JOIN VipunenTK..d_opintojen_kulku_kaste_t2en_mukaan  AS d0_34 ON d0_34.opintojen_kulku_kaste_t2en_mukaan_koodi = f.[1a_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan] --AND f.tilv_date between d0_34.alkaa and d0_34.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kaste_t2en_mukaan  AS d0_35 ON d0_35.opintojen_kulku_kaste_t2en_mukaan_koodi=f.[1b_opiskelijoiden_opintojen_kulku_kaste_t2_mukaan] --AND f.tilv_date between d0_35.alkaa and d0_35.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_kaste_t2ella AS d0_36 ON d0_36.tutkinto_alkuperaisella_kaste_t2ella_koodi=f.[1c_tutkinto_alkuperaisella_kaste_t2ella] --AND f.tilv_date between d0_36.alkaa and d0_36.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_kaste_t2ella AS d0_37 ON d0_37.tutkinto_muulla_kaste_t2ella_koodi=f.[1d_tutkinto_muulla_kaste_t2ella] --AND f.tilv_date between d0_37.alkaa and d0_37.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_kaste_t2ella AS d0_38 ON d0_38.jatkaa_opiskelua_alkuperaisella_kaste_t2ella_koodi=f.[1e_jatkaa_opiskelua_alkuperaisella_kaste_t2ella] --AND f.tilv_date between d0_38.alkaa and d0_38.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_kaste_t2ella AS d0_39 ON d0_39.jatkaa_opiskelua_muulla_kaste_t2ella_koodi=f.[1f_jatkaa_opiskelua_muulla_kaste_t2ella] --AND f.tilv_date between d0_39.alkaa and d0_39.paattyy
--2t1
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t1n_mukaan  AS d1_40 ON d1_40.opintojen_kulku_kala_t1n_mukaan_koodi=f.[2a_opiskelijoiden_opintojen_kulku_kala_t1_mukaan] --AND f.tilv_date between d1_40.alkaa and d1_40.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t1n_mukaan  AS d1_41 ON d1_41.opintojen_kulku_kala_t1n_mukaan_koodi=f.[2b_opiskelijoiden_opintojen_kulku_kala_t1_mukaan] --AND f.tilv_date between d1_41.alkaa and d1_41.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t1n_mukaan_versio2  AS d1_42 ON d1_42.opintojen_kulku_kala_t1n_mukaan_versio2_koodi=f.[2bb_opiskelijoiden_opintojen_kulku_kala_t1_mukaan] --AND f.tilv_date between d1_42.alkaa and d1_42.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_kala_t1lla AS d1_43 ON d1_43.tutkinto_alkuperaisella_kala_t1lla_koodi=f.[2c_tutkinto_alkuperaisella_kala_t1lla] --AND f.tilv_date between d1_43.alkaa and d1_43.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_kala_t1lla AS d1_44 ON d1_44.tutkinto_muulla_kala_t1lla_koodi=f.[2d_tutkinto_muulla_kala_t1lla] --AND f.tilv_date between d1_44.alkaa and d1_44.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_kala_t1lla AS d1_45 ON d1_45.jatkaa_opiskelua_alkuperaisella_kala_t1lla_koodi=f.[2e_jatkaa_opiskelua_alkuperaisella_kala_t1lla] --AND f.tilv_date between d1_45.alkaa and d1_45.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_kala_t1lla AS d1_46 ON d1_46.jatkaa_opiskelua_muulla_kala_t1lla_koodi=f.[2f_jatkaa_opiskelua_muulla_kala_t1lla] --AND f.tilv_date between d46.alkaa and d46.paattyy
--2t2
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t2n_mukaan  AS d2_40 ON d2_40.opintojen_kulku_kala_t2n_mukaan_koodi=f.[2a_opiskelijoiden_opintojen_kulku_kala_t2_mukaan] --AND f.tilv_date between d2_40.alkaa and d2_40.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t2n_mukaan  AS d2_41 ON d2_41.opintojen_kulku_kala_t2n_mukaan_koodi=f.[2b_opiskelijoiden_opintojen_kulku_kala_t2_mukaan] --AND f.tilv_date between d2_41.alkaa and d2_41.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t2n_mukaan_versio2  AS d2_42 ON d2_42.opintojen_kulku_kala_t2n_mukaan_versio2_koodi=f.[2bb_opiskelijoiden_opintojen_kulku_kala_t2_mukaan] --AND f.tilv_date between d2_42.alkaa and d2_42.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_kala_t2lla AS d2_43 ON d2_43.tutkinto_alkuperaisella_kala_t2lla_koodi=f.[2c_tutkinto_alkuperaisella_kala_t2lla] --AND f.tilv_date between d2_43.alkaa and d2_43.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_kala_t2lla AS d2_44 ON d2_44.tutkinto_muulla_kala_t2lla_koodi=f.[2d_tutkinto_muulla_kala_t2lla] --AND f.tilv_date between d2_44.alkaa and d2_44.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_kala_t2lla AS d2_45 ON d2_45.jatkaa_opiskelua_alkuperaisella_kala_t2lla_koodi=f.[2e_jatkaa_opiskelua_alkuperaisella_kala_t2lla] --AND f.tilv_date between d2_45.alkaa and d2_45.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_kala_t2lla AS d2_46 ON d2_46.jatkaa_opiskelua_muulla_kala_t2lla_koodi=f.[2f_jatkaa_opiskelua_muulla_kala_t2lla] --AND f.tilv_date between d46.alkaa and d46.paattyy
--2t3
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t3n_mukaan  AS d3_40 ON d3_40.opintojen_kulku_kala_t3n_mukaan_koodi=f.[2a_opiskelijoiden_opintojen_kulku_kala_t3_mukaan] --AND f.tilv_date between d3_40.alkaa and d3_40.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t3n_mukaan  AS d3_41 ON d3_41.opintojen_kulku_kala_t3n_mukaan_koodi=f.[2b_opiskelijoiden_opintojen_kulku_kala_t3_mukaan] --AND f.tilv_date between d3_41.alkaa and d3_41.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_kala_t3n_mukaan_versio2  AS d3_42 ON d3_42.opintojen_kulku_kala_t3n_mukaan_versio2_koodi=f.[2bb_opiskelijoiden_opintojen_kulku_kala_t3_mukaan] --AND f.tilv_date between d3_42.alkaa and d3_42.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_kala_t3lla AS d3_43 ON d3_43.tutkinto_alkuperaisella_kala_t3lla_koodi=f.[2c_tutkinto_alkuperaisella_kala_t3lla] --AND f.tilv_date between d3_43.alkaa and d3_43.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_kala_t3lla AS d3_44 ON d3_44.tutkinto_muulla_kala_t3lla_koodi=f.[2d_tutkinto_muulla_kala_t3lla] --AND f.tilv_date between d3_44.alkaa and d3_44.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_kala_t3lla AS d3_45 ON d3_45.jatkaa_opiskelua_alkuperaisella_kala_t3lla_koodi=f.[2e_jatkaa_opiskelua_alkuperaisella_kala_t3lla] --AND f.tilv_date between d3_45.alkaa and d3_45.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_kala_t3lla AS d3_46 ON d3_46.jatkaa_opiskelua_muulla_kala_t3lla_koodi=f.[2f_jatkaa_opiskelua_muulla_kala_t3lla] --AND f.tilv_date between d46.alkaa and d46.paattyy
--4bb
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2 AS d4_56 ON d4_56.opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi=f.[4bb_opiskelijoiden_opintojen_kulku_jarj_ja_kaste_t2_mukaan] --AND f.tilv_date between d56.alkaa and d56.paattyy
--vanhat
--1
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutusasteen_2002_mukaan  AS d34 ON d34.opintojen_kulku_koulutusasteen_2002_mukaan_koodi = f.[1a_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan] AND f.tilv_date between d34.alkaa and d34.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutusasteen_2002_mukaan  AS d35 ON d35.opintojen_kulku_koulutusasteen_2002_mukaan_koodi=f.[1b_opiskelijoiden_opintojen_kulku_koulutusaste_2002_mukaan]  AND f.tilv_date between d35.alkaa and d35.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_koulutusasteella_2002 AS d36 ON d36.tutkinto_alkuperaisella_koulutusasteella_2002_koodi=f.[1c_tutkinto_alkuperaisella_koulutusasteella_2002]  AND f.tilv_date between d36.alkaa and d36.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_koulutusasteella_2002 AS d37 ON d37.tutkinto_muulla_koulutusasteella_2002_koodi=f.[1d_tutkinto_muulla_koulutusasteella_2002]  AND f.tilv_date between d37.alkaa and d37.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002 AS d38 ON d38.jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002_koodi=f.[1e_jatkaa_opiskelua_alkuperaisella_koulutusasteella_2002]  AND f.tilv_date between d38.alkaa and d38.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_koulutusasteella_2002 AS d39 ON d39.jatkaa_opiskelua_muulla_koulutusasteella_2002_koodi=f.[1f_jatkaa_opiskelua_muulla_koulutusasteella_2002]  AND f.tilv_date between d39.alkaa and d39.paattyy
--2
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan  AS d40 ON d40.opintojen_kulku_koulutusalan_2002_mukaan_koodi=f.[2a_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] AND f.tilv_date between d40.alkaa and d40.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan  AS d41 ON d41.opintojen_kulku_koulutusalan_2002_mukaan_koodi=f.[2b_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] AND f.tilv_date between d41.alkaa and d41.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutusalan_2002_mukaan_versio2  AS d42 ON d42.opintojen_kulku_koulutusalan_2002_mukaan_versio2_koodi=f.[2bb_opiskelijoiden_opintojen_kulku_koulutusala_2002_mukaan] AND f.tilv_date between d42.alkaa and d42.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_koulutusalalla_2002 AS d43 ON d43.tutkinto_alkuperaisella_koulutusalalla_2002_koodi=f.[2c_tutkinto_alkuperaisella_koulutusalalla_2002]  AND f.tilv_date between d43.alkaa and d43.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_koulutusalalla_2002 AS d44 ON d44.tutkinto_muulla_koulutusalalla_2002_koodi=f.[2d_tutkinto_muulla_koulutusalalla_2002]  AND f.tilv_date between d44.alkaa and d44.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002 AS d45 ON d45.jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002_koodi=f.[2e_jatkaa_opiskelua_alkuperaisella_koulutusalalla_2002]  AND f.tilv_date between d45.alkaa and d45.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_koulutusalalla_2002 AS d46 ON d46.jatkaa_opiskelua_muulla_koulutusalalla_2002_koodi=f.[2f_jatkaa_opiskelua_muulla_koulutusalalla_2002]  AND f.tilv_date between d46.alkaa and d46.paattyy
--3
LEFT JOIN VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan  AS d47 ON d47.opintojen_kulku_opintoala_2002_mukaan_koodi=f.[3a_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] AND f.tilv_date between d47.alkaa and d47.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan  AS d48 ON d48.opintojen_kulku_opintoala_2002_mukaan_koodi=f.[3b_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] AND f.tilv_date between d48.alkaa and d48.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_opintoalan_2002_mukaan_versio2  AS d49 ON d49.opintojen_kulku_opintoala_2002_mukaan_versio2_koodi=f.[3bb_opiskelijoiden_opintojen_kulku_opintoala_2002_mukaan] AND f.tilv_date between d49.alkaa and d49.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_opintoalalla_2002 AS d50 ON d50.tutkinto_alkuperaisella_opintoalalla_2002_koodi=f.[3c_tutkinto_alkuperaisella_opintoalalla_2002]  AND f.tilv_date between d50.alkaa and d50.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_opintoalalla_2002 AS d51 ON d51.tutkinto_muulla_opintoalalla_2002_koodi =f.[3d_tutkinto_muulla_opintoalalla_2002]  AND f.tilv_date between d51.alkaa and d51.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002 AS d52 ON d52.jatkaa_opiskelua_alkuperaisella_opintoalalla_2002_koodi=f.[3e_jatkaa_opiskelua_alkuperaisella_opintoalalla_2002]  AND f.tilv_date between d52.alkaa and d52.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_opintoalalla_2002 AS d53 ON d53.jatkaa_opiskelua_muulla_opintoalalla_2002_koodi=f.[3f_jatkaa_opiskelua_muulla_opintoalalla_2002]  AND f.tilv_date between d53.alkaa and d53.paattyy
--4
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan  AS d54 ON d54.opintojen_kulku_koulutuksen_jarjestajan_mukaan_koodi=f.[4a_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] AND f.tilv_date between d54.alkaa and d54.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan AS d55 ON d55.opintojen_kulku_koulutuksen_jarjestajan_mukaan_koodi=f.[4b_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] AND f.tilv_date between d55.alkaa and d55.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2 AS d56 ON d56.opintojen_kulku_koulutuksen_jarjestajan_mukaan_versio2_koodi=f.[4bb_opiskelijoiden_opintojen_kulku_koul_jarjestajan_mukaan] AND f.tilv_date between d56.alkaa and d56.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_koulutuksen_jarjestajalla AS d57 ON d57.tutkinto_alkuperaisella_koulutuksen_jarjestajalla_koodi=f.[4c_tutkinto_alkuperaisella_koulutuksen_jarjestajalla]  AND f.tilv_date between d57.alkaa and d57.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_koulutuksen_jarjestajalla AS d58 ON d58.tutkinto_muulla_koulutuksen_jarjestajalla_koodi=f.[4d_tutkinto_muulla_koulutuksen_jarjestajalla]  AND f.tilv_date between d58.alkaa and d58.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla AS d59 ON d59.jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla_koodi=f.[4e_jatkaa_opiskelua_alkuperaisella_koulutuksen_jarjestajalla]  AND f.tilv_date between d59.alkaa and d59.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla AS d60 ON d60.jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla_koodi=f.[4f_jatkaa_opiskelua_muulla_koulutuksen_jarjestajalla]  AND f.tilv_date between d60.alkaa and d60.paattyy
--5
LEFT JOIN VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan AS d61 ON d61.opintojen_kulku_oppilaitoksen_mukaan_koodi=f.[5a_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan]  AND f.tilv_date between d61.alkaa and d61.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan  AS d62 ON d62.opintojen_kulku_oppilaitoksen_mukaan_koodi=f.[5b_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan]  AND f.tilv_date between d62.alkaa and d62.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_oppilaitoksen_mukaan_versio2  AS d63 ON d63.opintojen_kulku_oppilaitoksen_mukaan_versio2_koodi=f.[5bb_opiskelijoiden_opintojen_kulku_oppilaitoksen_mukaan]  AND f.tilv_date between d63.alkaa and d63.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisessa_oppilaitoksessa AS d64 ON d64.tutkinto_alkuperaisessa_oppilaitoksessa_koodi=f.[5c_tutkinto_alkuperaisessa_oppilaitoksessa]  AND f.tilv_date between d64.alkaa and d64.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muussa_oppilaitoksessa AS d65 ON d65.tutkinto_muussa_oppilaitoksessa_koodi=f.[5d_tutkinto_muussa_oppilaitoksessa]  AND f.tilv_date between d65.alkaa and d65.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa AS d66 ON d66.jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa_koodi=f.[5e_jatkaa_opiskelua_alkuperaisessa_oppilaitoksessa]  AND f.tilv_date between d66.alkaa and d66.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muussa_oppilaitoksessa AS d67 ON d67.jatkaa_opiskelua_muussa_oppilaitoksessa_koodi=f.[5f_jatkaa_opiskelua_muussa_oppilaitoksessa]  AND f.tilv_date between d67.alkaa and d67.paattyy
--6
LEFT JOIN VipunenTK..d_opintojen_kulku_maakunnan_mukaan AS d68 ON d68.opintojen_kulku_maakunnan_mukaan_koodi=f.[6a_opiskelijoiden_opintojen_kulku_maakunnan_mukaan]  AND f.tilv_date between d68.alkaa and d68.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_maakunnan_mukaan  AS d69 ON d69.opintojen_kulku_maakunnan_mukaan_koodi=f.[6b_opiskelijoiden_opintojen_kulku_maakunnan_mukaan]  AND f.tilv_date between d69.alkaa and d69.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisessa_maakunnassa AS d70 ON d70.tutkinto_alkuperaisessa_maakunnassa_koodi=f.[6c_tutkinto_alkuperaisessa_maakunnassa]  AND f.tilv_date between d70.alkaa and d70.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muussa_maakunnassa AS d71 ON d71.tutkinto_muussa_maakunnassa_koodi=f.[6d_tutkinto_muussa_maakunnassa]  AND f.tilv_date between d71.alkaa and d71.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisessa_maakunnassa AS d72 ON d72.jatkaa_opiskelua_alkuperaisessa_maakunnassa_koodi=f.[6e_jatkaa_opiskelua_alkuperaisessa_maakunnassa]  AND f.tilv_date between d72.alkaa and d72.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muussa_maakunnassa AS d73 ON d73.jatkaa_opiskelua_muussa_maakunnassa_koodi=f.[6f_jatkaa_opiskelua_muussa_maakunnassa]  AND f.tilv_date between d73.alkaa and d73.paattyy
--7
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutussektorin_mukaan AS d74 ON d74.opintojen_kulku_koulutussektorin_mukaan_koodi=f.[7a_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan]  AND f.tilv_date between d74.alkaa and d74.paattyy
LEFT JOIN VipunenTK..d_opintojen_kulku_koulutussektorin_mukaan  AS d75 ON d75.opintojen_kulku_koulutussektorin_mukaan_koodi=f.[7b_opiskelijoiden_opintojen_kulku_koulutussektorin_mukaan]  AND f.tilv_date between d75.alkaa and d75.paattyy
LEFT JOIN VipunenTK..d_tutkinto_alkuperaisella_koulutussektorilla AS d76 ON d76.tutkinto_alkuperaisella_koulutussektorilla_koodi=f.[7c_tutkinto_alkuperaisella_koulutussektorilla]  AND f.tilv_date between d76.alkaa and d76.paattyy
LEFT JOIN VipunenTK..d_tutkinto_muulla_koulutussektorilla AS d77 ON d77.tutkinto_muulla_koulutussektorilla_koodi=f.[7d_tutkinto_muulla_koulutussektorilla]  AND f.tilv_date between d77.alkaa and d77.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_alkuperaisella_koulutussektorilla AS d78 ON d78.jatkaa_opiskelua_alkuperaisella_koulutussektorilla_koodi=f.[7e_jatkaa_opiskelua_alkuperaisella_koulutussektorilla]  AND f.tilv_date between d78.alkaa and d78.paattyy
LEFT JOIN VipunenTK..d_jatkaa_opiskelua_muulla_koulutussektorilla AS d79 ON d79.jatkaa_opiskelua_muulla_koulutussektorilla_koodi=f.[7f_jatkaa_opiskelua_muulla_koulutussektorilla]  AND f.tilv_date between d79.alkaa and d79.paattyy 

/* Tämä ehto hidasti kyselyä liikaa, joten tehdään valinta jo SA-kannan näkymässä, jossa ennakkoaineisto kommentoidaan pois sitten kun lopullinen aineisto on käytettävissä. -Anssi 23.10.2017 */
/* Lisätään ehto hieman muokattuna, jotta ei tarvitse tehdä toimenpiteitä aineiston toimituksen jälkeen -Anssi 27.2.2018 */
--Ennakkoaineisto poistunut sopv19, joten muokattu rajausehtoa. / CSC Juha 23.11.2021

WHERE aineisto_koodi = 'L'
/*aineisto_koodi = 
(case 
	when f.tilastovuosi <= @maxTilastovuosiL then 
	'L'
	else  'E'
end)
*/

/*aineisto_koodi=
(case 
	when f.tilastovuosi <> (select max(tilastovuosi) from [VipunenTK_DW].[dbo].[f_K_3_11_Keskeyttaneet]) then 'L'
	else 
		case 
			when EXISTS (SELECT 1 FROM f_K_3_11_Keskeyttaneet o WHERE o.aineisto='L' and o.tilastovuosi=f.tilastovuosi) then 'L'
			else 'E'
		end
end
)
*/

