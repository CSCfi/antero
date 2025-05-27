USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_maahanmuuttajien_valmentava_koulutus]    Script Date: 10.3.2025 9.01.05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_amk_maahanmuuttajien_valmentava_koulutus]
AS
TRUNCATE TABLE dw.f_amk_maahanmuuttajien_valmentava_koulutus;

INSERT INTO dw.f_amk_maahanmuuttajien_valmentava_koulutus (
 d_amk_id
,d_ohjauksenala_id
,d_koulutusala_2002_id
,d_sukupuoli_id
,d_tilannepvm_id
,vuosi
,osallistuneet
,source
)

SELECT
 coalesce(d1.id,-1) as d_amk_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,-1 as d_koulutusala_2002_id
,coalesce(d3.id,-1) as d_sukupuoli_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi
,s.naisia as osallistuneet
,s.source
FROM sa.sa_virta_otp_amk8suorattk as s
LEFT JOIN dw.d_organisaatioluokitus as d1 ON d1.organisaatio_koodi=s.organisaatiokoodi
LEFT JOIN dw.d_ohjauksenala as d2 ON d2.ohjauksenala_koodi=s.koulutusala
LEFT JOIN dw.d_sukupuoli as d3 ON d3.sukupuoli_koodi='2'
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(s.loadtime as date)

UNION

SELECT 
 coalesce(d1.id,-1) as d_amk_id
,coalesce(d2.id,-1) as d_ohjauksenala_id
,-1 as d_koulutusala_2002_id
,coalesce(d3.id,-1) as d_sukupuoli_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.vuosi
,s.miehia as osallistuneet
,s.source
FROM sa.sa_virta_otp_amk8suorattk as s
LEFT JOIN dw.d_organisaatioluokitus as d1 ON d1.organisaatio_koodi=s.organisaatiokoodi
LEFT JOIN dw.d_ohjauksenala as d2 ON d2.ohjauksenala_koodi=s.koulutusala
LEFT JOIN dw.d_sukupuoli as d3 ON d3.sukupuoli_koodi='1'
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(s.loadtime as date)

UNION

SELECT
 coalesce(d1.id,-1) as d_amk_id
,-1 as d_ohjauksenala_id
,coalesce(d2.id,-1) as d_koulutusala_2002_id
,coalesce(d3.id,-1) as d_sukupuoli_id
,coalesce(d4.id,-1) as d_tilannepvm_id
,s.VUOSI as vuosi
,OSALLISTUNEIDEN_LKM as osallistuneet
,'etl: sa_suorat_hist_amk7_mamu_valmistava_koulutus' as source
FROM sa.sa_suorat_hist_amk7_mamu_valmistava_koulutus s
LEFT JOIN dw.d_organisaatioluokitus as d1 ON d1.organisaatio_koodi=s.AMK_TUNNUS
LEFT JOIN dw.d_koulutusala_2002 as d2 ON d2.koodi=s.KOULUTUSALA_KOODI
LEFT JOIN dw.d_sukupuoli as d3 ON d3.sukupuoli_koodi=s.SUKUPUOLIKOODI
LEFT JOIN dw.d_kalenteri as d4 ON d4.kalenteri_avain=cast(s.LATAUSAIKA as date)

GO

USE [ANTERO]