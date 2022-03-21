USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 3.12.2019 10:11:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
Select * into [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] FROM [VipunenTK_SA].[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
Truncate table [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
Insert into [VipunenTK_DW].[dbo].[f_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[ikar1] = CAST(kaikkivuodet.ikar1 as nvarchar(10))
      ,[opmast] = CAST(kaikkivuodet.opmast as nvarchar(10))
	  ,[kaste_t2] = CAST(kaikkivuodet.kaste_t2 as nvarchar(10))
      ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar(10))
      ,[opmopa] = CAST(kaikkivuodet.opmopa as nvarchar(10))
	  ,[iscfinarrow2013] = CAST(kaikkivuodet.iscfinarrow2013 as nvarchar(10))
	  ,[iscfi2013] = CAST(kaikkivuodet.iscfi2013 as nvarchar(10))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
	  ,[tol2008] = CAST(kaikkivuodet.tol2008 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
 

SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013] = NULL
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_14'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_14]
UNION All
SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013] = NULL
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_15'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_15]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013] = NULL
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_16'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_16]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013] = NULL
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_17'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_17]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013]
	  ,[iscfi2013] = NULL
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_18'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_14b_sopv_18]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja]
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_19'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_19]

) kaikkivuodet









GO
USE [ANTERO]