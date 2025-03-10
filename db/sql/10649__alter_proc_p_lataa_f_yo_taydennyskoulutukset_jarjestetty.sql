USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_yo_taydennyskoulutukset_jarjestetty]    Script Date: 10.3.2025 9.39.14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dw].[p_lataa_f_yo_taydennyskoulutukset_jarjestetty]
AS
TRUNCATE TABLE dw.f_yo_taydennyskoulutukset_jarjestetty;

INSERT INTO dw.f_yo_taydennyskoulutukset_jarjestetty (
	[d_yliopisto_id] 
	,[vuosi] 
	,jarjestettyjen_koulutusten_lkm 
	,[loadtime] 
	,[source]
	,[username] 
	)
SELECT s2.id
	,s1.vuosi
	,s1.JARJESTETTYJEN_KOULUTUSTEN_LKM
	,getdate()
	,'etl: p_lataa_f_yo_taydennyskoulutukset'
	,suser_sname()
FROM [sa].[sa_suorat_yo5_taydennyskoulutukset_jarjestetyt] s1
JOIN [dw].[d_organisaatioluokitus] s2 ON s1.YLIOPISTO_TUNNUS = s2.organisaatio_koodi
;
GO

USE [ANTERO]