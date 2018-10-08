-- v_virta_otp_valmentavaan_koulutukseen_osallistuneet näkymä

IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_valmentavaan_koulutukseen_osallistuneet') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_virta_otp_valmentavaan_koulutukseen_osallistuneet AS select 1 AS a'
GO

ALTER VIEW  dw.v_virta_otp_valmentavaan_koulutukseen_osallistuneet 
AS
		SELECT   			 		   
			  [Valmentava korkeakoulu] = d1.organisaatio_fi
			  
			--, [Valmentava oikeus aloitusvuosi] = f.vooalkamispaivamaara		-- date
			, [Valmentava oikeus aloitusvuosi]   =  YEAR(convert(date,dateadd(s, convert(int, f.vooalkamispaivamaara/1000) , convert(datetime, '1-1-1970')))  )
			
			, [Henkilo_koodi] = f.atunniste
			
			, [Sukupuoli] = coalesce(d3.sukupuoli_fi,'Tuntematon')
			, [Ikä] = coalesce(f.ika,'Tuntematon')
			, [Ikäryhmä] = coalesce(d4.ikaryhma1_fi,'Tuntematon')		
			
			--, [Tutkinto oikeus aloitusvuosi]   = f.tooalkamispaivamaara	-- date	
			, [Tutkinto oikeus aloitusvuosi]   =  YEAR(convert(date,dateadd(s, convert(int, f.tooalkamispaivamaara/1000)   , convert(datetime, '1-1-1970')))  )
			
			, [Tutkintooikeus koulutussektori] = 	
			
			CASE 
					WHEN d6.organisaatio_fi IN 
					('Aalto-yliopisto',
					'Helsingin yliopisto',
					'Itä-Suomen yliopisto',
					'Jyväskylän yliopisto',
					'Lapin yliopisto',
					'Lappeenrannan teknillinen yliopisto',
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

			, [Tutkintooikeus korkeakoulu] = d6.organisaatio_fi
			, [Tutkintokoodi] = coalesce(f.tkoulutuskoodi,'999999')			
			, [Tutkinto]  = coalesce(d5.koulutusluokitus_fi,'Tuntematon') 
			
			--, [Tutkinnon suorittamisvuosi] = f.ttutkinnonsuorituspvm		-- date			
		 	 , [Tutkinnon suorittamisvuosi]   =  YEAR(convert(date,dateadd(s, convert(int, f.ttutkinnonsuorituspvm/1000) , convert(datetime, '1-1-1970')))  ) 							 
			
			, [OKM ohjauksen ala] = coalesce(d5.okmohjauksenala_fi,'Tuntematon')
			
			, [Koulutusaste, taso 1] = coalesce(d5.koulutusastetaso1_fi,'Tuntematon')
			, [Koulutusaste, taso 2] = coalesce(d5.Koulutusastetaso2_fi,'Tuntematon')
			
			, [Koulutusala, taso 1] = coalesce(d5.koulutusalataso1_fi,'Tuntematon')
			, [Koulutusala, taso 2] = coalesce(d5.koulutusalataso2_fi,'Tuntematon')
			, [Koulutusala, taso 3] = coalesce(d5.koulutusalataso3_fi,'Tuntematon')

			-- Järjestys
			, [OKM ohjauksen ala jarj] = coalesce(d5.jarjestys_okmohjauksenala_koodi,'99999')
			
			, [Koulutusaste, taso 1 jarj] = coalesce(d5.jarjestys_koulutusastetaso1_koodi,'99999')
			, [Koulutusaste, taso 2 jarj] = coalesce(d5.jarjestys_koulutusastetaso2_koodi,'99999')
			
			, [Koulutusala, taso 1 jarj] = coalesce(d5.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 2 jarj] = coalesce(d5.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 3 jarj] = coalesce(d5.jarjestys_koulutusalataso1_koodi,'99999')
			
			, [Ikä jarj] 			= coalesce(d4.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= coalesce(d4.jarjestys_ikaryhma1,'999')			  				  
			  
	FROM 	ANTERO.sa.sa_virta_otp_valmentavaan_koulutukseen_osallistuneet f 	
	
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi	=	f.voppilaitosnro				
				LEFT JOIN ANTERO.dw.d_sukupuoli d3 ON d3.sukupuoli_koodi	=	f.sukupuoli
				LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = f.ika	
				
				LEFT JOIN ANTERO.dw.d_koulutusluokitus d5 ON d5.koulutusluokitus_koodi	=	f.tkoulutuskoodi
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 ON d6.organisaatio_koodi	=	f.toppilaitosnro				

				
