USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opiskelija_ja_tutkinto_ennakko]    Script Date: 10.3.2023 9:13:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_virta_otp_opiskelija_ja_tutkinto_ennakko] AS

SELECT 
	f.tilastovuosi as Tilastovuosi,
	coalesce(f.kirjoihintulovuosi, 'Tieto puuttuu') as Kirjoihintulovuosi,

	d1.organisaatio_fi as Korkeakoulu,
	CASE 
		WHEN d1.oppilaitostyyppi_fi = 'Yliopistot' THEN 'Yliopistokoulutus' 
		WHEN d1.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' THEN 'Ammattikorkeakoulukoulutus'
	END as Sektori,

	d2.koulutusluokitus_fi as Tutkinto,
	d2.koulutusastetaso1_fi as 'Koulutusaste, taso 1',
	d2.koulutusastetaso2_fi as 'Koulutusaste, taso 2',
	d2.koulutusalataso1_fi as 'Koulutusala, taso 1',
	d2.koulutusalataso2_fi as 'Koulutusala, taso 2',
	d2.koulutusalataso3_fi as 'Koulutusala, taso 3',
	d8.koulutuslaji_okm as Koulutuslaji,
	d9.koulutustyyppi as Koulutustyyppi,

	d3.maatjavaltiot2_fi as Kansalaisuus,
	d3.maanosa6_fi as 'Kansalaisuus (ryhmä)',
	d4.sukupuoli_fi as Sukupuoli,
	d5.ika_fi as 'Ikä',
	d5.ikaryhma2_fi as 'Ikäryhmä',
	d7.kieliryhma1_fi as 'Äidinkieli',
	[opiskelijat] as opiskelijat2,
    [opiskelijat_lasna],
    [opiskelijat_fte],
	CASE 
		WHEN d2.koulutusastetaso2_koodi in (62,63,71,72) THEN [aloittaneet] 
		ELSE NULL
	END as aloittaneet,
	CASE 
		WHEN f.tilastovuosi <> f.kirjoihintulovuosi and d2.koulutusastetaso2_koodi not in ('73','81','82','91','91','62','71') and op55 = 1 THEN opiskelijat 
		ELSE NULL
	END as op55,
    [opyht0],
    [opyht104],
    [opyht119],
    [opyht120],
    [opyht14],
    [opyht29],
    [opyht44],
    [opyht59],
    [opyht74],
    [opyht89],
    CASE 
		WHEN d9.koulutustyyppi_koodi not in (3,5) THEN [tutkinnot] 
		ELSE NULL
	END as tutkinnot2,

	d2.jarjestys_koulutusastetaso1_koodi,
	d2.jarjestys_koulutusastetaso2_koodi,
	d2.jarjestys_koulutusalataso1_koodi,
	d2.jarjestys_koulutusalataso2_koodi,
	d2.jarjestys_koulutusalataso3_koodi,
	d2.jarjestys_koulutusluokitus_koodi,
	d7.jarjestys_kieliryhma1 as jarjestys_aidinkieli,
	d5.jarjestys_ikaryhma2,
	d4.jarjestys_sukupuoli_koodi,
	d3.jarjestys_maanosa6_koodi,
	d8.jarjestys as jarjetys_koulutuslaji,
	d9.jarjestys as jarjestys_koulutustyyppi

FROM ANTERO.dw.f_virta_otp_opiskelija_ja_tutkinto_ennakko f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id 
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2 on d2.id = f.d_koulutusluokitus_id
LEFT JOIN ANTERO.dw.d_maatjavaltiot2 d3 on d3.id = f.d_maatjavaltiot2_kansalaisuus_id
LEFT JOIN ANTERO.dw.d_sukupuoli d4 on d4.id = f.d_sukupuoli_id
LEFT JOIN ANTERO.dw.d_ika d5 on d5.id = f.d_ika_id
LEFT JOIN ANTERO.dw.d_kieli d7 on d7.id = f.d_aidinkieli_id
LEFT JOIN VipunenTK.dbo.d_koulutuslaji_okm d8 on d8.koulutuslaji_okm_avain = f.koulutuslaji_OKM_avain
LEFT JOIN VipunenTK.dbo.d_koulutustyyppi d9 on d9.id = f.d_tk_koulutustyyppi_id

GO

USE [ANTERO]