-- v_virta_otp_valmentavaan_koulutukseen_osallistuneet näkymä

IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_valmentavaan_koulutukseen_osallistuneet') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_virta_otp_valmentavaan_koulutukseen_osallistuneet AS select 1 AS a'
GO

ALTER VIEW  [dw].[v_virta_otp_valmentavaan_koulutukseen_osallistuneet] 
AS
				SELECT   			 		   
			  [Organisaatio] = d1.organisaatio_fi
			  
			--, [Valmentava oikeus aloitusvuosi] = f.vooalkamispaivamaara		-- date
			, [Aloitusvuosi]   =  f.valmentava_oikeus_aloitusvuosi
			
			, [Henkilo_koodi] = f.henkilo_tunniste
			, [Tilastovuosi] = f.tilastovuosi
			
			, [Sukupuoli] = coalesce(d3.sukupuoli_fi,'Tuntematon')
			, [Ikä] = coalesce(d4.ika_fi,'Tuntematon')
			, [Ikäryhmä] = coalesce(d4.ikaryhma1_fi,'Tuntematon')		
			
			--, [Tutkinto oikeus aloitusvuosi]   = f.tooalkamispaivamaara	-- date	
			, [Tutkinnon aloitusvuosi]   =  f.tutkinto_oikeus_aloitusvuosi
			
			, [Tutkinnon sektori] = 	
			
			CASE 
					WHEN d6.oppilaitostyyppi_fi = 'Yliopistot' THEN 'Yliopisto'
					WHEN d6.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' THEN 'Ammattikorkeakoulu'
					ELSE 'Tuntematon'
			END

			, [Tutkinnon korkeakoulu] = d6.organisaatio_fi
			, [Tutkintokoodi] = coalesce(d5.koulutusluokitus_koodi,'999999')			
			, [Tutkinto]  = coalesce(d5.koulutusluokitus_fi,'Tuntematon') 
			
			--, [Tutkinnon suorittamisvuosi] = f.ttutkinnonsuorituspvm		-- date			
		 	 , [Tutkinnon suoritusvuosi]   =  f.tutkinnon_suoritus_vuosi 							 
			
			, [OKM ohjauksen ala] = coalesce(d5.okmohjauksenala_fi,'Tuntematon')
			
			, [Tutkinnon koulutusaste, taso 1] = coalesce(d5.koulutusastetaso1_fi,'Tuntematon')
			, [Tutkinnon koulutusaste, taso 2] = coalesce(d5.Koulutusastetaso2_fi,'Tuntematon')
			
			, [Tutkinnon koulutusala, taso 1] = coalesce(d5.koulutusalataso1_fi,'Tuntematon')
			, [Tutkinnon koulutusala, taso 2] = coalesce(d5.koulutusalataso2_fi,'Tuntematon')
			, [Tutkinnon koulutusala, taso 3] = coalesce(d5.koulutusalataso3_fi,'Tuntematon')
			, [Valmentava oikeus paattymisvuosi] = f.valmentava_oikeus_paattymisvuosi
			-- Järjestys
			, [OKM ohjauksen ala jarj] = coalesce(d5.jarjestys_okmohjauksenala_koodi,'99999')
			
			, [Tutkinnon koulutusaste, taso 1 jarj] = coalesce(d5.jarjestys_koulutusastetaso1_koodi,'99999')
			, [Tutkinnon koulutusaste, taso 2 jarj] = coalesce(d5.jarjestys_koulutusastetaso2_koodi,'99999')
			
			, [Tutkinnon koulutusala, taso 1 jarj] = coalesce(d5.jarjestys_koulutusalataso1_koodi,'99999')
			, [Tutkinnon koulutusala, taso 2 jarj] = coalesce(d5.jarjestys_koulutusalataso1_koodi,'99999')
			, [Tutkinnon koulutusala, taso 3 jarj] = coalesce(d5.jarjestys_koulutusalataso1_koodi,'99999')
			
			, [Ikä jarj] 			= coalesce(d4.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= coalesce(d4.jarjestys_ikaryhma1,'999')

			, case 
			  when f.tutkinnon_suoritus_vuosi >= f.tilastovuosi then 'Myöhempi tutkinto'
			  when f.tutkinnon_suoritus_vuosi < = f.tilastovuosi then 'Aiempi tutkinto'
			  else 'Ei aiempaa eikä myöhempää tutkintoa'
			  end as								[Aiempi/myöhempi tutkinto],
			--, case 
		 --     when d8.vuosi is not null  then 'Aiempi tutkinto'
		 --     when d9.vuosi is not null  then 'Myöhempi tutkinto'
		 --     else 'Ei aiempaa eikä myöhempää tutkintoa'
	  --        end as								[Aiempi/myöhempi tutkinto],
			
	          case 
		      when d8.vuosi is not null then 1
		      when d9.vuosi is not null then 2
		      else 3
	          end as								[Aiempi/myöhempi tutkinto jarj]	  				  
			  
	FROM 	ANTERO.dw.f_virta_otp_valmentavaan_koulutukseen_osallistuneet f 	
	
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.id	=	f.d_organisaatioluokitus_valmentavaoppilaitos				
				LEFT JOIN ANTERO.dw.d_sukupuoli d3 ON d3.id	=	f.d_sukupuoli
				LEFT JOIN ANTERO.dw.d_ika d4 ON d4.id  = f.d_ika	
				
				LEFT JOIN ANTERO.dw.d_koulutusluokitus d5 ON d5.id	=	f.d_koulutusluokitus
				LEFT JOIN ANTERO.dw.d_organisaatioluokitus d6 ON d6.id	=	f.d_organisaatioluokitus_tutkintooppilaitos			
				
				LEFT JOIN ANTERO.dw.d_kytkin d7a on d7a.id = f.d_kytkin_aiempi_tutkinto_id
                LEFT JOIN ANTERO.dw.d_kytkin d7b on d7b.id = f.d_kytkin_myohempi_tutkinto_id
				LEFT JOIN ANTERO.dw.d_kalenteri d8 on d8.id = f.d_kalenteri_muu_tutkinto_id and d7a.kytkin_koodi = 1
				LEFT JOIN ANTERO.dw.d_kalenteri d9 on d9.id = f.d_kalenteri_muu_tutkinto_id and d7b.kytkin_koodi = 1
	WHERE f.tilastovuosi < 2020				

				
