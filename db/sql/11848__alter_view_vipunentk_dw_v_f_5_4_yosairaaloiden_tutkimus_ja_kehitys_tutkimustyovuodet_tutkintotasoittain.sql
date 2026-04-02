USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain]    Script Date: 30.3.2026 13.59.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER view [dbo].[v_f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain
-- Select * into VipunenTK_DW.dbo.f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain from VipunenTK_DW.dbo.v_f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain
-- Insert into VipunenTK_DW.dbo.f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain Select * from VipunenTK_DW.dbo.v_f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_yosairaaloiden_tutkimus_ja_kehitys_tutkimustyovuodet_tutkintotasoittain

--Lukujen summa löytyy aineistosta myös kentistä
-- YHTTTV
-- TYOVY


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '82' --tohtori
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = TOTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE TOTTV <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '81' --lisensiaatti
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = LISTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE LISTTV <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '70' --yliopistotutkinto
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = dittv
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE dittv <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '60' --amk-tutkinto
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = insttv
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE insttv <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '30' --Muu koulutus
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = MKOUTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE MKOUTTV <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '50' --Muu opistoasteen tutkinto
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = OPISTTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE OPISTTTV <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,yosairaala_avain = TK_koodi
      ,tutkintotaso_avain = '-1' --Täsmäytys, jotta aineiston redundantit summat ovat samat
	  ,lkm_tutkimustyovuodet_tutkintotasoittain = YHTTTV - TOTTV - LISTTV - dittv - insttv - MKOUTTV - OPISTTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_yosairaaloiden_tutkimus_ja_kehitys] 
WHERE YHTTTV - TOTTV - LISTTV - dittv - insttv - MKOUTTV - OPISTTTV <> 0.0

--order by yosairaala_avain, tilastovuosi




GO


