USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amk_julkaisut_f_i]    Script Date: 24.11.2022 11:13:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE  [dw].[p_lataa_f_amk_julkaisut_f_i]
AS

SELECT
	Vuosi,
	Ammattikorkeakoulu,
	[Julkaisujen määrä], 
	[Julkaisutyyppi],
	[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)], 
	[I Koulutusala],
	[II Koulutusala],
	[III Koulutusala],
	[IV Koulutusala],
	[V Koulutusala],
	[VI Koulutusala],
	[I Tieteenala],
	rivi,
	COUNT(DISTINCT d.tieteenala_koodi) as tieteenala_lkm,
	COUNT(DISTINCT d.paatieteenala_koodi) as paatieteenala_lkm 
INTO #temp_julkaisut FROM (
	SELECT
		Vuosi,
		Ammattikorkeakoulu,
		[Julkaisujen määrä], 
		[Julkaisutyyppi],
		[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)],
		[I Tieteenala] as tieteenala1,
		[II Tieteenala] as tieteenala2,
		[III Tieteenala] as tieteenala3,
		[IV Tieteenala] as tieteenala4,
		[V Tieteenala] as tieteenala5,
		[VI Tieteenala] as tieteenala6,
		[I Tieteenala],
		CAST(NULLIF([I Koulutusala], '') as nvarchar) as 'I Koulutusala' ,  
		CAST(NULLIF([II Koulutusala], '') as nvarchar) as 'II Koulutusala' ,   
		CAST(NULLIF([III Koulutusala], '') as nvarchar) as 'III Koulutusala' ,  
		CAST(NULLIF([IV Koulutusala], '') as nvarchar) as 'IV Koulutusala' , 
		CAST(NULLIF([V Koulutusala], '')  as nvarchar) as 'V Koulutusala',
		CAST(NULLIF([VI Koulutusala], '')  as nvarchar) as 'VI Koulutusala',
		rivi = ROW_NUMBER() OVER(ORDER BY Vuosi ASC)
	FROM [ANTERO].[sa].[sa_suorat_amk3b_julkaisut]
) t
UNPIVOT  
   (koodi FOR tieteenala IN   
      (tieteenala1, tieteenala2, tieteenala3, tieteenala4, tieteenala5, tieteenala6)  
)AS unpvt
LEFT JOIN ANTERO.dw.d_tieteenala d on d.tieteenala_koodi = NULLIF(koodi, '-1')
GROUP BY Vuosi,
	Ammattikorkeakoulu, [Julkaisujen määrä], [Julkaisutyyppi], [Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)],  [I Koulutusala], [II Koulutusala],
	[III Koulutusala], [IV Koulutusala], [V Koulutusala], [VI Koulutusala], [I Tieteenala], rivi


SELECT * INTO #temp_julkaisut2 FROM (
	SELECT 
		Vuosi, 
		Ammattikorkeakoulu, 
		Julkaisutyyppi, 
		[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)], 
		[Julkaisujen määrä],
		[I Tieteenala], 
		NULLIF(tieteenala_lkm,0) as tieteenala_lkm,
		NULLIF(paatieteenala_lkm,0) as paatieteenala_lkm,
		[rivi], 
		[koodi]  	
	FROM #temp_julkaisut t
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
		  )
	) unpiv
) t2

TRUNCATE TABLE dw.[f_amk_julkaisut_f_i];

INSERT INTO dw.[f_amk_julkaisut_f_i] (
	[d_amk_id]
	,[d_organisaatioluokitus_id]
	,[d_koulutusala_id]
	,[d_ohjauksenala_id]
	,d_julkaisutyyppi_id
	,d_julkaisun_kansainvalisyys_id
	,d_tieteenala_id
	,tieteenala_lkm
	,paatieteenala_lkm
	,[vuosi]
	,[julkaisujen_maara]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s8.id,-1)
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,COALESCE(s5.id,-1)
	,COALESCE(s6.id,-1)
	,COALESCE(s7.id,-1)
	,s1.tieteenala_lkm
	,s1.paatieteenala_lkm
	,[Vuosi]
	,cast([Julkaisujen määrä] as float) / cast(ositus.lkm as float)
	,getdate()
	,'etl: p_lataa_f_amk_kotimaiset_julkaisut'
	,suser_sname()
FROM #temp_julkaisut2 s1
JOIN [dw].[d_amk] s2 ON s1.Ammattikorkeakoulu = s2.amk_tunnus
LEFT JOIN [dw].d_koulutusala_2002 s3 ON CONVERT(INT, CASE WHEN s1.[koodi] LIKE 'N%' THEN -1 ELSE s1.[koodi] END) = s3.koodi
	AND s1.Vuosi < 2016
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.[koodi] = s4.ohjauksenala_koodi
	AND s1.Vuosi >= 2016
JOIN [dw].d_julkaisutyyppi s5 ON SUBSTRING(s1.Julkaisutyyppi,1,2) = s5.julkaisutyyppi_koodi 
LEFT JOIN [dw].d_julkaisun_kansainvalisyys s6 ON s1.[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] = s6.julkaisun_kansainvalisyys_koodi
LEFT JOIN [dw].d_tieteenala s7 ON s1.[I Tieteenala] = s7.tieteenala_koodi
LEFT JOIN [dw].d_organisaatioluokitus s8 on s1.Ammattikorkeakoulu = s8.organisaatio_koodi
OUTER APPLY (
	SELECT * FROM (
		SELECT 
			rivi, 
			count(*) as lkm
		FROM #temp_julkaisut2
		GROUP BY rivi) o
	WHERE o.rivi = s1.rivi
) ositus

DROP TABLE #temp_julkaisut
DROP TABLE #temp_julkaisut2

GO

USE [ANTERO]

