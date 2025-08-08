USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_55_kuluva_lukuvuosi]    Script Date: 8.8.2025 12.25.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW  [dw].[v_virta_otp_55_kuluva_lukuvuosi] 

AS

SELECT  
	f.tilastovuosi as Tilastovuosi,
	f.lukuvuosi as Lukuvuosi,
	f.lo_aloituspvm,
	f.oo_aloituspvm,
			  
	CASE
		WHEN f.aika_aloittamisesta = 8 THEN '8 tai enemmän' 
		WHEN f.aika_aloittamisesta = -1 THEN 'Ei tietoa'
		ELSE cast(f.aika_aloittamisesta as varchar)
	END as 'Aika aloittamisesta',
	
	f.henkilo_koodi as Henkilo_koodi,

	d3.sukupuoli_fi	as Sukupuoli,
	f.uusi_opiskelija as uusi_opisk,
	d6.kytkin_fi as 'Aloittanut keväällä',
	f.olo_syksy as 'Olo syksy',
	f.olo_kevat as 'Olo kevät',
	f.lasna as Lasna,
	f.Suorittanut55,
	f.opintopisteet_syksy as 'Opintopisteet syksy',
	f.opintopisteet_kevat as 'Opintopisteet kevät',
		   
			  
	d1.oppilaitostyyppi_fi as Sektori,

	d1.organisaatio_fi as Korkeakoulu,
	d2.koulutusluokitus_koodi as Tutkintokoodi,
	d2.koulutusluokitus_fi as Tutkinto,
	d2.okmohjauksenala_fi as 'OKM ohjauksen ala',
	d2.koulutusastetaso1_fi as 'Koulutusaste, taso 1',
	d2.koulutusastetaso2_fi as 'Koulutusaste, taso 2',
	d2.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d2.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d2.koulutusalataso3_fi as 'Koulutusala, taso 3',

	f.suorittanut27 as suorittanut_27,
	f.suorittanut55IlmanPankkia AS suorittanut_55_ilman_pankkia,
	f.suorittanut55PankinAvulla AS suorittanut_55_pankin_avulla,

	f.ika as 'Ikä',
	d4.ikaryhma1_fi as 'Ikäryhmä',

	f.opintopisteet_summa as 'Opintopisteet summa',
	d5.opryhma1_fi as 'op suorittanut ryhmä',
	d5.opryhma1_fi as 'Opintopisteryhmä',

	-- järjestys
	d2.jarjestys_okmohjauksenala_koodi as 'OKM ohjauksen ala jarj',
	d2.jarjestys_koulutusastetaso1_koodi as 'Koulutusaste, taso 1 jarj',
	d2.jarjestys_koulutusastetaso2_koodi as 'Koulutusaste, taso 2 jarj',
	d2.jarjestys_koulutusalataso1_koodi as 'Koulutusala, taso 1 jarj',
	d2.jarjestys_koulutusalataso1_koodi as 'Koulutusala, taso 2 jarj',
	d2.jarjestys_koulutusalataso1_koodi as 'Koulutusala, taso 3 jarj',

	d5.jarjestys_op as 'Opintopisteet summa jarj',
	d5.jarjestys_opryhma1 as 'Opintopisteryhmä jarj',
			  
	d4.jarjestys_ika as 'Ikä jarj',
	d4.jarjestys_ikaryhma1 as 'Ikäryhmä jarj'
			  	
FROM ANTERO.dw.f_virta_otp_55_kuluva_lukuvuosi f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id=f.d_organisaatioluokitus_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_sukupuoli d3 on d3.id = d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_ika d4 ON d4.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_opintopisteet d5 ON d5.id = f.d_opintopisteet_id
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.id = f.d_kytkin_aloittanut_kevaalla_id

GO


