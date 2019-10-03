ALTER PROCEDURE [dw].[p_lataa_f_amk_julkaisut_f_i]
AS
TRUNCATE TABLE dw.[f_amk_julkaisut_f_i];

INSERT INTO dw.[f_amk_julkaisut_f_i] (
	[d_amk_id]
	,[d_koulutusala_id]
	,[d_ohjauksenala_id]
	,d_julkaisutyyppi_id
	,d_julkaisun_kansainvalisyys_id
	,d_tieteenala_id
	,[vuosi]
	,[julkaisujen_maara]
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
	,[Vuosi]
	,[Julkaisujen määrä]
	,getdate()
	,'etl: p_lataa_f_amk_kotimaiset_julkaisut'
	,suser_sname()
FROM [sa].[sa_suorat_amk3b_julkaisut] s1
JOIN [dw].[d_amk] s2 ON s1.Ammattikorkeakoulu = s2.amk_tunnus
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(INT, CASE WHEN s1.[I Koulutusala] LIKE 'N%' THEN -1 ELSE s1.[I Koulutusala] END) = s3.koodi
	AND s1.Vuosi < 2016
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.[I Koulutusala] = s4.ohjauksenala_koodi
	AND s1.Vuosi >= 2016
JOIN [dw].d_julkaisutyyppi s5 ON SUBSTRING(s1.Julkaisutyyppi,1,2) = s5.julkaisutyyppi_koodi 
LEFT JOIN [dw].d_julkaisun_kansainvalisyys s6 ON s1.[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] = s6.julkaisun_kansainvalisyys_koodi
LEFT JOIN [dw].d_tieteenala s7 ON s1.[I Tieteenala] = s7.tieteenala_koodi