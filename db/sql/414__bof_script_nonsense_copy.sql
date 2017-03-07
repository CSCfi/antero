-- this script is for CSC/SE BoF 7.3.2017
ALTER PROCEDURE dw.p_lataa_f_yo_erillisella_opinto_oikeudella_opiskelevat
AS
TRUNCATE TABLE dw.f_yo_erillisella_opinto_oikeudella_opiskelevat;

INSERT INTO dw.f_yo_erillisella_opinto_oikeudella_opiskelevat (
 vuosi 
,d_yliopisto_id 
,suorittaneiden_lkm 
,opettajakoulutus_suorittaneiden_lkm
,source
,loadtime 
)

SELECT
 s.vuosi
,d1.id as d_yliopisto_id
,s.suorittaneiden_lkm
,s.opettajakoulutus_suorittaneiden_lkm
,'etl: sa_suorat_yo6b_erillisella_opinto_oikeudella_opiskelevat' as source
,getdate() as loadtime
FROM sa.sa_suorat_yo6b_erillisella_opinto_oikeudella_opiskelevat s
JOIN dw.d_yo d1 ON d1.yo_tunnus = s.YLIOPISTO_TUNNUS
WHERE s.vuosi < 2016

UNION ALL

SELECT 
 s.vuosi
,coalesce(d1.id,-1) AS d_yliopisto_id
,s.erillisetOikeudet as suorittaneiden_lkm
,s.erillisetOpettajat as opettajakoulutus_suorittaneiden_lkm
,'THIS WILL FAIL'
,s.source
,s.loadtime
FROM sa.sa_virta_otp_avoimeterillisetyo as s
JOIN dw.d_yo d1 ON d1.yo_tunnus=s.organisaatioKoodi
where cast(s.loadtime as date)='2017-02-01' --cast((select max(loadtime) from sa.sa_virta_otp_avoimeterillisetyo) as date)
;
