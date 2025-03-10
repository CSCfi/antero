USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_harjoittelukoulujen_opintopisteet]    Script Date: 10.3.2025 9.27.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_harjoittelukoulujen_opintopisteet]
AS
TRUNCATE TABLE dw.f_yo_harjoittelukoulujen_opintopisteet;

INSERT INTO dw.f_yo_harjoittelukoulujen_opintopisteet (
	[d_yliopisto_id]
	,[d_koulutusala95_id]
	,d_ohjauksenala_id
	,[vuosi]
	,[suoritetut_opintopisteet_luokanopettajaharjoittelu]
	,[suoritetut_opintopisteet_aineenopettajaharjoittelu]
	,[suoritetut_opintopisteet_erityisopettajat]
	,[suoritetut_opintopisteet_opinto_ohjaajat]
	,[suoritetut_opintopisteet_lastentarhanopettajat]
	,[suoritetut_opintopisteet_aikuiskoulutus_harjoittelu]
	,[suoritetut_opintopisteet_muut_opettajankoulutusryhmat]
	,[loadtime]
	,[source]
	,[username]
	)
SELECT s2.id
	,COALESCE(s3.id,-1)
	,COALESCE(s4.id,-1)
	,[Vuosi]
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, luokanopettajaharjoittelu],0)
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, aineenopettajaharjoittelu],0)
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, erityisopettajat],0)
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, opinto-ohjaajat],0)
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, lastentarhanopettajat],0)
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, aikuiskoulutukseen painottunut harjoittelu],0)
	,COALESCE([Harjoittelukoulussa suoritetut opintopisteet, muut opettajankoulutusryhmät],0)
	,getdate()
	,'etl: p_lataa_f_yo_harjoittelukoulujen_opintopisteet'
	,suser_sname()
FROM [sa].[sa_suorat_yo2_opintopisteet] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.yliopisto = s2.organisaatio_koodi
LEFT JOIN [dw].[d_koulutusala_1995] s3 ON s1.[Koulutusala 1995] = s3.koodi
LEFT JOIN [dw].d_ohjauksenala s4 ON s1.ohjauksenala_koodi = s4.ohjauksenala_koodi
;
GO

USE [ANTERO]