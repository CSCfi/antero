USE [ANTERO]
GO

DROP VIEW IF EXISTS [dw].[v_virta_otp_opettajakelpoisuudet_uudet]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet_uudet]    Script Date: 24.3.2022 9:33:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dw].[v_virta_otp_opettajakelpoisuudet_uudet] AS

WITH mq AS (
	SELECT 
		[patevyys_ryhma]
		,[patevyys_koodi]
		,rnk = rank() over (partition by patevyys_ryhma order by patevyys_koodi)
	FROM [ANTERO].[sa].[opettajapatevyydet_koodi_ryhma]
) 

SELECT		
	 [Kelpoisuuden suoritusvuosi] = f.patevyyden_vuosi
	,[Tilastovuosi] = f.tilastovuosi
	,[Sukupuoli] = d1.sukupuoli_fi
	,[Ikä] = d2.ika_fi
	,[Ikäryhmä] = d2.ikaryhma3_fi
	,[Opettajakelpoisuudet] = d3a.selite_fi
	,[Opettajakelpoisuudet, asetus] = d3b.selite2_fi
	,[Opettajakelpoisuus] = d3b.selite_fi
	,[Aine] = LEFT(d14.patevyys_fi,LEN(d14.patevyys_fi)-CHARINDEX(',',REVERSE(d14.patevyys_fi)))
	,[Laajuus] = coalesce(f.laajuus,'Tieto puuttuu')
	,[1 kelpoisuus] =
		CASE 
			WHEN d3a.patevyyksien_maara like '1%' THEN d3a.selite_fi
			ELSE 'Muu kuin 1 kelpoisuus'
		END
	,[2 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '2%' THEN d3a.selite_fi
			ELSE 'Muu kuin 2 kelpoisuutta'
		END
	,[3 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '3%' THEN d3a.selite_fi
			ELSE 'Muu kuin 3 kelpoisuutta'
		END
	,[4 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '4%' THEN d3a.selite_fi 	
			ELSE 'Muu kuin 4 kelpoisuutta'
		END
	,[5 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '5%' THEN d3a.selite_fi
			ELSE 'Muu kuin 5 kelpoisuutta'
		END
	,[Opettajakelpoisuuksien määrä] = d3b.patevyyksien_maara

	,[Kelpoisuuden suoritustapa] =
		CASE
			WHEN d_opettajapatevyys_suoritustapa_id = '1' THEN 'Kelpoisuus tutkinnon yhteydessä'
			WHEN d_opettajapatevyys_suoritustapa_id = '2' THEN 'Kelpoisuus suoritettu erillisinä opintoina: henkilön ensimmäinen opettajan kelpoisuus'
			WHEN d_opettajapatevyys_suoritustapa_id = '3' THEN 'Kelpoisuus suoritettu erillisinä opintoina: kelpoisuus täydentää henkilön aiempia opettajan kelpoisuuksia'
			ELSE 'Tieto puuttuu'
		END
	,[Yli asetuksen] = d15.kytkin_fi
	,[Aineenopettajan pedagogiset opinnot] = d6.kytkin_fi
	,[Ammatillinen opettajakoulutus] = d7.kytkin_fi
	,[Varhaiskasvatuksen erityisopettajan opinnot] = d8.kytkin_fi
	,[Erityisopettajan opinnot] = d9.kytkin_fi
	,[Opinto-ohjaajan opinnot] = d10.kytkin_fi
	,[Perusopetuksessa opetettavien aineiden ja aihekokonaisuuksien monialaiset opinnot] = d11.kytkin_fi
	,[Varhaiskasvatuksen tehtäviin ammatillisia valmiuksia antavat opinnot] = d12.kytkin_fi
	,[Ammatillinen erityisopettajakoulutus] = d16.kytkin_fi
	,[Ammatillinen opinto-ohjaajakoulutus] = d17.kytkin_fi
	,[Ruotsinkielinen ammatillinen opettajankoulutus] = d18.kytkin_fi

	,[Sektori] = d5.oppilaitostyyppi_fi
	,[Koulutusaste, taso 1] = d4.koulutusastetaso1_fi
	,[Koulutusaste, taso 2] = d4.koulutusastetaso2_fi
	,[Koulutusala, taso 1] = d4.koulutusalataso1_fi
	,[Koulutusala, taso 2] = d4.koulutusalataso2_fi
	,[Koulutusala, taso 3] = d4.koulutusalataso3_fi
	,[OKM ohjauksen ala] = d4.okmohjauksenala_fi
	,[Tutkinto (korkein)] = d4.koulutusluokitus_fi
	,[Tutkinnon suoritusvuosi] = f.tutkinnon_vuosi
	,[Tutkinnon suorituskorkeakoulu] = d13.organisaatio_fi

	,[Korkeakoulu] = d5.organisaatio_fi

	,[tutkinnon_yhteydessa] = CASE WHEN d_opettajapatevyys_suoritustapa_id = '1' THEN 1 ELSE 0 END
	,[erillinen_eka] = CASE WHEN d_opettajapatevyys_suoritustapa_id = '2' THEN 1 ELSE 0 END
	,[erillinen_taydentava] = CASE WHEN d_opettajapatevyys_suoritustapa_id = '3' THEN 1 ELSE 0 END

	,f.patevyys_ryhma
	,lkm

	--koodit
	,[Koodit Koulutusnimike] = d4.koulutusluokitus_koodi
	,[Koodit Korkeakoulu] = d5.organisaatio_koodi
	,[Koodit Tutkinnon suorituskorkeakoulu] = d13.organisaatio_koodi
	
	--järjestys
	,[jarjestys Sukupuoli] = d1.jarjestys_sukupuoli_koodi
	,[jarjestys Ikäryhmä] = d2.jarjestys_ikaryhma3
	,[jarjestys Opettajakelpoisuudet] = d3a.jarjestys3_koodi
	,[jarjestys Opettajakelpoisuudet, asetus] = d3a.jarjestys2_koodi
	,[jarjestys Opettajakelpoisuus] = d3b.jarjestys3_koodi
	,[jarjestys Tutkinnon suoritustapa] =
		CASE
			WHEN d_opettajapatevyys_suoritustapa_id = '1' THEN 1
			WHEN d_opettajapatevyys_suoritustapa_id = '2' THEN 2
			WHEN d_opettajapatevyys_suoritustapa_id = '3' THEN 3
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
			WHEN d3a.patevyyksien_maara like '1%' THEN d3a.jarjestys3_koodi
			ELSE '99'
		END
	,[jarjestys 2 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '2%' THEN d3a.jarjestys3_koodi
			ELSE '99'
		END
	,[jarjestys 3 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '3%' THEN d3a.jarjestys3_koodi
			ELSE '99'
		END
	,[jarjestys 4 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '4%' THEN d3a.jarjestys3_koodi
			ELSE '99'
		END
	,[jarjestys 5 kelpoisuutta] =
		CASE 
			WHEN d3a.patevyyksien_maara like '5%' THEN d3a.jarjestys3_koodi
			ELSE '99'
		END

		 
FROM dw.f_virta_otp_opettajakelpoisuudet_uudet f

JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id		
JOIN dw.d_ika d2 on d2.id = f.d_ika_id
JOIN dw.d_opettajapatevyys d3a on d3a.id = f.d_opettajapatevyys_kaikki_id
JOIN dw.d_opettajapatevyys d3b on d3b.id = f.d_opettajapatevyys_id
--JOIN dw.d_opettajapatevyys d3c on d3c.id = f.d_opettajapatevyys_kaikki_id
--JOIN dw.d_opettajapatevyys d3d on d3d.id = f.d_opettajapatevyys_id
JOIN dw.d_koulutusluokitus d4 on d4.id = f.d_koulutusluokitus_korkein_tutkinto_id
JOIN dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_kelpoisuus_id
JOIN dw.d_kytkin d6 on d6.kytkin_koodi = d3b.aineenopettajan_pedagogiset
JOIN dw.d_kytkin d7 on d7.kytkin_koodi = d3b.ammatillinen_opettajakoulutus
JOIN dw.d_kytkin d8 on d8.kytkin_koodi = d3b.erityislastentarhanopettaja
JOIN dw.d_kytkin d9 on d9.kytkin_koodi = d3b.erityisopettaja
JOIN dw.d_kytkin d10 on d10.kytkin_koodi = d3b.opinto_ohjaaja
JOIN dw.d_kytkin d11 on d11.kytkin_koodi = d3b.monialaiset_opinnot
JOIN dw.d_kytkin d12 on d12.kytkin_koodi = d3b.varhaiskasvatuksen_ammatilliset_valmiudet
JOIN dw.d_kytkin d16 on d16.kytkin_koodi = d3b.ammatillinen_erityisopettajakoulutus
JOIN dw.d_kytkin d17 on d17.kytkin_koodi = d3b.ammatillinen_opinto_ohjaajakoulutus
JOIN dw.d_kytkin d18 on d18.kytkin_koodi = d3b.ruotsinkielinen_ammatillinen_opettajankoulutus
JOIN dw.d_organisaatioluokitus d13 on d13.id = f.d_organisaatioluokitus_tutkinto_id
JOIN dw.d_virta_patevyydet d14 on d14.id = f.d_virta_patevyydet_id
JOIN dw.d_kytkin d15 on d15.kytkin_koodi = d3b.yli_asetuksen

WHERE f.patevyys_ryhma = 'opettaja'

GO

USE [ANTERO]
