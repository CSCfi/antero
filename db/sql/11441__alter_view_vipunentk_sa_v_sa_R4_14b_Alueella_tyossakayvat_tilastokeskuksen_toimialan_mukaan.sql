USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan]    Script Date: 8.12.2025 12.22.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER   VIEW [dbo].[v_sa_R4_14b_Alueella_tyossakayvat_tilastokeskuksen_toimialan_mukaan] AS

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
	  ,[tol2008_oef] = CAST(kaikkivuodet.tol2008_oef as nvarchar(10))
	  ,[tol2008] = CAST(kaikkivuodet.tol2008 as nvarchar(20))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
	  ,[amm2010_oef1] = CAST(kaikkivuodet.amm2010_oef1 as nvarchar(20))
	  ,[amm2010_oef2] = CAST(kaikkivuodet.amm2010_oef2 as nvarchar(20))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (
 

/*
SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_13'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_13_O]


UNION All
*/

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_14'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_14_O]


UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_15'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_15_O]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_16'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_16_O]


UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_17'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_17_O]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_18'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_18_O]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_19'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_19_O]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_20'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_20_O]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_21'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_21_O]


UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_22'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_22_O]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_23'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_23]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_24'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_24]

UNION All

SELECT [tilv]
      ,[ikar1]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa] = NULL
	  ,[iscfinarrow2013] = NULL
	  ,[iscfi2013]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
	  ,[tol2008]='TOL'+tol2008
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
      ,[tietolahde]='R4_14b_sopv_25'
	  ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_14b_sopv_25]

) kaikkivuodet





GO


