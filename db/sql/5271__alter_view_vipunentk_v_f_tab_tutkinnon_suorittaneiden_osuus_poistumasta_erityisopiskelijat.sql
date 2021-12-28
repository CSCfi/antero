USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 28.12.2021 14:07:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER VIEW [dbo].[v_f_tab_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] AS

SELECT
	  [tilv] AS Tilastovuosi
      ,d1.lahde AS [Lähde]
	  ,d2.maakunta AS [Koulutuksen maakunta]
	  ,d2.suuralue AS [Koulutuksen suuralue]
	  ,d2.ely AS [Koulutuksen ELY]
	  ,d2.avi AS [Koulutuksen AVI]
      ,d3.koulutuksen_jarjestaja AS [Koulutuksen järjestäjä]
	  ,d3.koulutuksen_jarjestajan_kieli AS [Koul. järjestäjän kieli]
	  ,d3.koulutuksen_jarjestajan_omistajatyyppi AS [Koul. järjestäjän omistajatyyppi]
	  ,d3.koulutuksen_jarjestajan_sijaintikunta AS [Koul. järjestäjän sijaintikunta]
      ,d4.koulutus AS [Koulutusnimike]
	  ,d4.opintoala2002 AS [Opintoala]
	  ,d4.koulutusala2002 AS [Koulutusala]
	  ,d4.koulutusaste2002 AS [Koulutusaste]

	   --isced
	  ,d4.iscle2011 as "Koulutusaste, taso 1"
	  ,d4.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	  ,d4.iscfibroad2013 as "Koulutusala, taso 1"
	  ,d4.iscfinarrow2013 as "Koulutusala, taso 2"
	  ,d4.iscfi2013 as "Koulutusala, taso 3"
	  ,d4.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
	  ,d4.iscle2011_SV as "Utbildn.nivå, nivå 1"
	  ,d4.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	  ,d4.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	  ,d4.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	  ,d4.iscfi2013_SV as "Utbildn.område, nivå 3"
	  ,d4.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
	  ,d4.iscle2011_EN as "Level of education, tier 1"
	  ,d4.Koulutusaste_taso2_EN as "Level of education, tier 2"
	  ,d4.iscfibroad2013_EN as "Field of education, tier 1"
	  ,d4.iscfinarrow2013_EN as "Field of education, tier 2"
	  ,d4.iscfi2013_EN as "Field of education, tier 3"
	  ,d4.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"

      --,d5.opetushallinnon_koulutus AS [Hallinnonala]
	  ,d5b.hallinnonala AS Hallinnonala
	  ,d6.maakunta AS [Tutkinnon suoritusmaakunta]
	  ,d6.ely AS [Tutk. suorituspaikan ELY]
	  ,d6.avi AS [Tutk. suorituspaikan AVI]
      ,d7.koulutuksen_jarjestaja AS [Tutkinnon koul. järjestäjä]
	  ,d7.koulutuksen_jarjestajan_omistajatyyppi AS [Tutkinnon koul. järjestäjän omistajatyyppi]
	  ,d7.koulutuksen_jarjestajan_kieli [Tutkinnon koul. järjestäjän kieli]
	  ,d7.koulutuksen_jarjestajan_sijaintikunta AS [Tutkinnon koul. järjestäjän sijaintikunta]
      ,d8.koulutus AS [Tutkinnon koulutusnimike]
	  ,d8.opintoala2002 AS [Tutkinnon opintoala]
	  ,d8.koulutusala2002 AS [Tutkinnon koulutusala]
	  --isced
	  ,d8.iscle2011 AS [Tutkinnon koulutusaste, taso 1]
	  ,d8.Koulutusaste_taso2 AS [Tutkinnon koulutusaste, taso 2]
	  ,d8.iscfibroad2013 AS [Tutkinnon koulutusala, taso 1]
	  ,d8.iscfinarrow2013 AS [Tutkinnon koulutusala, taso 2]
	  ,d8.iscfi2013 AS [Tutkinnon koulutusala, taso 3]
	  ,d8.koulutusaste2002 AS [Tutkinnon koulutusaste]

	  ,d9.maakunta AS [Seur. vuoden koul. maakunta]
	  ,d9.ely AS [Seur. vuoden koul. ELY]
	  ,d9.avi AS [Seur. vuoden koul. AVI]
      ,d10.koulutuksen_jarjestaja AS [Seur. vuoden koul. järjestäjä]
	  ,d10.koulutuksen_jarjestajan_omistajatyyppi AS [Seur. vuoden koul. järjestäjän omistajatyyppi]
	  ,d10.koulutuksen_jarjestajan_kieli AS [Seur. vuoden koul. järjestäjän kieli]
	  ,d10.koulutuksen_jarjestajan_sijaintikunta AS [Seur. vuoden koul. järjestäjän sijaintikunta]
      ,d11.koulutus AS [Seur. vuoden koulutusnimike]
	  ,d11.opintoala2002 AS [Seur. vuoden opintoala]
	  ,d11.koulutusala2002 AS [Seur. vuoden koulutusala]
	  ,d11.koulutusaste2002 AS [Seur. vuoden koulutusaste]
	  --isced
	  ,d11.iscle2011  AS [Seur. vuoden koulutusaste, taso 1]
	  ,d11.Koulutusaste_taso2  AS [Seur. vuoden koulutusaste, taso 2]
	  ,d11.iscfibroad2013 AS [Seur. vuoden koulutusala, taso 1]
	  ,d11.iscfinarrow2013 AS [Seur. vuoden koulutusala, taso 2]
	  ,d11.iscfi2013 AS [Seur. vuoden koulutusala, taso 3]

	  --uudet
      ,d16_t2.opintojen_kulku_kaste_t2en_mukaan AS [Opintojen kulku, koul.aste taso 2 (tutkinto priorisoitu)]
      ,d17_t2.opintojen_kulku_kaste_t2en_mukaan AS [Opintojen kulku, koul.aste taso 2 (opiskelu priorisoitu)]
      ,d18_t1.opintojen_kulku_kala_t1n_mukaan AS [Opintojen kulku, koul.ala taso 1 (tutkinto priorisoitu)]
      ,d19_t1.opintojen_kulku_kala_t1n_mukaan AS [Opintojen kulku, koul.ala taso 1 (opiskelu priorisoitu)]
      ,d18_t2.opintojen_kulku_kala_t2n_mukaan AS [Opintojen kulku, koul.ala taso 2 (tutkinto priorisoitu)]
      ,d19_t2.opintojen_kulku_kala_t2n_mukaan AS [Opintojen kulku, koul.ala taso 2 (opiskelu priorisoitu)]
      ,d18_t3.opintojen_kulku_kala_t3n_mukaan AS [Opintojen kulku, koul.ala taso 3 (tutkinto priorisoitu)]
      ,d19_t3.opintojen_kulku_kala_t3n_mukaan AS [Opintojen kulku, koul.ala taso 3 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul.asteella, taso 2 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul.asteella, taso 2 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul.asteella, taso 2 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul.asteella, taso 2 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t1lla_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla, taso 1 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t1lla_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla, taso 1 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t1lla_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla, taso 1 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t1lla_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla, taso 1 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t2lla_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla, taso 2 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t2lla_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla, taso 2 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t2lla_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla, taso 2 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t2lla_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla, taso 2 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t3lla_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla, taso 3 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t3lla_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla, taso 3 (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t3lla_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla, taso 3 (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t3lla_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla, taso 3 (opiskelu priorisoitu)]
	  --vanhat
      ,d12.opintojen_kulku_koulutuksen_jarjestajan_mukaan AS [Opintojen kulku koul. järjestäjän mukaan (tutkinto priorisoitu)]
      ,d13.opintojen_kulku_koulutuksen_jarjestajan_mukaan AS [Opintojen kulku koul. järjestäjän mukaan (opiskelu priorisoitu)]
      ,d14.opintojen_kulku_maakunnan_mukaan AS [Opintojen kulku koul. maakunnan mukaan (tutkinto priorisoitu)]
      ,d15.opintojen_kulku_maakunnan_mukaan AS [Opintojen kulku koul. maakunnan mukaan (opiskelu priorisoitu)]
      ,d16.opintojen_kulku_koulutusasteen_2002_mukaan AS [Opintojen kulku koul.asteen mukaan (tutkinto priorisoitu)]
      ,d17.opintojen_kulku_koulutusasteen_2002_mukaan AS [Opintojen kulku koul.asteen mukaan (opiskelu priorisoitu)]
      ,d18.opintojen_kulku_koulutusalan_2002_mukaan AS [Opintojen kulku koul.alan mukaan (tutkinto priorisoitu)]
      ,d19.opintojen_kulku_koulutusalan_2002_mukaan AS [Opintojen kulku koul.alan mukaan (opiskelu priorisoitu)]
      ,d20.opintojen_kulku_opintoala_2002_mukaan AS [Opintojen kulku opintoalan mukaan (tutkinto priorisoitu)]
      ,d21.opintojen_kulku_opintoala_2002_mukaan AS [Opintojen kulku opintoalan mukaan (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul. järjeställä (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul. järjeställä (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul. järjeställä (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul. järjeställä (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. maakunnassa (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. maakunnassa (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. maakunnassa (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. maakunnassa (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul.asteella (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul.asteella (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul.asteella (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul.asteella (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul.alalla (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul.alalla (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. opintoalalla (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. opintoalalla (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. opintoalalla (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. opintoalalla (opiskelu priorisoitu)]


	  --ruotsi
	  ,[tilv] AS [Statistikår]
      ,d1.lahde_SV AS [Källa]
	  ,d2.maakunta_SV AS [Utbildningens landskap]
	  ,d2.suuralue_SV AS [Utbildningens storområde]
	  ,d2.ely_SV AS [Utbildningens NTM-område]
	  ,d2.avi_SV AS [Utbildningens RFV-område]
      ,d3.koulutuksen_jarjestaja_SV AS [Utbildningsanordnare]
	  ,d3.koulutuksen_jarjestajan_kieli_SV AS [Utbildningsanordnarens språk]
	  ,d3.koulutuksen_jarjestajan_omistajatyyppi_SV AS [Utbildningsanordnarens ägartyp]
	  ,d3.koulutuksen_jarjestajan_sijaintikunta_SV AS [Utbildningsanordnarens kommun]
      ,d4.koulutus_SV AS [Utbildningsbenämning]
	  ,d4.opintoala2002_SV AS [Studieområde]
	  ,d4.koulutusala2002_SV AS [Utbildningsområde]
	  ,d4.koulutusaste2002_SV AS [Utbildningsnivå]
      --,d5.opetushallinnon_koulutus_SV AS [Förvaltningsområde]
	  ,d5b.hallinnonala_SV AS Förvaltningsområde
	  ,d6.maakunta_SV AS [Examens landskap]
	  ,d6.ely_SV AS [Examens NMT-område]
	  ,d6.avi_SV AS [Examens RFV-område]
      ,d7.koulutuksen_jarjestaja_SV AS [Examens utbildningsanordnare]
	  ,d7.koulutuksen_jarjestajan_omistajatyyppi_SV AS [Examens utbildningsanordnarens ägartyp]
	  ,d7.koulutuksen_jarjestajan_kieli_SV AS [Examens utbildningsanordnarens språk]
	  ,d7.koulutuksen_jarjestajan_sijaintikunta_SV AS [Examens utbildningsanordnarens kommun]
      ,d8.koulutus_SV AS [Examens utbildningsbenämning]
	  ,d8.opintoala2002_SV AS [Examens studieområde]
	  ,d8.koulutusala2002_SV AS [Examens utbildningsområde]

	  --isced
	  ,d8.koulutusaste2002_SV AS [Examens utbildningsnivå]
	  ,d8.iscle2011_SV AS [Examens Utbildn.nivå, nivå 1]
	  ,d8.Koulutusaste_taso2_SV AS [Examens Utbildn.nivå, nivå 2]
	  ,d8.iscfibroad2013_SV AS [Examens Utbildn.område, nivå 1]
	  ,d8.iscfinarrow2013_SV AS [Examens Utbildn.område, nivå 2]
	  ,d8.iscfi2013_SV AS [Examens Utbildn.område, nivå 3]

	  ,d9.maakunta_SV AS [Nästa års utbildningens landskap]
	  ,d9.ely_SV AS [Nästa års utbildningens NTM-område]
	  ,d9.avi_SV AS [Nästa års utbildningens RFV-område]
      ,d10.koulutuksen_jarjestaja_SV AS [Nästa års utbildningsanordnare]
	  ,d10.koulutuksen_jarjestajan_omistajatyyppi_SV AS [Nästa års utbildningsanordnarens ägartyp]
	  ,d10.koulutuksen_jarjestajan_kieli_SV AS [Nästa års utbildningsanordnarens språk]
	  ,d10.koulutuksen_jarjestajan_sijaintikunta_SV AS [Nästa års utbildningsanordnarens kommun]
      ,d11.koulutus_SV AS [Nästa års utbildningsbenämning]
	  ,d11.opintoala2002_SV AS [Nästa års studieområde]
	  ,d11.koulutusala2002_SV AS [Nästa års utbildningsområde]
	  ,d11.koulutusaste2002_SV AS [Nästa års utbildningsnivå]
	  --isced
	  ,d11.iscle2011_SV AS [Nästa års Utbildn.nivå, nivå 1]
	  ,d11.Koulutusaste_taso2_SV AS [Nästa års Utbildn.nivå, nivå 2]
	  ,d11.iscfibroad2013_SV AS [Nästa års Utbildn.område, nivå 1]
	  ,d11.iscfinarrow2013_SV AS [Nästa års Utbildn.område, nivå 2]
	  ,d11.iscfi2013_SV AS [Nästa års Utbildn.område, nivå 3]

	  --uudet
      ,d16_t2.opintojen_kulku_kaste_t2en_mukaan_SV AS [Studiernas framskridande, utb.nivå 2 (examen prioriterad)]
      ,d17_t2.opintojen_kulku_kaste_t2en_mukaan_SV AS [Studiernas framskridande, utb.nivå 2 (studie prioriterad)]
      ,d18_t1.opintojen_kulku_kala_t1n_mukaan_SV AS [Studiernas framskridande, utb.område 1 (examen prioriterad)]
      ,d19_t1.opintojen_kulku_kala_t1n_mukaan_SV AS [Studiernas framskridande, utb.område 1 (studie prioriterad)]
      ,d18_t2.opintojen_kulku_kala_t2n_mukaan_SV AS [Studiernas framskridande, utb.område 2 (examen prioriterad)]
      ,d19_t2.opintojen_kulku_kala_t2n_mukaan_SV AS [Studiernas framskridande, utb.område 2 (studie prioriterad)]
      ,d18_t3.opintojen_kulku_kala_t3n_mukaan_SV AS [Studiernas framskridande, utb.område 3 (examen prioriterad)]
      ,d19_t3.opintojen_kulku_kala_t3n_mukaan_SV AS [Studiernas framskridande, utb.område 3 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id) AS [Examen i målexamens utb.nivå 2 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id) AS [Examen i målexamens utb.nivå 2 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id) AS [Studerar i målexamens utb.nivå 2 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id) AS [Studerar i målexamens utb.nivå 2 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t1lla_tutkinto_priorisoitu_id) AS [Examen i målexamens utb.område 1 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t1lla_opiskelu_priorisoitu_id) AS [Examen i målexamens utb.område 1 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t1lla_tutkinto_priorisoitu_id) AS [Studerar i målexamens utb.område 1 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t1lla_opiskelu_priorisoitu_id) AS [Studerar i målexamens utb.område 1 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t2lla_tutkinto_priorisoitu_id) AS [Examen i målexamens utb.område 2 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t2lla_opiskelu_priorisoitu_id) AS [Examen i målexamens utb.område 2 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t2lla_tutkinto_priorisoitu_id) AS [Studerar i målexamens utb.område 2 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t2lla_opiskelu_priorisoitu_id) AS [Studerar i målexamens utb.område 2 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t3lla_tutkinto_priorisoitu_id) AS [Examen i målexamens utb.område 3 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t3lla_opiskelu_priorisoitu_id) AS [Examen i målexamens utb.område 3 (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t3lla_tutkinto_priorisoitu_id) AS [Studerar i målexamens utb.område 3 (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t3lla_opiskelu_priorisoitu_id) AS [Studerar i målexamens utb.område 3 (studie prioriterad)]
	  --vanhat
      ,d12.opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV AS [Studiernas framskridande enligt utbildningsanordnare (examen prioriterad)]
      ,d13.opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV AS [Studiernas framskridande enligt utbildningsanordnare (studie prioriterad)]
      ,d14.opintojen_kulku_maakunnan_mukaan_SV AS [Studiernas framskridande enligt utbildningens landskap (examen prioriterad)]
      ,d15.opintojen_kulku_maakunnan_mukaan_SV AS [Studiernas framskridande enligt utbildningens landskap (studie prioriterad)]
      ,d16.opintojen_kulku_koulutusasteen_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsnivå (examen prioriterad)]
      ,d17.opintojen_kulku_koulutusasteen_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsnivå (studie prioriterad)]
      ,d18.opintojen_kulku_koulutusalan_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsområde (examen prioriterad)]
      ,d19.opintojen_kulku_koulutusalan_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsområde (studie prioriterad)]
      ,d20.opintojen_kulku_opintoala_2002_mukaan_SV AS [Studiernas framskridande enligt studieområde (examen prioriterad)]
      ,d21.opintojen_kulku_opintoala_2002_mukaan_SV AS [Studiernas framskridande enligt studieområde (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id) AS [Examen i målexamens utbildningsanordnare (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id) AS [Examen i målexamens utbildningsanordnare (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id) AS [Studerar i målexamens utbildningsanordnare (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id) AS [Studerar i målexamens utbildningsanordnare (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Examen i målexamens landskap (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Examen i målexamens landskap (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Studerar i målexamens landskap (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Studerar i målexamens landskap (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Examen i målexamens utbildningsnivå (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Examen i målexamens utbildningsnivå (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Studerar i målexamens utbildningsnivå (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Studerar i målexamens utbildningsnivå (studie prioriterad)]

	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Examen i målexamens utbildningsområde (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Examen i målexamens utbildningsområde (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Studerar i målexamens utbildningsområde (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Studerar i målexamens utbildningsområde (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Examen i målexamens studieområde (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Examen i målexamens studieområde (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Studerar i målexamens studieområde (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Studerar i målexamens studieområde (studie prioriterad)]


	  --englanti
	  ,[tilv] AS [Statistical year]
      ,d1.lahde_EN AS [Source]
	  ,d2.maakunta_EN AS [Region of education]
	  ,d2.suuralue_EN AS [Major region of education]
	  ,d2.ely_EN AS [ELY area of education]
	  ,d2.avi_EN AS [AVI area of education]
      ,d3.koulutuksen_jarjestaja_EN AS [Education provider]
	  ,d3.koulutuksen_jarjestajan_kieli_EN AS [Language of the education provider]
	  ,d3.koulutuksen_jarjestajan_omistajatyyppi_EN AS [Type of the education provider owner]
	  ,d3.koulutuksen_jarjestajan_sijaintikunta_EN AS [Municipality of the education provider]
      ,d4.koulutus_EN AS [Name of education]
	  ,d4.opintoala2002_EN AS [Subfield of education]
	  ,d4.koulutusala2002_EN AS [Field of education]
	  ,d4.koulutusaste2002_EN AS [Level of education]
      --,d5.opetushallinnon_koulutus_EN AS [Administrative sector]
	  ,d5b.hallinnonala_EN AS 'Administrative sector'
	  ,d6.maakunta_EN AS [Qualification's region]
	  ,d6.ely_EN AS [Qualification's ELY]
	  ,d6.avi_EN AS [Qualification's AVI]
      ,d7.koulutuksen_jarjestaja_EN AS [Qualification's edducation provider]
	  ,d7.koulutuksen_jarjestajan_omistajatyyppi_EN AS [Qualification's type of the education provider owner]
	  ,d7.koulutuksen_jarjestajan_kieli_EN AS [Qualification's language of the education provider]
	  ,d7.koulutuksen_jarjestajan_sijaintikunta_EN AS [Qualification's municipality of the education provider]
      ,d8.koulutus_EN AS [Qualification's name of education]
	  ,d8.opintoala2002_EN AS [Qualification's subfield of education]
	  ,d8.koulutusala2002_EN AS [Qualification's field of education]
	  ,d8.koulutusaste2002_EN AS [Qualification's level of education]
	  --isced
	  ,d8.iscle2011_EN AS [Qualification's level of education, tier 1]
	  ,d8.Koulutusaste_taso2_EN AS [Qualification's level of education, tier 2]
	  ,d8.iscfibroad2013_EN AS [Qualification's field of education, tier 1]
	  ,d8.iscfinarrow2013_EN AS [Qualification's field of education, tier 2]
	  ,d8.iscfi2013_EN AS [Qualification's field of education, tier 3]

	  ,d9.maakunta_EN AS [Next year's region of education]
	  ,d9.ely_EN AS [Next year's ELY area of education]
	  ,d9.avi_EN AS [Next year's AVI area of education]
      ,d10.koulutuksen_jarjestaja_EN AS [Next year's education provider]
	  ,d10.koulutuksen_jarjestajan_omistajatyyppi_EN AS [Next year's type of the education provider owner]
	  ,d10.koulutuksen_jarjestajan_kieli_EN AS [Next year's language of the education provider]
	  ,d10.koulutuksen_jarjestajan_sijaintikunta_EN AS [Next year's municipality of the education provider]
      ,d11.koulutus_EN AS [Next year's name of education]
	  ,d11.opintoala2002_EN AS [Next year's subfield of education]
	  ,d11.koulutusala2002_EN AS [Next year's field of education]
	  ,d11.koulutusaste2002_EN AS [Next year's level of education]
	  --isced
	  ,d11.iscle2011_EN AS [Next year's level of education, tier 1]
	  ,d11.Koulutusaste_taso2_EN AS [Next year's level of education, tier 2]
	  ,d11.iscfibroad2013_EN AS [Next year's field of education, tier 1]
	  ,d11.iscfinarrow2013_EN AS [Next year's field of education, tier 2]
	  ,d11.iscfi2013_EN AS [Next year's field of education, tier 3]  

	  --uudet
      ,d16_t2.opintojen_kulku_kaste_t2en_mukaan_EN AS [Study progress by level of ed. tier 2 (qualif. prioritized)]
      ,d17_t2.opintojen_kulku_kaste_t2en_mukaan_EN AS [Study progress by level of ed. tier 2 (studies prioritized)]
      ,d18_t1.opintojen_kulku_kala_t1n_mukaan_EN AS [Study progress by field of ed. tier 1 (qualif. prioritized)]
      ,d19_t1.opintojen_kulku_kala_t1n_mukaan_EN AS [Study progress by field of ed. tier 1 (studies prioritized)]
      ,d18_t2.opintojen_kulku_kala_t2n_mukaan_EN AS [Study progress by field of ed. tier 2 (qualif. prioritized)]
      ,d19_t2.opintojen_kulku_kala_t2n_mukaan_EN AS [Study progress by field of ed. tier 2 (studies prioritized)]
      ,d18_t3.opintojen_kulku_kala_t3n_mukaan_EN AS [Study progress by field of ed. tier 3 (qualif. prioritized)]
      ,d19_t3.opintojen_kulku_kala_t3n_mukaan_EN AS [Study progress by field of ed. tier 3 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id) AS [Qualif. in target level of ed. tier 2 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id) AS [Qualif. in target level of ed. tier 2 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id) AS [Contin. studies in target level of ed. tier 2 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id) AS [Contin. studies in target level of ed. tier 2 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t1lla_tutkinto_priorisoitu_id) AS [Qualif. in target field of ed. tier 1 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t1lla_opiskelu_priorisoitu_id) AS [Qualif. in target field of ed. tier 1 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t1lla_tutkinto_priorisoitu_id) AS [Contin. studies in target field of ed. tier 1 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t1lla_opiskelu_priorisoitu_id) AS [Contin. studies in target field of ed. tier 1 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t2lla_tutkinto_priorisoitu_id) AS [Qualif. in target field of ed. tier 2 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t2lla_opiskelu_priorisoitu_id) AS [Qualif. in target field of ed. tier 2 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t2lla_tutkinto_priorisoitu_id) AS [Contin. studies in target field of ed. tier 2 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t2lla_opiskelu_priorisoitu_id) AS [Contin. studies in target field of ed. tier 2 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t3lla_tutkinto_priorisoitu_id) AS [Qualif. in target field of ed. tier 3 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_kala_t3lla_opiskelu_priorisoitu_id) AS [Qualif. in target field of ed. tier 3 (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t3lla_tutkinto_priorisoitu_id) AS [Contin. studies in target field of ed. tier 3 (qualif. prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_kala_t3lla_opiskelu_priorisoitu_id) AS [Contin. studies in target field of ed. tier 3 (studies prioritized)]
	  --vanhat
      ,d12.opintojen_kulku_koulutuksen_jarjestajan_mukaan_EN AS [Study progress by education provider (qualification prioritized)]
      ,d13.opintojen_kulku_koulutuksen_jarjestajan_mukaan_EN AS [Study progress by education provider (studies prioritized)]
      ,d14.opintojen_kulku_maakunnan_mukaan_EN AS [Study progress by region of education (qualification prioritized)]
      ,d15.opintojen_kulku_maakunnan_mukaan_EN AS [Study progress by region of education (studies prioritized)]
      ,d16.opintojen_kulku_koulutusasteen_2002_mukaan_EN AS [Study progress by level of education (qualification prioritized)]
      ,d17.opintojen_kulku_koulutusasteen_2002_mukaan_EN AS [Study progress by level of education (studies prioritized)]
      ,d18.opintojen_kulku_koulutusalan_2002_mukaan_EN AS [Study progress by field of education (qualification prioritized)]
      ,d19.opintojen_kulku_koulutusalan_2002_mukaan_EN AS [Study progress by field of education (studies prioritized)]
      ,d20.opintojen_kulku_opintoala_2002_mukaan_EN AS [Study progress by subfield of education (qualification prioritized)]
      ,d21.opintojen_kulku_opintoala_2002_mukaan_EN AS [Study progress by subfield of education (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id) AS [Qualification in target education provider (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id) AS [Qualification in target education provider (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id) AS [Contin. studies in target education provider (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id) AS [Contin. studies in target education provider (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Qualification in target region (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Qualification in target region (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Contin. studies in target region (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Contin. studies in target region (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Qualification in target level of education (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Qualification in target level of education (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Contin. studies in target level of education (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Contin. studies in target level of education (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Qualification in target field of education (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Qualification in target field of education (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Contin. studies in target field of education (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Contin. studies in target field of education (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Qualification in target subfield of education (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Qualification in target subfield of education (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Contin. studies in target subfield of education (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Contin. studies in target subfield of education (studies prioritized)]
      
	  ,[lkm] AS lkm_int2

	  ,d1.jarjestys AS jarjestys_lahde
	  ,d2.jarjestys_maakunta
	  ,d2.jarjestys_suuralue
	  ,d2.jarjestys_ely
	  ,d2.jarjestys_avi
      ,d3.jarjestys_koulutuksenjarjestaja
	  ,d3.jarjestys_koulutuksen_jarjestajan_kieli
	  ,d3.jarjestys_sijaintikunta_koulutuksenjarjestaja
	  ,d3.koulutuksen_jarjestajan_omistajatyyppikoodi
      ,d4.jarjestys AS jarjestys_tutkintonimike
	  ,d4.jarjestys_opintoala2002
	  ,d4.jarjestys_koulutusala2002
	  ,d4.jarjestys_koulutusaste2002
	  ,d5b.jarjestys AS jarj_ophal
	  ,d6.jarjestys_maakunta AS jarjestys_tutkinnon_maakunta
	  ,d6.jarjestys_ely AS jarjestys_tutkinnon_ely
	  ,d6.jarjestys_avi AS jarjestys_tutkinnon_avi
      ,d7.jarjestys_koulutuksen_jarjestaja AS jarjestys_tutkinnon_koul_jarjestaja
	  ,d7.koulutuksen_jarjestajan_omistajatyyppikoodi AS jarjestys_tutkinnon_omistajatyyppi
	  ,d7.jarjestys_koulutuksen_jarjestajan_kieli AS jarjestys_tutkinnon_koul_jarj_kieli
	  ,d7.jarjestys_sijaintikunta_koulutuksenjarjestaja AS jarjestys_tutkinnon_koul_jarj_sijaintikunta
      ,d8.jarjestys AS jarjestys_tutkinnon_tutkintonimike
	  ,d8.jarjestys_opintoala2002 AS jarjestys_tutkinnon_opintoala2002
	  ,d8.jarjestys_koulutusala2002 AS jarjestys_tutkinnon_koulutusala2002
	  ,d8.jarjestys_koulutusaste2002 AS jarjestys_tutkinnon_koulutusaste2002
	  ,d9.jarjestys_maakunta AS jarjestys_svuoden_maakunta
	  ,d9.jarjestys_ely AS jarjestys_svuoden_ely
	  ,d9.jarjestys_avi AS jarjestys_svuoden_avi
      ,d10.jarjestys_koulutuksen_jarjestaja AS jarjestys_svuoden_koul_jarjestaja
	  ,d10.koulutuksen_jarjestajan_omistajatyyppikoodi AS jarjestys_svuoden_omistajatyyppi
	  ,d10.jarjestys_koulutuksen_jarjestajan_kieli AS jarjestys_svuoden_koul_jarj_kieli
	  ,d10.jarjestys_sijaintikunta_koulutuksenjarjestaja AS jarjestys_svuoden_koul_jarj_sijaintikunta
      ,d11.jarjestys AS jarjestys_svuoden_tutkintonimike
	  ,d11.jarjestys_opintoala2002 AS jarjestys_svuoden_opintoala2002
	  ,d11.jarjestys_koulutusala2002 AS jarjestys_svuoden_koulutusala2002
	  ,d11.jarjestys_koulutusaste2002 AS jarjestys_svuoden_koulutusaste2002
	  --uudet
	  ,d16_t2.jarjestys_1a_t2 AS jarjestys_Opintojen_kulku_kaste_t2en_mukaan_tutkinto_priorisoitu
	  ,d17_t2.jarjestys_1a_t2 AS jarjestys_Opintojen_kulku_kaste_t2en_mukaan_opiskelu_priorisoitu
	  ,d18_t1.jarjestys_2a_t1 AS jarjestys_Opintojen_kulku_kala_t1n_mukaan_tutkinto_priorisoitu
	  ,d19_t1.jarjestys_2a_t1 AS jarjestys_Opintojen_kulku_kala_t1n_mukaan_opiskelu_priorisoitu
	  ,d18_t2.jarjestys_2a_t2 AS jarjestys_Opintojen_kulku_kala_t2n_mukaan_tutkinto_priorisoitu
	  ,d19_t2.jarjestys_2a_t2 AS jarjestys_Opintojen_kulku_kala_t2n_mukaan_opiskelu_priorisoitu
	  ,d18_t3.jarjestys_2a_t3 AS jarjestys_Opintojen_kulku_kala_t3n_mukaan_tutkinto_priorisoitu
	  ,d19_t3.jarjestys_2a_t3 AS jarjestys_Opintojen_kulku_kala_t3n_mukaan_opiskelu_priorisoitu
	  --vanhat
	  ,d12.jarjestys_4a AS jarjestys_Opintojen_kulku_koul_jarj_mukaan_tutkinto_priorisoitu
	  ,d13.jarjestys_4a AS jarjestys_Opintojen_kulku_koul_jarj_mukaan_opiskelu_priorisoitu
	  ,d14.jarjestys_6a AS jarjestys_Opintojen_kulku_koul_maakunnan_mukaan_tutkinto_priorisoitu
	  ,d15.jarjestys_6a AS jarjestys_Opintojen_kulku_koul_maakunnan_mukaan_opiskelu_priorisoitu
	  ,d16.jarjestys_1a AS jarjestys_Opintojen_kulku_koul_asteen_mukaan_tutkinto_priorisoitu
	  ,d17.jarjestys_1a AS jarjestys_Opintojen_kulku_koul_asteen_mukaan_opiskelu_priorisoitu
	  ,d18.jarjestys_2a AS jarjestys_Opintojen_kulku_koul_alan_mukaan_tutkinto_priorisoitu
	  ,d19.jarjestys_2a AS jarjestys_Opintojen_kulku_koul_alan_mukaan_opiskelu_priorisoitu
	  ,d20.jarjestys_3a AS jarjestys_Opintojen_kulku_opintoalan_mukaan_tutkinto_priorisoitu
	  ,d21.jarjestys_3a AS jarjestys_Opintojen_kulku_opintoalan_mukaan_opiskelu_priorisoitu

  FROM [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] f
  INNER JOIN [VipunenTK].[dbo].[d_lahde] d1 ON d1.id = f.lahde_id
  INNER JOIN [VipunenTK].[dbo].[d_alueluokitus] d2 ON d2.id = f.alueluokitus_id
  INNER JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d3 ON d3.id = f.oppilaitoksen_taustatiedot_id
  INNER JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d4 ON d4.id = f.koulutusluokitus_id
  INNER JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutus] d5 ON d5.id = f.ophal_kylla_ei_id
  INNER JOIN VipunenTK.dbo.d_hallinnonala2 d5b on d5b.id=f.hallinnonala2_id
  INNER JOIN [VipunenTK].[dbo].[d_alueluokitus] d6 ON d6.id = f.tutkinnon_alueluokitus_id
  INNER JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d7 ON d7.id = f.tutkinnon_oppilaitoksen_taustatiedot_id
  INNER JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d8 ON d8.id = f.tutkinnon_koulutusluokitus_id
  INNER JOIN [VipunenTK].[dbo].[d_alueluokitus] d9 ON d9.id = f.seurv_alueluokitus_id
  INNER JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d10 ON d10.id = f.seurv_oppilaitoksen_taustatiedot_id
  INNER JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d11 ON d11.id = f.seurv_koulutusluokitus_id
  --uudet
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kaste_t2en_mukaan] d16_t2 ON d16_t2.id = f.opintojen_kulku_kaste_t2en_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kaste_t2en_mukaan] d17_t2 ON d17_t2.id = f.opintojen_kulku_kaste_t2en_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kala_t1n_mukaan] d18_t1 ON d18_t1.id = f.opintojen_kulku_kala_t1n_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kala_t1n_mukaan] d19_t1 ON d19_t1.id = f.opintojen_kulku_kala_t1n_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kala_t2n_mukaan] d18_t2 ON d18_t2.id = f.opintojen_kulku_kala_t2n_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kala_t2n_mukaan] d19_t2 ON d19_t2.id = f.opintojen_kulku_kala_t2n_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kala_t3n_mukaan] d18_t3 ON d18_t3.id = f.opintojen_kulku_kala_t3n_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_kala_t3n_mukaan] d19_t3 ON d19_t3.id = f.opintojen_kulku_kala_t3n_mukaan_opiskelu_priorisoitu_id
  --vanhat
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan] d12 ON d12.id = f.opintojen_kulku_koul_jarj_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_koulutuksen_jarjestajan_mukaan] d13 ON d13.id = f.opintojen_kulku_koul_jarj_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_maakunnan_mukaan] d14 ON d14.id = f.opintojen_kulku_koul_maakunnan_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_maakunnan_mukaan] d15 ON d15.id = f.opintojen_kulku_koul_maakunnan_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan] d16 ON d16.id = f.opintojen_kulku_koul_asteen_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_koulutusasteen_2002_mukaan] d17 ON d17.id = f.opintojen_kulku_koul_asteen_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan] d18 ON d18.id = f.opintojen_kulku_koul_alan_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_koulutusalan_2002_mukaan] d19 ON d19.id = f.opintojen_kulku_koul_alan_mukaan_opiskelu_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_opintoalan_2002_mukaan] d20 ON d20.id = f.opintojen_kulku_opintoalan_mukaan_tutkinto_priorisoitu_id
  INNER JOIN [VipunenTK].[dbo].[d_opintojen_kulku_opintoalan_2002_mukaan] d21 ON d21.id = f.opintojen_kulku_opintoalan_mukaan_opiskelu_priorisoitu_id




GO


