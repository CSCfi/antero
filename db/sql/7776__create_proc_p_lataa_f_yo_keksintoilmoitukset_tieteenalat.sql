USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_keksintoilmoitukset_tieteenalat]    Script Date: 7.6.2023 12:21:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dw].[p_lataa_f_yo_keksintoilmoitukset_tieteenalat]
AS

SELECT * INTO #temp_julkaisut FROM (
	SELECT
		Vuosi as tilastovuosi,
		d2.id as d_julkaisutyyppi_id,
		d3.id as d_julkaisun_kansainvalisyys_id,
		d4.id as d_organisaatioluokitus_id,
		julkaisunTunnus,
		coalesce(d.id, -1) as d_tieteenala_id
	FROM (
		SELECT  
			s1.Vuosi, 
			'H2' as Julkaisutyyppi,
			s1.[Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)],
			s1.Yliopisto,
			NULLIF(s1.[I Tieteenala], '') as 'I Tieteenala',
			NULLIF(s1.[II Tieteenala], '') as 'II Tieteenala',
			NULLIF(s1.[III Tieteenala], '') as 'III Tieteenala',
			NULLIF(s1.[IV Tieteenala], '') as 'IV Tieteenala',
			NULLIF(s1.[V Tieteenala], '') as 'V Tieteenala',
			NULLIF(s1.[VI Tieteenala], '') as 'VI Tieteenala',
			CONCAT('YO3B_H2_', ROW_NUMBER() OVER(ORDER BY Vuosi ASC)) as julkaisunTunnus
		FROM [ANTERO].[sa].[sa_suorat_yo3b_julkaisut_keksintoilmoitukset] s1
		JOIN master.dbo.spt_values s2 ON s2.type = 'P' AND s2.number < s1.h21
	) s
	UNPIVOT  
	   (koodi FOR tieteenala IN   
		  ([I Tieteenala], [II Tieteenala], [III Tieteenala], [IV Tieteenala], [V Tieteenala], [VI Tieteenala])  
	)AS unpvt
	LEFT JOIN ANTERO.dw.d_tieteenala d on d.tieteenala_koodi = koodi
	INNER JOIN ANTERO.dw.d_julkaisutyyppi d2 ON SUBSTRING(Julkaisutyyppi,1,2) = d2.julkaisutyyppi_koodi 
	LEFT JOIN ANTERO.dw.d_julkaisun_kansainvalisyys d3 ON [Julkaisumaa (julkaistu Suomessa   julkaistu ulkomailla)] = d3.julkaisun_kansainvalisyys_koodi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus d4 ON Yliopisto = d4.organisaatio_koodi
) t

TRUNCATE TABLE dw.[f_yo_keksintoilmoitukset_tieteenalat];

INSERT INTO dw.[f_yo_keksintoilmoitukset_tieteenalat] (
	 [tilastovuosi]
	,[d_organisaatioluokitus_id]
	,d_julkaisutyyppi_id
	,d_julkaisun_kansainvalisyys_id
	,[d_tieteenala_1_id]
	,[d_tieteenala_2_id]
	,julkaisunTunnus
	,[source]
)
SELECT
	t.tilastovuosi,
	t.d_organisaatioluokitus_id,
	t.d_julkaisutyyppi_id,
	t.d_julkaisun_kansainvalisyys_id,
	t.d_tieteenala_id,
	t2.d_tieteenala_id,
	t.julkaisunTunnus,
	'etl: p_lataa_f_yo_keksintoilmoitukset_tieteenalat'
FROM #temp_julkaisut t
LEFT JOIN #temp_julkaisut t2 on t.julkaisunTunnus = t2.julkaisunTunnus

DROP TABLE #temp_julkaisut

GO

USE [ANTERO]