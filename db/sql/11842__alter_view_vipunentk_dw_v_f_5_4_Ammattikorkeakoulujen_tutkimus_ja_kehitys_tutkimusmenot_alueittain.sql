USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain]    Script Date: 30.3.2026 13.26.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER view [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain] as

-- CSC JN 16.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_alueittain


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO1
	  ,tutkimusmenot_alueittain = A_YS1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO1 IS NOT NULL
  AND A_YS1 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO2
	  ,tutkimusmenot_alueittain = A_YS2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO2 IS NOT NULL
  AND A_YS2 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO3
	  ,tutkimusmenot_alueittain = A_YS3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO3 IS NOT NULL
  AND A_YS3 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO4
	  ,tutkimusmenot_alueittain = A_YS4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO4 IS NOT NULL
  AND A_YS4 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO5
	  ,tutkimusmenot_alueittain = A_YS5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO5 IS NOT NULL
  AND A_YS5 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO6
	  ,tutkimusmenot_alueittain = A_YS6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO6 IS NOT NULL
  AND A_YS6 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO7
	  ,tutkimusmenot_alueittain = A_YS7
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO7 IS NOT NULL
  AND A_YS7 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO8
	  ,tutkimusmenot_alueittain = A_YS8
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO8 IS NOT NULL
  AND A_YS8 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO9
	  ,tutkimusmenot_alueittain = A_YS9
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO9 IS NOT NULL
  AND A_YS9 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO10
	  ,tutkimusmenot_alueittain = A_YS10
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO10 IS NOT NULL
  AND A_YS10 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO11
	  ,tutkimusmenot_alueittain = A_YS11
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO11 IS NOT NULL
  AND A_YS11 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO12
	  ,tutkimusmenot_alueittain = A_YS12
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO12 IS NOT NULL
  AND A_YS12 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO13
	  ,tutkimusmenot_alueittain = A_YS13
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO13 IS NOT NULL
  AND A_YS13 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO14
	  ,tutkimusmenot_alueittain = A_YS14
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO14 IS NOT NULL
  AND A_YS14 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO15
	  ,tutkimusmenot_alueittain = A_YS15
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO15 IS NOT NULL
  AND A_YS15 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO16
	  ,tutkimusmenot_alueittain = A_YS16
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO16 IS NOT NULL
  AND A_YS16 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO17
	  ,tutkimusmenot_alueittain = A_YS17
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO17 IS NOT NULL
  AND A_YS17 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO18
	  ,tutkimusmenot_alueittain = A_YS18
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO18 IS NOT NULL
  AND A_YS18 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO19
	  ,tutkimusmenot_alueittain = A_YS19
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO19 IS NOT NULL
  AND A_YS19 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO20
	  ,tutkimusmenot_alueittain = A_YS20
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO20 IS NOT NULL
  AND A_YS20 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO21
	  ,tutkimusmenot_alueittain = A_YS21
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO21 IS NOT NULL
  AND A_YS21 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO22
	  ,tutkimusmenot_alueittain = A_YS22
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO22 IS NOT NULL
  AND A_YS22 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO23
	  ,tutkimusmenot_alueittain = A_YS23
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO23 IS NOT NULL
  AND A_YS23 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO24
	  ,tutkimusmenot_alueittain = A_YS24
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO24 IS NOT NULL
  AND A_YS24 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO25
	  ,tutkimusmenot_alueittain = A_YS25
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO25 IS NOT NULL
  AND A_YS25 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO26
	  ,tutkimusmenot_alueittain = A_YS26
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO26 IS NOT NULL
  AND A_YS26 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO27
	  ,tutkimusmenot_alueittain = A_YS27
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO27 IS NOT NULL
  AND A_YS27 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO28
	  ,tutkimusmenot_alueittain = A_YS28
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO28 IS NOT NULL
  AND A_YS28 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO29
	  ,tutkimusmenot_alueittain = A_YS29
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO29 IS NOT NULL
  AND A_YS29 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO30
	  ,tutkimusmenot_alueittain = A_YS30
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO30 IS NOT NULL
  AND A_YS30 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO31
	  ,tutkimusmenot_alueittain = A_YS31
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO31 IS NOT NULL
  AND A_YS31 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO32
	  ,tutkimusmenot_alueittain = A_YS32
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO32 IS NOT NULL
  AND A_YS32 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO33
	  ,tutkimusmenot_alueittain = A_YS33
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO33 IS NOT NULL
  AND A_YS33 <> 0.0
  
UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = '-1' --Täsmäytys, jotta aineiston redundantit summat ovat samat
	  ,tutkimusmenot_alueittain = A_YSY - A_YS1 - A_YS2 - A_YS3 - A_YS4 - A_YS5 - A_YS6 - A_YS7 - A_YS8 - A_YS9 - A_YS10
												- A_YS11 - A_YS12 - A_YS13 - A_YS14 - A_YS15 - A_YS16 - A_YS17 - A_YS18 - A_YS19 - A_YS20
												- A_YS21 - A_YS22 - A_YS23 - A_YS24 - A_YS25 - A_YS26 - A_YS27 - A_YS28 - A_YS29 - A_YS30
												- A_YS31 - A_YS32 - A_YS33
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE (A_YSY - A_YS1 - A_YS2 - A_YS3 - A_YS4 - A_YS5 - A_YS6 - A_YS7 - A_YS8 - A_YS9 - A_YS10
			 - A_YS11 - A_YS12 - A_YS13 - A_YS14 - A_YS15 - A_YS16 - A_YS17 - A_YS18 - A_YS19 - A_YS20
			 - A_YS21 - A_YS22 - A_YS23 - A_YS24 - A_YS25 - A_YS26 - A_YS27 - A_YS28 - A_YS29 - A_YS30
			 - A_YS31 - A_YS32 - A_YS33) <> 0.0




GO


