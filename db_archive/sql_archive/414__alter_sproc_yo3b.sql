ALTER PROCEDURE [dw].[p_lataa_f_yo_julkaisut_f_i]
AS
TRUNCATE TABLE dw.f_yo_julkaisut_f_i;

INSERT INTO dw.f_yo_julkaisut_f_i(
	[d_yliopisto_id]
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
	,COALESCE([Julkaisujen määrä], 0)
	,getdate()
	,'etl: p_lataa_f_yo_julkaisut_f_i'
	,suser_sname()
FROM [sa].[sa_suorat_yo3b_julkaisut] s1
JOIN [dw].[d_yo] s2 ON s1.yliopisto = s2.yo_tunnus
LEFT JOIN [dw].d_koulutusala_1995 s3 ON CONVERT(VARCHAR, s1.[I Koulutusala]) = CONVERT(VARCHAR, CASE WHEN s3.koodi = 'NN' THEN '-1' ELSE s3.koodi END)
	AND s1.Vuosi < 2016
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.[I Koulutusala] = s4.ohjauksenala_koodi
	AND s1.Vuosi >= 2016
JOIN [dw].d_julkaisutyyppi s5 ON s1.Julkaisutyyppi = s5.julkaisutyyppi_koodi 
LEFT JOIN [dw].d_julkaisun_kansainvalisyys s6 ON s1.[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] = s6.julkaisun_kansainvalisyys_koodi
LEFT JOIN [dw].d_tieteenala s7 ON s1.[I Tieteenala] = s7.tieteenala_koodi
;