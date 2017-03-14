ALTER PROCEDURE [dw].[p_lataa_f_yo_erillisella_opinto_oikeudella_opiskelevat]
AS
TRUNCATE TABLE dw.f_yo_erillisella_opinto_oikeudella_opiskelevat;

INSERT INTO dw.f_yo_erillisella_opinto_oikeudella_opiskelevat (
	[d_yliopisto_id] 
	,[vuosi] 
	,suorittaneiden_lkm 
	,opettajakoulutus_suorittaneiden_lkm
	,[loadtime] 
	,[source]
	,[username] 
	)
SELECT s2.id
	,s1.vuosi
	,s1.suorittaneiden_lkm
	,s1.opettajakoulutus_suorittaneiden_lkm
	,getdate()
	,'etl: p_lataa_f_yo_taydennyskoulutukset'
	,suser_sname()
FROM [sa].[sa_suorat_yo6b_erillisella_opinto_oikeudella_opiskelevat] s1
JOIN [dw].[d_yo] s2 ON s1.YLIOPISTO_TUNNUS = s2.yo_tunnus
;