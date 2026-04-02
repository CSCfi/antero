USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain]    Script Date: 30.3.2026 12.28.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER view [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tehtavittain] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimustyovuodet_tyorooleittain



SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
      ,tehtava_avain = 'TUTKIJA' --Tutkija
	  ,lkm_tutkimustyovuodet_tyorooleittain = TUTTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE TUTTTV <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,lkm_tutkimustyovuodet_tyorooleittain = MTKTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE MTKTTV <> 0.0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
      ,tehtava_avain = 'KORJAUS' --Muu tutkimushenkilökunta
	  ,lkm_tutkimustyovuodet_tyorooleittain = YHTTTV - TUTTTV - MTKTTV
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE YHTTTV - TUTTTV - MTKTTV <> 0.0


--order by sektoritutkimuslaitos_avain, tilastovuosi


GO


