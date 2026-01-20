USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_julkaisut_a_e]    Script Date: 10.3.2025 8.52.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_amk_julkaisut_a_e]
AS
TRUNCATE TABLE dw.f_amk_julkaisut_a_e;

INSERT INTO dw.f_amk_julkaisut_a_e(
	[d_amk_id]
	,[d_organisaatioluokitus_id]
	,[d_koulutusala_id]
	,[d_ohjauksenala_id]
	,d_julkaisutyyppi_id
	,d_julkaisun_kansainvalisyys_id
	,d_tieteenala_id
	,tieteenala_koodi
	,d_julkaisufoorumitaso_id
	,d_kansainvalinen_yhteisjulkaisu_id
	,d_yhteisjulkaisuSHPKytkin_id
	,d_yhteisjulkaisuTutkimuslaitosKytkin_id
	,d_yhteisjulkaisuMuuKytkin_id
	,d_avoinSaatavuus_id	
	,[vuosi]
	,[julkaisujen_maara]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT 
	s2.id
	,COALESCE(s2.id,-1)
	,COALESCE(s3.id,-1)
	,-1
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,COALESCE(s7.id,-1)
	,COALESCE(case when vuosi<2011 then case when TIETEENALA_KOODI_07 = 'NNN' then '-1' else TIETEENALA_KOODI_07 end else TIETEENALA_KOODI_10 end,'-1')
	,COALESCE(d3.id,-1)
	,COALESCE(d6.id,-1)
	,COALESCE(d12.id,-1)
	,COALESCE(d13.id,-1)
	,COALESCE(d14.id,-1)
	,COALESCE(d17.id,-1)
	,[Vuosi]
	,COALESCE(s1.JULKAISUJEN_LKM, 0)
	,getdate()
	,'etl: p_lataa_f_amk_julkaisut_a_e'
	,suser_sname()
FROM [sa].[sa_suorat_hist_amk3_julkaisut_a_e] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.AMK_TUNNUS = s2.organisaatio_koodi
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(VARCHAR, s1.KOULUTUSALA_KOODI) = CONVERT(VARCHAR, CASE WHEN cast(s3.koodi as varchar) = 'NN' THEN '-1' ELSE cast(s3.koodi as varchar) END)
JOIN [dw].d_julkaisutyyppi s5 ON SUBSTRING(s1.JULKAISUTYYPPI_KOODI,1,2) = s5.julkaisutyyppi_koodi 
LEFT JOIN [dw].d_julkaisun_kansainvalisyys s6 ON s1.KANSAINVALISYYS_KOODI = s6.julkaisun_kansainvalisyys_koodi
LEFT JOIN [dw].d_tieteenala s7 ON CONVERT(VARCHAR, case when vuosi < 2011 then s1.TIETEENALA_KOODI_07 else s1.TIETEENALA_KOODI_10 end) =  CONVERT(VARCHAR, CASE WHEN s7.tieteenala_koodi = 'NNN' THEN '-1' ELSE s7.tieteenala_koodi END)
LEFT JOIN dw.d_julkaisufoorumitaso d3 ON d3.julkaisufoorumitaso_koodi = coalesce(s1.JUFO_KOODI,'-')
LEFT JOIN dw.d_kansainvalinen_yhteisjulkaisu d6 ON d6.kansainvalinen_yhteisjulkaisu_koodi = s1.KV_YHTEISJULKAISU_KOODI
LEFT JOIN dw.d_kytkin d12 on d12.kytkin_koodi = nullif(YLIOPISTOLLINEN_SAIRAANHOITOPIIRI_YHTEISJULKAISU_KOODI,'')
LEFT JOIN dw.d_kytkin d13 on d13.kytkin_koodi = nullif(VALTION_SEKTORITUTKIMUSLAITOS_YHTEISJULKAISU_KOODI,'')
LEFT JOIN dw.d_kytkin d14 on d14.kytkin_koodi = nullif(MUU_KOTIMAINEN_TUTKIMUSORGANISAATIO_YHTEISJULKAISU_KOODI,'')
LEFT JOIN dw.d_avoinsaatavuus d17 on d17.avoinsaatavuus_koodi = s1.OPEN_ACCESS_KOODI

GO

USE [ANTERO]