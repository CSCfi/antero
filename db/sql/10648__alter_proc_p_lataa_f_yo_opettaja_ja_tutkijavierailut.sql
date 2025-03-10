USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_opettaja_ja_tutkijavierailut]    Script Date: 10.3.2025 9.37.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_opettaja_ja_tutkijavierailut]
AS
TRUNCATE TABLE dw.f_yo_opettaja_ja_tutkijavierailut;

INSERT INTO dw.f_yo_opettaja_ja_tutkijavierailut (
	[d_yliopisto_id]
	,[d_ohjauksen_ala_id]
	,[d_maa_id]
	,[d_yo_tutkijanuravaihe_id]
	,[d_vierailutyyppi_id]
	,[d_koulutusala_id]
	,[vuosi]
	,vierailut_ulkomaille_lkm
	,vierailut_ulkomailta_lkm
	,[loadtime]
	,[source]
	,[username]
	)
SELECT COALESCE(s2.id,-1)
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,COALESCE(s7.id,-1)
	,s1.[Vuosi]
	,COALESCE(s1.[VIERAILUT_ULKOMAILLE_LKM],0)
	,COALESCE(s1.[VIERAILUT_ULKOMAILTA_LKM],0)
	,getdate()
	,'etl: p_lataa_f_yo_opettaja_ja_tutkijavierailut'
	,suser_sname()
FROM [sa].[sa_suorat_yo7_opettaja_ja_tutkijavierailut] s1
LEFT JOIN [dw].[d_organisaatioluokitus] s2 ON s1.yliopisto = s2.organisaatio_koodi
LEFT JOIN [dw].[d_ohjauksenala] s3 ON s1.ohjauksenala_koodi = s3.ohjauksenala_koodi -- Ohjauksen ala kaventaa settiä, vierailujen lkm pitää populoida
LEFT JOIN [dw].[d_maatjavaltiot2] s4 ON s1.[MAA_KOODI] = s4.maatjavaltiot2_koodi
LEFT JOIN [dw].[d_yo_tutkijanuravaihe] s5 ON s1.[Tutkijanuravaihe] = s5.koodi -- setti supistuu 7000 -> 5000
LEFT JOIN [dw].[d_suorat_liikkuvuudentyyppi] s6 ON s1.[Vierailutyyppi] = s6.koodi -- korjattava
LEFT JOIN dw.d_koulutusala_1995 s7 ON s1.Koulutusala = s7.koodi
WHERE Vuosi IS NOT NULL
;
GO

USE [ANTERO]