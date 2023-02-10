USE [ANTERO]
GO

/****** Object:  View [dw].[v_virta_otp_opettajakelpoisuudet_tarkistus]    Script Date: 10.2.2023 10:07:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dw].[v_virta_otp_opettajakelpoisuudet_tarkistus] AS

SELECT DISTINCT
	f.KelpoisuusID,
	f.henkilo,
	d1.selite_fi as Kelpoisuus,
	f.[Status],
	d2.organisaatio_fi as 'Kelpoisuuden korkeakoulu',
	f.Vuosi as 'Kelpoisuuden vuosi',
	coalesce(d3.patevyys_fi, d4.koulutusluokitus_fi) as 'Suoritus',
	case when d3.patevyys_fi is null then 'Tutkinto' else 'Pätevyyskoodi' end as 'Suorituksen tyyppi',
	d6.kalenteri_avain as 'Suorituspäivämäärä',
	d5.organisaatio_fi as 'Suorituksen korkeakoulu',
	d8.organisaatio_fi as 'Korkeakoulu',
	d7.kytkin_fi as 'Kelpoisuus suoritettu yhdessä korkeakoulussa'
FROM ANTERO.dw.f_virta_otp_opettajakelpoisuudet f
LEFT JOIN ANTERO.dw.f_virta_otp_opettajakelpoisuudet f2 on f.KelpoisuusID = f2.KelpoisuusID
LEFT JOIN ANTERO.dw.d_opettajapatevyys d1 on d1.id = f.d_kelpoisuus_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d2 on d2.id = f.d_organisaatioluokitus_kelpoisuus_id
LEFT JOIN ANTERO.dw.d_virta_patevyydet d3 on d3.patevyys_koodi = f.suorituksen_koodi
LEFT JOIN ANTERO.dw.d_koulutusluokitus d4 on d4.koulutusluokitus_koodi = f.suorituksen_koodi
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d5 on d5.id = f.d_organisaatioluokitus_suoritus_id
LEFT JOIN ANTERO.dw.d_kalenteri d6 on d6.id = f.d_kalenteri_suoritus_pvm_id
LEFT JOIN ANTERO.dw.d_kytkin d7 on d7.id = f.d_kytkin_yksi_org_id
LEFT JOIN ANTERO.dw.d_organisaatioluokitus d8 on d8.id = f2.d_organisaatioluokitus_suoritus_id

WHERE f.Vuosi <= YEAR(GETDATE())

GO

USE [ANTERO]