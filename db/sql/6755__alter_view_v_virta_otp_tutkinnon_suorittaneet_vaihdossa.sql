USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_tutkinnon_suorittaneet_vaihdossa]    Script Date: 14.12.2022 12:50:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dw].[v_virta_otp_tutkinnon_suorittaneet_vaihdossa] AS

SELECT * FROM (
SELECT   
	[Tilastovuosi] = f.tilastovuosi,

    [Sukupuoli] = d1.sukupuoli_fi,
	[Ikä] = d2.ika_fi,
    [Ikäryhmä] = d2.ikaryhma5_fi,	
	[Liikkuvuuden kesto] = d4.liikkuvuudenkesto_fi,
    
	[Koulutussektori] = d8.koulutussektori_fi,		
	[Koulutusaste, taso 1] = d8.koulutusastetaso1_fi,
	[Koulutusaste, taso 2] = d8.Koulutusastetaso2_fi,
	[Koulutusala, taso 1] = d8.koulutusalataso1_fi,
	[Koulutusala, taso 2] = d8.koulutusalataso2_fi,
	[Koulutusala, taso 3] = d8.koulutusalataso3_fi,
	[Tutkinto] = d8.koulutusluokitus_fi, 
	[OKM ohjauksen ala] = d8.okmohjauksenala_fi,
	
	[Korkeakoulu] = d7.organisaatio_fi,

	f.lukumaara as lkm_vaihdossa,
	[lkm_tutkinnot] = 0,
	[opiskelijaavain],
			
	--koodimuuttujat
	[Koodit Korkeakoulu] = d7.organisaatio_koodi,
	[Koodit Tutkinto] = d8.koulutusluokitus_koodi,

	--järjestysmuuttujat
	[jarj Sukupuoli] = d1.jarjestys_sukupuoli_koodi, 
	[jarj Ikä] = d2.jarjestys_ika,
	[jarj Ikäryhmä]	= d2.jarjestys_ikaryhma5,	
	[jarj Liikkuvuudenkesto] = d4.jarjestys_liikkuvuudenkesto_koodi,
	[jarj Koulutussektori] = d8.jarjestys_koulutussektori_koodi,
	[jarj Koulutusaste, taso 1] = d8.jarjestys_koulutusastetaso1_koodi,
	[jarj Koulutusaste, taso 2] = d8.jarjestys_koulutusastetaso2_koodi,
	[jarj Koulutusala, taso 1] = d8.jarjestys_koulutusalataso1_koodi,
	[jarj Koulutusala, taso 2] = d8.jarjestys_koulutusalataso1_koodi,
	[jarj Koulutusala, taso 3] = d8.jarjestys_koulutusalataso1_koodi,
	[jarj OKM ohjauksen ala] = d8.jarjestys_okmohjauksenala_koodi

FROM [ANTERO].[dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa] f 
LEFT JOIN dw.d_sukupuoli d1 on d1.id = f.d_sukupuoli_id
LEFT JOIN dw.d_ika d2 on d2.id = f.d_ika_id
LEFT JOIN dw.d_liikkuvuudenkesto d4 on d4.id = f.d_liikkuvuudenkesto_id
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.id = f.d_organisaatioluokitus_id
LEFT JOIN dw.d_koulutusluokitus d8 on d8.id	= f.d_koulutusluokitus_id

WHERE f.tilastovuosi >= 2016 
and (d8.koulutusastetaso2_koodi in ('62','72')) --amk ja ylempi kk

UNION ALL

SELECT   
	[Tilastovuosi] = f.tilastointivuosi,

    [Sukupuoli] = d1.sukupuoli_fi,
	[Ikä] = d2.ika_fi,
    [Ikäryhmä] = d2.ikaryhma5_fi,	
	[Liikkuvuuden kesto] = d4.liikkuvuudenkesto_fi,
    
	[Koulutussektori] = d8.koulutussektori_fi,		
	[Koulutusaste, taso 1] = d8.koulutusastetaso1_fi,
	[Koulutusaste, taso 2] = d8.Koulutusastetaso2_fi,
	[Koulutusala, taso 1] = d8.koulutusalataso1_fi,
	[Koulutusala, taso 2] = d8.koulutusalataso2_fi,
	[Koulutusala, taso 3] = d8.koulutusalataso3_fi,
	[Tutkinto] = d8.koulutusluokitus_fi, 
	[OKM ohjauksen ala] = d8.okmohjauksenala_fi,
	
	[Korkeakoulu] = d7.organisaatio_fi,

	[lkm_vaihdossa] = NULL,
	[lkm_tutkinnot] = lukumaara,
	[opiskelijaavain] = NULL,		
	--koodimuuttujat
	[Koodit Korkeakoulu] = d7.organisaatio_koodi,
	[Koodit Tutkinto] = d8.koulutusluokitus_koodi,


	--järjestysmuuttujat
	[jarj Sukupuoli] = d1.jarjestys_sukupuoli_koodi, 
	[jarj Ikä] = d2.jarjestys_ika,
	[jarj Ikäryhmä]	= d2.jarjestys_ikaryhma5,	
	[jarj Liikkuvuudenkesto] = '999999',
	[jarj Koulutussektori] = d8.jarjestys_koulutussektori_koodi,
	[jarj Koulutusaste, taso 1] = d8.jarjestys_koulutusastetaso1_koodi,
	[jarj Koulutusaste, taso 2] = d8.jarjestys_koulutusastetaso2_koodi,
	[jarj Koulutusala, taso 1] = d8.jarjestys_koulutusalataso1_koodi,
	[jarj Koulutusala, taso 2] = d8.jarjestys_koulutusalataso1_koodi,
	[jarj Koulutusala, taso 3] = d8.jarjestys_koulutusalataso1_koodi,
	[jarj OKM ohjauksen ala] = d8.jarjestys_okmohjauksenala_koodi

FROM [VipunenTK].[dbo].[f_OTV_2_9_Korkeakoulututkinnot] f 
LEFT JOIN dw.d_sukupuoli d1 on d1.sukupuoli_koodi = f.sukupuoli
LEFT JOIN dw.d_ika d2 on d2.ika_avain = f.ika_1v
LEFT JOIN dw.d_liikkuvuudenkesto d4 on d4.id = '1'
LEFT JOIN dw.d_organisaatioluokitus d7 on d7.organisaatio_avain = 'oppilaitos_' + f.oppilaitos
LEFT JOIN dw.d_koulutusluokitus d8 on d8.koulutusluokitus_avain	= 'koulutus_' + f.koulutusluokitus

WHERE f.tilastointivuosi in (select distinct tilastovuosi FROM [dw].[f_virta_otp_tutkinnon_suorittaneet_vaihdossa])
and d8.koulutusastetaso2_koodi in ('62','72') --amk ja ylempi kk

) Q

WHERE Tilastovuosi < YEAR(GETDATE())

GO

USE [ANTERO]