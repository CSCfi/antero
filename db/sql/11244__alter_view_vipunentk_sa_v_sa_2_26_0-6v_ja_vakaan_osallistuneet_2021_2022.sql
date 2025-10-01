USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_26_0-6v_ja_vakaan_osallistuneet_2021_2022]    Script Date: 1.10.2025 10.08.21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER    VIEW [dbo].[v_sa_2_26_0-6v_ja_vakaan_osallistuneet_2021_2022] AS
SELECT [tilv] = cast(kaikkivuodet.tilv as nvarchar(4))
      ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	  ,[maakunta] = cast(kaikkivuodet.maakunta as nvarchar(100))
	  ,[vakaos] = cast(kaikkivuodet.vakaos as nvarchar(10))
	  ,[vaesto] = cast(kaikkivuodet.vaesto as nvarchar(5))
	  ,[sp] = cast(kaikkivuodet.sp as nvarchar(1))
	  ,[ika] = cast(kaikkivuodet.ika as nvarchar(4))
	  ,[syntyp2] = cast(kaikkivuodet.syntyp2 as nvarchar(10))
	  ,[tuloluokka] = cast(kaikkivuodet.tuloluokka as nvarchar(10))
	  ,[perhe] = cast(kaikkivuodet.perhe as nvarchar(10))
	  ,[pekoko] = cast(kaikkivuodet.pekoko as nvarchar(10))
	  ,[lkm] = cast(kaikkivuodet.lkm as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	  ,rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)

FROM (

SELECT [tilv]
      ,[maakunta]
      ,[vakaos]
      ,[vaesto]
      ,[sp]
      ,[ika]
      ,[syntyp2]
      ,[tuloluokka]
      ,[perhe]
      ,[pekoko]
      ,[lkm]
	  ,[tietolahde]='2_26_sopv_24'
FROM [TK_H9098_CSC].[dbo].[TK_K2_26_sopv_24]

UNION ALL

SELECT [tilv]
      ,[maakunta]
      ,[vakaos]
      ,[vaesto]
      ,[sp]
      ,[ika]
      ,[syntyp2]
      ,[tuloluokka]
      ,[perhe]
      ,[pekoko]
      ,[lkm]
	  ,[tietolahde]='2_26_sopv_25'
FROM [TK_H9098_CSC].[dbo].[TK_K2_26_sopv_25]

) as kaikkivuodet



GO


