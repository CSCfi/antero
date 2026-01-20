USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk]    Script Date: 26.3.2025 16.24.43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER VIEW [dbo].[v_sa_2_23_Opisk_ja_tutksuor_vanh_aseman_muk] AS

SELECT
	  [tilv]= cast(kaikkivuodet.tilv as nvarchar(4))
	  ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	  ,[sp]= CAST(kaikkivuodet.sp as nvarchar (1))
      ,[syntv]= cast(kaikkivuodet.syntv as nvarchar(4))
      ,[aikielir1x]= cast (kaikkivuodet.aikielir1x as nvarchar(2))
      ,[tilvaskun]= cast (kaikkivuodet.tilvaskun as nvarchar(3))
      ,[tilvaskunx]= cast (kaikkivuodet.tilvaskunx as nvarchar(3))
      ,[sose_isa1]= cast (kaikkivuodet.sose_isa1 as nvarchar(1))
      ,[sose_aiti1]= cast (kaikkivuodet.sose_aiti1 as nvarchar(1))
      ,[sose_isa2]= cast (kaikkivuodet.sose_isa2 as nvarchar(2))
      ,[sose_aiti2]= cast (kaikkivuodet.sose_aiti2 as nvarchar(2))
      ,[koulk_isa]= cast (kaikkivuodet.koulk_isa as nvarchar(6))
      ,[koulk_aiti]= cast (kaikkivuodet.koulk_aiti as nvarchar(6))
      ,[tulo_isa]= cast (kaikkivuodet.tulo_isa as nvarchar(2))
      ,[tulo_aiti]= cast (kaikkivuodet.tulo_aiti as nvarchar(2))
      ,[klaji]= cast (kaikkivuodet.klaji as nvarchar(2))
      ,[ophal]= cast (kaikkivuodet.ophal as nvarchar(1))
      ,[koulk]= cast (kaikkivuodet.koulk as nvarchar(6))
      ,[kkieli]= cast (kaikkivuodet.kkieli as nvarchar(2))
      ,[kmaak]= cast (kaikkivuodet.kmaak as nvarchar(2))
      ,[alvv]= cast (kaikkivuodet.alvv as nvarchar(4))
      ,[olosyys]= cast (kaikkivuodet.olosyys as nvarchar(1))
      ,[uusi]= cast(kaikkivuodet.uusi as int)
      ,[opisk]= cast(kaikkivuodet.opisk as int)
      ,[tutk]= cast(kaikkivuodet.tutk as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	  ,rivinumero = cast(kaikkivuodet.rivinumero as int)

FROM (

SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi]= ''THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_12]
union all
SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_13]
union all
SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_14]
  union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_15]

   union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_16]

   union all
 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_17]

 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,(CASE WHEN [syntv] = 'XXXX' THEN '' else [syntv] end )as syntv
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_2_23_sopv_18]
 
 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] = (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
       ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) 
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_19] 
 
 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] --= (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) 
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_20]
 
 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] --= (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_21]  
 
 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] --= (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_22] 
 
 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] --= (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_23]
 
 UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] --= (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) 
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_24]

  UNION ALL

 SELECT [tilv]
      ,[sp]
      ,[syntv] --= (CASE left([syntv],3) WHEN '   ' THEN '9999' WHEN '190' THEN 100+[syntv] else syntv end)
      ,[aikielir1x]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[sose_isa1]
      ,[sose_aiti1]
      ,[sose_isa2]
      ,[sose_aiti2]
      ,[koulk_isa]
      ,[koulk_aiti]
      ,[tulo_isa]
      ,[tulo_aiti]
      ,[klaji]
      ,[ophal]
      ,[koulk]
      ,[kkieli]
      ,[kmaak]
      ,[alvv]
      ,[olosyys]
      ,(CASE WHEN [uusi] = '' THEN NULL else [uusi] end )as uusi
      ,(CASE WHEN [opisk] = '' THEN NULL else [opisk] end )as opisk
      ,(CASE WHEN [tutk] = '' THEN NULL else [tutk] end )as tutk
      ,[tietolahde]='2_23_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) 
  FROM [TK_H9098_CSC].[dbo].[TK_K2_23_sopv_25]

) as kaikkivuodet

GO


