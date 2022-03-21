-- OKM opettajatiedonkeruu raportin näkymä
USE ANTERO
GO 
IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_opettajapatevyydet') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_virta_otp_opettajapatevyydet AS select 1 AS a'
GO

ALTER VIEW  dw.v_virta_otp_opettajapatevyydet 
AS

SELECT		[Tilastovuosi] = O.vuosi
			, [Korkeakoulu] = COALESCE(ORG.organisaatio_fi,'Tuntematon')
			, [Henkilo_koodi] = O.opiskelija_avain+O.db+O.organisaatiokoodi			 
			, [Sukupuoli] = COALESCE(S.sukupuoli_fi,'Tuntematon')
			, [Ikä] = COALESCE(O.ika,'Tuntematon')
			, [Ikäryhmä] = COALESCE(I.ikaryhma1_fi,'Tuntematon')		
			
			, [Sektori] = 
				CASE 
					WHEN ORG.organisaatio_fi IN 
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
			
			-- Opettajapätevyydet tutkintoon vai ei
				, [ke]	 			= O.patevkoodi_ke
				, [ke tutkinto]	 = O.ke_tutkinto
				, [ke avain]	 = O.ke_opintosuoritus_avain
				, [ik]	 			= O.patevkoodi_ik
				, [ik tutkinto]	 = O.ik_tutkinto
				, [ik avain]	 = O.ik_opintosuoritus_avain
				, [il]	 			= O.patevkoodi_il
				, [il tutkinto]	 = O.il_tutkinto
				, [il avain]	 = O.il_opintosuoritus_avain
				, [im]	 			= O.patevkoodi_im
				, [im tutkinto]	 = O.im_tutkinto
				, [im avain]	 = O.im_opintosuoritus_avain
				, [in]				 = O.patevkoodi_in
				, [in tutkinto]	 = O.in_tutkinto
				, [in avain]	 = O.in_opintosuoritus_avain
				, [io]			 = O.patevkoodi_io
				, [io tutkinto]	 = O.io_tutkinto
				, [io avain]	 = O.io_opintosuoritus_avain
				, [ip]			 = O.patevkoodi_ip
				, [ip tutkinto]	 = O.ip_tutkinto
				, [ip avain]	 = O.ip_opintosuoritus_avain
				, [iq]			 = O.patevkoodi_iq
				, [iq tutkinto]	 = O.iq_tutkinto
				, [iq avain]	 = O.iq_opintosuoritus_avain
				, [ir]			 = O.patevkoodi_ir
				, [ir tutkinto]	 = O.ir_tutkinto
				, [ir avain]	 = O.ir_opintosuoritus_avain
				, [is]			 = O.patevkoodi_is
				, [is tutkinto]	 = O.is_tutkinto
				, [is avain]	 = O.is_opintosuoritus_avain
				, [it]			 = O.patevkoodi_it
				, [it tutkinto]	 = O.it_tutkinto
				, [it avain]	 = O.it_opintosuoritus_avain
				, [iu]			 = O.patevkoodi_iu
				, [iu tutkinto]	 = O.iu_tutkinto
				, [iu avain]	 = O.iu_opintosuoritus_avain
				, [iv]			 = O.patevkoodi_iv
				, [iv tutkinto]	 = O.iv_tutkinto
				, [iv avain]	 = O.iv_opintosuoritus_avain
				, [iw]			 = O.patevkoodi_iw
				, [iw tutkinto]	 = O.iw_tutkinto
				, [iw avain]	 = O.iw_opintosuoritus_avain
				, [iy]			 = O.patevkoodi_iy
				, [iy tutkinto]	 = O.iy_tutkinto
				, [iy avain]	 = O.iy_opintosuoritus_avain
				, [jb]			 = O.patevkoodi_jb
				, [jb tutkinto]	 = O.jb_tutkinto
				, [jb avain]	 = O.jb_opintosuoritus_avain
				, [ja]			 = O.patevkoodi_ja
				, [ja tutkinto]	 = O.ja_tutkinto
				, [ja avain]	 = O.ja_opintosuoritus_avain
				, [jc]			 = O.patevkoodi_jc
				, [jc tutkinto]	 = O.jc_tutkinto
				, [jc avain]	 = O.jc_opintosuoritus_avain


			-- Pätevyydet
			, [Pätevyys1 ryhmä] = P1.patevyysryhma1_fi
			, [Pätevyys1]		= O.patevyysselite1
			, [Pätevyys1 vuosi] = CASE WHEN O.Patevyysmerk_vuosi1 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi1,-1) END	 
			, [Pätevyys1 avain]	= O.popintosuoritus_avain1

			, [Pätevyys2 ryhmä] = P2.patevyysryhma1_fi
			, [Pätevyys2]		= O.patevyysselite2
			, [Pätevyys2 vuosi] = CASE WHEN O.Patevyysmerk_vuosi2 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi2,-1) END	
			, [Pätevyys2 avain]	= O.popintosuoritus_avain2 

			, [Pätevyys3 ryhmä] = P3.patevyysryhma1_fi
			, [Pätevyys3]		= O.patevyysselite3
			, [Pätevyys3 vuosi] = CASE WHEN O.Patevyysmerk_vuosi3 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi3,-1) END	 
			, [Pätevyys3 avain]	= O.popintosuoritus_avain3
			
			, [Pätevyys4 ryhmä] = P4.patevyysryhma1_fi
			, [Pätevyys4]		= O.patevyysselite4
			, [Pätevyys4 vuosi] = CASE WHEN O.Patevyysmerk_vuosi4 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi4,-1) END	
			, [Pätevyys4 avain]	= O.popintosuoritus_avain4
			
			, [Pätevyys5 ryhmä] = P5.patevyysryhma1_fi
			, [Pätevyys5]		= O.patevyysselite5
			, [Pätevyys5 vuosi] = CASE WHEN O.Patevyysmerk_vuosi5 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi5,-1) END	
			, [Pätevyys5 avain]	= O.popintosuoritus_avain5
		
			-- Tutkinnot
			, [Tutkinto1]  		= CASE WHEN K1.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K1.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi1] 	= CASE WHEN O.tkkoodi1 IS NOT NULL THEN COALESCE(O.tkkoodi1,'999999') END
			, [Tutkinto1 vuosi] = CASE WHEN O.tv1 IS NOT NULL THEN COALESCE(O.tv1,-1) END	
			, [Tutkinto1 avain]	= O.topintosuoritus_avain1			 

			, [Tutkinto2]  		= CASE WHEN K2.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K2.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi2] 	= CASE WHEN O.tkkoodi2 IS NOT NULL THEN COALESCE(O.tkkoodi2,'999999') END
			, [Tutkinto2 vuosi] = CASE WHEN O.tv2 IS NOT NULL THEN COALESCE(O.tv2,-1) END	 
			, [Tutkinto2 avain]	= O.topintosuoritus_avain2

			, [Tutkinto3]  		= CASE WHEN K3.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K3.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi3] 	= CASE WHEN O.tkkoodi3 IS NOT NULL THEN COALESCE(O.tkkoodi3,'999999') END
			, [Tutkinto3 vuosi] = CASE WHEN O.tv3 IS NOT NULL THEN COALESCE(O.tv3,-1) END	 
			, [Tutkinto3 avain]	= O.topintosuoritus_avain3

			, [Tutkinto4]  		= CASE WHEN K4.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K4.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi4] 	= CASE WHEN O.tkkoodi4 IS NOT NULL THEN COALESCE(O.tkkoodi4,'999999') END
			, [Tutkinto4 vuosi] = CASE WHEN O.tv4 IS NOT NULL THEN COALESCE(O.tv4,-1) END	
			, [Tutkinto4 avain]	= O.topintosuoritus_avain4
			
			, [Tutkinto5]  		= CASE WHEN K5.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K5.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi5] 	= CASE WHEN O.tkkoodi5 IS NOT NULL THEN COALESCE(O.tkkoodi5,'999999') END
			, [Tutkinto5 vuosi] = CASE WHEN O.tv5 IS NOT NULL THEN COALESCE(O.tv5,-1) END
			, [Tutkinto5 avain]	= O.topintosuoritus_avain5

			-- Yhteensä pätevyyksiä
			, [Opettaja pätevyyksiä]	= O.opettajapatevyytta
			, [Tutkinto pätevyyksiä]	= O.tutkintopatevyyksia
			, [Ainepätevyyksiä]			= O.ainepatevyytta
			, [Pätevyyksiä yhteensä]	= O.pateyyksiayhteensa


			-- Järjestys
			, [Ikä jarj] 			= COALESCE(I.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= COALESCE(I.jarjestys_ikaryhma1,'999')	

		 
  FROM [sa].[sa_virta_otp_opettajapatevyydet] O
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P1 ON P1.patevyys_koodi = O.[patevyyskoodi1]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P2 ON P2.patevyys_koodi = O.[patevyyskoodi2]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P3 ON P3.patevyys_koodi = O.[patevyyskoodi3]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P4 ON P4.patevyys_koodi = O.[patevyyskoodi4]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P5 ON P5.patevyys_koodi = O.[patevyyskoodi5]
		LEFT JOIN [ANTERO].[dw].[d_sukupuoli] S ON S.sukupuoli_koodi = O.sukupuolikoodi
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K1 ON K1.koulutusluokitus_koodi = O.tkkoodi1
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K2 ON K2.koulutusluokitus_koodi = O.tkkoodi2
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K3 ON K3.koulutusluokitus_koodi = O.tkkoodi3
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K4 ON K4.koulutusluokitus_koodi = O.tkkoodi4
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K5 ON K5.koulutusluokitus_koodi = O.tkkoodi5
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] ORG ON ORG.[organisaatio_koodi] = O.organisaatiokoodi
		LEFT JOIN [ANTERO].[dw].[d_ika] I ON I.ika_avain = O.ika
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG1 ON TORG1.[organisaatio_koodi] = O.toppilaitostunnus1
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG2 ON TORG2.[organisaatio_koodi] = O.toppilaitostunnus2
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG3 ON TORG3.[organisaatio_koodi] = O.toppilaitostunnus3
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG4 ON TORG4.[organisaatio_koodi] = O.toppilaitostunnus4
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG5 ON TORG5.[organisaatio_koodi] = O.toppilaitostunnus5

WHERE (P1.patevyysryhma1_fi = 'opettaja' OR P2.patevyysryhma1_fi = 'opettaja' OR P3.patevyysryhma1_fi = 'opettaja' OR P4.patevyysryhma1_fi = 'opettaja' OR P5.patevyysryhma1_fi = 'opettaja')



UNION


SELECT		  [Tilastovuosi] = O.vuosi
			, [Korkeakoulu] = COALESCE(ORG.organisaatio_fi,'Tuntematon')
			, [Henkilo_koodi] = O.opiskelija_avain+O.db+O.organisaatiokoodi			 
			, [Sukupuoli] = COALESCE(S.sukupuoli_fi,'Tuntematon')
			, [Ikä] = COALESCE(O.ika,'Tuntematon')
			, [Ikäryhmä] = COALESCE(I.ikaryhma1_fi,'Tuntematon')		
			
			, [Sektori] = 
				CASE 
					WHEN ORG.organisaatio_fi IN 
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
			
				-- Opettajapätevyydet tutkintoon vai ei
				, [ke]	 			= O.patevkoodi_ke
				, [ke tutkinto]	 = O.ke_tutkinto
				, [ke avain]	 = O.ke_opintosuoritus_avain
				, [ik]	 			= O.patevkoodi_ik
				, [ik tutkinto]	 = O.ik_tutkinto
				, [ik avain]	 = O.ik_opintosuoritus_avain
				, [il]	 			= O.patevkoodi_il
				, [il tutkinto]	 = O.il_tutkinto
				, [il avain]	 = O.il_opintosuoritus_avain
				, [im]	 			= O.patevkoodi_im
				, [im tutkinto]	 = O.im_tutkinto
				, [im avain]	 = O.im_opintosuoritus_avain
				, [in]				 = O.patevkoodi_in
				, [in tutkinto]	 = O.in_tutkinto
				, [in avain]	 = O.in_opintosuoritus_avain
				, [io]			 = O.patevkoodi_io
				, [io tutkinto]	 = O.io_tutkinto
				, [io avain]	 = O.io_opintosuoritus_avain
				, [ip]			 = O.patevkoodi_ip
				, [ip tutkinto]	 = O.ip_tutkinto
				, [ip avain]	 = O.ip_opintosuoritus_avain
				, [iq]			 = O.patevkoodi_iq
				, [iq tutkinto]	 = O.iq_tutkinto
				, [iq avain]	 = O.iq_opintosuoritus_avain
				, [ir]			 = O.patevkoodi_ir
				, [ir tutkinto]	 = O.ir_tutkinto
				, [ir avain]	 = O.ir_opintosuoritus_avain
				, [is]			 = O.patevkoodi_is
				, [is tutkinto]	 = O.is_tutkinto
				, [is avain]	 = O.is_opintosuoritus_avain
				, [it]			 = O.patevkoodi_it
				, [it tutkinto]	 = O.it_tutkinto
				, [it avain]	 = O.it_opintosuoritus_avain
				, [iu]			 = O.patevkoodi_iu
				, [iu tutkinto]	 = O.iu_tutkinto
				, [iu avain]	 = O.iu_opintosuoritus_avain
				, [iv]			 = O.patevkoodi_iv
				, [iv tutkinto]	 = O.iv_tutkinto
				, [iv avain]	 = O.iv_opintosuoritus_avain
				, [iw]			 = O.patevkoodi_iw
				, [iw tutkinto]	 = O.iw_tutkinto
				, [iw avain]	 = O.iw_opintosuoritus_avain
				, [iy]			 = O.patevkoodi_iy
				, [iy tutkinto]	 = O.iy_tutkinto
				, [iy avain]	 = O.iy_opintosuoritus_avain
				, [jb]			 = O.patevkoodi_jb
				, [jb tutkinto]	 = O.jb_tutkinto
				, [jb avain]	 = O.jb_opintosuoritus_avain
				, [ja]			 = O.patevkoodi_ja
				, [ja tutkinto]	 = O.ja_tutkinto
				, [ja avain]	 = O.ja_opintosuoritus_avain
				, [jc]			 = O.patevkoodi_jc
				, [jc tutkinto]	 = O.jc_tutkinto
				, [jc avain]	 = O.jc_opintosuoritus_avain



			-- Pätevyydet
			, [Pätevyys1 ryhmä] = P1.patevyysryhma1_fi
			, [Pätevyys1]		= O.patevyysselite1
			, [Pätevyys1 vuosi] = CASE WHEN O.Patevyysmerk_vuosi1 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi1,-1) END	 
			, [Pätevyys1 avain]	= O.popintosuoritus_avain1

			, [Pätevyys2 ryhmä] = P2.patevyysryhma1_fi
			, [Pätevyys2]		= O.patevyysselite2
			, [Pätevyys2 vuosi] = CASE WHEN O.Patevyysmerk_vuosi2 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi2,-1) END	
			, [Pätevyys2 avain]	= O.popintosuoritus_avain2 

			, [Pätevyys3 ryhmä] = P3.patevyysryhma1_fi
			, [Pätevyys3]		= O.patevyysselite3
			, [Pätevyys3 vuosi] = CASE WHEN O.Patevyysmerk_vuosi3 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi3,-1) END	 
			, [Pätevyys3 avain]	= O.popintosuoritus_avain3
			
			, [Pätevyys4 ryhmä] = P4.patevyysryhma1_fi
			, [Pätevyys4]		= O.patevyysselite4
			, [Pätevyys4 vuosi] = CASE WHEN O.Patevyysmerk_vuosi4 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi4,-1) END	
			, [Pätevyys4 avain]	= O.popintosuoritus_avain4
			
			, [Pätevyys5 ryhmä] = P5.patevyysryhma1_fi
			, [Pätevyys5]		= O.patevyysselite5
			, [Pätevyys5 vuosi] = CASE WHEN O.Patevyysmerk_vuosi5 IS NOT NULL THEN COALESCE(O.Patevyysmerk_vuosi5,-1) END	
			, [Pätevyys5 avain]	= O.popintosuoritus_avain5
		
			-- Tutkinnot
			, [Tutkinto1]  		= CASE WHEN K1.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K1.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi1] 	= CASE WHEN O.tkkoodi1 IS NOT NULL THEN COALESCE(O.tkkoodi1,'999999') END
			, [Tutkinto1 vuosi] = CASE WHEN O.tv1 IS NOT NULL THEN COALESCE(O.tv1,-1) END	
			, [Tutkinto1 avain]	= O.topintosuoritus_avain1			 

			, [Tutkinto2]  		= CASE WHEN K2.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K2.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi2] 	= CASE WHEN O.tkkoodi2 IS NOT NULL THEN COALESCE(O.tkkoodi2,'999999') END
			, [Tutkinto2 vuosi] = CASE WHEN O.tv2 IS NOT NULL THEN COALESCE(O.tv2,-1) END	 
			, [Tutkinto2 avain]	= O.topintosuoritus_avain2

			, [Tutkinto3]  		= CASE WHEN K3.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K3.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi3] 	= CASE WHEN O.tkkoodi3 IS NOT NULL THEN COALESCE(O.tkkoodi3,'999999') END
			, [Tutkinto3 vuosi] = CASE WHEN O.tv3 IS NOT NULL THEN COALESCE(O.tv3,-1) END	 
			, [Tutkinto3 avain]	= O.topintosuoritus_avain3

			, [Tutkinto4]  		= CASE WHEN K4.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K4.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi4] 	= CASE WHEN O.tkkoodi4 IS NOT NULL THEN COALESCE(O.tkkoodi4,'999999') END
			, [Tutkinto4 vuosi] = CASE WHEN O.tv4 IS NOT NULL THEN COALESCE(O.tv4,-1) END	
			, [Tutkinto4 avain]	= O.topintosuoritus_avain4
			
			, [Tutkinto5]  		= CASE WHEN K5.koulutusluokitus_fi IS NOT NULL THEN  COALESCE(K5.koulutusluokitus_fi,'Tuntematon') END
			, [Tutkintokoodi5] 	= CASE WHEN O.tkkoodi5 IS NOT NULL THEN COALESCE(O.tkkoodi5,'999999') END
			, [Tutkinto5 vuosi] = CASE WHEN O.tv5 IS NOT NULL THEN COALESCE(O.tv5,-1) END
			, [Tutkinto5 avain]	= O.topintosuoritus_avain5

			-- Yhteensä pätevyyksiä
			, [Opettaja pätevyyksiä]	= O.opettajapatevyytta
			, [Tutkinto pätevyyksiä]	= O.tutkintopatevyyksia
			, [Ainepätevyyksiä]			= O.ainepatevyytta
			, [Pätevyyksiä yhteensä]	= O.pateyyksiayhteensa

			-- Järjestys
			, [Ikä jarj] 			= COALESCE(I.jarjestys_ika,'999')
			, [Ikäryhmä jarj]		= COALESCE(I.jarjestys_ikaryhma1,'999')	

		 
  FROM [sa].[sa_virta_otp_opettajapatevyydet] O
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P1 ON P1.patevyys_koodi = O.[patevyyskoodi1]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P2 ON P2.patevyys_koodi = O.[patevyyskoodi2]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P3 ON P3.patevyys_koodi = O.[patevyyskoodi3]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P4 ON P4.patevyys_koodi = O.[patevyyskoodi4]
		LEFT JOIN ANTERO.[dw].[d_virta_patevyydet] P5 ON P5.patevyys_koodi = O.[patevyyskoodi5]
		LEFT JOIN [ANTERO].[dw].[d_sukupuoli] S ON S.sukupuoli_koodi = O.sukupuolikoodi
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K1 ON K1.koulutusluokitus_koodi = O.tkkoodi1
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K2 ON K2.koulutusluokitus_koodi = O.tkkoodi2
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K3 ON K3.koulutusluokitus_koodi = O.tkkoodi3
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K4 ON K4.koulutusluokitus_koodi = O.tkkoodi4
		LEFT JOIN ANTERO.[dw].[d_koulutusluokitus] K5 ON K5.koulutusluokitus_koodi = O.tkkoodi5
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] ORG ON ORG.[organisaatio_koodi] = O.organisaatiokoodi
		LEFT JOIN [ANTERO].[dw].[d_ika] I ON I.ika_avain = O.ika
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG1 ON TORG1.[organisaatio_koodi] = O.toppilaitostunnus1
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG2 ON TORG2.[organisaatio_koodi] = O.toppilaitostunnus2
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG3 ON TORG3.[organisaatio_koodi] = O.toppilaitostunnus3
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG4 ON TORG4.[organisaatio_koodi] = O.toppilaitostunnus4
		LEFT JOIN [ANTERO].[dw].[d_organisaatioluokitus] TORG5 ON TORG5.[organisaatio_koodi] = O.toppilaitostunnus5

WHERE (P1.patevyysryhma1_fi = 'opettajaaineet' OR P2.patevyysryhma1_fi = 'opettajaaineet' OR P3.patevyysryhma1_fi = 'opettajaaineet' OR P4.patevyysryhma1_fi = 'opettajaaineet' OR P5.patevyysryhma1_fi = 'opettajaaineet')


		


		



GO


