USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain]    Script Date: 30.3.2026 13.23.42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER   view [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_alueittain] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_alueittain


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO1
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO1 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO2
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO2 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO3
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO3 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO4
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO4 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO5
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO5 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO6
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO6 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO7
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH7
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO7 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO8
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH8
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO8 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO9
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH9
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO9 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO10
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH10
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO10 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO11
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH11
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO11 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO12
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH12
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO12 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO13
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH13
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO13 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO14
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH14
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO14 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO15
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH15
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO15 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO16
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH16
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO16 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO17
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH17
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO17 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO18
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH18
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO18 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO19
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH19
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO19 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO20
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH20
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO20 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO21
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH21
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO21 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO22
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH22
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO22 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO23
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH23
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO23 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO24
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH24
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO24 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO25
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH25
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO25 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO26
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH26
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO26 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO27
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH27
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO27 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO28
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH28
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO28 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO29
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH29
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO29 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO30
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH30
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO30 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO31
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH31
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO31 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO32
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH32
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO33 IS NOT NULL

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO33
	  ,lkm_tutkimushenkilokunta_alueittain = YHTH33
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO33 IS NOT NULL

--order by oppilaitos_avain, tilastovuosi



GO


