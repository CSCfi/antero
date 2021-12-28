USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]    Script Date: 28.12.2021 11:21:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dbo].[p_lataa_f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] AS

TRUNCATE TABLE [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]

DECLARE @periodStart INT, @periodEnd INT, @tilv INT
SET @periodStart = 0
SET @tilv = (SELECT MAX(tilv) FROM [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat])
SET @periodEnd = (SELECT MAX(suorv) FROM [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]) - (SELECT MIN(alvv) FROM [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat])

;WITH PeriodSeq ([tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      --,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
	  ,period) AS
(
	SELECT DISTINCT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,-1 AS [suorv]
      --,-1 AS [suoropmala]
	  ,-1 AS [suoriscfibroad2013]
      ,6 AS [suortutk]
	  ,[lkm]
	  ,@periodStart AS [period]
	FROM
		(SELECT [tilv]
		  ,[lahde]
		  ,[alvv]
		  ,[jarj]
		  --,[opmala]
		  ,[iscfibroad2013]
		  ,[kmaak]
		  ,[suorv]
		  --,[suoropmala]
		  ,[suoriscfibroad2013]
		  ,[suortutk]
		  ,SUM(lkm) OVER (PARTITION BY alvv, jarj, /*opmala,*/ iscfibroad2013, kmaak ORDER BY alvv, jarj, /*opmala,*/ iscfibroad2013, kmaak) AS lkm
		FROM [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
		WHERE tilv = @tilv) f
	WHERE suorv = (
		SELECT MIN(suorv) 
		FROM [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat] fb 
		WHERE f.alvv = fb.alvv AND f.jarj = fb.jarj AND (/*f.opmala = fb.opmala OR*/ f.iscfibroad2013 = fb.iscfibroad2013) AND f.kmaak = fb.kmaak AND tilv = @tilv
	)
	UNION ALL
	SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv] 
      --,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
	  ,period + 1 AS [period]
	FROM PeriodSeq
	WHERE period < @periodEnd AND alvv + period < tilv
)

, PeriodSeq2 ([tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      --,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
	  ,period) AS
(
	SELECT DISTINCT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      --,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
	  ,[lkm]
	  ,@periodStart AS [period]
	FROM [dbo].[sa_3_8_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
	WHERE tilv = @tilv AND suorv <> -1
	UNION ALL
	SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv] 
      --,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,[lkm]
	  ,period + 1 AS [period]
	FROM PeriodSeq2
	WHERE period < @periodEnd AND alvv + period < tilv
)

INSERT INTO [VipunenTK].[dbo].[f_tutkinnon_suorittaneiden_osuus_aloittaneista_erityisopiskelijat]
           ([tilv]
           ,[lahde_id]
           ,[alvv]
           ,[oppilaitoksen_taustatiedot_id]
           --,[koulutusala_id]
           ,[alueluokitus_id]
           ,[suorv]
           --,[suoritettu_koulutusala_id]
           ,[suoritettu_tutkinto_id]
		   ,[tarkastelujakso_id]
		   ,[koulutusala_taso1_id]
		   ,[suoritettu_koulutusala_taso1_id]
           ,[lkm])
SELECT [tilv]
      ,COALESCE(d1.id, -2) AS [lahde_id]
      ,[alvv]
      ,COALESCE(d2.id, -2) AS [oppilaitoksen_taustatiedot_id]
      --,COALESCE(d3.id, -2) AS [koulutusala_id]
      ,COALESCE(d4.id, -2) AS [alueluokitus_id]
      ,[suorv]
      --,COALESCE(d5.id, -2) AS [suoritettu_koulutusala_id]
      ,COALESCE(d6.id, -2) AS [suoritettu_tutkinto_id]
	  ,COALESCE(d7.id, -2) AS [tarkastelujakso_id]
	  ,COALESCE(d8.id, -2) AS [koulutusala_taso1_id]
	  ,COALESCE(d9.id, -2) AS [suoritettu_koulutusala_taso1_id]
      ,[lkm]
  FROM (SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,[opmala]
	  ,[iscfibroad2013]
      ,[kmaak]
      ,[suorv]
      --,[suoropmala]
	  ,[suoriscfibroad2013]
      ,[suortutk]
      ,CASE WHEN suorv = -1 
		THEN lkm - COALESCE((SELECT SUM(lkm)
					FROM PeriodSeq2 b
					WHERE a.alvv = b.alvv AND a.jarj = b.jarj AND (/*a.opmala = b.opmala OR*/ a.iscfibroad2013 = b.iscfibroad2013) AND a.kmaak = b.kmaak AND b.suorv <> -1 AND b.period = a.period AND b.alvv + b.period >= b.suorv), 0)
		ELSE lkm END AS [lkm]
	  ,[period]
FROM
(SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,CAST([opmala] AS nvarchar(2)) AS opmala
	  ,CAST([iscfibroad2013] AS nvarchar(2)) AS iscfibroad2013
      ,[kmaak]
      ,[suorv]
      --,CAST([suoropmala] AS nvarchar(2)) AS suoropmala
	  ,CAST([suoriscfibroad2013] AS nvarchar(2)) AS suoriscfibroad2013
      ,[suortutk]
      ,[lkm]
	  ,[period]
FROM PeriodSeq
UNION ALL 
SELECT [tilv]
      ,[lahde]
      ,[alvv]
      ,[jarj]
      --,CAST([opmala] AS nvarchar(2)) AS opmala
	  ,CAST([iscfibroad2013] AS nvarchar(2)) AS iscfibroad2013
      ,[kmaak]
      ,[suorv]
      --,CAST([suoropmala] AS nvarchar(2)) AS suoropmala
	  ,CAST([suoriscfibroad2013] AS nvarchar(2)) AS suoriscfibroad2013
      ,[suortutk]
      ,[lkm]
	  ,[period]
FROM PeriodSeq2
WHERE alvv + period >= suorv) a) f
  LEFT JOIN [VipunenTK].[dbo].[d_lahde] d1 ON d1.lahde_koodi = f.lahde
  LEFT JOIN [VipunenTK].[dbo].[d_oppilaitoksen_taustatiedot] d2 ON d2.oppilaitos_avain = f.jarj
  --LEFT JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutusala] d3 ON d3.koulutusala_koodi = f.opmala
  LEFT JOIN [VipunenTK].[dbo].[d_alueluokitus] d4 ON d4.[alueluokitus_avain] = 'MAAK' + f.[kmaak]
  --LEFT JOIN [VipunenTK].[dbo].[d_opetushallinnon_koulutusala] d5 ON d5.koulutusala_koodi = f.suoropmala
  LEFT JOIN [VipunenTK].[dbo].[d_suoritettu_tutkinto] d6 ON d6.suoritettu_tutkinto_koodi = f.suortutk
  LEFT JOIN [VipunenTK].[dbo].[d_tarkastelujakso] d7 ON CONVERT(decimal(18,2), REPLACE(d7.tarkastelujakso_koodi, ',', '.')) = f.period
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d8 ON d8.koulutusluokitus_avain='ISCFIBROAD'+f.iscfibroad2013
  LEFT JOIN [VipunenTK].[dbo].[d_koulutusluokitus] d9 ON d9.koulutusluokitus_avain='ISCFIBROAD'+f.suoriscfibroad2013

