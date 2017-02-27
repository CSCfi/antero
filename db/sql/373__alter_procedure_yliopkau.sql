ALTER PROCEDURE [dw].[p_lataa_f_yo_avoimen_yliopiston_kautta_opiskelevat]
AS
TRUNCATE TABLE dw.f_yo_avoimen_yliopiston_kautta_opiskelevat;

INSERT INTO dw.f_yo_avoimen_yliopiston_kautta_opiskelevat (
	[d_yliopisto_id] 
	,[d_sukupuoli_id]
	,[vuosi] 
	,asianomainen
	,suorittaneiden_lkm 
	,[loadtime] 
	,[source]
	,[username] 
	)
SELECT s2.id
	,s3.id
	,s1.vuosi
	,case when s1.[ASIANOMAISUUS] like '%ei%' then 0 else 1 end
	,s1.[OPISKELIJA_NETTO_LKM]
	,getdate()
	,'etl: p_lataa_f_yo_taydennyskoulutukset'
	,suser_sname()
FROM [sa].[sa_suorat_yo6b_avoimen_yliopiston_kautta_opiskelevat] s1
JOIN [dw].[d_yo] s2 ON s1.YLIOPISTO_TUNNUS = s2.yo_tunnus
JOIN [dw].[d_sukupuoli] s3 ON s1.SUKUPUOLIKOODI = s3.sukupuoli_koodi
;