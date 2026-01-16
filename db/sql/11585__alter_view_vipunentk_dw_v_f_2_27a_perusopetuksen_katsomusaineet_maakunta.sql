USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_2_27a_perusopetuksen_katsomusaineet_maakunta]    Script Date: 16.1.2026 17.09.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO













CREATE OR ALTER  VIEW [dbo].[v_f_2_27a_perusopetuksen_katsomusaineet_maakunta] AS

SELECT 
  tilv = kaikki.tilv
 ,tilv_date = kaikki.tilv_date
 ,kmaak = kaikki.kmaak
 ,vuosiluokat = kaikki.vuosiluokat
 ,aine = kaikki.aine
 ,lkm = kaikki.lkm
 
  FROM
  
(  

-- luokat 1 - 6

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'ev'
 ,[lkm] = [aev]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aev]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'or'
 ,[lkm] = [aor]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aor]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'ka'
 ,[lkm] = [aka]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aka]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'is'
 ,[lkm] = [ais]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ais]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'ju'
 ,[lkm] = [aju]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aju]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'ad'
 ,[lkm] = [aad]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aad]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'ba'
 ,[lkm] = [aba]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aba]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'bu'
 ,[lkm] = [abu]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [abu]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'he'
 ,[lkm] = [ahe]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ahe]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'kr'
 ,[lkm] = [akr]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [akr]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'mu'
 ,[lkm] = [amu]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [amu]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'et'
 ,[lkm] = [aet]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aet]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'em'
 ,[lkm] = [aem]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aem]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'mo'
 ,[lkm] = [amo]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [amo]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'tp'
 ,[lkm] = [atp]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [atp]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk1_6'
 ,[aine] = 'ky'
 ,[lkm] = [aky]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [aky]>0

UNION ALL

-- luokat 7 - 9

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'ev'
 ,[lkm] = [yev]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yev]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'or'
 ,[lkm] = [yor]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yor]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'ka'
 ,[lkm] = [yka]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yka]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'is'
 ,[lkm] = [yis]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yis]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'ju'
 ,[lkm] = [yju]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yju]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'ad'
 ,[lkm] = [yad]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yad]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'ba'
 ,[lkm] = [yba]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yba]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'bu'
 ,[lkm] = [ybu]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ybu]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'he'
 ,[lkm] = [yhe]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yhe]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'kr'
 ,[lkm] = [ykr]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ykr]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'mu'
 ,[lkm] = [ymu]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ymu]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'et'
 ,[lkm] = [yet]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yet]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'em'
 ,[lkm] = [yem]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yem]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'mo'
 ,[lkm] = [ymo]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ymo]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'tp'
 ,[lkm] = [ytp]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ytp]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'lk7_9'
 ,[aine] = 'ky'
 ,[lkm] = [yky]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [yky]>0

UNION ALL

-- Aikuiset

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'ev'
 ,[lkm] = [uev]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uev]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'or'
 ,[lkm] = [uor]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uor]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'ka'
 ,[lkm] = [uka]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uka]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'is'
 ,[lkm] = [uis]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uis]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'ju'
 ,[lkm] = [uju]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uju]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'ad'
 ,[lkm] = [uad]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uad]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'ba'
 ,[lkm] = [uba]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uba]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'bu'
 ,[lkm] = [ubu]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ubu]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'he'
 ,[lkm] = [uhe]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uhe]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'kr'
 ,[lkm] = [ukr]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [ukr]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'mu'
 ,[lkm] = [umu]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [umu]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'et'
 ,[lkm] = [uet]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uet]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'em'
 ,[lkm] = [uem]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uem]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'mo'
 ,[lkm] = [umo]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [umo]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'tp'
 ,[lkm] = [utp]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [utp]>0

UNION ALL

SELECT
  [tilv]
 ,[tilv_date]
 ,[kmaak]  
 ,[vuosiluokat] = 'aik'
 ,[aine] = 'ky'
 ,[lkm] = [uky]
FROM [dbo].[sa_2_27a_perusopetuksen_katsomusaineet_maakunta]
--WHERE [uky]>0

) kaikki
GO


