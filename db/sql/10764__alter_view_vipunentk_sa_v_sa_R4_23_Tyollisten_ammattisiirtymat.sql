USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 7.5.2025 13.26.08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









/*
drop table [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]
select * into [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat] from VipunenTK_SA.[dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]
*/

/****** Script for SelectTopNRows command from SSMS  ******/
ALTER VIEW [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat] AS

--5.1.2020 erik_[N-2] sopv17 jälkeenkin opmopa eikä kala_t2, kuten kuvauksessa. -jsyrjala 
--2.12.2021 edelleen ks. yllä

/*
HUOM! Muuta myös tilv-päättelyt!
*/

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef] = null
      ,[amm2010_m2]
	  ,[amm2010_oef2] = null
      ,[opmast_2]
	  ,[kaste_t2_2] = null
      ,[opmopa]
	  ,[iscfinarrow2013] = null
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2015]
      ,[tmaak_se] = [tmaak_2015]
      ,[tol2008_2_s] = [tol2008_2_2015]
      ,[amm2010_m2_s] = [amm2010_m2_2015]
	  ,[amm2010_oef2_s] = null
      ,[opmast_2_s] = [opmast_2_2015]
	  ,[kaste_t2_2_s] = null
      ,[opmopa_s] = [opmopa_2015]
	  ,[iscfinarrow2013_s] = null
      ,[tutklaja_s] = [tutklaja_2015]
      ,[opkelp_s] = [opkelp_2015]
	  ,[erik_s] = [erik_2015]
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2010 THEN 'tilv+5'
		 WHEN tilv = 2014 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_R4_23_sopv_17]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef] = null
      ,[amm2010_m2] = null
	  ,[amm2010_oef2] 
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null 
      ,[ptoim1r9_s] = [ptoim1r9_2016]
      ,[tmaak_se] = [tmaak_2016]
      ,[tol2008_2_s] = [tol2008_2_2016]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2016]
      ,[opmast_2_2016] = null
	  ,[kaste_t2_2_2016]
      ,[opmopa_2016] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2016]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
	  ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2011 THEN 'tilv+5'
		 WHEN tilv = 2015 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_18_O]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef] = null
      ,[amm2010_m2] = null
	  ,[amm2010_oef2] 
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null
      ,[ptoim1r9_s] = [ptoim1r9_2017]
      ,[tmaak_se] = [tmaak_2017]
      ,[tol2008_2_s] = [tol2008_2_2017]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2017]
      ,[opmast_2_2017] = null
	  ,[kaste_t2_2_2017]
      ,[opmopa_2017] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2017]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2012 THEN 'tilv+5'
		 WHEN tilv = 2016 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_19_O]

UNION ALL

-- Rivit tuplana
SELECT DISTINCT
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef] = null
      ,[amm2010_m2] = null
	  ,[amm2010_oef2] 
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null
      ,[ptoim1r9_s] = [ptoim1r9_2018]
      ,[tmaak_se] = [tmaak_2018]
      ,[tol2008_2_s] = [tol2008_2_2018]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2018]
      ,[opmast_2_2018] = null
	  ,[kaste_t2_2_2018]
      ,[opmopa_2018] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2018]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2013 THEN 'tilv+5'
		 WHEN tilv = 2017 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_20'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_20_O]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef] = null
      ,[amm2010_m2] = null
	  ,[amm2010_oef2] 
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null
      ,[ptoim1r9_s] = [ptoim1r9_2019]
      ,[tmaak_se] = [tmaak_2019]
      ,[tol2008_2_s] = [tol2008_2_2019]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2019]
      ,[opmast_2_s] = null
	  ,[kaste_t2_2_2019]
      ,[opmopa_s] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2019]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2014 THEN 'tilv+5'
		 WHEN tilv = 2018 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_21'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_21_O]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef] = null
      ,[amm2010_m2] = null
	  ,[amm2010_oef2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null
      ,[ptoim1r9_s] = [ptoim1r9_2020]
      ,[tmaak_se] = [tmaak_2020]
      ,[tol2008_2_s] = [tol2008_2_2020]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2020]
      ,[opmast_2_s] = null
	  ,[kaste_t2_2_2020]
      ,[opmopa_s] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2020]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2015 THEN 'tilv+5'
		 WHEN tilv = 2019 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_22'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_22_O]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef]
      ,[amm2010_m2] = null
	  ,[amm2010_oef2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null
      ,[ptoim1r9_s] = [ptoim1r9_2021]
      ,[tmaak_se] = [tmaak_2021]
      ,[tol2008_2_s] = [tol2008_2_2021]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2021]
      ,[opmast_2_s] = null
	  ,[kaste_t2_2_2021]
      ,[opmopa_s] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2021]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2016 THEN 'tilv+5'
		 WHEN tilv = 2020 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_23'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_23]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
	  ,[tol2008_oef]
      ,[amm2010_m2] = null
	  ,[amm2010_oef2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja] = null
      ,[opkelp] = null
      ,[ptoim1r9_s] = [ptoim1r9_2022]
      ,[tmaak_se] = [tmaak_2022]
      ,[tol2008_2_s] = [tol2008_2_2022]
      ,[amm2010_m2_s] = null
	  ,[amm2010_oef2_s] = [amm2010_oef2_2022]
      ,[opmast_2_s] = null
	  ,[kaste_t2_2_2022]
      ,[opmopa_s] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2022]
      ,[tutklaja_s] = null
      ,[opkelp_s] = null
	  ,[erik_s] = null
	  ,[erik_amk_s] = null
	  ,[erik_yo_s] = null
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2017 THEN 'tilv+5'
		 WHEN tilv = 2021 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_24'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_24]

-- päivitä myös viimeisimmän CASE-lauseen vuosipäättely

GO


