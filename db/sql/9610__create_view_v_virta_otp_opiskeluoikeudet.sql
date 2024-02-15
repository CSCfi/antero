USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opiskeluoikeudet]    Script Date: 15.2.2024 12:51:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW  [dw].[v_virta_otp_opiskeluoikeudet]
AS
SELECT 

	-- Aikamuuttujat
	tilastovuosi as Tilastovuosi,
	vuosia_ensimmaisesta_opiskeluoikeudesta as 'Vuodet ensimmäisestä opiskeluoikeudesta',
	vuosia_viimeisesta_opiskeluoikeudesta as 'Vuodet viimeisestä opiskeluoikeudesta',

	-- Organisaatiomuuttujat
	d1a.organisaatio_fi as 'Ensimmäinen korkeakoulu',
    d1b.organisaatio_fi as 'Viimeinen korkeakoulu',
	lukumaara_korkeakoulut as 'Korkeakoulujen lukumäärä',
	lukumaara_yliopistot as 'Yliopistojen lukumäärä',
	lukumaara_ammattikorkeakoulut as 'Ammattikorkeakoulujen lukumäärä',
	d6.kytkin_fi as 'Opiskeluoikeus ammattikorkeakoulussa ja yliopistossa',

	-- Koulutusmuuttujat

	CASE
		WHEN d2a.koulutussektori_fi = 'Tieto puuttuu' and d1a.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' THEN 'Ammattikorkeakoulukoulutus'
		WHEN d2a.koulutussektori_fi = 'Tieto puuttuu' and d1a.oppilaitostyyppi_fi = 'Yliopistot' THEN 'Yliopistokoulutus'
		ELSE d2a.koulutussektori_fi
	END as 'Sektori (1. opiskeluoikeus)',
	CASE
		WHEN d2b.koulutussektori_fi = 'Tieto puuttuu' and d1b.oppilaitostyyppi_fi = 'Ammattikorkeakoulut' THEN 'Ammattikorkeakoulukoulutus'
		WHEN d2b.koulutussektori_fi = 'Tieto puuttuu' and d1b.oppilaitostyyppi_fi = 'Yliopistot' THEN 'Yliopistokoulutus'
		ELSE d2b.koulutussektori_fi
	END as 'Sektori (viimeinen opiskeluoikeus)',

	d2a.koulutusalataso1_fi as 'Koulutusala, taso 1 (1. opiskeluoikeus)',
	d2a.koulutusalataso2_fi as 'Koulutusala, taso 2 (1. opiskeluoikeus)',
	d2a.koulutusalataso3_fi as 'Koulutusala, taso 3 (1. opiskeluoikeus)',
	d2a.koulutusastetaso1_fi as 'Koulutusaste, taso 1 (1. opiskeluoikeus)',
	d2a.koulutusastetaso2_fi as 'Koulutusaste, taso 2 (1. opiskeluoikeus)',
	d2a.okmohjauksenala_fi as 'OKM ohjauksen ala (1. opiskeluoikeus)',
	d2a.koulutusluokitus_fi as 'Koulutusnimike (1. opiskeluoikeus)',

	d2b.koulutusalataso1_fi as 'Koulutusala, taso 1 (viimeinen opiskeluoikeus)',
	d2b.koulutusalataso2_fi as 'Koulutusala, taso 2 (viimeinen opiskeluoikeus)',
	d2b.koulutusalataso3_fi as 'Koulutusala, taso 3 (viimeinen opiskeluoikeus)',
	d2b.koulutusastetaso1_fi as 'Koulutusaste, taso 1 (viimeinen opiskeluoikeus)',
	d2b.koulutusastetaso2_fi as 'Koulutusaste, taso 2 (viimeinen opiskeluoikeus)',
	d2b.okmohjauksenala_fi as 'OKM ohjauksen ala (viimeinen opiskeluoikeus)',
	d2b.koulutusluokitus_fi as 'Koulutusnimike (viimeinen opiskeluoikeus)',

	CASE 
		WHEN lukumaara_opiskeluoikeudet > 4 then 'Yli 4 opiskeluoikeutta'
		WHEN lukumaara_opiskeluoikeudet = 1 then '1 opiskeluoikeus'
		ELSE cast(lukumaara_opiskeluoikeudet as varchar) + ' opiskeluoikeutta'
	END as 'Opiskeluoikeuksien lukumäärä',

	d3.kytkin_fi as 'Useampi opiskeluoikeus samalta alalta',
	d4.kytkin_fi as 'Useampi opiskeluoikeus samasta ammattikorkeakoulusta',
	d5.kytkin_fi as 'Useampi opiskeluoikeus samasta yliopistosta',

	-- Koodimuuttujat
	d1a.organisaatio_koodi as 'Koodit Ensimmäinen korkeakoulu',
	d1b.organisaatio_koodi as 'Koodit Viimeinen korkeakoulu',
	d2a.koulutusluokitus_koodi as 'Koodit Koulutusnimike (1. opiskeluoikeus)',
	d2b.koulutusluokitus_koodi as 'Koodit Koulutusnimike (viimeinen opiskeluoikeus)',

	-- Apumuuttuja
	lkm,
	lukumaara_opiskeluoikeudet

FROM [ANTERO].[dw].[f_virta_otp_opiskeluoikeudet] f
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1a on d1a.id = f.d_organisaatioluokitus_ensimmainen_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d1b on d1b.id = f.d_organisaatioluokitus_viimeinen_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2a on d2a.id = f.d_koulutusluokitus_ensimmainen_id
LEFT JOIN ANTERO.dw.d_koulutusluokitus d2b on d2b.id = f.d_koulutusluokitus_viimeinen_id
LEFT JOIN ANTERO.dw.d_kytkin d3 on d3.id = f.d_kytkin_usea_oo_samalta_alalta
LEFT JOIN ANTERO.dw.d_kytkin d4 on d4.id = f.d_kytkin_usea_oo_samasta_ammattikorkeakoulusta
LEFT JOIN ANTERO.dw.d_kytkin d5 on d5.id = f.d_kytkin_usea_oo_samasta_yliopistosta
LEFT JOIN ANTERO.dw.d_kytkin d6 on d6.id = f.d_kytkin_yliopisto_ja_ammattikorkeakoulu


GO

USE [ANTERO]
