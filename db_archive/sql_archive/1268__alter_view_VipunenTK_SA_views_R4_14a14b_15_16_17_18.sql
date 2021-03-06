USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 23.2.2018 16:47:17 ******/
DROP VIEW [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
GO
/****** Object:  View [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 23.2.2018 16:47:17 ******/
DROP VIEW [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
GO
/****** Object:  View [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]    Script Date: 23.2.2018 16:47:17 ******/
DROP VIEW [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]
GO
/****** Object:  View [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 23.2.2018 16:47:17 ******/
DROP VIEW [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
GO
/****** Object:  View [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 23.2.2018 16:47:17 ******/
DROP VIEW [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]
GO
/****** Object:  View [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 23.2.2018 16:47:17 ******/
DROP VIEW [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
GO
/****** Object:  View [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]    Script Date: 23.2.2018 16:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Select * into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan] FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Truncate table [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
Insert into [VipunenTK_DW].[dbo].[f_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_14_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[sp] = CAST(kaikkivuodet.sp as nvarchar(10))
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(10))
      ,[ikar1] = CAST(kaikkivuodet.ikar1 as nvarchar(10))
      ,[opmast] = CAST(kaikkivuodet.opmast as nvarchar(10))
      ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar(10))
      ,[opmopa] = CAST(kaikkivuodet.opmopa as nvarchar(10))
      ,[tilvasmaak] = CAST(kaikkivuodet.tilvasmaak as varchar(2))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
      ,[tsekt] = CAST(kaikkivuodet.tsekt as nvarchar(10))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[sose] = CAST(kaikkivuodet.sose as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
  SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]=case tilvasmaak when '20' then '01' else tilvasmaak end
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m1],',','.') End --'MITENNA2001_'+Replace([amm2001_m1],',','.')
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m2],',','.') End --'MITENNA2001_'+Replace([amm2001_m2],',','.')
      ,[tsekt]
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14_sopv_11]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]=case tilvasmaak when '99' then '-1' when '20' then '01' else tilvasmaak end
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') end
      ,[tsekt]
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14_2010_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14_2010_sopv_13]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14_2011_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14_2011_sopv_13]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_2012_sopv_14'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_14]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_2012_sopv_15'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_15]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_2012_sopv_16'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_16]
  
UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_2012_sopv_17'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_17]

  UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ikar1]
      ,[opmast] = NULL
      ,[tutklaja]
      ,[opmopa] =NULL
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tsekt]
      ,[tmaak]
      ,[sose]
      ,[lkm]
      ,[tietolahde]='R4_14a_2012_sopv_18'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_14a_sopv_18]


) kaikkivuodet






GO
/****** Object:  View [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 23.2.2018 16:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] AS

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
      ,[tutklaja] = CAST(kaikkivuodet.tutklaja as nvarchar(10))
      ,[opmopa] = CAST(kaikkivuodet.opmopa as nvarchar(10))
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
      ,[tutklaja]
      ,[opmopa]
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
      ,[tutklaja]
      ,[opmopa]
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
      ,[tutklaja]
      ,[opmopa]
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
      ,[tutklaja]
      ,[opmopa]
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
      ,[tutklaja]
      ,[opmopa] = NULL
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

) kaikkivuodet







GO
/****** Object:  View [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 23.2.2018 16:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO













CREATE VIEW [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Select * into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Truncate table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Insert into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
*/
SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(10))
      ,[ika] = CAST(kaikkivuodet.ika as nvarchar(10))
      ,[tilvasmaak] = CAST(kaikkivuodet.tilvasmaak as nvarchar(10))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]=case tilvasmaak when '20' then '01' else tilvasmaak end
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m1],',','.') End --'MITENNA2001_'+Replace([amm2001_m1],',','.')
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m2],',','.') End --'MITENNA2001_'+Replace([amm2001_m2],',','.')
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[lkm]
      ,[tietolahde]='R4_15_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_11]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]= case tilvasmaak when '99' then '-1' when '20' then '01' else tilvasmaak end
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') end
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[lkm]
      ,[tietolahde]='R4_15_2010_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_2010_sopv_13]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') end
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_15_2011_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_2011_sopv_13]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_2012_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_14]
UNION ALL
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_2012_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_15]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_2012_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_16]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_2012_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_17]

  UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
      ,[tol2008_m1]='MITENNA'+Replace(isnull([tol2008_m1],28),',','.')
      ,[tol2008_m2]='MITENNA'+Replace(isnull([tol2008_m2],'28.0'),',','.')
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') end
      ,[amm2001_m2]=Case 
	  when left(amm2010_m2,2)='12' then '-1' 
	  when substring(amm2010_m2,4,1)=0 then 'MITENNA2010_'++Replace(LEFT(amm2010_m2,3),',','.')+RIGHT(amm2010_m2,1)
	  else 'MITENNA2010_'+Replace([amm2010_m2],',','.') end
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_2012_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_18]
 
 
) kaikkivuodet






GO
/****** Object:  View [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]    Script Date: 23.2.2018 16:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












CREATE VIEW [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]
Select * into [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain] FROM [VipunenTK_SA].[dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]
Truncate table [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]
Insert into [VipunenTK_DW].[dbo].[f_R4_16_Tyossakayvat_ammateittain]
  Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]
*/

SELECT [tilv] = CAST(tilv as nvarchar(4))
	  ,[tilv_date] = Cast(tilv+'0101' as date)
      ,[sp] = CAST(sp as nvarchar(10))
      ,[aikielir1] = CAST(aikielir1 as nvarchar(10))
      ,[ika] = CAST(ika as nvarchar(10))
      ,[opmast] = CAST(opmast as nvarchar(10))
      ,[tutklaja] = CAST(tutklaja as nvarchar(10))
      ,[opmopa] = CAST(opmopa as nvarchar(10))
      ,[amm2001_m1] = CAST(amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(amm2001_m2 as nvarchar(20))
      ,[amm2001_m] = CAST(amm2001_m as nvarchar(20))
      ,[lkm] = CAST(lkm as int)
      ,[tietolahde] = CAST(tietolahde as nvarchar(10))
      ,[rivinumero] = CAST(rivinumero as int)
      ,[tmaak] = CAST(tmaak as nvarchar(10))
      ,[amm2001_mnim] = CAST(amm2001_mnim as nvarchar(10))
  FROM 
(
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m2],',','.') End
      ,[amm2001_m]=Case when Left(amm2001_m,2)='99' then '-1' else 'MITENNA2001_'+Replace([amm2001_m],',','.') End
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[amm2001_mnim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_11]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') End
      ,[amm2001_m]=Case when Left(amm2001_m,1)='X' then '-1' else 'MITENNA2010_'+Replace([amm2001_m],',','.') End
      --,[amm2001_m]='MITENNA2010_'+Replace([amm2010],',','.')
      ,[lkm]
      ,[tietolahde]='R4_16_2010_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[amm2001_mnim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_2010_sopv_13]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') End
      ,[amm2001_m]=Case when Left(amm2001_m,1)='X' then '-1' else 'MITENNA2010_'+Replace([amm2001_m],',','.') End
      --,[amm2001_m]='MITENNA2010_'+Replace([amm2010],',','.')
      ,[lkm]
      ,[tietolahde]='R4_16_2011_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2001_mnim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_2011_sopv_13]
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m2],',','.') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010='99999' then '-1' 
					else LEFT('MITENNA2010_'+Replace([amm2010],',','.')+'.....',17) End
      ,[lkm]
      ,[tietolahde]='R4_16_2011_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_14] 
  WHERE tilv!='' AND tilv!='asia'
UNION ALL
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m2],',','.') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010='99999' then '-1' 
					else LEFT('MITENNA2010_'+Replace([amm2010],',','.')+'.....',17) End
      ,[lkm]
      ,[tietolahde]='R4_16_2011_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_15] 

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m2],',','.') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010='99999' then '-1' 
					else LEFT('MITENNA2010_'+Replace([amm2010],',','.')+'.....',17) End
      ,[lkm]
      ,[tietolahde]='R4_16_2011_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_16] 

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m2],',','.') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010='99999' then '-1' 
					else LEFT('MITENNA2010_'+Replace([amm2010],',','.')+'.....',17) End
      ,[lkm]
      ,[tietolahde]='R4_16_2011_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_17] 

  UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
      ,[tutklaja]
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
      ,[amm2001_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') End
      ,[amm2001_m2]=Case when left(amm2010_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m2],',','.') End
      --LÄHDEAINEISTOSSA PUUTTUU PISTEET AMMATTILUOKITUKSESTA, KORJAUS TEHDÄÄN ALLA
	  ,[amm2001_m]=Case 
					when amm2010='99999' then '-1' 
					else LEFT('MITENNA2010_'+Replace([amm2010],',','.')+'.....',17) End
      ,[lkm]
      ,[tietolahde]='R4_16_2011_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim]
  FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_18]

) kaikkivuodet






GO
/****** Object:  View [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]    Script Date: 23.2.2018 16:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti] AS

/**********

drop table [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]

truncate table [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]

insert into [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
SELECT [tilv]
      ,[tilv_date]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[elk_koodi]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1x]
      ,[amm2001_m2x]
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero]
      ,[tietojen_ajankohta]
      ,[tiet_ak]
      ,[tiet_akdate]      
      ,[aineisto]
--  INTO [VipunenTK_DW].[dbo].[f_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]
  FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_17_Elakkeelle_siirt_ja_heidan_ammatti]

**********/

SELECT [tilv] = CAST([tilv] AS nvarchar(4))
	  ,[tilv_date] = CAST(tilv+'0101' as date)
      ,[lahde] = CAST([lahde] as nvarchar(10))
      ,[sp] = CAST([sp] as nvarchar(10))
      ,[aikielir1] = CAST([aikielir1] as nvarchar(10))
      ,[ika] = CAST([ika] as nvarchar(10))
      ,[elaji] = CAST([elaji] as nvarchar(10))
      ,[elk_koodi] = 
		CASE WHEN [lahde] = 'E' THEN CAST([elaji] as nvarchar(10))      
		WHEN [lahde] = 'K' THEN CAST('100' as nvarchar(10))     
      END
      ,[ptoim1r8x] = 
      CASE
          WHEN [ptoim1r8x] = 99 THEN CAST('-1' as nvarchar(10))
          ELSE CAST([ptoim1r8x] as nvarchar(10))
      END
      ,[tmaakx] = 
		CASE WHEN [tmaakx] = 99 THEN CAST('-1' as nvarchar(10))
		ELSE CAST([tmaakx] as nvarchar(10))
      END      
      ,[amm2001_m1x] = 
		CASE WHEN [amm2001_m1_x] = 'XX' THEN CAST('-1' as nvarchar(10))
		ELSE CAST([amm2001_m1_x] as nvarchar(10))
      END
      ,[amm2001_m2x] = 
		CASE WHEN [amm2001_m2_x] LIKE '%XX%' THEN CAST('-1' as nvarchar(20))
		ELSE CAST([amm2001_m2_x] as nvarchar(20))
	  END
      ,[lkm] = CAST([lkm] as int)
      ,[tietolahde] = CAST([tietolahde] as nvarchar(50))
      ,[rivinumero] = CAST([rivinumero] as int)
      ,[tietojen_ajankohta] = CAST([tietojen_ajankohta] as nvarchar(10))
      ,[tiet_ak] = CAST(CAST([tilv] as int) - 1 AS nvarchar(4))
      ,[tiet_akdate] = CAST(CAST(CAST([tilv] as int) - 1 as nvarchar(10)) + '0101' as date)
      ,aineisto = CAST('R4.17' as nvarchar(8))

FROM      

(
SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]='MITENNA2001_'+Replace([amm2001_m2_x],',','.')            
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
      
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_11]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]='MITENNA2010_'+Replace([amm2001_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_12]
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]='MITENNA2010_'+Replace([amm2001_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_13] 
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_16]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--      ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17a_Elakkeelle_siirt_ja_heidan_ammatti_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17a_sopv_17]



UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--      ,[amm2001_m2x]
      ,[amm2001_m2_x]='MITENNA2010_'+Replace([amm2001_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2001_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2001_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2001_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_16]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_17]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 AS elaji      
      ,[ptoim1r8x]
      ,[tmaakx]
      ,[amm2010_m1_x]
--    ,[amm2001_m2x]
      ,[amm2010_m2_x]='MITENNA2010_'+Replace([amm2010_m2_x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_17b_Kuolleet_ja_heidan_ammatti_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'1' AS tietojen_ajankohta
  FROM [TK_H9098_CSC].[dbo].[TK_R4_17b_sopv_18]


) kaikkivuodet



GO
/****** Object:  View [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]    Script Date: 23.2.2018 16:47:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin] AS

/******************

drop table [VipunenTK_DW].[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
truncate table [VipunenTK_DW].[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]

SELECT [tilv]
	  ,[tilv_date]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[elk_koodi]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]
      ,[lkm]
      ,[tietolahde]
      ,[rivinumero]
      ,[tietojen_ajankohta]
      ,[tiet_ak]
      ,[tiet_akdate]    
      ,[aineisto]  
  INTO [VipunenTK_DW].[dbo].[f_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]
  FROM [TK_H9098_CSC].[dbo].[TK_v_sa_R4_18_Elakkeelle_siirt_ja_heidan_ammatti_2v_aiemmin]

******************/

SELECT [tilv] = CAST([tilv] AS nvarchar(4))
	  ,[tilv_date] = CAST(tilv+'0101' as date)
      ,[lahde] = CAST([lahde] as nvarchar(10))
      ,[sp] = CAST([sp] as nvarchar(10))
      ,[aikielir1] = CAST([aikielir1] as nvarchar(10))
      ,[ika] = CAST([ika] as nvarchar(10))
      ,[elaji] = CAST([elaji] as nvarchar(10))
      ,[elk_koodi] = 
		CASE WHEN [lahde] = 'E' THEN CAST([elaji] as nvarchar(10))      
		WHEN [lahde] = 'K' THEN CAST('100' as nvarchar(10))     
      END      
      ,[ptoim1r8_2x] = 
      CASE
          WHEN [ptoim1r8_2x] = 99 THEN CAST('-1' as nvarchar(10))
          ELSE CAST([ptoim1r8_2x] as nvarchar(10))
      END
      ,[tmaak2x] = 
		CASE WHEN [tmaak2x] = 99 THEN CAST('-1' as nvarchar(10))
		ELSE CAST([tmaak2x] as nvarchar(10))
      END      
      ,[amm2001_m1_2x] = 
		CASE WHEN [amm2001_m1_2x] = 'XX' THEN CAST('-1' as nvarchar(10))
		ELSE CAST([amm2001_m1_2x] as nvarchar(10))
      END
      ,[amm2001_m2_2x] = 
		CASE WHEN [amm2001_m2_2x] LIKE '%XX%' THEN CAST('-1' as nvarchar(20))
		ELSE CAST([amm2001_m2_2x] as nvarchar(20))
	  END
      ,[lkm] = CAST([lkm] as int)
      ,[tietolahde] = CAST([tietolahde] as nvarchar(50))
      ,[rivinumero] = CAST([rivinumero] as int)
      ,[tietojen_ajankohta] = CAST([tietojen_ajankohta] as nvarchar(20))
      ,[tiet_ak] = CAST(CAST([tilv] as int) - 2 AS nvarchar(4))
      ,[tiet_akdate] = CAST(CAST(CAST([tilv] as int) - 2 as nvarchar(10)) + '0101' as date)   
      ,aineisto = CAST('R4.18' as nvarchar(8))         

FROM

(
SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2001_'+Replace([amm2001_m2_2x],',','.')      
      ,[lkm]
      ,[tietolahde]='sa_R4_18a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_11]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_16] 

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18a_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18a_sopv_17] 
 
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_11]
  
UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_12]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2001_m1_2x]
      ,[amm2001_m2_2x]='MITENNA2010_'+Replace([amm2001_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_13]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_14]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_15]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_16]

UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_17]

  UNION ALL

SELECT [tilv]
      ,[lahde]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,-1 as [elaji]
      ,[ptoim1r8_2x]
      ,[tmaak2x]
      ,[amm2010_m1_2x]
      ,[amm2010_m2_2x]='MITENNA2010_'+Replace([amm2010_m2_2x],',','.')
      ,[lkm]
      ,[tietolahde]='R4_18b_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,'2' AS tietojen_ajankohta  
  FROM [TK_H9098_CSC].[dbo].[TK_R4_18b_sopv_18]

) kaikkivuodet



GO

USE ANTERO
