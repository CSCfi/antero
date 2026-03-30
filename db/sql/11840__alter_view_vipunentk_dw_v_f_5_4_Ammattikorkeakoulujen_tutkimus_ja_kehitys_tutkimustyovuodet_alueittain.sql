USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain]    Script Date: 30.3.2026 13.27.58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER view [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimustyovuodet_alueittain] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimustyovuodet_alueittain


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO1
	  ,lkm_tutkimustyovuodet_alueittain = TTV1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO1 IS NOT NULL
  AND TTV1 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO2
	  ,lkm_tutkimustyovuodet_alueittain = TTV2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO2 IS NOT NULL
  AND TTV2 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO3
	  ,lkm_tutkimustyovuodet_alueittain = TTV3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO3 IS NOT NULL
  AND TTV3 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO4
	  ,lkm_tutkimustyovuodet_alueittain = TTV4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO4 IS NOT NULL
  AND TTV4 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO5
	  ,lkm_tutkimustyovuodet_alueittain = TTV5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO5 IS NOT NULL
  AND TTV5 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO6
	  ,lkm_tutkimustyovuodet_alueittain = TTV6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO6 IS NOT NULL
  AND TTV6 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO7
	  ,lkm_tutkimustyovuodet_alueittain = TTV7
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO7 IS NOT NULL
  AND TTV7 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO8
	  ,lkm_tutkimustyovuodet_alueittain = TTV8
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO8 IS NOT NULL
  AND TTV8 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO9
	  ,lkm_tutkimustyovuodet_alueittain = TTV9
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO9 IS NOT NULL
  AND TTV9 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO10
	  ,lkm_tutkimustyovuodet_alueittain = TTV10
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO10 IS NOT NULL
  AND TTV10 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO11
	  ,lkm_tutkimustyovuodet_alueittain = TTV11
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO11 IS NOT NULL
  AND TTV11 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO12
	  ,lkm_tutkimustyovuodet_alueittain = TTV12
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO12 IS NOT NULL
  AND TTV12 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO13
	  ,lkm_tutkimustyovuodet_alueittain = TTV13
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO13 IS NOT NULL
  AND TTV13 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO14
	  ,lkm_tutkimustyovuodet_alueittain = TTV14
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO14 IS NOT NULL
  AND TTV14 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO15
	  ,lkm_tutkimustyovuodet_alueittain = TTV15
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO15 IS NOT NULL
  AND TTV15 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO16
	  ,lkm_tutkimustyovuodet_alueittain = TTV16
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO16 IS NOT NULL
  AND TTV16 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO17
	  ,lkm_tutkimustyovuodet_alueittain = TTV17
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO17 IS NOT NULL
  AND TTV17 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO18
	  ,lkm_tutkimustyovuodet_alueittain = TTV18
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO18 IS NOT NULL
  AND TTV18 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO19
	  ,lkm_tutkimustyovuodet_alueittain = TTV19
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO19 IS NOT NULL
  AND TTV19 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO20
	  ,lkm_tutkimustyovuodet_alueittain = TTV20
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO20 IS NOT NULL
  AND TTV20 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO21
	  ,lkm_tutkimustyovuodet_alueittain = TTV21
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO21 IS NOT NULL
  AND TTV21 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO22
	  ,lkm_tutkimustyovuodet_alueittain = TTV22
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO22 IS NOT NULL
  AND TTV22 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO23
	  ,lkm_tutkimustyovuodet_alueittain = TTV23
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO23 IS NOT NULL
  AND TTV23 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO24
	  ,lkm_tutkimustyovuodet_alueittain = TTV24
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO24 IS NOT NULL
  AND TTV24 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO25
	  ,lkm_tutkimustyovuodet_alueittain = TTV25
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO25 IS NOT NULL
  AND TTV25 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO26
	  ,lkm_tutkimustyovuodet_alueittain = TTV26
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO26 IS NOT NULL
  AND TTV26 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO27
	  ,lkm_tutkimustyovuodet_alueittain = TTV27
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO27 IS NOT NULL
  AND TTV27 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO28
	  ,lkm_tutkimustyovuodet_alueittain = TTV28
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO28 IS NOT NULL
  AND TTV28 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO29
	  ,lkm_tutkimustyovuodet_alueittain = TTV29
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO29 IS NOT NULL
  AND TTV29 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO30
	  ,lkm_tutkimustyovuodet_alueittain = TTV30
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO30 IS NOT NULL
  AND TTV30 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO31
	  ,lkm_tutkimustyovuodet_alueittain = TTV31
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO31 IS NOT NULL
  AND TTV31 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO32
	  ,lkm_tutkimustyovuodet_alueittain = TTV32
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO32 IS NOT NULL
  AND TTV32 <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = K_NRO33
	  ,lkm_tutkimustyovuodet_alueittain = TTV33
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE K_NRO33 IS NOT NULL
  AND TTV33 <> 0.0
  
UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,alueluokitus_avain = '-1' --Täsmäytys, jotta aineiston redundantit summat ovat samat
	  ,lkm_tutkimustyovuodet_alueittain = TTVY - TTV1 - TTV2 - TTV3 - TTV4 - TTV5 - TTV6 - TTV7 - TTV8 - TTV9 - TTV10
												- TTV11 - TTV12 - TTV13 - TTV14 - TTV15 - TTV16 - TTV17 - TTV18 - TTV19 - TTV20
												- TTV21 - TTV22 - TTV23 - TTV24 - TTV25 - TTV26 - TTV27 - TTV28 - TTV29 - TTV30
												- TTV31 - TTV32 - TTV33
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE (TTVY - TTV1 - TTV2 - TTV3 - TTV4 - TTV5 - TTV6 - TTV7 - TTV8 - TTV9 - TTV10
			 - TTV11 - TTV12 - TTV13 - TTV14 - TTV15 - TTV16 - TTV17 - TTV18 - TTV19 - TTV20
			 - TTV21 - TTV22 - TTV23 - TTV24 - TTV25 - TTV26 - TTV27 - TTV28 - TTV29 - TTV30
			 - TTV31 - TTV32 - TTV33) <> 0.0

--order by oppilaitos_avain, tilastovuosi





GO


