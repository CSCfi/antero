USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain]    Script Date: 30.3.2026 13.25.25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER view [dbo].[v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_kehitys_tutkimushenkilokunta_tutkintotasoittain from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys_tutkimushenkilokunta_tutkintotasoittain

--Lukujen summa löytyy aineistosta myös kentistä
-- yhte
-- yhte2
-- henlkmy


SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '82' --tohtori
	  ,sukupuoli_avain = '1' --mies
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = [TOLKM] - [NTOLKM]
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '82' --tohtori
	  ,sukupuoli_avain = '2' --nainen
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = [NTOLKM]
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '81' --lisensiaatti
	  ,sukupuoli_avain = '1' --mies
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = LISLKM - NLISLKM
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '81' --lisensiaatti
	  ,sukupuoli_avain = '2' --nainen
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NLISLKM
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '70' --yliopistotutkinto
	  ,sukupuoli_avain = '1' --mies
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = DILKM - ndilkm
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '70' --yliopistotutkinto
	  ,sukupuoli_avain = '2' --nainen
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = ndilkm
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '60' --amk-tutkinto
	  ,sukupuoli_avain = '1' --mies
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = INSLKM - nyhtlkm2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '60' --amk-tutkinto
	  ,sukupuoli_avain = '2' --nainen
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = nyhtlkm2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '30' --Muu koulutus
	  ,sukupuoli_avain = '1' --mies
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = MKOULKM - NMKOULKM
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '30' --Muu koulutus
	  ,sukupuoli_avain = '2' --nainen
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NMKOULKM
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '50' --Muu opistoasteen tutkinto
	  ,sukupuoli_avain = '1' --mies
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = OPISTLKM - NOPISTLKM
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,oppilaitos_avain = TK_koodi
      ,tutkintotaso_avain = '50' --Muu opistoasteen tutkinto
	  ,sukupuoli_avain = '2' --nainen
	  ,lkm_tutkimushenkilokunta_tutkintotasoittain = NOPISTLKM
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Ammattikorkeakoulujen_tutkimus_ja_kehitys] 

--order by oppilaitos_avain, tilastovuosi




GO


