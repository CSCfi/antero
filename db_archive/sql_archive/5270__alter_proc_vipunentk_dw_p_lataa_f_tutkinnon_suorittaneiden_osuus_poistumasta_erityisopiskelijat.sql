USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]    Script Date: 28.12.2021 11:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[p_lataa_f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]

INSERT INTO [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat]
           ([tilv]
           ,[lahde_id]
           ,[alueluokitus_id]
           ,[oppilaitoksen_taustatiedot_id]
           ,[koulutusluokitus_id]
           ,[ophal_kylla_ei_id]
		   ,hallinnonala2_id
           ,[tutkinnon_alueluokitus_id]
           ,[tutkinnon_oppilaitoksen_taustatiedot_id]
           ,[tutkinnon_koulutusluokitus_id]
           ,[seurv_alueluokitus_id]
           ,[seurv_oppilaitoksen_taustatiedot_id]
           ,[seurv_koulutusluokitus_id]
           ,[lkm]
		   --uudet
           ,[opintojen_kulku_kaste_t2en_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_kaste_t2en_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_kala_t1n_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_kala_t1n_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_kala_t2n_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_kala_t2n_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_kala_t3n_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_kala_t3n_mukaan_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_kala_t1lla_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_kala_t1lla_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_kala_t1lla_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_kala_t1lla_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_kala_t2lla_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_kala_t2lla_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_kala_t2lla_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_kala_t2lla_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_kala_t3lla_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_kala_t3lla_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_kala_t3lla_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_kala_t3lla_opiskelu_priorisoitu_id]
		   --vanhat
           ,[opintojen_kulku_koul_jarj_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_koul_jarj_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_koul_maakunnan_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_koul_maakunnan_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_koul_asteen_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_koul_asteen_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_koul_alan_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_koul_alan_mukaan_opiskelu_priorisoitu_id]
           ,[opintojen_kulku_opintoalan_mukaan_tutkinto_priorisoitu_id]
           ,[opintojen_kulku_opintoalan_mukaan_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id]
           ,[tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id]
           ,[tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id]
           ,[opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id]
           ,[opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id])

SELECT [tilv]
        ,[lahde_id]
        ,[alueluokitus_id]
        ,[oppilaitoksen_taustatiedot_id]
        ,[koulutusluokitus_id]
        ,[ophal_kylla_ei_id]
		,hallinnonala2_id
        ,[tutkinnon_alueluokitus_id]
        ,[tutkinnon_oppilaitoksen_taustatiedot_id]
        ,[tutkinnon_koulutusluokitus_id]
        ,[seurv_alueluokitus_id]
        ,[seurv_oppilaitoksen_taustatiedot_id]
        ,[seurv_koulutusluokitus_id]
		,[lkm]
	--uudet
	  --kaste_t2
	  ,CASE	WHEN opisk_kaste_t2 = tutk_kaste_t2 THEN 1
			WHEN opisk_kaste_t2 <> tutk_kaste_t2 AND tutkinnon_koulutusluokitus_id <> -1 THEN 3
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kaste_t2 = seurv_kaste_t2 THEN 4
			WHEN opisk_kaste_t2 <> seurv_kaste_t2 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 5
			ELSE 8
		END AS opintojen_kulku_kaste_t2en_mukaan_tutkinto_priorisoitu_id

	  ,CASE	WHEN opisk_kaste_t2 = seurv_kaste_t2 THEN 4
			WHEN opisk_kaste_t2 <> seurv_kaste_t2 AND seurv_koulutusluokitus_id <> -1 THEN 5
			WHEN opisk_kaste_t2 = tutk_kaste_t2 THEN 1
			WHEN opisk_kaste_t2 <> tutk_kaste_t2 AND tutkinnon_koulutusluokitus_id <> -1 THEN 3
			ELSE 8
		END AS opintojen_kulku_kaste_t2en_mukaan_opiskelu_priorisoitu_id
		
	  --kala_t1
	  ,CASE	WHEN opisk_kala_t1 = tutk_kala_t1 THEN 1
			WHEN opisk_kala_t1 <> tutk_kala_t1 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kala_t1 = seurv_kala_t1 THEN 3
			WHEN opisk_kala_t1 <> seurv_kala_t1 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 4
			ELSE 7
		END AS opintojen_kulku_kala_t1_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t1 = seurv_kala_t1 THEN 3
			WHEN opisk_kala_t1 <> seurv_kala_t1 AND seurv_koulutusluokitus_id <> -1 THEN 4
			WHEN opisk_kala_t1 = tutk_kala_t1 THEN 1
			WHEN opisk_kala_t1 <> tutk_kala_t1 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_kala_t1_mukaan_opiskelu_priorisoitu_id
		
	  --kala_t2
	  ,CASE	WHEN opisk_kala_t2 = tutk_kala_t2 THEN 1
			WHEN opisk_kala_t2 <> tutk_kala_t2 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kala_t2 = seurv_kala_t2 THEN 3
			WHEN opisk_kala_t2 <> seurv_kala_t2 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 4
			ELSE 7
		END AS opintojen_kulku_kala_t2n_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t2 = seurv_kala_t2 THEN 3
			WHEN opisk_kala_t2 <> seurv_kala_t2 AND seurv_koulutusluokitus_id <> -1 THEN 4
			WHEN opisk_kala_t2 = tutk_kala_t2 THEN 1
			WHEN opisk_kala_t2 <> tutk_kala_t2 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_kala_t2n_mukaan_opiskelu_priorisoitu_id
		
	  --kala_t3
	  ,CASE	WHEN opisk_kala_t3 = tutk_kala_t3 THEN 1
			WHEN opisk_kala_t3 <> tutk_kala_t3 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kala_t3 = seurv_kala_t3 THEN 3
			WHEN opisk_kala_t3 <> seurv_kala_t3 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 4
			ELSE 7
		END AS opintojen_kulku_kala_t3_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t3 = seurv_kala_t3 THEN 3
			WHEN opisk_kala_t3 <> seurv_kala_t3 AND seurv_koulutusluokitus_id <> -1 THEN 4
			WHEN opisk_kala_t3 = tutk_kala_t3 THEN 1
			WHEN opisk_kala_t3 <> tutk_kala_t3 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_kala_t3_mukaan_opiskelu_priorisoitu_id
		   
	  --k/e, kaste_t2
	  ,CASE	WHEN opisk_kaste_t2 = tutk_kaste_t2 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kaste_t2 = seurv_kaste_t2 THEN 2
			WHEN opisk_kaste_t2 <> seurv_kaste_t2 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_kaste_t2 = tutk_kaste_t2 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id	
		
	  ,CASE	WHEN opisk_kaste_t2 = tutk_kaste_t2 THEN 2
			WHEN opisk_kaste_t2 <> tutk_kaste_t2 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kaste_t2 = seurv_kaste_t2 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kaste_t2ella_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kaste_t2 = seurv_kaste_t2 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kaste_t2ella_opiskelu_priorisoitu_id
		
	  --k/e, kala_t1
	  ,CASE	WHEN opisk_kala_t1 = tutk_kala_t1 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kala_t1lla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t1 = seurv_kala_t1 THEN 2
			WHEN opisk_kala_t1 <> seurv_kala_t1 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_kala_t1 = tutk_kala_t1 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kala_t1lla_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t1 = tutk_kala_t1 THEN 2
			WHEN opisk_kala_t1 <> tutk_kala_t1 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kala_t1 = seurv_kala_t1 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kala_t1lla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t1 = seurv_kala_t1 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kala_t1lla_opiskelu_priorisoitu_id
		
	  --k/e, kala_t2
	  ,CASE	WHEN opisk_kala_t2 = tutk_kala_t2 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kala_t2lla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t2 = seurv_kala_t2 THEN 2
			WHEN opisk_kala_t2 <> seurv_kala_t2 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_kala_t2 = tutk_kala_t2 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kala_t2lla_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t2 = tutk_kala_t2 THEN 2
			WHEN opisk_kala_t2 <> tutk_kala_t2 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kala_t2 = seurv_kala_t2 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kala_t2lla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t2 = seurv_kala_t2 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kala_t2lla_opiskelu_priorisoitu_id
		
	  --k/e, kala_t3
	  ,CASE	WHEN opisk_kala_t3 = tutk_kala_t3 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kala_t3lla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t3 = seurv_kala_t3 THEN 2
			WHEN opisk_kala_t3 <> seurv_kala_t3 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_kala_t3 = tutk_kala_t3 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_kala_t3lla_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t3 = tutk_kala_t3 THEN 2
			WHEN opisk_kala_t3 <> tutk_kala_t3 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_kala_t3 = seurv_kala_t3 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kala_t3lla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_kala_t3 = seurv_kala_t3 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_kala_t3lla_opiskelu_priorisoitu_id
		
	--vanhat
	  ,CASE	WHEN oppilaitoksen_taustatiedot_id = tutkinnon_oppilaitoksen_taustatiedot_id THEN 1
			WHEN oppilaitoksen_taustatiedot_id <> tutkinnon_oppilaitoksen_taustatiedot_id AND tutkinnon_oppilaitoksen_taustatiedot_id <> -1 THEN 2
			WHEN tutkinnon_oppilaitoksen_taustatiedot_id = -1 AND oppilaitoksen_taustatiedot_id = seurv_oppilaitoksen_taustatiedot_id THEN 3
			WHEN oppilaitoksen_taustatiedot_id <> seurv_oppilaitoksen_taustatiedot_id AND tutkinnon_oppilaitoksen_taustatiedot_id = -1 AND 
				(seurv_oppilaitoksen_taustatiedot_id <> -1 OR seurv_oppilaitoksen_taustatiedot_id = -1 AND seurv_alueluokitus_id <> -1 AND seurv_koulutusluokitus_id <> -1) THEN 4
			ELSE 7
		END AS opintojen_kulku_koul_jarj_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN oppilaitoksen_taustatiedot_id = seurv_oppilaitoksen_taustatiedot_id THEN 3
			WHEN oppilaitoksen_taustatiedot_id <> seurv_oppilaitoksen_taustatiedot_id AND 
				(seurv_oppilaitoksen_taustatiedot_id <> -1 OR seurv_oppilaitoksen_taustatiedot_id = -1 AND seurv_alueluokitus_id <> -1 AND seurv_koulutusluokitus_id <> -1) THEN 4
			WHEN oppilaitoksen_taustatiedot_id = tutkinnon_oppilaitoksen_taustatiedot_id THEN 1
			WHEN oppilaitoksen_taustatiedot_id <> tutkinnon_oppilaitoksen_taustatiedot_id AND tutkinnon_oppilaitoksen_taustatiedot_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_koul_jarj_mukaan_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN alueluokitus_id = tutkinnon_alueluokitus_id THEN 1
			WHEN alueluokitus_id <> tutkinnon_alueluokitus_id AND tutkinnon_alueluokitus_id <> -1 THEN 2
			WHEN tutkinnon_alueluokitus_id = -1 AND alueluokitus_id = seurv_alueluokitus_id THEN 3
			WHEN alueluokitus_id <> seurv_alueluokitus_id AND tutkinnon_alueluokitus_id = -1 AND seurv_alueluokitus_id <> -1 THEN 4
			ELSE 7
		END AS opintojen_kulku_koul_maakunnan_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN alueluokitus_id = seurv_alueluokitus_id THEN 3
			WHEN alueluokitus_id <> seurv_alueluokitus_id AND seurv_alueluokitus_id <> -1 THEN 4
			WHEN alueluokitus_id = tutkinnon_alueluokitus_id THEN 1
			WHEN alueluokitus_id <> tutkinnon_alueluokitus_id AND tutkinnon_alueluokitus_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_koul_maakunnan_mukaan_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusaste2002 = tutk_koulutusaste2002 THEN 1
			WHEN opisk_koulutusaste2002 <> tutk_koulutusaste2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 3
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_koulutusaste2002 = seurv_koulutusaste2002 THEN 4
			WHEN opisk_koulutusaste2002 <> seurv_koulutusaste2002 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 5
			ELSE 8
		END AS opintojen_kulku_koul_asteen_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusaste2002 = seurv_koulutusaste2002 THEN 4
			WHEN opisk_koulutusaste2002 <> seurv_koulutusaste2002 AND seurv_koulutusluokitus_id <> -1 THEN 5
			WHEN opisk_koulutusaste2002 = tutk_koulutusaste2002 THEN 1
			WHEN opisk_koulutusaste2002 <> tutk_koulutusaste2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 3
			ELSE 8
		END AS opintojen_kulku_koul_asteen_mukaan_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusala2002 = tutk_koulutusala2002 THEN 1
			WHEN opisk_koulutusala2002 <> tutk_koulutusala2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_koulutusala2002 = seurv_koulutusala2002 THEN 3
			WHEN opisk_koulutusala2002 <> seurv_koulutusala2002 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 4
			ELSE 7
		END AS opintojen_kulku_koul_alan_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusala2002 = seurv_koulutusala2002 THEN 3
			WHEN opisk_koulutusala2002 <> seurv_koulutusala2002 AND seurv_koulutusluokitus_id <> -1 THEN 4
			WHEN opisk_koulutusala2002 = tutk_koulutusala2002 THEN 1
			WHEN opisk_koulutusala2002 <> tutk_koulutusala2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_koul_alan_mukaan_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_opintoala2002 = tutk_opintoala2002 THEN 1
			WHEN opisk_opintoala2002 <> tutk_opintoala2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_opintoala2002 = seurv_opintoala2002 THEN 3
			WHEN opisk_opintoala2002 <> seurv_opintoala2002 AND tutkinnon_koulutusluokitus_id = -1 AND seurv_koulutusluokitus_id <> -1 THEN 4
			ELSE 7
		END AS opintojen_kulku_opintoalan_mukaan_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_opintoala2002 = seurv_opintoala2002 THEN 3
			WHEN opisk_opintoala2002 <> seurv_opintoala2002 AND seurv_koulutusluokitus_id <> -1 THEN 4
			WHEN opisk_opintoala2002 = tutk_opintoala2002 THEN 1
			WHEN opisk_opintoala2002 <> tutk_opintoala2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			ELSE 7
		END AS opintojen_kulku_opintoalan_mukaan_opiskelu_priorisoitu_id	
		
	  ,CASE	WHEN oppilaitoksen_taustatiedot_id = tutkinnon_oppilaitoksen_taustatiedot_id THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN oppilaitoksen_taustatiedot_id = seurv_oppilaitoksen_taustatiedot_id THEN 2
			WHEN oppilaitoksen_taustatiedot_id <> seurv_oppilaitoksen_taustatiedot_id AND 
				(seurv_oppilaitoksen_taustatiedot_id <> -1 OR seurv_oppilaitoksen_taustatiedot_id = -1 AND seurv_alueluokitus_id <> -1 AND seurv_koulutusluokitus_id <> -1) THEN 2
			WHEN oppilaitoksen_taustatiedot_id = tutkinnon_oppilaitoksen_taustatiedot_id THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN oppilaitoksen_taustatiedot_id = tutkinnon_oppilaitoksen_taustatiedot_id THEN 2
			WHEN oppilaitoksen_taustatiedot_id <> tutkinnon_oppilaitoksen_taustatiedot_id AND tutkinnon_oppilaitoksen_taustatiedot_id <> -1 THEN 2
			WHEN tutkinnon_oppilaitoksen_taustatiedot_id = -1 AND oppilaitoksen_taustatiedot_id = seurv_oppilaitoksen_taustatiedot_id THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_koul_järjeställä_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN oppilaitoksen_taustatiedot_id = seurv_oppilaitoksen_taustatiedot_id THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_koul_järjeställä_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN alueluokitus_id = tutkinnon_alueluokitus_id THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_maakunnassa_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN alueluokitus_id = seurv_alueluokitus_id THEN 2
			WHEN alueluokitus_id <> seurv_alueluokitus_id AND seurv_alueluokitus_id <> -1 THEN 2
			WHEN alueluokitus_id = tutkinnon_alueluokitus_id THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_maakunnassa_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN alueluokitus_id = tutkinnon_alueluokitus_id THEN 2
			WHEN alueluokitus_id <> tutkinnon_alueluokitus_id AND tutkinnon_alueluokitus_id <> -1 THEN 2
			WHEN tutkinnon_alueluokitus_id = -1 AND alueluokitus_id = seurv_alueluokitus_id THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_maakunnassa_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN alueluokitus_id = seurv_alueluokitus_id THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_maakunnassa_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusaste2002 = tutk_koulutusaste2002 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_koul_asteella_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusaste2002 = seurv_koulutusaste2002 THEN 2
			WHEN opisk_koulutusaste2002 <> seurv_koulutusaste2002 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_koulutusaste2002 = tutk_koulutusaste2002 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_koul_asteella_opiskelu_priorisoitu_id	
		
	  ,CASE	WHEN opisk_koulutusaste2002 = tutk_koulutusaste2002 THEN 2
			WHEN opisk_koulutusaste2002 <> tutk_koulutusaste2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_koulutusaste2002 = seurv_koulutusaste2002 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_koul_asteella_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusaste2002 = seurv_koulutusaste2002 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_koul_asteella_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusala2002 = tutk_koulutusala2002 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_koul_alalla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusala2002 = seurv_koulutusala2002 THEN 2
			WHEN opisk_koulutusala2002 <> seurv_koulutusala2002 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_koulutusala2002 = tutk_koulutusala2002 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_koul_alalla_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusala2002 = tutk_koulutusala2002 THEN 2
			WHEN opisk_koulutusala2002 <> tutk_koulutusala2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_koulutusala2002 = seurv_koulutusala2002 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_koul_alalla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_koulutusala2002 = seurv_koulutusala2002 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_koul_alalla_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_opintoala2002 = tutk_opintoala2002 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_opintoalalla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_opintoala2002 = seurv_opintoala2002 THEN 2
			WHEN opisk_opintoala2002 <> seurv_opintoala2002 AND seurv_koulutusluokitus_id <> -1 THEN 2
			WHEN opisk_opintoala2002 = tutk_opintoala2002 THEN 1
			ELSE 2
		END AS tutkinto_tavoitet_opintoalalla_opiskelu_priorisoitu_id
		
	  ,CASE	WHEN opisk_opintoala2002 = tutk_opintoala2002 THEN 2
			WHEN opisk_opintoala2002 <> tutk_opintoala2002 AND tutkinnon_koulutusluokitus_id <> -1 THEN 2
			WHEN tutkinnon_koulutusluokitus_id = -1 AND opisk_opintoala2002 = seurv_opintoala2002 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_opintoalalla_tutkinto_priorisoitu_id
		
	  ,CASE	WHEN opisk_opintoala2002 = seurv_opintoala2002 THEN 1
			ELSE 2
		END AS opiskelee_tavoitet_opintoalalla_opiskelu_priorisoitu_id
		
FROM
(SELECT [tilv]
      ,COALESCE(d1.id, -2) AS [lahde_id]
      ,COALESCE(d2.id, -2) AS [alueluokitus_id]
      ,COALESCE(d3.id, -2) AS [oppilaitoksen_taustatiedot_id]
      ,COALESCE(d4.id, -2) AS koulutusluokitus_id
      ,CASE WHEN [ophal] = 1 THEN 1 WHEN [ophal] = 0 THEN 1 ELSE -1 END AS ophal_kylla_ei_id
	  ,COALESCE(d11.id, -2) AS hallinnonala2_id
      ,COALESCE(d5.id, -2) AS [tutkinnon_alueluokitus_id]
      ,COALESCE(d6.id, -2) AS [tutkinnon_oppilaitoksen_taustatiedot_id]
      ,COALESCE(d7.id, -2) AS [tutkinnon_koulutusluokitus_id]
      ,COALESCE(d8.id, -2) AS [seurv_alueluokitus_id]
      ,COALESCE(d9.id, -2) AS [seurv_oppilaitoksen_taustatiedot_id]
      ,COALESCE(d10.id, -2) AS [seurv_koulutusluokitus_id]
	  ,[lkm]
	  --vanhat
	  ,COALESCE(d4.koulutusaste2002_koodi, -2) AS opisk_koulutusaste2002
	  ,COALESCE(d7.koulutusaste2002_koodi, -2) AS tutk_koulutusaste2002
	  ,COALESCE(d10.koulutusaste2002_koodi, -2) AS seurv_koulutusaste2002
	  ,COALESCE(d4.koulutusala2002_koodi, -2) AS opisk_koulutusala2002
	  ,COALESCE(d7.koulutusala2002_koodi, -2) AS tutk_koulutusala2002
	  ,COALESCE(d10.koulutusala2002_koodi, -2) AS seurv_koulutusala2002
	  ,COALESCE(d4.opintoala2002_koodi, -2) AS opisk_opintoala2002
	  ,COALESCE(d7.opintoala2002_koodi, -2) AS tutk_opintoala2002
	  ,COALESCE(d10.opintoala2002_koodi, -2) AS seurv_opintoala2002
	  --uudet
	  ,COALESCE(d4.Koulutusaste_taso2_koodi, -2) AS opisk_kaste_t2
	  ,COALESCE(d7.Koulutusaste_taso2_koodi, -2) AS tutk_kaste_t2
	  ,COALESCE(d10.Koulutusaste_taso2_koodi, -2) AS seurv_kaste_t2
	  ,COALESCE(d4.iscfibroad2013_koodi, -2) AS opisk_kala_t1
	  ,COALESCE(d7.iscfibroad2013_koodi, -2) AS tutk_kala_t1
	  ,COALESCE(d10.iscfibroad2013_koodi, -2) AS seurv_kala_t1
	  ,COALESCE(d4.iscfinarrow2013_koodi, -2) AS opisk_kala_t2
	  ,COALESCE(d7.iscfinarrow2013_koodi, -2) AS tutk_kala_t2
	  ,COALESCE(d10.iscfinarrow2013_koodi, -2) AS seurv_kala_t2
	  ,COALESCE(d4.iscfi2013_koodi, -2) AS opisk_kala_t3
	  ,COALESCE(d7.iscfi2013_koodi, -2) AS tutk_kala_t3
	  ,COALESCE(d10.iscfi2013_koodi, -2) AS seurv_kala_t3
	  
  FROM [dbo].[sa_3_7_tutkinnon_suorittaneiden_osuus_poistumasta_erityisopiskelijat] f
  LEFT JOIN [VipunenTK].[dbo].[d_lahde] d1 ON d1.lahde_koodi = f.lahde
  LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d2 ON d2.[alueluokitus_avain] = CASE WHEN f.[kmaak] <> -1 THEN 'MAAK' ELSE '' END + f.[kmaak]
  LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d3 ON d3.oppilaitos_avain = f.jarj
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d4 ON d4.koulutusluokitus_avain = f.koulk
  LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d5 ON d5.[alueluokitus_avain] = CASE WHEN f.[tutkmaak] <> -1 THEN 'MAAK' ELSE '' END + f.[tutkmaak]
  LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d6 ON d6.oppilaitos_avain = f.tutkjarj
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d7 ON d7.koulutusluokitus_avain = f.tutkkoulk
  LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d8 ON d8.[alueluokitus_avain] = CASE WHEN f.[seurvkmaak] <> -1 THEN 'MAAK' ELSE '' END + f.[seurvkmaak]
  LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d9 ON d9.oppilaitos_avain = f.seurvjarj
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d10 ON d10.koulutusluokitus_avain = f.seurvkoulk
  LEFT JOIN VipunenTK.dbo.d_hallinnonala2 d11 on d11.hallinnonala_koodi=
  case
	when f.ophal = '1' then '1' --Opetushallinto, pl. työvoimakoulutus
	when f.ophal = '2' and coalesce(coalesce(d3.koulutuksen_jarjestajan_korvaavakoodi,d3.koulutuksen_jarjestajakoodi),'') not in ('0145076-7','2153105-4','150622-3','0909306-3' /*'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'*/) then '2' --Opetushallinto, työvoimakoulutus
	when f.ophal = '2' then '3' --Muiden hallinnonalojen alainen koulutus
	else '-1'
  end
  ) a



