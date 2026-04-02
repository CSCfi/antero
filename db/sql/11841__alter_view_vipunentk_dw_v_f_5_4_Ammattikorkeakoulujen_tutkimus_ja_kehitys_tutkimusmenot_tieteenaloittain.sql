USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain]    Script Date: 30.3.2026 13.27.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER view [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain] as

-- CSC JN 16.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimusmenot_tieteenaloittain


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA1
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA1P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA1 IS NOT NULL
  AND TA1P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA2
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA2P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA2 IS NOT NULL
  AND TA2P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA3
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA3P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA3 IS NOT NULL
  AND TA3P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA4
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA4P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA4 IS NOT NULL
  AND TA4P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA5
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA5P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA5 IS NOT NULL
  AND TA5P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA6
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA6P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA6 IS NOT NULL
  AND TA6P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA7
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA7P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA7 IS NOT NULL
  AND TA7P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA8
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA8P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA8 IS NOT NULL
  AND TA8P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA9
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA9P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA9 IS NOT NULL
  AND TA9P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA10
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA10P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA10 IS NOT NULL
  AND TA10P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA11
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA11P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA11 IS NOT NULL
  AND TA11P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA12
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA12P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA12 IS NOT NULL
  AND TA12P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA13
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA13P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA13 IS NOT NULL
  AND TA13P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA14
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA14P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA14 IS NOT NULL
  AND TA14P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA15
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA15P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA15 IS NOT NULL
  AND TA15P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA16
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA16P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA16 IS NOT NULL
  AND TA16P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA17
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA17P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA17 IS NOT NULL
  AND TA17P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA18
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA18P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA18 IS NOT NULL
  AND TA18P <> 0.0




UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA19
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA19P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA19 IS NOT NULL
  AND TA19P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA20
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA20P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA20 IS NOT NULL
  AND TA20P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA21
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA21P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA21 IS NOT NULL
  AND TA21P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA22
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA22P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA22 IS NOT NULL
  AND TA22P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA23
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA23P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA23 IS NOT NULL
  AND TA23P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA24
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA24P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA24 IS NOT NULL
  AND TA24P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA25
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA25P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA25 IS NOT NULL
  AND TA25P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA26
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA26P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA26 IS NOT NULL
  AND TA26P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA27
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA27P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA27 IS NOT NULL
  AND TA27P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA28
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA28P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA28 IS NOT NULL
  AND TA28P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA29
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA29P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA29 IS NOT NULL
  AND TA29P <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
	  ,tieteenala_avain = TA30
	  ,tutkimusmenot_tieteenaloittain = ysyht*TA30P/100.0
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 
WHERE TA30 IS NOT NULL
  AND TA30P <> 0.0


GO


