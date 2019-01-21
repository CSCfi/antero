USE ANTERO
GO

-- v_virta_otp_kansainvalisettutkinnot  
 
IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_kansainvalisettutkinnot') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_virta_otp_kansainvalisettutkinnot AS select 1 AS a'
GO

ALTER VIEW  dw.v_virta_otp_kansainvalisettutkinnot 
AS


SELECT 
			[Tilastovuosi] = S.vuosi      
			,[Sektori] = 	
			
			CASE 
					WHEN d1.organisaatio_fi IN 
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

			, [Korkeakoulu] = d1.organisaatio_fi
			, [Tutkinto]  = coalesce(d2.koulutusluokitus_fi,'Tuntematon') 
			, [Luokittelu] = D3.os_luokittelu_nimi_fi
      
			, [lkm] = S.kpl
      
			, [OKM ohjauksen ala] = coalesce(d2.okmohjauksenala_fi,'Tuntematon')
			
			, [Koulutusaste, taso 1] = coalesce(d2.koulutusastetaso1_fi,'Tuntematon')
			, [Koulutusaste, taso 2] = coalesce(d2.Koulutusastetaso2_fi,'Tuntematon')
			
			, [Koulutusala, taso 1] = coalesce(d2.koulutusalataso1_fi,'Tuntematon')
			, [Koulutusala, taso 2] = coalesce(d2.koulutusalataso2_fi,'Tuntematon')
			, [Koulutusala, taso 3] = coalesce(d2.koulutusalataso3_fi,'Tuntematon')

			-- Järjestys
			, [OKM ohjauksen ala jarj] = coalesce(d2.jarjestys_okmohjauksenala_koodi,'99999')
			
			, [Koulutusaste, taso 1 jarj] = coalesce(d2.jarjestys_koulutusastetaso1_koodi,'99999')
			, [Koulutusaste, taso 2 jarj] = coalesce(d2.jarjestys_koulutusastetaso2_koodi,'99999')
			
			, [Koulutusala, taso 1 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 2 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
			, [Koulutusala, taso 3 jarj] = coalesce(d2.jarjestys_koulutusalataso1_koodi,'99999')
	  
  FROM ANTERO.sa.sa_virta_otp_kansainvalisettutkinnot S

		LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = S.oppilaitos
		LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 ON d2.koulutusluokitus_koodi = S.tutkintokoodi
		LEFT JOIN ANTERO.dw.d_virta_os_luokittelu d3 ON d3.os_luokittelu_koodi = S.luokittelukoodi