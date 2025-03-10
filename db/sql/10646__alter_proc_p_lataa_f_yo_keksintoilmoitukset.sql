USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_keksintoilmoitukset]    Script Date: 10.3.2025 9.31.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_yo_keksintoilmoitukset]
AS


SELECT 
	Vuosi,
	yliopisto,
	h21,
	h22,
	h23,
	h24,
	[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)],
	[i tieteenala],
	[I Koulutusala],
	[II Koulutusala],
	[III Koulutusala],
	[IV Koulutusala],
	[V Koulutusala],
	[VI Koulutusala],
	[VII Koulutusala],
	[VIII Koulutusala],
	[IX Koulutusala],
	[X Koulutusala],
	[XI Koulutusala],
	[XII Koulutusala],
	rivi,
	COUNT(DISTINCT d.tieteenala_koodi) as tieteenala_lkm,
	COUNT(DISTINCT d.paatieteenala_koodi) as paatieteenala_lkm 
INTO #temp_keksinto FROM (
	SELECT
		Vuosi,
		yliopisto,
		h21,
		h22,
		h23,
		h24,
		[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)],
		[i tieteenala] as tieteenala1,
		[ii tieteenala] as tieteenala2,
		[iii tieteenala] as tieteenala3,
		[iv tieteenala] as tieteenala4,
		[v tieteenala] as tieteenala5,
		[vi tieteenala] as tieteenala6,
		[i tieteenala],
		CAST(NULLIF([i koulutusala], '') as nvarchar) as 'I Koulutusala' ,  
		CAST(NULLIF([ii koulutusala], '') as nvarchar) as 'II Koulutusala' ,   
		CAST(NULLIF([iii koulutusala], '') as nvarchar) as 'III Koulutusala' ,  
		CAST(NULLIF([iv koulutusala], '') as nvarchar) as 'IV Koulutusala' , 
		CAST(NULLIF([v koulutusala], '')  as nvarchar) as 'V Koulutusala',
		CAST(NULLIF([vi koulutusala], '')  as nvarchar) as 'VI Koulutusala',
		CAST(NULLIF([vi koulutusala], '') as nvarchar) as 'VII Koulutusala' ,  
		CAST(NULLIF([viii koulutusala], '') as nvarchar) as 'VIII Koulutusala' ,   
		CAST(NULLIF([ix koulutusala], '') as nvarchar) as 'IX Koulutusala' ,  
		CAST(NULLIF([x koulutusala], '') as nvarchar) as 'X Koulutusala' , 
		CAST(NULLIF([xi koulutusala], '')  as nvarchar) as 'XI Koulutusala',
		CAST(NULLIF([xii koulutusala], '')  as nvarchar) as 'XII Koulutusala',
		rivi = ROW_NUMBER() OVER(ORDER BY Vuosi ASC)
	FROM [ANTERO].[sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset]
) t
UNPIVOT  
   (koodi FOR tieteenala IN   
      (tieteenala1, tieteenala2, tieteenala3, tieteenala4, tieteenala5, tieteenala6)  
)AS unpvt
LEFT JOIN ANTERO.dw.d_tieteenala d on d.tieteenala_koodi = NULLIF(koodi, '-1')
GROUP BY Vuosi,
	Vuosi, yliopisto, h21, h22, h23, h24, [Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)], [i tieteenala],
	[I Koulutusala],[II Koulutusala], [III Koulutusala], [IV Koulutusala], [V Koulutusala], [VI Koulutusala], 
	[VII Koulutusala], [VIII Koulutusala], [IX Koulutusala], [X Koulutusala], [XI Koulutusala], [XII Koulutusala], rivi

SELECT * INTO #temp_keksinto2 FROM (
	SELECT 
		Vuosi, 
		yliopisto, 
		[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)], 
		h21,
		h22,
		h23,
		h24,
		NULLIF(tieteenala_lkm,0) as tieteenala_lkm,
		NULLIF(paatieteenala_lkm,0)  as paatieteenala_lkm,
		[I Tieteenala], 
		[rivi], 
		[koodi]  	
	FROM #temp_keksinto t
	UNPIVOT
	(
	  koodi
	  for ohjauksen_ala in (
		   [I Koulutusala]
		  ,[II Koulutusala]
		  ,[III Koulutusala]
		  ,[IV Koulutusala]
		  ,[V Koulutusala]
		  ,[VI Koulutusala]
		  ,[VII Koulutusala]
		  ,[VIII Koulutusala]
		  ,[IX Koulutusala]
		  ,[X Koulutusala]
		  ,[XI Koulutusala]
		  ,[XII Koulutusala]
		  )
	) unpiv
) t2

TRUNCATE TABLE dw.f_yo_keksintoilmoitukset;

INSERT INTO dw.f_yo_keksintoilmoitukset(
	[d_yliopisto_id]
	,[d_koulutusala_id]
	,[d_ohjauksenala_id]
	,d_julkaisun_kansainvalisyys_id
	,d_tieteenala_id
	,[vuosi]
	,h21
	,h22
	,h23
	,h24
	,tieteenala_lkm
	,paatieteenala_lkm
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,[Vuosi]
	,coalesce(cast([h21] as float) / cast(ositus.lkm as float), 0) as h21
	,coalesce(cast([h22] as float) / cast(ositus.lkm as float), 0) as h22
	,coalesce(cast([h23] as float) / cast(ositus.lkm as float), 0) as h23
	,coalesce(cast([h24] as float) / cast(ositus.lkm as float), 0) as h24
	,s1.tieteenala_lkm
	,s1.paatieteenala_lkm
	,getdate()
	,'etl: p_lataa_f_yo_keksintoilmoitukset'
	,suser_sname()
FROM #temp_keksinto2 s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.yliopisto = s2.organisaatio_koodi
LEFT JOIN [dw].d_koulutusala_1995 s3 ON CONVERT(VARCHAR, s3.[koodi]) = CONVERT(VARCHAR, CASE WHEN s1.koodi = 'NN' THEN '-1' ELSE s1.koodi END)
	AND s1.Vuosi < 2016
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.[koodi] = s4.ohjauksenala_koodi
	AND s1.Vuosi >= 2016
LEFT JOIN [dw].d_julkaisun_kansainvalisyys s5 ON s1.[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] = s5.julkaisun_kansainvalisyys_koodi
LEFT JOIN [dw].d_tieteenala s6 ON s1.[I Tieteenala] = s6.tieteenala_koodi
OUTER APPLY (
	SELECT * FROM (
		SELECT 
			rivi, 
			count(*) as lkm
		FROM #temp_keksinto2
		GROUP BY rivi) o
	WHERE o.rivi = s1.rivi
) ositus

GO

USE [ANTERO]