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
JOIN [dw].[d_yo] s2 ON s1.YLIOPISTO_TUNNUS = s2.yo_tunnus
JOIN [dw].[d_sukupuoli] s3 ON s1.SUKUPUOLI = s3.sukupuoli_koodi
;