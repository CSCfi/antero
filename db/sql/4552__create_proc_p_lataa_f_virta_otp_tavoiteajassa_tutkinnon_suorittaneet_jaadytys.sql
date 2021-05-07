USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys] AS' 
END
GO




ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys] AS

TRUNCATE TABLE dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys

INSERT INTO dw.f_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_jaadytys (
			  d_ika_id								
			, d_ika_tutkinnon_alkaessa_id			
			, d_sukupuoli_id						
			, d_koulutuksen_kieli_id				
			, d_koulutuksen_kunta_id				
			, d_organisaatioluokitus_id            
			, d_koulutusluokitus_id					
			, d_tutkintoryhma_id			
			, d_rahoituslahde_id				
			, d_ohjauksen_ala_id				
			, d_kalenteri_tutkinnon_suoritus_id	
			, aloituslukuvuosi      
			, tutkinnon_tavoiteaika_vuosia		
			, tutkinnon_tavoiteaika_lukukausia	
			, tutkinnon_tavoiteaika_kuukausia	 
			, aiempi_korkeakoulututkinto_fi        
			, tutkinto_suoritettu_maaraajassa_fi 					 							
			, enintaan_12_kk_maaraajan_jalkeen_fi 	
			, yli_12_kk_maaraajan_jalkeen_fi 	
			, aiempi_korkeakoulututkinto_sv        
			, tutkinto_suoritettu_maaraajassa_sv 						 							
			, enintaan_12_kk_maaraajan_jalkeen_sv 	
			, yli_12_kk_maaraajan_jalkeen_sv 	
			, aiempi_korkeakoulututkinto_en        
			, tutkinto_suoritettu_maaraajassa_en 						 							
			, enintaan_12_kk_maaraajan_jalkeen_en 
			, yli_12_kk_maaraajan_jalkeen_en 	
			, tutkinnon_laajuus 				
			, koulutustyyppi_fi						
			, koulutustyyppi_sv			 
			, koulutustyyppi_en			
			, apusarake_tavoiteajassavalmistunut  
			, apusarake_tutkinto_pisteet
			, apusarake_aiempitutkinto          
			, apusarake_tutkinto_yli_12		 
			, apusarake_tutkinto_enintaan_12	
			, apusarake_rahoitusmalli 
			, apusarake_henkilokoodi
)

SELECT  
			
			  d_ika_id								= d1a.id 
			, d_ika_tutkinnon_alkaessa_id			= d1b.id
			, d_sukupuoli_id						= COALESCE(d2.id, -1)
			, d_koulutuksen_kieli_id				= d3.id
			, d_koulutuksen_kunta_id				= d4.id
			, d_organisaatioluokitus_id             = d5.id
			, d_koulutusluokitus_id					= d6.id
			, d_tutkintoryhma_id					= COALESCE(d7.id, -1)
			, d_rahoituslahde_id					= d8.id
			, d_ohjauksen_ala_id					= d9.id
			, d_kalenteri_tutkinnon_suoritus_id		= d10a.id
			
			, aloituslukuvuosi                      = f.aloitusvuosi
			, tutkinnon_tavoiteaika_vuosia			= f.tavoiteaikavuosia
			, tutkinnon_tavoiteaika_lukukausia		= f.tavoitelukukaudet
			, tutkinnon_tavoiteaika_kuukausia	 	= f.xxetavoiteaikakuukausia

			, aiempi_korkeakoulututkinto_fi         = CASE f.onaiempitutkinto WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, tutkinto_suoritettu_maaraajassa_fi 	= CASE f.tavoiteajassavalmistunut WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 						 							
			, enintaan_12_kk_maaraajan_jalkeen_fi 	= CASE f.[xonenintaan12kk] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, yli_12_kk_maaraajan_jalkeen_fi 		= CASE f.[xonyli12kk] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			
			, aiempi_korkeakoulututkinto_sv         = CASE f.onaiempitutkinto WHEN 1 THEN 'Ja' WHEN 0 THEN 'Nej' ELSE 'Information saknas' END 
			, tutkinto_suoritettu_maaraajassa_sv 	= CASE f.tavoiteajassavalmistunut WHEN 1 THEN 'Ja' WHEN 0 THEN 'Nej' ELSE 'Information saknas' END 						 							
			, enintaan_12_kk_maaraajan_jalkeen_sv 	= CASE f.[xonenintaan12kk] WHEN 1 THEN 'Ja' WHEN 0 THEN 'Nej' ELSE 'Information saknas' END 
			, yli_12_kk_maaraajan_jalkeen_sv 		= CASE f.[xonyli12kk] WHEN 1 THEN 'Ja' WHEN 0 THEN 'Nej' ELSE 'Information saknas' END 
			
			, aiempi_korkeakoulututkinto_en         = CASE f.onaiempitutkinto WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'Missing information' END 
			, tutkinto_suoritettu_maaraajassa_en 	= CASE f.tavoiteajassavalmistunut WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'Missing information' END 						 							
			, enintaan_12_kk_maaraajan_jalkeen_en 	= CASE f.[xonenintaan12kk] WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'Missing information' END 
			, yli_12_kk_maaraajan_jalkeen_en 		= CASE f.[xonyli12kk] WHEN 1 THEN 'Yes' WHEN 0 THEN 'No' ELSE 'Missing information' END 

			, tutkinnon_laajuus 					= f.vaadittuop 		
			, koulutustyyppi_fi						= CASE f.xxlkoulutustyyppi WHEN 1 THEN 'Päivätoteutus (AMK)' WHEN 2 THEN 'Monimuotototeutus (AMK)' ELSE 'Yliopisto' END 
			, koulutustyyppi_sv						= CASE f.xxlkoulutustyyppi WHEN 1 THEN 'Dagstudier (YH)' WHEN 2 THEN 'Flerformsstudier (YH)' ELSE 'Universitet' END 
			, koulutustyyppi_en						= CASE f.xxlkoulutustyyppi WHEN 1 THEN 'Full-time studies (UAS)' WHEN 2 THEN 'Part-time studies (UAS)' ELSE 'University' END 

			, apusarake_tavoiteajassavalmistunut    = f.tavoiteajassavalmistunut
			, apusarake_tutkinto_pisteet 			= f.tutkintokerroin
			, apusarake_aiempitutkinto              = f.onaiempitutkinto 
			, apusarake_tutkinto_yli_12		        = f.xonyli12kk
			, apusarake_tutkinto_enintaan_12		= f.xonenintaan12kk
			, apusarake_rahoitusmalli				= CASE WHEN f.xxmrahoituslahde = '4' THEN 0 ELSE 1 END
			, apusarake_henkilokoodi				= f.opiskelijaavain+f.opiskeluoikeusAvain+d5.organisaatio_koodi
	  
	  FROM 	ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet_2020 f 
	  LEFT JOIN ANTERO.dw.d_ika d1a ON d1a.ika_avain = f.ika
	  LEFT JOIN ANTERO.dw.d_ika d1b ON d1b.ika_avain = f.xxmikatutkinnonaloitusajankohtana
	  LEFT JOIN ANTERO.dw.d_sukupuoli d2 on d2.sukupuoli_koodi = COALESCE(f.sukupuoli, '-1')
	  LEFT JOIN ANTERO.dw.d_kieli d3 ON d3.kieli_koodi = COALESCE(f.xkoulutuskieli, '-1')
	  LEFT JOIN ANTERO.dw.d_alueluokitus d4 ON d4.kunta_koodi = COALESCE(f.xkoulutuskunta, '-1')
	  LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.organisaatio_koodi = COALESCE(f.oppilaitosnro, '-1')
	  LEFT JOIN ANTERO.dw.d_koulutusluokitus d6 on d6.koulutusluokitus_koodi = COALESCE(f.tutkintokoodi, '-1')
	  LEFT JOIN ANTERO.dw.d_virta_tutkintoryhmat d7 ON d7.tutkintoryhma_koodi = COALESCE(f.xxltutkintoryhma, '-1')
	  LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d8 ON d8.rahoituslahde_koodi  = COALESCE(f.xxmrahoituslahde, '-1')
	  LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] d9 ON d9.iscfi2013_koodi = d6.koulutusalataso3_koodi
	  LEFT JOIN ANTERO.dw.d_kalenteri d10a ON d10a.kalenteri_avain = convert(varchar(10), dateadd(S, f.tutkinnonsuorituspvm/1000, '1970-01-01 03:00:00'), 120)
	  WHERE d10a.vuosi < 2021







GO


