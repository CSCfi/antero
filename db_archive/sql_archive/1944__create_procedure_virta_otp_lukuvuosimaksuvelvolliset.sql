USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset]    Script Date: 13.11.2018 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset] AS


TRUNCATE TABLE dw.f_virta_otp_lukuvuosimaksuvelvolliset



INSERT INTO dw.f_virta_otp_lukuvuosimaksuvelvolliset (
	tilastovuosi
	,d_sukupuoli_id
	,d_ika_id
	,d_maatjavaltiot_kansalaisuus_id
	,d_koulutusluokitus_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarjestaja_id
	,lkm
	,source
)

SELECT 
	
	tilastovuosi = vuosi
	,d_sukupuoli_id = COALESCE(d1.id,-1)
	,d_ika_id = COALESCE(d2.id,-1)
	,d_maatjavaltiot_kansalaisuus_id = COALESCE(d3.id, -1)
	,d_koulutusluokitus_id = COALESCE(d4.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d5.id,-1)
	,d_organisaatioluokitus_jarjestaja_id = COALESCE(d6.id,-1)
	,lkm = 1
	,source = 'p_lataa_f_virta_otp_lukuvuosimaksuvelvolliset'
	
FROM (
	
	SELECT
		vuosi
		,sukupuoli
		,ika
		,kansalaisuus
		,koulutuskoodi
		,oppilaitos
	FROM [ANTERO].[sa].[sa_virta_otp_lukuvuosimaksuvelvolliset]
			
) q
	
LEFT JOIN d_sukupuoli d1 ON d1.sukupuoli_koodi=q.sukupuoli
LEFT JOIN d_ika d2 ON d2.ika_avain=q.ika
LEFT JOIN d_maatjavaltiot2 d3 ON d3.maatjavaltiot2_koodi=q.kansalaisuus
LEFT JOIN d_koulutusluokitus d4 ON d4.koulutusluokitus_koodi=q.koulutuskoodi
LEFT JOIN d_organisaatioluokitus d5 ON d5.organisaatio_koodi=q.oppilaitos
LEFT JOIN d_organisaatioluokitus d6 ON d6.organisaatio_oid=d5.ylaorganisaatio_oid
