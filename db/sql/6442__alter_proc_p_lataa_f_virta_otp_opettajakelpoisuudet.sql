USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet]    Script Date: 19.9.2022 17:47:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opettajakelpoisuudet] AS

--sa-taulu
EXEC [sa].[p_lataa_virta_opettajakelpoisuus]

--dimensiotaulu (uusien pätevyyskombinaatioiden varalta)
EXEC [dw].[p_lataa_d_opettajapatevyys]

--faktataulu
DROP TABLE IF EXISTS dw.f_virta_otp_opettajakelpoisuudet


SELECT 
	tilastovuosi = kelpoisuus_vuosi 
	,korkeimman_tutkinnon_vuosi
	,d_sukupuoli_id = COALESCE(d1.id,'-1')
	,d_ika_id = COALESCE(d2.id,'-1')
	,d_koulutusluokitus_viimeisin_tutkinto_id = COALESCE(d5.id,'-1')
	,d_organisaatio_kelpoisuus_id = COALESCE(d3.id,'-1')
	,d_organisaatio_tutkinto_id = COALESCE(d6.id,'-1')
	,d_opettajapatevyys_id = COALESCE(d4.id,'-1')
	,d_opettajapatevyys_kaikki_id = COALESCE(d9.id,'-1')
	,d_opettajapatevyys_suoritustapa_id = suoritustapa
	,kelpoinen = 1	
	,kelpoisuuksien_maara
	,d_kytkin_yli_asetuksen_id  = COALESCE(d10.id,'-1')
	,lkm = count(distinct henkilo)

INTO dw.f_virta_otp_opettajakelpoisuudet

FROM sa.virta_opettajakelpoisuus v
LEFT JOIN dw.d_sukupuoli d1 ON d1.sukupuoli_koodi = v.sukupuoli
LEFT JOIN dw.d_ika d2 ON d2.ika_avain = v.ika
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = v.kelpoisuuden_organisaatiokoodi
LEFT JOIN dw.d_opettajapatevyys d4 ON d4.koodi = v.kelpoisuus_koodi
LEFT JOIN dw.d_koulutusluokitus d5 ON d5.koulutusluokitus_koodi = v.korkeimman_tutkinnon_koulutuskoodi
LEFT JOIN dw.d_organisaatioluokitus d6 ON d6.organisaatio_koodi = v.korkeimman_tutkinnon_organisaatiokoodi
LEFT JOIN dw.d_opettajapatevyys d9 ON d9.koodi = v.kelpoisuus_koodi_kaikki_myos_aiemmat_vuodet
LEFT JOIN dw.d_kytkin d10 on d10.kytkin_koodi = v.yli_asetuksen

WHERE kelpoisuus_vuosi >= 2016 and rnk = 1

GROUP BY 
	kelpoisuus_vuosi
	,korkeimman_tutkinnon_vuosi
	,COALESCE(d1.id,'-1')
	,COALESCE(d2.id,'-1')
	,COALESCE(d3.id,'-1')
	,COALESCE(d4.id,'-1')
	,COALESCE(d9.id,'-1')
	,COALESCE(d5.id,'-1')
	,COALESCE(d6.id,'-1')
	,COALESCE(d10.id,'-1')
	,suoritustapa
	,kelpoisuuksien_maara


GO

USE [ANTERO]