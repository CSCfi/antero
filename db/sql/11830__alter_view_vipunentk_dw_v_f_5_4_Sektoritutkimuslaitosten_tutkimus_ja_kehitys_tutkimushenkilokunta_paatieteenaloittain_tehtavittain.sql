USE [VipunenTK_DW]
GO

/****** Object:  View [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain]    Script Date: 30.3.2026 12.23.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER view [dbo].[v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain] as

-- CSC JN 13.4.2015

-- Taulun luonti
-- Drop table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain
-- Select * into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain

-- Taulun populointi
-- Truncate table VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain
-- Insert into VipunenTK_DW.dbo.f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain

-- Kysely
-- Select * from VipunenTK_DW.dbo.v_f_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys_tutkimushenkilokunta_paatieteenaloittain_tehtavittain


--Tutkijat
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_1'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = pty1 - ptn1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE pty1 - ptn1 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_1'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = ptn1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE ptn1 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_2'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = pty2 - ptn2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE pty2 - ptn2 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_2'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = ptn2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE ptn2 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_3'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = pty3 - ptn3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE pty3 - ptn3 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_3'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = ptn3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE ptn3 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_4'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = pty4 - ptn4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE pty4 - ptn4 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_4'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = ptn4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE ptn4 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_5'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = pty5 - ptn5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE pty5 - ptn5 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_5'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = ptn5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE ptn5 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_6'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = pty6 - ptn6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE pty6 - ptn6 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'TUTKIJA' --Tutkijat
	  ,tieteenala_avain = 'TA10_6'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = ptn6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE ptn6 <> 0

--Muu henkilökunta
UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_1'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phy1 - phn1 - pty1 + ptn1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phy1 - phn1 - pty1 + ptn1 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_1'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phn1 - ptn1
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phn1 - ptn1 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_2'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phy2 - phn2 - pty2 + ptn2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phy2 - phn2 - pty2 + ptn2 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_2'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phn2 - ptn2
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phn2 - ptn2 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_3'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phy3 - phn3 - pty3 + ptn3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phy3 - phn3 - pty3 + ptn3 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_3'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phn3 - ptn3
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phn3 - ptn3 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_4'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phy4 - phn4 - pty4 + ptn4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phy4 - phn4 - pty4 + ptn4 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_4'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phn4 - ptn4
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phn4 - ptn4 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_5'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phy5 - phn5 - pty5 + ptn5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phy5 - phn5 - pty5 + ptn5 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_5'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phn5 - ptn5
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phn5 - ptn5 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '1' --mies
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_6'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phy6 - phn6 - pty6 + ptn6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phy6 - phn6 - pty6 + ptn6 <> 0

UNION ALL
SELECT 
	   tilastovuosi = [tilv]
      ,[tilv_date]
      ,sektoritutkimuslaitos_avain = TK_koodi
	  ,sukupuoli_avain = '2' --nainen
      ,tehtava_avain = 'MUU' --Muu tutkimushenkilökunta
	  ,tieteenala_avain = 'TA10_6'
	  ,lkm_tutkimushenkilokunta_paatieteenaloittain_tehtavittain = phn6 - ptn6
      ,[tietolahde]
      ,[rivinumero]
FROM [VipunenTK_DW].[dbo].[sa_5_4_Sektoritutkimuslaitosten_tutkimus_ja_kehitys] 
WHERE phn6 - ptn6 <> 0


--order by sektoritutkimuslaitos_avain, tilastovuosi







GO


