USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_yhteiskaksoistutkinnot]    Script Date: 21.1.2020 9:16:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW  [dw].[v_virta_otp_yhteiskaksoistutkinnot] 
AS

SELECT 
			[Tilastovuosi] = S.tutkintovuosi      
			,[Sektori] = 	
			
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

			, [Korkeakoulu] = d1.organisaatio_fi
			, [Tutkinto]  = coalesce(d2.koulutusluokitus_fi,'Tuntematon') 
			, [Luokittelu] = coalesce(D3.os_luokittelu_nimi_fi, 'Muut tutkinnot')
      
			, [Henkilo_koodi] = opiskelijaavain + S.kk
      
			, [OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
			
			, [Koulutusaste, taso 1] = coalesce(d2.koulutusastetaso1_fi,'Tuntematon')
			, [Koulutusaste, taso 2] = coalesce(d2.Koulutusastetaso2_fi,'Tuntematon')
			
			, [Koulutusala, taso 1] = coalesce(d2.koulutusalataso1_fi,'Tuntematon')
			, [Koulutusala, taso 2] = coalesce(d2.koulutusalataso2_fi,'Tuntematon')
			, [Koulutusala, taso 3] = coalesce(d2.koulutusalataso3_fi,'Tuntematon')

			 , [Ikä] = coalesce(S.ika,'Tuntematon')
			 , [Ikäryhmä] = coalesce(d4.ikaryhma1_fi,'Tuntematon')

			 , [Sukupuoli] = d5.sukupuoli_fi 

			 ,[Kansalaisuus] = d6.maatjavaltiot2_fi
			 ,[Kansalaisuus (maanosa)] = d6.maanosa_fi
			 ,[Kansalaisuus (maanosa, suuralue)] = d6.maanosa2_fi

			-- Järjestys
			, [OKM ohjauksen ala jarj] = coalesce(d2.jarjestys_okmohjauksenala_koodi,'99999')
			
			, [Koulutusaste, taso 1 jarj] = coalesce(d2.jarjestys_koulutusastetaso1_koodi,'99999')
			, [Koulutusaste, taso 2 jarj] = coalesce(d2.jarjestys_koulutusastetaso2_koodi,'99999')
			
			, [Koulutusala, taso 1 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 2 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 3 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
	  
			 ,[Ikä jarj] 			= coalesce(d4.jarjestys_ika,'999')
			 ,[Ikäryhmä jarj]		= coalesce(d4.jarjestys_ikaryhma1,'999')
			  

  FROM ANTERO.sa.sa_virta_otp_yhteiskaksoistutkinnot S

		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = S.oppilaitoskoodi
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_koodi = S.tutkintokoodi
		LEFT JOIN ANTERO.dw.d_virta_os_luokittelu d3 ON d3.os_luokittelu_koodi = S.luokittelukoodi
		LEFT JOIN ANTERO.dw.d_ika d4 ON d4.ika_avain  = S.ika
		LEFT JOIN ANTERO.dw.d_sukupuoli d5 ON d5.sukupuoli_koodi = S.sukupuoli
		LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d6 ON d6.jarjestys_maatjavaltiot2_koodi = S.kansalaisuus

		WHERE cast((cast((S.tutkintovuosi + 1) as varchar(4)) + '-02-03') as date) <= convert(date, getdate()) 
		


