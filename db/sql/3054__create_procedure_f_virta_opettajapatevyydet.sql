USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_opettajapatevyydet]    Script Date: 8.5.2020 11:39:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_virta_otp_opettajapatevyydet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_opettajapatevyydet] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_opettajapatevyydet] AS

DROP TABLE IF EXISTS sa.sa_opettajapatevyys
SELECT * INTO sa.sa_opettajapatevyys
FROM [sa].[v_virta_otp_opettajapatevyydet2]


TRUNCATE TABLE dw.f_virta_otp_opettajapatevyydet

INSERT INTO dw.f_virta_otp_opettajapatevyydet (
	[tilastovuosi]
	,[opiskelija_avain]
	,[opiskelija]
	,[d_organisaatioluokitus_id]
	,[d_sukupuoli_id]
	,[d_ika_id]
	,[tutkinnon_vuosi]
	,[d_koulutusluokitus_viimeisin_tutkinto_id]
	,[d_organisaatioluokitus_tutkinto_id]
	,[d_opettajapatevyys_kaikki_id]
	,[d_opettajapatevyys_id]
	,[suor_tapa]
)

SELECT 
	vuosi
	,opiskelija_avain
	,opiskelija
	,d_organisaatio_id = COALESCE(d3.id,'-1')
	,d_sukupuoli_id = COALESCE(d1.id,'-1')
	,d_ika_id = COALESCE(d2.id,'-1')
	,tutkinnon_vuosi = v.tutkinto_vuosi
	,d_koulutusluokitus_viimeisin_tutkinto_id = COALESCE(d5.id,'-1')
	,d_organisaatio_tutkinto_id = COALESCE(d6.id,'-1')
	,d_opettajapatevyys_kaikki_id = COALESCE(d4a.id,'-1')
	,d_opettajapatevyys_id = COALESCE(d4b.id,'-1')
	,suor_tapa
FROM sa.v_virta_otp_opettajapatevyydet4 v

LEFT JOIN dw.d_sukupuoli d1 ON d1.sukupuoli_koodi = v.sukupuoli_koodi
LEFT JOIN dw.d_ika d2 ON d2.ika_avain = v.ika
LEFT JOIN dw.d_organisaatioluokitus d3 ON d3.organisaatio_koodi = v.organisaatio_koodi
LEFT JOIN dw.d_opettajapatevyys d4a ON d4a.koodi = v.kelp_avain
LEFT JOIN dw.d_opettajapatevyys d4b ON d4b.koodi = v.kelp_avain2
LEFT JOIN dw.d_koulutusluokitus d5 ON d5.koulutusluokitus_koodi = v.tutkinto_koodi
LEFT JOIN dw.d_organisaatioluokitus d6 ON d6.organisaatio_koodi = v.tutkinto_organisaatio

WHERE len(kelp_avain) > 0
