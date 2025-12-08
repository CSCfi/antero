USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]    Script Date: 8.12.2025 12.22.52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












ALTER   VIEW [dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] AS

/*
Drop table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Select top 0 * into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh] 
FROM [VipunenTK_SA].[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Truncate table [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Insert into [VipunenTK_DW].[dbo].[f_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
Select * FROM [VipunenTK_SA].[dbo].[v_sa_R4_15_Alueella_tyossakayvat_toimialan_ammryhm_ja_koul_mukaan_1vuotisikaryh]
*/

SELECT [tilv] = CAST(kaikkivuodet.tilv as nvarchar(4))
	  ,[tilv_date] = Cast(kaikkivuodet.tilv+'0101' as date)
      ,[aikielir1] = CAST(kaikkivuodet.aikielir1 as nvarchar(10))
      ,[ika] = CAST(kaikkivuodet.ika as nvarchar(10))
      ,[tilvasmaak] = CAST(kaikkivuodet.tilvasmaak as nvarchar(10))
 	  ,[tol2008_2] = CAST(kaikkivuodet.tol2008_2 as nvarchar(20))
      ,[tol2008_m1] = CAST(kaikkivuodet.tol2008_m1 as nvarchar(20))
      ,[tol2008_m2] = CAST(kaikkivuodet.tol2008_m2 as nvarchar(20))
	  ,[tol2008_oef] = CAST(kaikkivuodet.tol2008_oef as nvarchar(10))
      ,[amm2001_m1] = CAST(kaikkivuodet.amm2001_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(kaikkivuodet.amm2001_m2 as nvarchar(20))
	  ,[amm2010_oef1] = CAST(kaikkivuodet.amm2010_oef1 as nvarchar(20))
	  ,[amm2010_oef2] = CAST(kaikkivuodet.amm2010_oef2 as nvarchar(20))
      ,[tmaak] = CAST(kaikkivuodet.tmaak as nvarchar(10))
      ,[lkm] = CAST(kaikkivuodet.lkm as int)
      ,[tietolahde] = CAST(kaikkivuodet.tietolahde as nvarchar(50))
      ,[rivinumero] = CAST(kaikkivuodet.rivinumero as int)
  FROM (

-- kaudet 2005 - 2009
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]=case tilvasmaak when '20' then '01' else tilvasmaak end
	  ,[tol2008_2] = NULL
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
	  ,[tol2008_oef]='-1'
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m1],',','.') End --'MITENNA2001_'+Replace([amm2001_m1],',','.')
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2001_'+Replace([amm2001_m2],',','.') End --'MITENNA2001_'+Replace([amm2001_m2],',','.')
	  ,[amm2010_oef1]='-1'
	  ,[amm2010_oef2]='-1'
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[lkm]
      ,[tietolahde]='R4_15_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_15_sopv_11]

UNION ALL

-- kausi 2010
SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]= case tilvasmaak when '99' then '-1' when '20' then '01' else tilvasmaak end
	  ,[tol2008_2] = NULL
      ,[tol2008_m1]='MITENNA'+Replace([tol2008_m1],',','.')
      ,[tol2008_m2]='MITENNA'+Replace([tol2008_m2],',','.')
	  ,[tol2008_oef]='-1'
      ,[amm2001_m1]=Case when amm2001_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m1],',','.') end
      ,[amm2001_m2]=Case when left(amm2001_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2001_m2],',','.') end
	  ,[amm2010_oef1]='-1'
	  ,[amm2010_oef2]='-1'
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[lkm]
      ,[tietolahde]='R4_15_2010_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_R4_15_2010_sopv_13]

-- tästä eteenpäin uudella rakenteella
UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_13_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_14_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_15_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_16_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_17_O]


UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_18_O]


UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_19_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_20_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_21_O]


UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_22_O]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_23]
 
UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_24]

UNION ALL

SELECT [tilv]
      ,[aikielir1]
      ,[ika]
      ,[tilvasmaak]
	  ,[tol2008_2] = 'TOL'+[tol2008_2]
      ,[tol2008_m1]='-1'
      ,[tol2008_m2]='-1'
	  ,[tol2008_oef]=Case when [tol2008_oef] = '39' then '-1' else [tol2008_oef] end
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end 
      ,[tmaak]
      ,[lkm]
	  ,[tietolahde]='R4_15_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K4_15_sopv_25]

) kaikkivuodet





GO


