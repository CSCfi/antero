USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet]    Script Date: 9.3.2020 23:14:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER VIEW  [dw].[v_virta_otp_tavoiteajassa_tutkinnon_suorittaneet] 
AS
			SELECT  
			
			  [Korkeakoulu] 				= COALESCE(d1.organisaatio_fi,'Tuntematon')
			, [Tutkinnon suorittamisvuosi] 	= COALESCE(f.tutkintovuosi,-1)			  
			
			, [Tutkinto]  					= COALESCE(d2.koulutusluokitus_fi,'Tuntematon') 
			, [Tutkintokoodi] 				= COALESCE(f.tutkintokoodi,'999999')
			
			, [Tutkinnon vaadittu laajuus] 	= COALESCE(f.vaadittuop,-1)  
			, [Tavoiteaika vuosia] 			= COALESCE(f.tavoiteaikavuosia,-1) 
			, [Tavoiteaika lukukausia]		= COALESCE(f.tavoitelukukaudet,-1)			
			
			, [Tavoiteaika kuukausia] 		= COALESCE(f.xxetavoiteaikakuukausia,-1)				
			, [Tutkinnon suoritusaika kuukausia] 	= COALESCE(f.xxfkaytettyaikakk,-1)
			
			, [Tutkinto suoritettu määräajassa] 	= CASE f.tavoiteajassavalmistunut WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 						 					
			, f.tavoiteajassavalmistunut
			, [Tutkinto pisteet] 			= COALESCE(f.tutkintokerroin,-1) 
			, f.tutkintokerroin
			, [Läsnäolo lukukausia] 		= COALESCE(f.xxalasnaololukukaudet,-1)				
			, [Läsnäolo kuukausia] 			= COALESCE(f.xxblasnaolokuukaudet,-1)
			
			, [Poissaolo lukukausia] 		= COALESCE(f.xxcpoissaololukukaudet,-1)
			, [Poissaolo kuukausia]  		= COALESCE(f.xxdpoissaolokuukaudet,-1)
			
			, [Aiempi korkeakoulututkinto] = CASE f.onaiempitutkinto WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 			 			
			, f.onaiempitutkinto
			, [Enintään 12 kk määräajan jälkeen] 	=  CASE f.[xonenintaan12kk] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, f.xonenintaan12kk
			, [Yli 12 kk määräajan jälkeen] 		=  CASE f.[xonyli12kk] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, f.xonyli12kk
			, [Ryhmä A]		 	=  CASE f.[xonryhmaa] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, f.xonryhmaa
			, [Ryhmä B] 		=  CASE f.[xonryhmab] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, f.xonryhmab
			, [Ryhmä C] 		=  CASE f.[xonryhmac] WHEN 1 THEN 'Kyllä' WHEN 0 THEN 'Ei' ELSE 'Tuntematon' END 
			, f.xonryhmac
			, [Tutkinnon aloitusvuosi] 		= COALESCE(f.aloitusvuosi,'Tuntematon')  				
			, [Tutkinnon suoritusaika vuosia] 		= COALESCE(f.vuosia,-1)
			, [Tutkinnon suoritusaika lukukausia] 	= COALESCE(f.kaytetytlukukaudet,-1)	
			, [Kokonaisaika kuukausia] 		= COALESCE(f.xxgkokonaisaikakk,-1)
					 
			, [Henkilo_koodi] = opiskelijaavain+opiskeluoikeusAvain+d1.organisaatio_koodi			 
			, [Sukupuoli] = COALESCE(d3.sukupuoli_fi,'Tuntematon')
			, [Ikä] = COALESCE(f.ika,'Tuntematon')
			, [Ikäryhmä] = COALESCE(d4.ikaryhma1_fi,'Tuntematon')		
			
			, [Sektori] = 
				CASE 
					WHEN d1.organisaatio_fi IN 
					('Aalto-yliopisto',
					'Helsingin yliopisto',
					'Itä-Suomen yliopisto',
					'Jyväskylän yliopisto',
					'Lapin yliopisto',
					'Lappeenrannan-Lahden teknillinen yliopisto',
					'Oulun yliopisto',
					'Svenska handelshögskolan',
					'Taideyliopisto',
					'Tampereen teknillinen yliopisto',
					'Tampereen yliopisto',
					'Turun yliopisto',
					'Vaasan yliopisto',
					'Åbo Akademi') THEN 'Yliopisto'
					ELSE 'Ammattikorkeakoulu'
				END
			 
			, [Koulutuskieli] 	= COALESCE(d5.kieli_fi,'Tuntematon')
			, [Koulutuskunta] 	= COALESCE(d6.kunta_fi,'Tuntematon')				

			, [OKM ohjauksen ala] = COALESCE(d2.okmohjauksenala_fi,'Tuntematon')
			, [Koulutusaste, taso 1] = COALESCE(d2.koulutusastetaso1_fi,'Tuntematon')
			, [Koulutusaste, taso 2] = COALESCE(d2.Koulutusastetaso2_fi,'Tuntematon')
			, [Koulutusala, taso 1] = COALESCE(d2.koulutusalataso1_fi,'Tuntematon')
			, [Koulutusala, taso 2] = COALESCE(d2.koulutusalataso2_fi,'Tuntematon')
			, [Koulutusala, taso 3] = COALESCE(d2.koulutusalataso3_fi,'Tuntematon')

			, [Tutkintoryhmä] = COALESCE( d7.tutkintoryhma_koodi,'Tuntematon')		
			, [Koulutustyyppi] =  CASE f.xxlkoulutustyyppi WHEN 1 THEN 'Päivämuoto' WHEN 2 THEN 'Monimuoto' ELSE 'Yliopisto' END 

			
			, REPLACE(convert(varchar(10),dateadd(S, f.[tutkinnonsuorituspvm]/1000, '1970-01-01 03:00:00'),102),'.','-')  	AS suorituspvm
			, MONTH(dateadd(S, f.[tutkinnonsuorituspvm]/1000, '1970-01-01 03:00:00'))  suorituskuukausi 

			 , [Rahoitusmallialat AMK 2021-2024] = O.Ammattikorkeakoulut_tutkintotavoitteet			 
			 , [Rahoitusmallialat YO 2021-2024] = O.Yliopistot_tutkintotavoitteet2021
			 

			-- Järjestys
			, [OKM ohjauksen ala jarj] = COALESCE(d2.jarjestys_okmohjauksenala_koodi,'99999')
			, [Koulutusaste, taso 1 jarj] = COALESCE(d2.jarjestys_koulutusastetaso1_koodi,'99999')
			, [Koulutusaste, taso 2 jarj] = COALESCE(d2.jarjestys_koulutusastetaso2_koodi,'99999')
			, [Koulutusala, taso 1 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 2 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 3 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999')
			
			, [Ikä jarj] 			= COALESCE(d4.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= COALESCE(d4.jarjestys_ikaryhma1,'999')			  				  
			  
	FROM 	ANTERO.sa.sa_virta_otp_tavoiteajassa_tutkinnon_suorittaneet f 
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi	=	f.oppilaitosnro
				LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi	=	f.tutkintokoodi
				LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi	=	f.sukupuoli
				LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = f.ika
				LEFT JOIN ANTERO.dw.d_kieli	d5 ON d5.kieli_koodi = f.xkoulutuskieli
				LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.kunta_koodi = f.xkoulutuskunta
				LEFT JOIN ANTERO.dw.d_virta_tutkintoryhmat d7 ON d7.tutkintoryhma_koodi = f.xxltutkintoryhma
				LEFT JOIN [VipunenTK_lisatiedot].[dbo].[isced_suomi_ohjauksenala] O ON O.iscfi2013_koodi = d2.koulutusalataso3_koodi

