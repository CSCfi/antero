USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_harjoittelukoulut]    Script Date: 10.3.2025 9.28.30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_harjoittelukoulut]
AS
TRUNCATE TABLE dw.f_yo_harjoittelukoulut;

INSERT INTO dw.f_yo_harjoittelukoulut (
	[d_yliopisto_id]
	,[vuosi]
	,[harjoittelukoulun_oppilaat_yhteensa]
	,[harjoittelukoulun_oppilaat_esiopetus]
	,[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_1_6]
	,[harjoittelukoulun_oppilaat_perusopetuksen_vuodet_7_9]
	,[harjoittelukoulun_oppilaat_lukio]
	,[harjoittelukoulun_kokonaistuntimaara]
	,[harjoittelukoulun_opettajankoulutustehtavien_kokonaisviikkotunnit]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,[Vuosi]
	,COALESCE([Harjoittelukoulun oppilaat, yhteensä], 0)
	,COALESCE([Harjoittelukoulun oppilaat, esiopetus], 0)
	,COALESCE([Harjoittelukoulun oppilaat, perusopetuksen vuodet 1-6], 0)
	,COALESCE([Harjoittelukoulun oppilaat, perusopetuksen vuodet 7-9], 0)
	,COALESCE([Harjoittelukoulun oppilaat, lukio], 0)
	,COALESCE([Harjoittelukoulun kokonaistuntimäärä], 0)
	,COALESCE([Harjoittelukoulun opettajankoulutustehtävien kokonaisviikkotunnit], 0)
	,getdate()
	,'etl: p_lataa_f_yo_harjoittelukoulut'
	,suser_sname()
FROM [sa].[sa_suorat_yo9_harjoittelukoulut] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.yliopisto = s2.organisaatio_koodi
;
GO

USE [ANTERO]