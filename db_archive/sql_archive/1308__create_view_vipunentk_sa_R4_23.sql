USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]    Script Date: 9.3.2018 14:15:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]'))
EXEC dbo.sp_executesql @statement = N'


/*
drop table [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat]
select * into [VipunenTK_DW].[dbo].[sa_R4_23_Tyollisten_ammattisiirtymat] from VipunenTK_SA.[dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat]
*/


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_23_Tyollisten_ammattisiirtymat] AS


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
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2010 THEN ''tilv+5''
		 WHEN tilv = 2014 THEN ''tilv+1''
		 ELSE ''-1''		 
		END
	  ,[tietolahde]=''R4_23_sopv_17''
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
      ,[lkm]
      ,[suhteellinen_ajankohta_avain] =  
		CASE 
		 WHEN tilv = 2011 THEN ''tilv+5''
		 WHEN tilv = 2015 THEN ''tilv+1''
		 ELSE ''-1''		 
		END
	  ,[tietolahde]=''R4_23_sopv_18''
  FROM [TK_H9098_CSC].[dbo].[TK_R4_23_sopv_18]



' 
GO


USE [ANTERO]