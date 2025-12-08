USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain]    Script Date: 8.12.2025 12.23.39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











ALTER   VIEW [dbo].[v_sa_R4_16_Tyossakayvat_ammateittain] AS

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
	  ,[kaste_t2] = CAST(kaste_t2 as nvarchar(10))
      ,[tutklaja] = CAST(tutklaja as nvarchar(10))
      ,[opmopa] = CAST(opmopa as nvarchar(10))
	  ,[iscfinarrow2013] = CAST(iscfinarrow2013 as nvarchar(10))
      ,[amm2001_m1] = CAST(amm2010_m1 as nvarchar(20))
      ,[amm2001_m2] = CAST(amm2010_m2 as nvarchar(20))
      ,[amm2001_m] = CAST(amm2010_m as nvarchar(20))
	  ,[amm2010] = CAST(kaikkivuodet.amm2010 as nvarchar(20))
	  ,[amm2010_oef1] = CAST(kaikkivuodet.amm2010_oef1 as nvarchar(20))
	  ,[amm2010_oef2] = CAST(kaikkivuodet.amm2010_oef2 as nvarchar(20))
      ,[lkm] = CAST(lkm as int)
      ,[tietolahde] = CAST(tietolahde as nvarchar(10))
      ,[rivinumero] = CAST(rivinumero as int)
      ,[tmaak] = CAST(tmaak as nvarchar(10))
      ,[amm2001_mnim] = CAST(amm2010_nim as nvarchar(10))
  FROM 
(
SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] = NULL
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013] = NULL
      ,[amm2010_m1] = NULL
      ,[amm2010_m2] = NULL
      ,[amm2010_m] = NULL
	  ,[amm2010] = '-1'
      ,[amm2010_oef1]= '-1'
	  ,[amm2010_oef2]= '-1'
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[amm2010_nim] = NULL
FROM [TK_H9098_CSC].[dbo].[TK_R4_16_sopv_11]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast]
	  ,[kaste_t2] 
      ,[tutklaja]
      ,[opmopa]=Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2010_m1]=Case when amm2010_m1='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m1],',','.') End
      ,[amm2010_m2]=Case when left(amm2010_m2,2)='12' then '-1' else 'MITENNA2010_'+Replace([amm2010_m2],',','.') End
      ,[amm2010_m]=Case when Left(amm2010,1)='X' then '-1' else 'MITENNA2010_'+Replace([amm2010],',','.') End
      --,[amm2001_m]='MITENNA2010_'+Replace([amm2010],',','.')
	  ,[amm2010] = '-1'
      ,[amm2010_oef1]= '-1'
	  ,[amm2010_oef2]= '-1'
      ,[lkm]
      ,[tietolahde]='R4_16_2010_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]=case tmaak when '20' then '01' else tmaak end
      ,[amm2010_nim]
FROM [TK_H9098_CSC].[dbo].[TK_R4_16_2010_sopv_13_H]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_13_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_14_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_15_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_16_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_17_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_18_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_19_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_20_O]


UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_21_O]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_22_O]


UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_23]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_24]

UNION ALL

SELECT [tilv]
      ,[sp]
      ,[aikielir1]
      ,[ika]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[tutklaja] = null
      ,[opmopa]= NULL --Case when opmopa='999' then '-1' else opmopa End
	  ,[iscfinarrow2013]
      ,[amm2001_m1]='-1'
      ,[amm2001_m2]='-1'
	  ,[amm2001_m]='-1'  
	  ,[amm2010]
      ,[amm2010_oef1]=Case when [amm2010_oef1] = '17' then '-1' else [amm2010_oef1] end
	  ,[amm2010_oef2]=Case when [amm2010_oef2] = '17.01' then '-1' else [amm2010_oef2] end
      ,[lkm]
      ,[tietolahde]='R4_16_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
      ,[tmaak]
      ,[amm2010_nim] = null
FROM [TK_H9098_CSC].[dbo].[TK_K4_16_sopv_25]

) kaikkivuodet



GO


