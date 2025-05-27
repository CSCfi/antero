USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_avoimen_yliopiston_kautta_opiskelevat]    Script Date: 10.3.2025 9.24.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_avoimen_yliopiston_kautta_opiskelevat]
AS
TRUNCATE TABLE dw.f_yo_avoimen_yliopiston_kautta_opiskelevat;

INSERT INTO dw.f_yo_avoimen_yliopiston_kautta_opiskelevat (
 vuosi
,d_yliopisto_id
,d_sukupuoli_id
,d_asianomainen_id --d_kytkin
,suorittaneiden_lkm 
,source
,loadtime
)

SELECT
 s.vuosi
,d1.id as d_yliopisto_id
,d2.id as d_sukupuoli_id
,-1 as d_asianomainen_id
,s.OPISKELIJA_NETTO_LKM as suorittaneiden_lkm
,'etl: sa_suorat_yo6b_avoimen_yliopiston_kautta_opiskelevat' as source
,getdate() as loadtime
FROM sa.sa_suorat_yo6b_avoimen_yliopiston_kautta_opiskelevat s
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.YLIOPISTO_TUNNUS
JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = s.SUKUPUOLIKOODI

UNION

SELECT 
 s.vuosi
,coalesce(d1.id,-1) AS d_yliopisto_id
,coalesce(d2.id,-1) AS d_sukupuoli_id
,coalesce(d3.id,-1) AS d_asianomainen_id
,s.avoNaiset as suorittaneiden_lkm
,s.source
,s.loadtime
FROM sa.sa_virta_otp_avoimeterillisetyo as s
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.organisaatioKoodi
JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi='2'
JOIN dw.d_kytkin d3 ON d3.kytkin_koodi='0'
where cast(s.loadtime as date)=cast((select max(loadtime) from sa.sa_virta_otp_avoimeterillisetyo) as date)
group by vuosi,s.source,s.loadtime,d1.id,d2.id,d3.id,avoNaiset

UNION

SELECT 
 s.vuosi
,coalesce(d1.id,-1) AS d_yliopisto_id
,coalesce(d2.id,-1) AS d_sukupuoli_id
,coalesce(d3.id,-1) AS d_asianomainen_id
,s.avoTutkintoNaiset as suorittaneiden_lkm
,s.source
,s.loadtime
FROM sa.sa_virta_otp_avoimeterillisetyo as s
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.organisaatioKoodi
JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi='2'
JOIN dw.d_kytkin d3 ON d3.kytkin_koodi='1'
where cast(s.loadtime as date)=cast((select max(loadtime) from sa.sa_virta_otp_avoimeterillisetyo) as date)
group by vuosi,s.source,s.loadtime,d1.id,d2.id,d3.id,avoTutkintoNaiset

UNION

SELECT 
 s.vuosi
,coalesce(d1.id,-1) AS d_yliopisto_id
,coalesce(d2.id,-1) AS d_sukupuoli_id
,coalesce(d3.id,-1) AS d_asianomainen_id
,s.avoMiehet as suorittaneiden_lkm
,s.source
,s.loadtime
FROM sa.sa_virta_otp_avoimeterillisetyo as s
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.organisaatioKoodi
JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi='1'
JOIN dw.d_kytkin d3 ON d3.kytkin_koodi='0'
where cast(s.loadtime as date)=cast((select max(loadtime) from sa.sa_virta_otp_avoimeterillisetyo) as date)
group by vuosi,s.source,s.loadtime,d1.id,d2.id,d3.id,avoMiehet

UNION

SELECT 
 s.vuosi
,coalesce(d1.id,-1) AS d_yliopisto_id
,coalesce(d2.id,-1) AS d_sukupuoli_id
,coalesce(d3.id,-1) AS d_asianomainen_id
,s.avoTutkintoMiehet as suorittaneiden_lkm
,s.source
,s.loadtime
FROM sa.sa_virta_otp_avoimeterillisetyo as s
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.organisaatioKoodi
JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi='1'
JOIN dw.d_kytkin d3 ON d3.kytkin_koodi='1'
where cast(s.loadtime as date)=cast((select max(loadtime) from sa.sa_virta_otp_avoimeterillisetyo) as date)
group by vuosi,s.source,s.loadtime,d1.id,d2.id,d3.id,avoTutkintoMiehet
;

GO

USE [ANTERO]