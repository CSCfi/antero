USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_cultures]    Script Date: 17.4.2024 11:13:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW  [dw].[v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_cultures] AS SELECT  
			
			-- Aikamuuttujat
			  tilastovuosi_fi 						= d11a.vuosi
			, tutkinnon_tavoiteaika_vuosia_fi		= f.tutkinnon_tavoiteaika_vuosia
			, tutkinnon_tavoiteaika_lukukausia_fi	= f.tutkinnon_tavoiteaika_lukukausia
			, tutkinnon_tavoiteaika_kuukausia_fi 	= f.tutkinnon_tavoiteaika_kuukausia
			, tutkinnon_suorituskuukausi_fi			= d11a.kuukausi_fi
			, aloituslukuvuosi_fi 					= f.aloituslukuvuosi

			-- Henkilömuuttujat
			, d3.sukupuoli_fi
			, d4.ika_fi
			, ikaryhma_fi							= d4.ikaryhma3_fi
			, aiempi_saman_tason_korkeakoulututkinto_fi = d11.kytkin_fi       
			, ika_tutkinnon_alkaessa_fi				= d8.ika_fi
			, ikaryhma_tutkinnon_alkaessa_fi		= d8.ikaryhma3_fi
			, tutkinto_suoritettu_maaraajassa_fi 	= d12.kytkin_fi						 							
			, enintaan_12_kk_maaraajan_jalkeen_fi	= d13.kytkin_fi	
			, yli_12_kk_maaraajan_jalkeen_fi		= d14.kytkin_fi		
			, aiempi_sama_koulutuskoodi_fi			= d15.kytkin_fi

			-- Organisaatiomuuttujat
			, korkeakoulu_fi 						= d1.organisaatio_fi

			-- Koulutusmuuttujat
			, koulutusnimike_fi						= d2.koulutusluokitus_fi
			, sektori_fi							= CASE WHEN d2.koulutusluokitus_koodi = '662151' THEN 'Yliopistokoulutus' ELSE d2.koulutussektori_fi END
			, tutkinnon_laajuus_fi 					= f.tutkinnon_laajuus 
			, koulutuksen_kieli_fi 					= d5.kieli_fi
			, koulutuksen_kunta_fi 					= d6.kunta_fi			
			, okm_ohjauksen_ala_fi					= d2.okmohjauksenala_fi
			, koulutusaste_taso_1_fi				= d2.koulutusastetaso1_fi
			, koulutusaste_taso_2_fi				= d2.Koulutusastetaso2_fi
			, koulutusala_taso_1_fi					= d2.koulutusalataso1_fi
			, koulutusala_taso_2_fi					= d2.koulutusalataso2_fi
			, koulutusala_taso_3_fi					= d2.koulutusalataso3_fi
			, tutkintoryhma_rahoitusmalli_fi		= d7.tutkintoryhma_koodi		
			, f.koulutustyyppi_fi						
			, rahoituslahde_fi						= d9.rahoituslahde_nimi_fi
			, rahoitusmallialat_amk_2021_2024_fi	= d10.Ammattikorkeakoulut_tutkintotavoitteet			 
			, rahoitusmallialat_yo_2021_2024_fi		= d10.Yliopistot_tutkintotavoitteet2021

			-- SV

			, tilastovuosi_sv 						= d11a.vuosi	
			, tutkinnon_tavoiteaika_vuosia_sv		= f.tutkinnon_tavoiteaika_vuosia
			, tutkinnon_tavoiteaika_lukukausia_sv	= f.tutkinnon_tavoiteaika_lukukausia
			, tutkinnon_tavoiteaika_kuukausia_sv 	= f.tutkinnon_tavoiteaika_kuukausia
			, tutkinnon_suorituskuukausi_sv			= d11a.kuukausi_sv
			, aloituslukuvuosi_sv 					= f.aloituslukuvuosi

			, d3.sukupuoli_sv
			, d4.ika_sv
			, ikaryhma_sv							= d4.ikaryhma3_sv
			, aiempi_saman_tason_korkeakoulututkinto_sv = d11.kytkin_sv         
			, ika_tutkinnon_alkaessa_sv				= d8.ika_sv
			, ikaryhma_tutkinnon_alkaessa_sv		= d8.ikaryhma3_sv
			, tutkinto_suoritettu_maaraajassa_sv	= d12.kytkin_sv 							 							
			, enintaan_12_kk_maaraajan_jalkeen_sv	= d13.kytkin_sv
			, yli_12_kk_maaraajan_jalkeen_sv 		= d14.kytkin_sv	
			, aiempi_sama_koulutuskoodi_sv			= d15.kytkin_sv

			, korkeakoulu_sv 						= d1.organisaatio_sv

			, koulutusnimike_sv						= d2.koulutusluokitus_sv
			, sektori_sv							= CASE WHEN d2.koulutusluokitus_koodi = '662151' THEN 'Universitetsutbildning' ELSE d2.koulutussektori_sv END
			, tutkinnon_laajuus_sv 					= f.tutkinnon_laajuus
			, koulutuksen_kieli_sv 					= d5.kieli_sv
			, koulutuksen_kunta_sv 					= d6.kunta_sv				
			, okm_ohjauksen_ala_sv					= d2.okmohjauksenala_sv
			, koulutusaste_taso_1_sv				= d2.koulutusastetaso1_sv
			, koulutusaste_taso_2_sv				= d2.Koulutusastetaso2_sv
			, koulutusala_taso_1_sv					= d2.koulutusalataso1_sv
			, koulutusala_taso_2_sv					= d2.koulutusalataso2_sv
			, koulutusala_taso_3_sv					= d2.koulutusalataso3_sv
			, tutkintoryhma_rahoitusmalli_sv		= d7.tutkintoryhma_koodi		
			, f.koulutustyyppi_sv							
			, rahoituslahde_sv						= d9.rahoituslahde_nimi_sv
			, rahoitusmallialat_amk_2021_2024_sv	= d10.Ammattikorkeakoulut_tutkintotavoitteet_SV			 
			, rahoitusmallialat_yo_2021_2024_sv		= d10.Yliopistot_tutkintotavoitteet2021_SV

			-- EN

			, tilastovuosi_en						= d11a.vuosi
			, tutkinnon_tavoiteaika_vuosia_en		= f.tutkinnon_tavoiteaika_vuosia
			, tutkinnon_tavoiteaika_lukukausia_en	= f.tutkinnon_tavoiteaika_lukukausia
			, tutkinnon_tavoiteaika_kuukausia_en 	= f.tutkinnon_tavoiteaika_kuukausia
			, tutkinnon_suorituskuukausi_en			= d11a.kuukausi_en
			, aloituslukuvuosi_en 					= f.aloituslukuvuosi

			, d3.sukupuoli_en
			, d4.ika_en
			, ikaryhma_en							= d4.ikaryhma3_en
			, aiempi_saman_tason_korkeakoulututkinto_en = d11.kytkin_en
			, ika_tutkinnon_alkaessa_en				= d8.ika_en
			, ikaryhma_tutkinnon_alkaessa_en		= d8.ikaryhma3_en
			, tutkinto_suoritettu_maaraajassa_en	= d12.kytkin_en				
			, enintaan_12_kk_maaraajan_jalkeen_en	= d13.kytkin_en 	
			, yli_12_kk_maaraajan_jalkeen_en 		= d14.kytkin_en	
			, aiempi_sama_koulutuskoodi_en			= d15.kytkin_en

			, korkeakoulu_en 						= d1.organisaatio_en

			, koulutusnimike_en						= d2.koulutusluokitus_en
			, sektori_en							= CASE WHEN d2.koulutusluokitus_koodi = '662151' THEN 'University education' ELSE d2.koulutussektori_en END
			, tutkinnon_laajuus_en 					= f.tutkinnon_laajuus
			, koulutuksen_kieli_en 					= d5.kieli_en
			, koulutuksen_kunta_en 					= d6.kunta_en			
			, okm_ohjauksen_ala_en					= d2.okmohjauksenala_en
			, koulutusaste_taso_1_en				= d2.koulutusastetaso1_en
			, koulutusaste_taso_2_en				= d2.Koulutusastetaso2_en
			, koulutusala_taso_1_en					= d2.koulutusalataso1_en
			, koulutusala_taso_2_en					= d2.koulutusalataso2_en
			, koulutusala_taso_3_en					= d2.koulutusalataso3_en
			, tutkintoryhma_rahoitusmalli_en		= d7.tutkintoryhma_koodi		
			, f.koulutustyyppi_en						
			, rahoituslahde_en						= d9.rahoituslahde_nimi_en
			, rahoitusmallialat_amk_2021_2024_en	= d10.Ammattikorkeakoulut_tutkintotavoitteet_EN			 
			, rahoitusmallialat_yo_2021_2024_en		= d10.Yliopistot_tutkintotavoitteet2021_EN

			, lyhyt_kv_vaihto_fi					= d16.kytkin_fi
			, lyhyt_kv_vaihto_sv					= d16.kytkin_sv
			, lyhyt_kv_vaihto_en					= d16.kytkin_en
			, pitka_kv_vaihto_fi					= d17.kytkin_fi
			, pitka_kv_vaihto_sv					= d17.kytkin_sv
			, pitka_kv_vaihto_en					= d17.kytkin_en
			, virtuaalinen_blended_kv_vaihto_fi		= d18.kytkin_fi
			, virtuaalinen_blended_kv_vaihto_sv		= d18.kytkin_sv
			, virtuaalinen_blended_kv_vaihto_en		= d18.kytkin_en
			, henkilolla_kv_liikkuvuusjakso_fi		= d19.kytkin_fi
			, henkilolla_kv_liikkuvuusjakso_sv		= d19.kytkin_sv
			, henkilolla_kv_liikkuvuusjakso_en		= d19.kytkin_en
			
			-- Koodimuuttujat
			, koodit_koulutusnimike					= d2.koulutusluokitus_koodi
			, koodit_korkeakoulu					= d1.organisaatio_koodi

			-- Apumuuttujat 
			, f.apusarake_tavoiteajassavalmistunut
			, f.apusarake_tutkinto_pisteet
			, f.apusarake_henkilokoodi		
			, f.apusarake_aiempitutkinto      
			, f.apusarake_tutkinto_yli_12		
			, f.apusarake_tutkinto_enintaan_12	
			, f.apusarake_rahoitusmalli
			 			
			-- Järjestysmuuttujat
			, jarjestys_okm_ohjauksen_ala			= d2.jarjestys_okmohjauksenala_koodi
			, jarjestys_koulutusaste_taso_1			= d2.jarjestys_koulutusastetaso1_koodi
			, jarjestys_koulutusaste_taso_2			= d2.jarjestys_koulutusastetaso2_koodi
			, jarjestys_koulutusala_taso_1			= d2.jarjestys_koulutusalataso1_koodi
			, jarjestys_koulutusala_taso_2			= d2.jarjestys_koulutusalataso1_koodi
			, jarjestys_koulutusala_taso_3			= d2.jarjestys_koulutusalataso1_koodi
			, jarjestys_sukupuoli 					= d3.jarjestys_sukupuoli_koodi
			, jarjestys_ika 						= d4.jarjestys_ika
			, jarjestys_ikaryhma					= d4.jarjestys_ikaryhma3
			, jarjestys_tutkintoryhma_rahoitusmalli = d7.jarjestys_tutkintoryhma_koodi
			, jarjestys_ika_aloittaessa 			= d8.jarjestys_ika
			, jarjestys_ikaryhma_aloittaessa		= d8.jarjestys_ikaryhma3
			, jarjestys_rahoituslahde               = d9.jarjestys_rahoituslahde_koodi	
			, jarjestys_tutkinnon_suorituskuukausi  = d11a.kuukausi		 
			  
	FROM 	ANTERO.dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys f 
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
	LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
	LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id	= f.d_sukupuoli_id
	LEFT JOIN ANTERO.dw.d_ika d4 ON d4.id = f.d_ika_id
	LEFT JOIN ANTERO.dw.d_kieli	d5 ON d5.id = f.d_koulutuksen_kieli_id
	LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.id = f.d_koulutuksen_kunta_id
	LEFT JOIN ANTERO.dw.d_virta_tutkintoryhmat d7 ON d7.id = f.d_tutkintoryhma_id
	LEFT JOIN ANTERO.dw.d_ika d8 ON d8.id  = f.d_ika_tutkinnon_alkaessa_id
	LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d9 ON d9.id  = f.d_rahoituslahde_id
	LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] d10 ON d10.iscfi2013_koodi = d2.koulutusalataso3_koodi
	LEFT JOIN ANTERO.dw.d_kalenteri d11a ON d11a.id  = f.d_kalenteri_tutkinnon_suoritus_id
	LEFT JOIN ANTERO.dw.d_kytkin d11 on d11.id = f.d_kytkin_aiempi_korkeakoulututkinto_id
	LEFT JOIN ANTERO.dw.d_kytkin d12 on d12.id = f.d_kytkin_tutkinto_suoritettu_maaraajassa_id
	LEFT JOIN ANTERO.dw.d_kytkin d13 on d13.id = f.d_kytkin_enintaan_12_kk_maaraajan_jalkeen_id
	LEFT JOIN ANTERO.dw.d_kytkin d14 on d14.id = f.d_kytkin_yli_12_kk_maaraajan_jalkeen_id
	LEFT JOIN ANTERO.dw.d_kytkin d15 on d15.id = f.d_kytkin_aiempi_sama_koulutuskoodi_id
	LEFT JOIN ANTERO.dw.d_kytkin d16 on d16.id = f.d_kytkin_lyhyt_kv_vaihto_id
	LEFT JOIN ANTERO.dw.d_kytkin d17 on d17.id = f.d_kytkin_pitka_kv_vaihto_id
	LEFT JOIN ANTERO.dw.d_kytkin d18 on d18.id = f.d_kytkin_blended_kv_vaihto_id
	LEFT JOIN ANTERO.dw.d_kytkin d19 on d19.id = f.d_kytkin_kv_vaihto_id
			

GO

USE [ANTERO]
