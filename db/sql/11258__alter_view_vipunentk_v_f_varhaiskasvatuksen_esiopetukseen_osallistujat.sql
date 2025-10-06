USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_varhaiskasvatuksen_esiopetukseen_osallistujat]    Script Date: 6.10.2025 11.00.24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE OR ALTER VIEW [dbo].[v_f_varhaiskasvatuksen_esiopetukseen_osallistujat] AS

SELECT [tilv] = CAST(tilv as nvarchar(4))
	  ,[tilv_date] = Cast(tilv+'0101' as date)
      ,[jarj] = CAST(jarj as nvarchar(10))
	  ,[oppilaitoksen_taustatiedot_id]
      ,[alueluokitus_id]
	  ,[opetuskieli_id]
	  ,[oppilaitoksen_taustatiedot_historia_id]
      ,[alueluokitus_historia_id]
      ,[sp] = CAST(sp as nvarchar(2))
      ,[lkm]=  Cast([lkm] as int)
  FROM (

  --  < 2016: sukupuoli vain tuntematon

  SELECT [tilv]
      ,[jarj]
	  ,[oppilaitoksen_taustatiedot_id]
      ,[alueluokitus_id]
	  ,[opetuskieli_id]
	  ,[oppilaitoksen_taustatiedot_historia_id]
      ,[alueluokitus_historia_id]
	  ,sp = -1
      ,sum(cast([popy] as int)) as lkm
  FROM [f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]
  WHERE CAST([tilv] as int) < 2016 and cast([popy] as int) > 0
  GROUP BY [tilv], [jarj], [oppilaitoksen_taustatiedot_id], [alueluokitus_id], [opetuskieli_id], [oppilaitoksen_taustatiedot_historia_id], [alueluokitus_historia_id]

  UNION ALL

  -- > 2015: tyttöjen osuus

  SELECT [tilv]
      ,[jarj]
	  ,[oppilaitoksen_taustatiedot_id]
      ,[alueluokitus_id]
	  ,[opetuskieli_id]
	  ,[oppilaitoksen_taustatiedot_historia_id]
      ,[alueluokitus_historia_id]
	  ,sp = 2
      ,sum(cast([popyn] as int)) as lkm
  FROM [f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]
  WHERE cast([tilv] as int) > 2015 and CAST([popyn] as int) > 0
  GROUP BY [tilv], [jarj], [oppilaitoksen_taustatiedot_id], [alueluokitus_id], [opetuskieli_id], [oppilaitoksen_taustatiedot_historia_id], [alueluokitus_historia_id]

  UNION ALL

  -- >2016: poikien osuus

  SELECT [tilv]
      ,[jarj]
	  ,[oppilaitoksen_taustatiedot_id]
      ,[alueluokitus_id]
	  ,[opetuskieli_id]
      ,[oppilaitoksen_taustatiedot_historia_id]
      ,[alueluokitus_historia_id]
	  ,sp = 1
      ,sum(isnull(cast([popy] as int), 0) - isnull(cast([popyn] as int), 0)) as lukumaara
  FROM  [f_paivahoidon_yhteydessa_annettavan_esiopetuksen_aineisto]
  WHERE cast([tilv] as int) > 2015 and (isnull(cast([popy] as int), 0) - isnull(cast([popyn] as int), 0)) > 0
  GROUP BY [tilv], [jarj], [oppilaitoksen_taustatiedot_id], [alueluokitus_id], [opetuskieli_id], [oppilaitoksen_taustatiedot_historia_id], [alueluokitus_historia_id]
) Aineisto



GO


