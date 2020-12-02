USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 1.12.2020 23:36:58 ******/
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

--HUOM! Muuta myös tilv-päättelyt!

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
      ,[amm2010_m2]
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
      ,[amm2010_m2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2016]
      ,[tmaak_se] = [tmaak_2016]
      ,[tol2008_2_s] = [tol2008_2_2016]
      ,[amm2010_m2_s] = [amm2010_m2_2016]
      ,[opmast_2_2016] = null
	  ,[kaste_t2_2_2016]
      ,[opmopa_2016] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2016]
      ,[tutklaja_s] = [tutklaja_2016]
      ,[opkelp_s] = [opkelp_2016]
      ,[erik_s] = [erik_2016]
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
FROM [TK_H9098_CSC].[dbo].[TK_R4_23_sopv_18]

UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
      ,[amm2010_m2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2017]
      ,[tmaak_se] = [tmaak_2017]
      ,[tol2008_2_s] = [tol2008_2_2017]
      ,[amm2010_m2_s] = [amm2010_m2_2017]
      ,[opmast_2_2017] = null
	  ,[kaste_t2_2_2017]
      ,[opmopa_2017] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2017]
      ,[tutklaja_s] = [tutklaja_2017]
      ,[opkelp_s] = [opkelp_2017]
      ,[erik_s] = [erik_2017]
	  ,[erik_amk_s] = [amk_erik_2017]
	  ,[erik_yo_s] = [yo_erik_2017]
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2012 THEN 'tilv+5'
		 WHEN tilv = 2016 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_19'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_19]


UNION ALL

SELECT 
	   [tilv]
      ,[ptoim1r9]
      ,[aikielir5]
      ,[ikar6]
      ,[tol2008_2]
      ,[amm2010_m2]
      ,[opmast_2] = null
	  ,[kaste_t2_2]
      ,[opmopa] = null
	  ,[iscfinarrow2013]
      ,[tutklaja]
      ,[opkelp]
      ,[ptoim1r9_s] = [ptoim1r9_2018]
      ,[tmaak_se] = [tmaak_2018]
      ,[tol2008_2_s] = [tol2008_2_2018]
      ,[amm2010_m2_s] = [amm2010_m2_2018]
      ,[opmast_2_2018] = null
	  ,[kaste_t2_2_2018]
      ,[opmopa_2018] = null
	  ,[iscfinarrow2013_s] = [iscfinarrow2013_2018]
      ,[tutklaja_s] = [tutklaja_2018]
      ,[opkelp_s] = [opkelp_2018]
      ,[erik_s] = [erik_2018]
	  ,[erik_amk_s] = [amk_erik_2018]
	  ,[erik_yo_s] = [yo_erik_2018]
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2013 THEN 'tilv+5'
		 WHEN tilv = 2017 THEN 'tilv+1'
		 ELSE '-1'		 
		END
	  ,[tietolahde]='R4_23_sopv_20'
FROM [TK_H9098_CSC].[dbo].[TK_K4_23_sopv_20]



GO


USE [ANTERO]