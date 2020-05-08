USE [ANTERO]
GO
/****** Object:  View [dw].[v_virta_otp_opettajapatevyydet]    Script Date: 8.5.2020 11:45:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dw].[v_virta_otp_opettajapatevyydet]'))
EXEC dbo.sp_executesql @statement = N'



CREATE VIEW [dw].[v_virta_otp_opettajapatevyydet] AS

SELECT		
	 [Tilastovuosi] = f.tilastovuosi

	,[opiskelija_avain]
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	,[Opettajakelpoisuudet] = d3a.selite_fi
	,[Opettajakelpoisuus] = d3b.selite_fi
	,[1 kelpoisuus] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''1%'' THEN d3a.selite_fi
			ELSE ''Muu kuin 1 kelpoisuus''
		END
	,[2 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''2%'' THEN d3a.selite_fi
			ELSE ''Muu kuin 2 kelpoisuutta''
		END
	,[3 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''3%'' THEN d3a.selite_fi
			ELSE ''Muu kuin 3 kelpoisuutta''
		END
	,[4 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''4%'' THEN d3a.selite_fi 	
			ELSE ''Muu kuin 4 kelpoisuutta''
		END
	,[5 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''5%'' THEN d3a.selite_fi
			ELSE ''Muu kuin 5 kelpoisuutta''
		END
	,[Opettajakelpoisuuksien määrä] = d3a.patevyyksien_maara

	,[Kelpoisuuden suoritustapa] =
		CASE
			WHEN suor_tapa = ''tutkinnon_yhteydessa'' THEN ''Kelpoisuus tutkinnon yhteydessä''
			WHEN suor_tapa = ''erillinen_eka'' THEN ''Kelpoisuus suoritettu erillisinä opintoina: henkilön ensimmäinen opettajan kelpoisuus''
			WHEN suor_tapa = ''erillinen_taydentava'' THEN ''Kelpoisuus suoritettu erillisinä opintoina: kelpoisuus täydentää henkilön aiempia opettajan kelpoisuuksia''
			ELSE ''Tieto puuttuu''
		END

	,[Aineenopettajan pedagogiset opinnot] = d6.kytkin_fi
	,[Ammatillinen opettajakoulutus] = d7.kytkin_fi
	,[Erityislastentarhanopettajan opinnot] = d8.kytkin_fi
	,[Erityisopettajan opinnot] = d9.kytkin_fi
	,[Opinto-ohjaajan opinnot] = d10.kytkin_fi
	,[Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot] = d11.kytkin_fi
	,[Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot] = d12.kytkin_fi

	,[Sektori] = d5.oppilaitostyyppi_fi
	,[Koulutusaste, taso 1] = d4.koulutusastetaso1_fi
	,[Koulutusaste, taso 2] = d4.koulutusastetaso2_fi
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d4.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi
	,[OKM ohjauksen ala] = d4.okmohjauksenala_fi
	,[Tutkinto] = d4.koulutusluokitus_fi
	,[Tutkinnon suoritusvuosi] = f.tutkinnon_vuosi
	,[Tutkinnon suorituskorkeakoulu] = d13.organisaatio_fi

	,[Korkeakoulu] = d5.organisaatio_fi

	,[tutkinnon_yhteydessa] = CASE WHEN suor_tapa = ''tutkinnon_yhteydessa'' THEN 1 ELSE 0 END
	,[erillinen_eka] = CASE WHEN suor_tapa = ''erillinen_eka'' THEN 1 ELSE 0 END
	,[erillinen_taydentava] = CASE WHEN suor_tapa = ''erillinen_taydentava'' THEN 1 ELSE 0 END

	--koodit
	,[Koodit Koulutusnimike] = d4.koulutusluokitus_koodi
	,[Koodit Korkeakoulu] = d5.organisaatio_koodi
	
	--järjestys
	,[jarjestys Sukupuoli] = d1.jarjestys_sukupuoli_koodi
	,[jarjestys Ikäryhmä] = d2.jarjestys_ikaryhma3
	,[jarjestys Opettajakelpoisuudet] = d3a.jarjestys_koodi
	,[jarjestys Opettajakelpoisuus] = d3b.jarjestys_koodi
	,[jarjestys Tutkinnon suoritustapa] =
		CASE
			WHEN suor_tapa = ''tutkinnon_yhteydessa'' THEN 1
			WHEN suor_tapa = ''erillinen_eka'' THEN 2
			WHEN suor_tapa = ''erillinen_taydentava'' THEN 3
			ELSE 9
		END
	,[jarjestys Sektori] = d5.jarjestys_oppilaitostyyppi_koodi
	,[jarjestys Koulutusaste, taso 1] = d4.jarjestys_koulutusastetaso1_koodi
	,[jarjestys Koulutusaste, taso 2] = d4.jarjestys_koulutusastetaso2_koodi
	,[jarjestys Koulutusala, taso 1] = d4.jarjestys_koulutusalataso1_koodi
	,[jarjestys Koulutusala, taso 2] = d4.jarjestys_koulutusalataso2_koodi
	,[jarjestys Koulutusala, taso 3] = d4.jarjestys_koulutusalataso3_koodi
	,[jarjestys OKM ohjauksen ala] = d4.jarjestys_okmohjauksenala_koodi
	,[jarjestys 1 kelpoisuus] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''1%'' THEN d3a.jarjestys_koodi
			ELSE ''ÖÖ''
		END
	,[jarjestys 2 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''2%'' THEN d3a.jarjestys_koodi
			ELSE ''ÖÖ''
		END
	,[jarjestys 3 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''3%'' THEN d3a.jarjestys_koodi
			ELSE ''ÖÖ''
		END
	,[jarjestys 4 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''4%'' THEN d3a.jarjestys_koodi
			ELSE ''ÖÖ''
		END
	,[jarjestys 5 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like ''5%'' THEN d3a.jarjestys_koodi
			ELSE ''ÖÖ''
		END

		 
FROM dw.f_virta_otp_opettajapatevyydet f

JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
JOIN dw.d_ika d2 on d2.id = f.d_ika_id
JOIN dw.d_opettajapatevyys d3a on d3a.id = f.d_opettajapatevyys_kaikki_id
JOIN dw.d_opettajapatevyys d3b on d3b.id = f.d_opettajapatevyys_id
JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_viimeisin_tutkinto_id
JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_id
JOIN dw.d_kytkin d6 on d6.kytkin_koodi = d3a.aineenopettajan_pedagogiset
JOIN dw.d_kytkin d7 on d7.kytkin_koodi = d3a.ammatillinen
JOIN dw.d_kytkin d8 on d8.kytkin_koodi = d3a.erityislastentarhanopettaja
JOIN dw.d_kytkin d9 on d9.kytkin_koodi = d3a.erityisopettaja
JOIN dw.d_kytkin d10 on d10.kytkin_koodi = d3a.opinto_ohjaaja
JOIN dw.d_kytkin d11 on d11.kytkin_koodi = d3a.monialaiset_opinnot
JOIN dw.d_kytkin d12 on d12.kytkin_koodi = d3a.varhaiskasvatuksen_ammatilliset_valmiudet
JOIN dw.d_organisaatioluokitus d13 on d13.id = f.d_organisaatioluokitus_tutkinto_id


' 
