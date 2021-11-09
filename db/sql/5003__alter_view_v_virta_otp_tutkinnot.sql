USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_tutkinnot]    Script Date: 9.11.2021 10:33:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW  [dw].[v_virta_otp_tutkinnot] 
AS
	SELECT   		
			  [Korkeakoulu] 				= COALESCE(d1.organisaatio_fi,'Tuntematon')
			, [Tutkinnon suorittamisvuosi] 	= COALESCE(f.[tutkinnonsuoritusvuosi],-1)	
			
			, MONTH(dateadd(S, f.tutkinnonsuorituspvm/1000, '1970-01-01 03:00:00'))  Suorituskuukausi 
			
			, [Tutkinto]  					= COALESCE(d2.koulutusluokitus_fi,'Tuntematon') 
			, [Tutkintokoodi] 				= COALESCE(f.tutkintokoodi,'999999')
			
			, [Tutkinnon laajuus (op)] 	= COALESCE(f.[tutkinnonlaajuusop],-1)  
			
			, [H_koodi] = opiskelijaavain+opintosuoritusavain+d1.organisaatio_koodi		
			
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
					'Lappeenrannan-Lahden teknillinen yliopisto LUT',
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
			, [TK Koulutustyyppi (AMK)] =  CASE f.[tkkoulutustyyppi] WHEN 1 THEN 'Päivämuoto' WHEN 2 THEN 'Monimuoto' WHEN 6 THEN 'YAMK' ELSE '' END 

			, [Alkuperäinen oppilaitosnimi] 	= COALESCE(d7.organisaatio_fi,'')
			 
			, [OKM ohjauksen ala] = COALESCE(d2.okmohjauksenala_fi,'Tuntematon')
			, [Rahoituslähde] = COALESCE( d9.rahoituslahde_nimi_fi,'Tuntematon')	

			, [Koulutusaste, taso 1] = COALESCE(d2.koulutusastetaso1_fi,'Tuntematon')
			, [Koulutusaste, taso 2] = COALESCE(d2.Koulutusastetaso2_fi,'Tuntematon')
			, [Koulutusala, taso 1] = COALESCE(d2.koulutusalataso1_fi,'Tuntematon')
			, [Koulutusala, taso 2] = COALESCE(d2.koulutusalataso2_fi,'Tuntematon')
			, [Koulutusala, taso 3] = COALESCE(d2.koulutusalataso3_fi,'Tuntematon')
			
			-- Järjestys
			, [OKM ohjauksen ala jarj] = COALESCE(d2.jarjestys_okmohjauksenala_koodi,'99999')
			, [Koulutusaste, taso 1 jarj] = COALESCE(d2.jarjestys_koulutusastetaso1_koodi,'99999')
			, [Koulutusaste, taso 2 jarj] = COALESCE(d2.jarjestys_koulutusastetaso2_koodi,'99999')
			, [Koulutusala, taso 1 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 2 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 3 jarj] = COALESCE(d2.jarjestys_koulutusalataso1_koodi,'99999')
			
			, [Ikä jarj] 			= COALESCE(d4.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= COALESCE(d4.jarjestys_ikaryhma1,'999')	
			  
	FROM 	ANTERO.sa.[sa_virta_otp_tutkinnot] f 
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi	=	f.oppilaitosnro
				LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi	=	f.tutkintokoodi
				LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.sukupuoli_koodi	=	f.sukupuoli
				LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = f.ika
				LEFT JOIN ANTERO.dw.d_kieli	d5 ON d5.kieli_koodi = f.koulutuskieli
				LEFT JOIN ANTERO.dw.d_alueluokitus d6 ON d6.kunta_koodi = f.koulutuskunta 
				LEFT JOIN ANTERO.dw.[d_organisaatio] d7 on d7.organisaatio_koodi = f.[alkuperainenorganisaatio]
				LEFT JOIN ANTERO.dw.d_virta_rahoituslahde d9 ON d9.rahoituslahde_koodi  = f.rahoituslahde
				 


GO


USE [ANTERO]