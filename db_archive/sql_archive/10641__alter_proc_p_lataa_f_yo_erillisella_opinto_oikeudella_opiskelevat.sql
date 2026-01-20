USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_erillisella_opinto_oikeudella_opiskelevat]    Script Date: 10.3.2025 9.26.41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_yo_erillisella_opinto_oikeudella_opiskelevat]
AS

DECLARE @pvm as date
SET @pvm = cast((select max(loadtime) from sa.sa_virta_otp_avoimeterillisetyo) as date)

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
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.YLIOPISTO_TUNNUS
WHERE s.vuosi < 2016

UNION ALL

SELECT 
 s.vuosi
,coalesce(d1.id,-1) AS d_yliopisto_id
,s.erillisetOikeudet as suorittaneiden_lkm
,s.erillisetOpettajat as opettajakoulutus_suorittaneiden_lkm
,s.source
,s.loadtime
FROM sa.sa_virta_otp_avoimeterillisetyo as s
JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_koodi = s.organisaatioKoodi
where cast(s.loadtime as date) = @pvm
;

GO

USE [ANTERO]