USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_taydennyskoulutukset_osallistumiset]    Script Date: 10.3.2025 9.40.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_taydennyskoulutukset_osallistumiset]
AS
TRUNCATE TABLE dw.f_yo_taydennyskoulutukset_osallistumiset;

INSERT INTO dw.f_yo_taydennyskoulutukset_osallistumiset (
	[d_yliopisto_id] 
	,sukupuoli_id
	,[vuosi] 
	,osallistujien_lkm 
	,[loadtime] 
	,[source]
	,[username] 
	)
SELECT s2.id
	,s3.id
	,s1.vuosi
	,s1.OSALLISTUJIEN_LKM
	,getdate()
	,'etl: p_lataa_f_yo_taydennyskoulutukset'
	,suser_sname()
FROM [sa].[sa_suorat_yo5_taydennyskoulutukset_osallistumiset] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.YLIOPISTO_TUNNUS = s2.organisaatio_koodi
JOIN [dw].[d_sukupuoli] s3 ON s1.SUKUPUOLI = s3.sukupuoli_koodi
;
GO

USE [ANTERO]