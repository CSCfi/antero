USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[_v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvojen_avaimet]    Script Date: 18.9.2021 23:13:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW [dbo].[_v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvojen_avaimet] AS

--lisätty 9-11 / CSC Juha 20.9.2021

-- Asettaa tilanteiden 1-8 avaimet
-- Lisätty saavutetun koulutuksen tiedot /Jarmo 24.5.2013
-- Lisätty kandi-tutkintolajit /Jarmo 23.1.2014

-- Select * from vipunen_ETL.v_aloittaneiden_lapaisy_lasketut_sarakkeet_dimensioarvojen_avaimet order by rivinumero
SELECT rivinumero
,[1a_koodi] = Case 
	when [1a_tutkinto_alkuperaisessa_tutkintolajissa]>0 then '1a_tutkinto_alkuperaisessa_tutkintolajissa'
	when [1a_tutkinto_kandi_tutkintolajissa]>0 then '1a_tutkinto_kandi_tutkintolajissa'
	when [1a_tutkinto_muussa_tutkintolajissa]>0 then '1a_tutkinto_muussa_tutkintolajissa'
	when [1a_opiskelee_alkuperaisessa_tutkintolajissa]>0 then '1a_opiskelee_alkuperaisessa_tutkintolajissa'
	when [1a_opiskelee_muussa_tutkintolajissa]>0 then '1a_opiskelee_muussa_tutkintolajissa'
	when [1a_keskeyttanyt_tyollinen]>0 then '1a_keskeyttanyt_tyollinen'
	when [1a_keskeyttanyt_ei_tyollinen]>0 then '1a_keskeyttanyt_ei_tyollinen'
	end
,[1b_koodi] = Case 
	when [1b_tutkinto_alkuperaisessa_tutkintolajissa]>0 then '1b_tutkinto_alkuperaisessa_tutkintolajissa'
	when [1b_opiskelee_alkuperaisessa_tutkintolajissa]>0 then '1b_opiskelee_alkuperaisessa_tutkintolajissa'
	when [1b_tutkinto_kandi_tutkintolajissa]>0 then '1b_tutkinto_kandi_tutkintolajissa'
	when [1b_tutkinto_muussa_tutkintolajissa]>0 then '1b_tutkinto_muussa_tutkintolajissa'
	when [1b_opiskelee_muussa_tutkintolajissa]>0 then '1b_opiskelee_muussa_tutkintolajissa'
	when [1b_keskeyttanyt_tyollinen]>0 then '1b_keskeyttanyt_tyollinen'
	when [1b_keskeyttanyt_ei_tyollinen]>0 then '1b_keskeyttanyt_ei_tyollinen'
	end
,[1c_koodi] = Case 
	when [1c_tutkinto_lukiokoulutuksesta]>0 then '1c_tutkinto_lukiokoulutuksesta'
	when [1c_ammatillinen_perustutkinto]>0 then '1c_ammatillinen_perustutkinto'
	when [1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto]>0 then '1c_ammatillinen_lisakoulutus_ammattitutkinto_tai_erikoisammattitutkinto'
	when [1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto]>0 then '1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_korkeakoulututkinto'
	when [1c_ammattikorkeakoulututkinto]>0 then '1c_ammattikorkeakoulututkinto'
	when [1c_alempi_korkeakoulututkinto]>0 then '1c_alempi_korkeakoulututkinto'
	when [1c_ylempi_ammattikorkeakoulututkinto]>0 then '1c_ylempi_ammattikorkeakoulututkinto'
	when [1c_ylempi_korkeakoulututkinto]>0 then '1c_ylempi_korkeakoulututkinto'
	when [1c_tutkijakoulutusasteen_tutkinto]>0 then '1c_tutkijakoulutusasteen_tutkinto'
	when [1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste]>0 then '1c_muu_korkein_ja_viimeisimmaksi_suoritettu_tutkinto_toinen_aste'
	when [1c_ei_tutkintoa]>0 then '1c_ei_tutkintoa'
	end
,[1d_koodi] = Case 
	when [1d_opiskelee_lukiokoulutuksessa]>0 then '1d_opiskelee_lukiokoulutuksessa'
	when [1d_opiskelee_ammatillista_perustutkintoa]>0 then '1d_opiskelee_ammatillista_perustutkintoa'
	when [1d_opiskelee_ammatillisessa_lisakoulutuksessa]>0 then '1d_opiskelee_ammatillisessa_lisakoulutuksessa'
	when [1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto]>0 then '1d_opiskelee_muussa_koulutuksessa_korkeakoulututkinto'
	when [1d_opiskelee_ammattikorkeakoulututkintoa]>0 then '1d_opiskelee_ammattikorkeakoulututkintoa'
	when [1d_opiskelee_alempaa_korkeakoulututkintoa]>0 then '1d_opiskelee_alempaa_korkeakoulututkintoa'
	when [1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa]>0 then '1d_opiskelee_ylempaa_ammattikorkeakoulututkintoa'
	when [1d_opiskelee_ylempaa_korkeakoulututkintoa]>0 then '1d_opiskelee_ylempaa_korkeakoulututkintoa'
	when [1d_opiskelee_tieteellista_jatkotutkintoa]>0 then '1d_opiskelee_tieteellista_jatkotutkintoa'
	when [1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij]>0 then '1d_opiskelu_muuhun_kuin_korkeakoulututkintoon_johtavassa_koulutuksessa_toisen_asteen_opiskelu_ammatillinen_poimitaan_ensisij'
	when [1d_ei_opiskele]>0 then '1d_ei_opiskele'
	end
,[1e_koodi] = Case 
	when [1e_kylla]>0 then '1e_kylla'
	when [1e_ei]>0 then '1e_ei'	
	end
,[1f_koodi] = Case 
	when [1f_kylla]>0 then '1f_kylla'
	when [1f_ei]>0 then '1f_ei'
	end
,[1g_koodi] = Case 
	when [1g_kylla]>0 then '1g_kylla'
	when [1g_ei]>0 then '1g_ei'
	end
,[1h_koodi] = Case 
	when [1h_kylla]>0 then '1h_kylla'
	when [1h_ei]>0 then '1h_ei'
	end
,[2a_koodi] = Case 
	when [2a_tutkinto_alkuperaisella_koulutusalalla_2002]>0 then '2a_tutkinto_alkuperaisella_koulutusalalla_2002'
	when [2a_tutkinto_muulla_koulutusalalla_2002]>0 then '2a_tutkinto_muulla_koulutusalalla_2002'
	when [2a_opiskelee_alkuperaisella_koulutusalalla_2002]>0 then '2a_opiskelee_alkuperaisella_koulutusalalla_2002'
	when [2a_opiskelee_muulla_koulutusalalla_2002]>0 then '2a_opiskelee_muulla_koulutusalalla_2002'
	when [2a_keskeyttanyt_tyollinen]>0 then '2a_keskeyttanyt_tyollinen'
	when [2a_keskeyttanyt_ei_tyollinen]>0 then '2a_keskeyttanyt_ei_tyollinen'
	end
,[2b_koodi] = Case 
	when [2b_tutkinto_alkuperaisella_koulutusalalla_2002]>0 then '2b_tutkinto_alkuperaisella_koulutusalalla_2002'
	when [2b_opiskelee_alkuperaisella_koulutusalalla_2002]>0 then '2b_opiskelee_alkuperaisella_koulutusalalla_2002'
	when [2b_tutkinto_muulla_koulutusalalla_2002]>0 then '2b_tutkinto_muulla_koulutusalalla_2002'
	when [2b_opiskelee_muulla_koulutusalalla_2002]>0 then '2b_opiskelee_muulla_koulutusalalla_2002'
	when [2b_keskeyttanyt_tyollinen]>0 then '2b_keskeyttanyt_tyollinen'
	when [2b_keskeyttanyt_ei_tyollinen]>0 then '2b_keskeyttanyt_ei_tyollinen'
	end
,[2e_koodi] = Case 
	when [2e_kylla]>0 then '2e_kylla'
	when [2e_ei]>0 then '2e_ei'
	end
,[2f_koodi] = Case 
	when [2f_kylla]>0 then '2f_kylla'
	when [2f_ei]>0 then '2f_ei'
	end
,[2g_koodi] = Case 
	when [2g_kylla]>0 then '2g_kylla'
	when [2g_ei]>0 then '2g_ei'
	end
,[2h_koodi] = Case 
	when [2h_kylla]>0 then '2h_kylla'
	when [2h_ei]>0 then '2h_ei'
	end
,[3a_koodi] = Case 
	when [3a_tutkinto_alkuperaisella_opintoalalla_2002]>0 then '3a_tutkinto_alkuperaisella_opintoalalla_2002'
	when [3a_tutkinto_muulla_opintoalalla_2002]>0 then '3a_tutkinto_muulla_opintoalalla_2002'
	when [3a_opiskelee_alkuperaisella_opintoalalla_2002]>0 then '3a_opiskelee_alkuperaisella_opintoalalla_2002'
	when [3a_opiskelee_muulla_opintoalalla_2002]>0 then '3a_opiskelee_muulla_opintoalalla_2002'
	when [3a_keskeyttanyt_tyollinen]>0 then '3a_keskeyttanyt_tyollinen'
	when [3a_keskeyttanyt_ei_tyollinen]>0 then '3a_keskeyttanyt_ei_tyollinen'
	end
,[3b_koodi] = Case 
	when [3b_tutkinto_alkuperaisella_opintoalalla_2002]>0 then '3b_tutkinto_alkuperaisella_opintoalalla_2002'
	when [3b_opiskelee_alkuperaisella_opintoalalla_2002]>0 then '3b_opiskelee_alkuperaisella_opintoalalla_2002'
	when [3b_tutkinto_muulla_opintoalalla_2002]>0 then '3b_tutkinto_muulla_opintoalalla_2002'
	when [3b_opiskelee_muulla_opintoalalla_2002]>0 then '3b_opiskelee_muulla_opintoalalla_2002'
	when [3b_keskeyttanyt_tyollinen]>0 then '3b_keskeyttanyt_tyollinen'
	when [3b_keskeyttanyt_ei_tyollinen]>0 then '3b_keskeyttanyt_ei_tyollinen'
	end
,[3e_koodi] = Case 
	when [3e_kylla]>0 then '3e_kylla'
	when [3e_ei]>0 then '3e_ei'
	end
,[3f_koodi] = Case 
	when [3f_kylla]>0 then '3f_kylla'
	when [3f_ei]>0 then '3f_ei'
	end
,[3g_koodi] = Case 
	when [3g_kylla]>0 then '3g_kylla'
	when [3g_ei]>0 then '3g_ei'
	end
,[3h_koodi] = Case 
	when [3h_kylla]>0 then '3h_kylla'
	when [3h_ei]>0 then '3h_ei'
	end
,[4a_koodi] = Case 
	when [4a_tutkinto_alkuperaisella_jarjestajalla]>0 then '4a_tutkinto_alkuperaisella_jarjestajalla'
	when [4a_tutkinto_muulla_jarjestajalla]>0 then '4a_tutkinto_muulla_jarjestajalla'
	when [4a_opiskelee_alkuperaisella_jarjestajalla]>0 then '4a_opiskelee_alkuperaisella_jarjestajalla'
	when [4a_opiskelee_muulla_jarjestajalla]>0 then '4a_opiskelee_muulla_jarjestajalla'
	when [4a_keskeyttanyt_tyollinen]>0 then '4a_keskeyttanyt_tyollinen'
	when [4a_keskeyttanyt_ei_tyollinen]>0 then '4a_keskeyttanyt_ei_tyollinen'
	end
,[4b_koodi] = Case 
	when [4b_tutkinto_alkuperaisella_jarjestajalla]>0 then '4b_tutkinto_alkuperaisella_jarjestajalla'
	when [4b_opiskelee_alkuperaisella_jarjestajalla]>0 then '4b_opiskelee_alkuperaisella_jarjestajalla'
	when [4b_tutkinto_muulla_jarjestajalla]>0 then '4b_tutkinto_muulla_jarjestajalla'
	when [4b_opiskelee_muulla_jarjestajalla]>0 then '4b_opiskelee_muulla_jarjestajalla'
	when [4b_keskeyttanyt_tyollinen]>0 then '4b_keskeyttanyt_tyollinen'
	when [4b_keskeyttanyt_ei_tyollinen]>0 then '4b_keskeyttanyt_ei_tyollinen'
	end
,[4e_koodi] = Case 
	when [4e_kylla]>0 then '4e_kylla'
	when [4e_ei]>0 then '4e_ei'
	end
,[4f_koodi] = Case 
	when [4f_kylla]>0 then '4f_kylla'
	when [4f_ei]>0 then '4f_ei'
	end
,[4g_koodi] = Case 
	when [4g_kylla]>0 then '4g_kylla'
	when [4g_ei]>0 then '4g_ei'
	end
,[4h_koodi] = Case 
	when [4h_kylla]>0 then '4h_kylla'
	when [4h_ei]>0 then '4h_ei'
	end
,[5a_koodi] = Case 
	when [5a_tutkinto_alkuperaisessa_oppilaitoksessa]>0 then '5a_tutkinto_alkuperaisessa_oppilaitoksessa'
	when [5a_tutkinto_muussa_oppilaitoksessa]>0 then '5a_tutkinto_muussa_oppilaitoksessa'
	when [5a_opiskelee_alkuperaisessa_oppilaitoksessa]>0 then '5a_opiskelee_alkuperaisessa_oppilaitoksessa'
	when [5a_opiskelee_muussa_oppilaitoksessa]>0 then '5a_opiskelee_muussa_oppilaitoksessa'
	when [5a_keskeyttanyt_tyollinen]>0 then '5a_keskeyttanyt_tyollinen'
	when [5a_keskeyttanyt_ei_tyollinen]>0 then '5a_keskeyttanyt_ei_tyollinen'
	end
,[5b_koodi] = Case 
	when [5b_tutkinto_alkuperaisessa_oppilaitoksessa]>0 then '5b_tutkinto_alkuperaisessa_oppilaitoksessa'
	when [5b_opiskelee_alkuperaisessa_oppilaitoksessa]>0 then '5b_opiskelee_alkuperaisessa_oppilaitoksessa'
	when [5b_tutkinto_muussa_oppilaitoksessa]>0 then '5b_tutkinto_muussa_oppilaitoksessa'
	when [5b_opiskelee_muussa_oppilaitoksessa]>0 then '5b_opiskelee_muussa_oppilaitoksessa'
	when [5b_keskeyttanyt_tyollinen]>0 then '5b_keskeyttanyt_tyollinen'
	when [5b_keskeyttanyt_ei_tyollinen]>0 then '5b_keskeyttanyt_ei_tyollinen'
	end
,[5e_koodi] = Case 
	when [5e_kylla]>0 then '5e_kylla'
	when [5e_ei]>0 then '5e_ei'
	end
,[5f_koodi] = Case 
	when [5f_kylla]>0 then '5f_kylla'
	when [5f_ei]>0 then '5f_ei'
	end
,[5g_koodi] = Case 
	when [5g_kylla]>0 then '5g_kylla'
	when [5g_ei]>0 then '5g_ei'
	end
,[5h_koodi] = Case 
	when [5h_kylla]>0 then '5h_kylla'
	when [5h_ei]>0 then '5h_ei'
	end
,[6a_koodi] = Case 
	when [6a_tutkinto_alkuperaisessa_maakunnassa]>0 then '6a_tutkinto_alkuperaisessa_maakunnassa'
	when [6a_tutkinto_muussa_maakunnassa]>0 then '6a_tutkinto_muussa_maakunnassa'
	when [6a_opiskelee_alkuperaisessa_maakunnassa]>0 then '6a_opiskelee_alkuperaisessa_maakunnassa'
	when [6a_opiskelee_muussa_maakunnassa]>0 then '6a_opiskelee_muussa_maakunnassa'
	when [6a_keskeyttanyt_tyollinen]>0 then '6a_keskeyttanyt_tyollinen'
	when [6a_keskeyttanyt_ei_tyollinen]>0 then '6a_keskeyttanyt_ei_tyollinen'
	end
,[6b_koodi] = Case 
	when [6b_tutkinto_alkuperaisessa_maakunnassa]>0 then '6b_tutkinto_alkuperaisessa_maakunnassa'
	when [6b_opiskelee_alkuperaisessa_maakunnassa]>0 then '6b_opiskelee_alkuperaisessa_maakunnassa'
	when [6b_tutkinto_muussa_maakunnassa]>0 then '6b_tutkinto_muussa_maakunnassa'
	when [6b_opiskelee_muussa_maakunnassa]>0 then '6b_opiskelee_muussa_maakunnassa'
	when [6b_keskeyttanyt_tyollinen]>0 then '6b_keskeyttanyt_tyollinen'
	when [6b_keskeyttanyt_ei_tyollinen]>0 then '6b_keskeyttanyt_ei_tyollinen'
	end
,[6e_koodi] = Case 
	when [6e_kylla]>0 then '6e_kylla'
	when [6e_ei]>0 then '6e_ei'
	end
,[6f_koodi] = Case 
	when [6f_kylla]>0 then '6f_kylla'
	when [6f_ei]>0 then '6f_ei'
	end
,[6g_koodi] = Case 
	when [6g_kylla]>0 then '6g_kylla'
	when [6g_ei]>0 then '6g_ei'
	end
,[6h_koodi] = Case 
	when [6h_kylla]>0 then '6h_kylla'
	when [6h_ei]>0 then '6h_ei'
	end
,[7a_koodi] = Case 
	when [7a_tutkinto_alkuperaisella_koulutussektorilla]>0 then '7a_tutkinto_alkuperaisella_koulutussektorilla'
	when [7a_tutkinto_muulla_koulutussektorilla]>0 then '7a_tutkinto_muulla_koulutussektorilla'
	when [7a_opiskelee_alkuperaisella_koulutussektorilla]>0 then '7a_opiskelee_alkuperaisella_koulutussektorilla'
	when [7a_opiskelee_muulla_koulutussektorilla]>0 then '7a_opiskelee_muulla_koulutussektorilla'
	when [7a_keskeyttanyt_tyollinen]>0 then '7a_keskeyttanyt_tyollinen'
	when [7a_keskeyttanyt_ei_tyollinen]>0 then '7a_keskeyttanyt_ei_tyollinen'
	end
,[7b_koodi] = Case 
	when [7b_tutkinto_alkuperaisella_koulutussektorilla]>0 then '7b_tutkinto_alkuperaisella_koulutussektorilla'
	when [7b_opiskelee_alkuperaisella_koulutussektorilla]>0 then '7b_opiskelee_alkuperaisella_koulutussektorilla'
	when [7b_tutkinto_muulla_koulutussektorilla]>0 then '7b_tutkinto_muulla_koulutussektorilla'
	when [7b_opiskelee_muulla_koulutussektorilla]>0 then '7b_opiskelee_muulla_koulutussektorilla'
	when [7b_keskeyttanyt_tyollinen]>0 then '7b_keskeyttanyt_tyollinen'
	when [7b_keskeyttanyt_ei_tyollinen]>0 then '7b_keskeyttanyt_ei_tyollinen'
	end
,[7e_koodi] = Case 
	when [7e_kylla]>0 then '7e_kylla'
	when [7e_ei]>0 then '7e_ei'
	end
,[7f_koodi] = Case 
	when [7f_kylla]>0 then '7f_kylla'
	when [7f_ei]>0 then '7f_ei'
	end
,[7g_koodi] = Case 
	when [7g_kylla]>0 then '7g_kylla'
	when [7g_ei]>0 then '7g_ei'
	end
,[7h_koodi] = Case 
	when [7h_kylla]>0 then '7h_kylla'
	when [7h_ei]>0 then '7h_ei'
	end
,[8a_koodi] = Case 
	when [8a_tutkinto_alkuperaisella_opintoalalla_1995]>0 then '8a_tutkinto_alkuperaisella_opintoalalla_1995'
	when [8a_tutkinto_muulla_opintoalalla_1995]>0 then '8a_tutkinto_muulla_opintoalalla_1995'
	when [8a_opiskelee_alkuperaisella_opintoalalla_1995]>0 then '8a_opiskelee_alkuperaisella_opintoalalla_1995'
	when [8a_opiskelee_muulla_opintoalalla_1995]>0 then '8a_opiskelee_muulla_opintoalalla_1995'
	when [8a_keskeyttanyt_tyollinen]>0 then '8a_keskeyttanyt_tyollinen'
	when [8a_keskeyttanyt_ei_tyollinen]>0 then '8a_keskeyttanyt_ei_tyollinen'
	end
,[8b_koodi] = Case 
	when [8b_tutkinto_alkuperaisella_opintoalalla_1995]>0 then '8b_tutkinto_alkuperaisella_opintoalalla_1995'
	when [8b_opiskelee_alkuperaisella_opintoalalla_1995]>0 then '8b_opiskelee_alkuperaisella_opintoalalla_1995'
	when [8b_tutkinto_muulla_opintoalalla_1995]>0 then '8b_tutkinto_muulla_opintoalalla_1995'
	when [8b_opiskelee_muulla_opintoalalla_1995]>0 then '8b_opiskelee_muulla_opintoalalla_1995'
	when [8b_keskeyttanyt_tyollinen]>0 then '8b_keskeyttanyt_tyollinen'
	when [8b_keskeyttanyt_ei_tyollinen]>0 then '8b_keskeyttanyt_ei_tyollinen'
	end
,[8e_koodi] = Case 
	when [8e_kylla]>0 then '8e_kylla'
	when [8e_ei]>0 then '8e_ei'
	end
,[8f_koodi] = Case 
	when [8f_kylla]>0 then '8f_kylla'
	when [8f_ei]>0 then '8f_ei'
	end
,[8g_koodi] = Case 
	when [8g_kylla]>0 then '8g_kylla'
	when [8g_ei]>0 then '8g_ei'
	end
,[8h_koodi] = Case 
	when [8h_kylla]>0 then '8h_kylla'
	when [8h_ei]>0 then '8h_ei'
	end
,[9a_koodi] = Case 
	when [9a_tutkinto_alkuperaisella_koulutusalalla1]>0 then '9a_tutkinto_alkuperaisella_koulutusalalla1'
	when [9a_tutkinto_muulla_koulutusalalla1]>0 then '9a_tutkinto_muulla_koulutusalalla1'
	when [9a_opiskelee_alkuperaisella_koulutusalalla1]>0 then '9a_opiskelee_alkuperaisella_koulutusalalla1'
	when [9a_opiskelee_muulla_koulutusalalla1]>0 then '9a_opiskelee_muulla_koulutusalalla1'
	when [9a_keskeyttanyt_tyollinen]>0 then '9a_keskeyttanyt_tyollinen'
	when [9a_keskeyttanyt_ei_tyollinen]>0 then '9a_keskeyttanyt_ei_tyollinen'
	end
,[9b_koodi] = Case 
	when [9b_tutkinto_alkuperaisella_koulutusalalla1]>0 then '9b_tutkinto_alkuperaisella_koulutusalalla1'
	when [9b_opiskelee_alkuperaisella_koulutusalalla1]>0 then '9b_opiskelee_alkuperaisella_koulutusalalla1'
	when [9b_tutkinto_muulla_koulutusalalla1]>0 then '9b_tutkinto_muulla_koulutusalalla1'
	when [9b_opiskelee_muulla_koulutusalalla1]>0 then '9b_opiskelee_muulla_koulutusalalla1'
	when [9b_keskeyttanyt_tyollinen]>0 then '9b_keskeyttanyt_tyollinen'
	when [9b_keskeyttanyt_ei_tyollinen]>0 then '9b_keskeyttanyt_ei_tyollinen'
	end
,[9e_koodi] = Case 
	when [9e_kylla]>0 then '9e_kylla'
	when [9e_ei]>0 then '9e_ei'
	end
,[9f_koodi] = Case 
	when [9f_kylla]>0 then '9f_kylla'
	when [9f_ei]>0 then '9f_ei'
	end
,[9g_koodi] = Case 
	when [9g_kylla]>0 then '9g_kylla'
	when [9g_ei]>0 then '9g_ei'
	end
,[9h_koodi] = Case 
	when [9h_kylla]>0 then '9h_kylla'
	when [9h_ei]>0 then '9h_ei'
	end
,[10a_koodi] = Case 
	when [10a_tutkinto_alkuperaisella_koulutusalalla2]>0 then '10a_tutkinto_alkuperaisella_koulutusalalla2'
	when [10a_tutkinto_muulla_koulutusalalla2]>0 then '10a_tutkinto_muulla_koulutusalalla2'
	when [10a_opiskelee_alkuperaisella_koulutusalalla2]>0 then '10a_opiskelee_alkuperaisella_koulutusalalla2'
	when [10a_opiskelee_muulla_koulutusalalla2]>0 then '10a_opiskelee_muulla_koulutusalalla2'
	when [10a_keskeyttanyt_tyollinen]>0 then '10a_keskeyttanyt_tyollinen'
	when [10a_keskeyttanyt_ei_tyollinen]>0 then '10a_keskeyttanyt_ei_tyollinen'
	end
,[10b_koodi] = Case 
	when [10b_tutkinto_alkuperaisella_koulutusalalla2]>0 then '10b_tutkinto_alkuperaisella_koulutusalalla2'
	when [10b_opiskelee_alkuperaisella_koulutusalalla2]>0 then '10b_opiskelee_alkuperaisella_koulutusalalla2'
	when [10b_tutkinto_muulla_koulutusalalla2]>0 then '10b_tutkinto_muulla_koulutusalalla2'
	when [10b_opiskelee_muulla_koulutusalalla2]>0 then '10b_opiskelee_muulla_koulutusalalla2'
	when [10b_keskeyttanyt_tyollinen]>0 then '10b_keskeyttanyt_tyollinen'
	when [10b_keskeyttanyt_ei_tyollinen]>0 then '10b_keskeyttanyt_ei_tyollinen'
	end
,[10e_koodi] = Case 
	when [10e_kylla]>0 then '10e_kylla'
	when [10e_ei]>0 then '10e_ei'
	end
,[10f_koodi] = Case 
	when [10f_kylla]>0 then '10f_kylla'
	when [10f_ei]>0 then '10f_ei'
	end
,[10g_koodi] = Case 
	when [10g_kylla]>0 then '10g_kylla'
	when [10g_ei]>0 then '10g_ei'
	end
,[10h_koodi] = Case 
	when [10h_kylla]>0 then '10h_kylla'
	when [10h_ei]>0 then '10h_ei'
	end
,[11a_koodi] = Case 
	when [11a_tutkinto_alkuperaisella_koulutusalalla3]>0 then '11a_tutkinto_alkuperaisella_koulutusalalla3'
	when [11a_tutkinto_muulla_koulutusalalla3]>0 then '11a_tutkinto_muulla_koulutusalalla3'
	when [11a_opiskelee_alkuperaisella_koulutusalalla3]>0 then '11a_opiskelee_alkuperaisella_koulutusalalla3'
	when [11a_opiskelee_muulla_koulutusalalla3]>0 then '11a_opiskelee_muulla_koulutusalalla3'
	when [11a_keskeyttanyt_tyollinen]>0 then '11a_keskeyttanyt_tyollinen'
	when [11a_keskeyttanyt_ei_tyollinen]>0 then '11a_keskeyttanyt_ei_tyollinen'
	end
,[11b_koodi] = Case 
	when [11b_tutkinto_alkuperaisella_koulutusalalla3]>0 then '11b_tutkinto_alkuperaisella_koulutusalalla3'
	when [11b_opiskelee_alkuperaisella_koulutusalalla3]>0 then '11b_opiskelee_alkuperaisella_koulutusalalla3'
	when [11b_tutkinto_muulla_koulutusalalla3]>0 then '11b_tutkinto_muulla_koulutusalalla3'
	when [11b_opiskelee_muulla_koulutusalalla3]>0 then '11b_opiskelee_muulla_koulutusalalla3'
	when [11b_keskeyttanyt_tyollinen]>0 then '11b_keskeyttanyt_tyollinen'
	when [11b_keskeyttanyt_ei_tyollinen]>0 then '11b_keskeyttanyt_ei_tyollinen'
	end
,[11e_koodi] = Case 
	when [11e_kylla]>0 then '11e_kylla'
	when [11e_ei]>0 then '11e_ei'
	end
,[11f_koodi] = Case 
	when [11f_kylla]>0 then '11f_kylla'
	when [11f_ei]>0 then '11f_ei'
	end
,[11g_koodi] = Case 
	when [11g_kylla]>0 then '11g_kylla'
	when [11g_ei]>0 then '11g_ei'
	end
,[11h_koodi] = Case 
	when [11h_kylla]>0 then '11h_kylla'
	when [11h_ei]>0 then '11h_ei'
	end

,saavutettu_suorv
,saavutettu_suorlk
,saavutettu_tutkmaak
,saavutettu_tutkjarj
,saavutettu_tutkopp
,saavutettu_tutkkoulk
--,saavutettu_tutkopmala
--,saavutettu_tutkopmopa
--,saavutettu_tutkopmast
--,saavutettu_tutkopm95opa
,saavutettu_tutkkoulutussektori
,lkm_laskettu=lkm

FROM [_aloittaneiden_lapaisy_lasketut_sarakkeet]


GO


