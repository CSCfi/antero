USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_keksintoilmoitukset]    Script Date: 30.3.2022 16:20:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_f_amk_keksintoilmoitukset]
AS
TRUNCATE TABLE dw.f_amk_keksintoilmoitukset;

INSERT INTO dw.f_amk_keksintoilmoitukset (
	[d_amk_id]
	,[d_organisaatioluokitus_id]
	,[d_koulutusala_id]
	,[d_ohjauksenala_id]
	,d_julkaisun_kansainvalisyys_id
	,d_tieteenala_id
	,[vuosi]
	,H21
	,H22
	,H23
	,H24
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s7.id,-1)
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,[Vuosi]
	,H21
	,H22
	,H23
	,H24
	,getdate()
	,'etl: p_lataa_f_amk_keksintoilmoitukset'
	,suser_sname()
FROM [sa].[sa_suorat_amk3b_julkaisut_keksintoilmoitukset] s1
JOIN [dw].[d_amk] s2 ON s1.Ammattikorkeakoulu = s2.amk_tunnus
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(INT, CASE WHEN s1.[I Koulutusala] LIKE 'N%' THEN -1 ELSE s1.[I Koulutusala] END) = s3.koodi
	AND s1.Vuosi < 2016
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.[I Koulutusala] = s4.ohjauksenala_koodi
	AND s1.Vuosi >= 2016
LEFT JOIN [dw].d_julkaisun_kansainvalisyys s5 ON s1.[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] = s5.julkaisun_kansainvalisyys_koodi
LEFT JOIN [dw].d_tieteenala s6 ON s1.[I Tieteenala] = s6.tieteenala_koodi
LEFT JOIN [dw].[d_organisaatioluokitus] s7 ON s1.Ammattikorkeakoulu = s7.organisaatio_koodi


GO

USE [ANTERO]