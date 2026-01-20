USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_opettaja_ja_henkilostoliikkuvuus]    Script Date: 10.3.2025 9.03.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_amk_opettaja_ja_henkilostoliikkuvuus]
AS
TRUNCATE TABLE dw.f_amk_opettaja_ja_henkilostoliikkuvuus;

INSERT INTO dw.f_amk_opettaja_ja_henkilostoliikkuvuus (
	[d_amk_id]
	,d_koulutusala_id
	,[d_ohjauksen_ala_id]
	,[d_maa_id]
	,[d_sukupuoli_id]
	,[d_liikkuvuusohjelma_id]
	,[d_tehtavanjaottelu_id]
	,[d_kohdemaa_lahtevat_tai_lahtomaa_saapuvat_id]
	,d_vierailutyyppi_id
	,[vuosi]
	,[vierailut_ulkomaille_lkm]
	,[vierailut_ulkomailta_lkm]
	,[liikkuvuuden_kesto_ulkomaille]
	,[liikkuvuuden_kesto_ulkomailta]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,COALESCE(s7.id,-1)
	,COALESCE(s8.id,-1)
	,COALESCE(s9.id,-1)
	-- ,case when vierailun_kesto >= 30 then 0 else 1 end
	,COALESCE(s10.id,-1)
	,[vuosi]
	,[vierailut ulkomaille lkm]
	,[vierailut ulkomailta lkm]
	,[liikkuvuuden_kesto_ulkomaille]
	,COALESCE([liikkuvuuden_kesto_ulkomailta], 0.00)
	,getdate()
	,'etl: p_lataa_f_amk_opettaja_ja_henkilostoliikkuvuus'
	,suser_sname()
FROM [sa].[sa_suorat_amk10_opettaja_ja_henkilostoliikkuvuus] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.Ammattikorkeakoulu = s2.organisaatio_koodi
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(INT, CASE WHEN s1.koulutusala ='N' OR s1.koulutusala ='NN' THEN -1 ELSE s1.koulutusala END) = s3.koodi
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.ohjauksenala = s4.ohjauksenala_koodi
LEFT JOIN [dw].d_maatjavaltiot2 s5 ON s1.kansalaisuus = s5.maatjavaltiot2_koodi
LEFT JOIN [dw].d_sukupuoli s6 ON s1.sukupuoli = s6.sukupuoli_koodi
LEFT JOIN [dw].d_amk_liikkuvuusohjelma s7 ON s1.liikkuvuusohjelma = s7.koodi
LEFT JOIN [dw].d_amk_tehtavanjaottelu s8 ON s1.tehtavanjaottelu = s8.koodi
LEFT JOIN [dw].d_maatjavaltiot2 s9 ON s1.kohdemaa_lahtevat_tai_lahtomaa_saapuvat = s9.maatjavaltiot2_koodi
LEFT JOIN [dw].d_suorat_liikkuvuudentyyppi s10 ON s1.vierailun_kesto = s10.koodi

GO

USE [ANTERO]