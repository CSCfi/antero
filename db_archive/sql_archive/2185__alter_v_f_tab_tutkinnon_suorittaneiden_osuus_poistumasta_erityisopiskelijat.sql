USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 1.4.2019 15:28:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_f_tab_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] AS
SELECT [tilv] AS Tilastovuosi
      ,d1.lahde AS [L�hde]
	  ,d2.maakunta AS [Koulutuksen maakunta]
	  ,d2.suuralue AS [Koulutuksen suuralue]
	  ,d2.ely AS [Koulutuksen ELY]
	  ,d2.avi AS [Koulutuksen AVI]
      ,d3.koulutuksen_jarjestaja AS [Koulutuksen j�rjest�j�]
	  ,d3.koulutuksen_jarjestajan_kieli AS [Koul. j�rjest�j�n kieli]
	  ,d3.koulutuksen_jarjestajan_omistajatyyppi AS [Koul. j�rjest�j�n omistajatyyppi]
	  ,d3.koulutuksen_jarjestajan_sijaintikunta AS [Koul. j�rjest�j�n sijaintikunta]
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
	  ,d4.iscle2011_SV as "Utbildn.niv�, niv� 1"
	  ,d4.Koulutusaste_taso2_SV as "Utbildn.niv�, niv� 2"
	  ,d4.iscfibroad2013_SV as "Utbildn.omr�de, niv� 1"
	  ,d4.iscfinarrow2013_SV as "Utbildn.omr�de, niv� 2"
	  ,d4.iscfi2013_SV as "Utbildn.omr�de, niv� 3"
	  ,d4.OKM_ohjauksen_ala_SV as "UKM-styrningsomr�de, h�gskolor"
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
      ,d7.koulutuksen_jarjestaja AS [Tutkinnon koul. j�rjest�j�]
	  ,d7.koulutuksen_jarjestajan_omistajatyyppi AS [Tutkinnon koul. j�rjest�j�n omistajatyyppi]
	  ,d7.koulutuksen_jarjestajan_kieli [Tutkinnon koul. j�rjest�j�n kieli]
	  ,d7.koulutuksen_jarjestajan_sijaintikunta AS [Tutkinnon koul. j�rjest�j�n sijaintikunta]
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
      ,d10.koulutuksen_jarjestaja AS [Seur. vuoden koul. j�rjest�j�]
	  ,d10.koulutuksen_jarjestajan_omistajatyyppi AS [Seur. vuoden koul. j�rjest�j�n omistajatyyppi]
	  ,d10.koulutuksen_jarjestajan_kieli AS [Seur. vuoden koul. j�rjest�j�n kieli]
	  ,d10.koulutuksen_jarjestajan_sijaintikunta AS [Seur. vuoden koul. j�rjest�j�n sijaintikunta]
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
	
      ,d12.opintojen_kulku_koulutuksen_jarjestajan_mukaan AS [Opintojen kulku koul. j�rjest�j�n mukaan (tutkinto priorisoitu)]
      ,d13.opintojen_kulku_koulutuksen_jarjestajan_mukaan AS [Opintojen kulku koul. j�rjest�j�n mukaan (opiskelu priorisoitu)]
      ,d14.opintojen_kulku_maakunnan_mukaan AS [Opintojen kulku koul. maakunnan mukaan (tutkinto priorisoitu)]
      ,d15.opintojen_kulku_maakunnan_mukaan AS [Opintojen kulku koul. maakunnan mukaan (opiskelu priorisoitu)]
      ,d16.opintojen_kulku_koulutusasteen_2002_mukaan AS [Opintojen kulku koul.asteen mukaan (tutkinto priorisoitu)]
      ,d17.opintojen_kulku_koulutusasteen_2002_mukaan AS [Opintojen kulku koul.asteen mukaan (opiskelu priorisoitu)]
      ,d18.opintojen_kulku_koulutusalan_2002_mukaan AS [Opintojen kulku koul.alan mukaan (tutkinto priorisoitu)]
      ,d19.opintojen_kulku_koulutusalan_2002_mukaan AS [Opintojen kulku koul.alan mukaan (opiskelu priorisoitu)]
      ,d20.opintojen_kulku_opintoala_2002_mukaan AS [Opintojen kulku opintoalan mukaan (tutkinto priorisoitu)]
      ,d21.opintojen_kulku_opintoala_2002_mukaan AS [Opintojen kulku opintoalan mukaan (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_j�rjest�ll�_tutkinto_priorisoitu_id) AS [Tutkinto tavoitet. koul. j�rjest�ll� (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_j�rjest�ll�_opiskelu_priorisoitu_id) AS [Tutkinto tavoitet. koul. j�rjest�ll� (opiskelu priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_j�rjest�ll�_tutkinto_priorisoitu_id) AS [Opiskelee tavoitet. koul. j�rjest�ll� (tutkinto priorisoitu)]
	  ,(SELECT kylla_ei FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_j�rjest�ll�_opiskelu_priorisoitu_id) AS [Opiskelee tavoitet. koul. j�rjest�ll� (opiskelu priorisoitu)]
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
	  ,[tilv] AS [Statistik�r]
      ,d1.lahde_SV AS [K�lla]
	  ,d2.maakunta_SV AS [Utbildningens landskap]
	  ,d2.suuralue_SV AS [Utbildningens storomr�de]
	  ,d2.ely_SV AS [Utbildningens NTM-omr�de]
	  ,d2.avi_SV AS [Utbildningens RFV-omr�de]
      ,d3.koulutuksen_jarjestaja_SV AS [Utbildningsanordnare]
	  ,d3.koulutuksen_jarjestajan_kieli_SV AS [Utbildningsanordnarens spr�k]
	  ,d3.koulutuksen_jarjestajan_omistajatyyppi_SV AS [Utbildningsanordnarens �gartyp]
	  ,d3.koulutuksen_jarjestajan_sijaintikunta_SV AS [Utbildningsanordnarens kommun]
      ,d4.koulutus_SV AS [Utbildningsben�mning]
	  ,d4.opintoala2002_SV AS [Studieomr�de]
	  ,d4.koulutusala2002_SV AS [Utbildningsomr�de]
	  ,d4.koulutusaste2002_SV AS [Utbildningsniv�]
      --,d5.opetushallinnon_koulutus_SV AS [F�rvaltningsomr�de]
	  ,d5b.hallinnonala_SV AS F�rvaltningsomr�de
	  ,d6.maakunta_SV AS [Examens landskap]
	  ,d6.ely_SV AS [Examens NMT-omr�de]
	  ,d6.avi_SV AS [Examens RFV-omr�de]
      ,d7.koulutuksen_jarjestaja_SV AS [Examens utbildningsanordnare]
	  ,d7.koulutuksen_jarjestajan_omistajatyyppi_SV AS [Examens utbildningsanordnarens �gartyp]
	  ,d7.koulutuksen_jarjestajan_kieli_SV AS [Examens utbildningsanordnarens spr�k]
	  ,d7.koulutuksen_jarjestajan_sijaintikunta_SV AS [Examens utbildningsanordnarens kommun]
      ,d8.koulutus_SV AS [Examens utbildningsben�mning]
	  ,d8.opintoala2002_SV AS [Examens studieomr�de]
	  ,d8.koulutusala2002_SV AS [Examens utbildningsomr�de]

	  --isced
	  ,d8.koulutusaste2002_SV AS [Examens utbildningsniv�]
	  ,d8.iscle2011_SV AS [Examens Utbildn.niv�, niv� 1]
	  ,d8.Koulutusaste_taso2_SV AS [Examens Utbildn.niv�, niv� 2]
	  ,d8.iscfibroad2013_SV AS [Examens Utbildn.omr�de, niv� 1]
	  ,d8.iscfinarrow2013_SV AS [Examens Utbildn.omr�de, niv� 2]
	  ,d8.iscfi2013_SV AS [Examens Utbildn.omr�de, niv� 3]

	  ,d9.maakunta_SV AS [N�sta �rs utbildningens landskap]
	  ,d9.ely_SV AS [N�sta �rs utbildningens NTM-omr�de]
	  ,d9.avi_SV AS [N�sta �rs utbildningens RFV-omr�de]
      ,d10.koulutuksen_jarjestaja_SV AS [N�sta �rs utbildningsanordnare]
	  ,d10.koulutuksen_jarjestajan_omistajatyyppi_SV AS [N�sta �rs utbildningsanordnarens �gartyp]
	  ,d10.koulutuksen_jarjestajan_kieli_SV AS [N�sta �rs utbildningsanordnarens spr�k]
	  ,d10.koulutuksen_jarjestajan_sijaintikunta_SV AS [N�sta �rs utbildningsanordnarens kommun]
      ,d11.koulutus_SV AS [N�sta �rs utbildningsben�mning]
	  ,d11.opintoala2002_SV AS [N�sta �rs studieomr�de]
	  ,d11.koulutusala2002_SV AS [N�sta �rs utbildningsomr�de]
	  ,d11.koulutusaste2002_SV AS [N�sta �rs utbildningsniv�]
	  --isced
	  ,d11.iscle2011_SV AS [N�sta �rs Utbildn.niv�, niv� 1]
	  ,d11.Koulutusaste_taso2_SV AS [N�sta �rs Utbildn.niv�, niv� 2]
	  ,d11.iscfibroad2013_SV AS [N�sta �rs Utbildn.omr�de, niv� 1]
	  ,d11.iscfinarrow2013_SV AS [N�sta �rs Utbildn.omr�de, niv� 2]
	  ,d11.iscfi2013_SV AS [N�sta �rs Utbildn.omr�de, niv� 3]
	 
      ,d12.opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV AS [Studiernas framskridande enligt utbildningsanordnare (examen prioriterad)]
      ,d13.opintojen_kulku_koulutuksen_jarjestajan_mukaan_SV AS [Studiernas framskridande enligt utbildningsanordnare (studie prioriterad)]
      ,d14.opintojen_kulku_maakunnan_mukaan_SV AS [Studiernas framskridande enligt utbildningens landskap (examen prioriterad)]
      ,d15.opintojen_kulku_maakunnan_mukaan_SV AS [Studiernas framskridande enligt utbildningens landskap (studie prioriterad)]
      ,d16.opintojen_kulku_koulutusasteen_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsniv� (examen prioriterad)]
      ,d17.opintojen_kulku_koulutusasteen_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsniv� (studie prioriterad)]
      ,d18.opintojen_kulku_koulutusalan_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsomr�de (examen prioriterad)]
      ,d19.opintojen_kulku_koulutusalan_2002_mukaan_SV AS [Studiernas framskridande enligt utbildningsomr�de (studie prioriterad)]
      ,d20.opintojen_kulku_opintoala_2002_mukaan_SV AS [Studiernas framskridande enligt studieomr�de (examen prioriterad)]
      ,d21.opintojen_kulku_opintoala_2002_mukaan_SV AS [Studiernas framskridande enligt studieomr�de (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_j�rjest�ll�_tutkinto_priorisoitu_id) AS [Examen i m�lexamens utbildningsanordnare (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_j�rjest�ll�_opiskelu_priorisoitu_id) AS [Examen i m�lexamens utbildningsanordnare (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_j�rjest�ll�_tutkinto_priorisoitu_id) AS [Studerar i m�lexamens utbildningsanordnare (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_j�rjest�ll�_opiskelu_priorisoitu_id) AS [Studerar i m�lexamens utbildningsanordnare (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Examen i m�lexamens landskap (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Examen i m�lexamens landskap (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id) AS [Studerar i m�lexamens landskap (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id) AS [Studerar i m�lexamens landskap (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Examen i m�lexamens utbildningsniv� (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Examen i m�lexamens utbildningsniv� (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id) AS [Studerar i m�lexamens utbildningsniv� (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id) AS [Studerar i m�lexamens utbildningsniv� (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Examen i m�lexamens utbildningsomr�de (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Examen i m�lexamens utbildningsomr�de (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id) AS [Studerar i m�lexamens utbildningsomr�de (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id) AS [Studerar i m�lexamens utbildningsomr�de (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Examen i m�lexamens studieomr�de (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Examen i m�lexamens studieomr�de (studie prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id) AS [Studerar i m�lexamens studieomr�de (examen prioriterad)]
	  ,(SELECT kylla_ei_SV FROM d_kylla_ei WHERE id = opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id) AS [Studerar i m�lexamens studieomr�de (studie prioriterad)]


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
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_j�rjest�ll�_tutkinto_priorisoitu_id) AS [Qualification in target education provider (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = tutkinto_tavoitet_koul_j�rjest�ll�_opiskelu_priorisoitu_id) AS [Qualification in target education provider (studies prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_j�rjest�ll�_tutkinto_priorisoitu_id) AS [Contin. studies in target education provider (qualification prioritized)]
	  ,(SELECT kylla_ei_EN FROM d_kylla_ei WHERE id = opiskelee_tavoitet_koul_j�rjest�ll�_opiskelu_priorisoitu_id) AS [Contin. studies in target education provider (studies prioritized)]
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


USE ANTERO