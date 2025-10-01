USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_26b_Vammaistuki_1-6v_ja_vakaan_osallistuneet_2021_2022]    Script Date: 1.10.2025 10.08.13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER      VIEW [dbo].[v_sa_2_26b_Vammaistuki_1-6v_ja_vakaan_osallistuneet_2021_2022] AS
SELECT [tilv] = cast(kaikkivuodet.tilv as nvarchar(4))
      ,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	  ,[maakunta] = cast(kaikkivuodet.maakunta as nvarchar(100))
	  ,[ikar_l] = cast(kaikkivuodet.ikar_l as nvarchar(10))
	  ,[vakaos] = cast(kaikkivuodet.vakaos as nvarchar(10))
	  ,[vtukia16perus] = cast(kaikkivuodet.vtukia16perus as nvarchar(1))
	  ,[vtukia16korotettu] = cast(kaikkivuodet.vtukia16korotettu as nvarchar(1))
	  ,[vtukia16ylin] = cast(kaikkivuodet.vtukia16ylin as nvarchar(1))
	  ,[lkm] = cast(kaikkivuodet.lkm as int)
   	  ,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	  ,rivinumero = ROW_NUMBER() OVER(ORDER BY tilv)

FROM (

SELECT [tilv]
      ,[maakunta]
      ,[ikar_l]
      ,[vakaos]
      ,[vtukia16perus]
      ,[vtukia16korotettu]
      ,[vtukia16ylin]
      ,[lkm]
	  ,[tietolahde]='2_26b_sopv_24'
FROM [TK_H9098_CSC].[dbo].[TK_K2_26b_sopv_24]

UNION ALL

SELECT [tilv]
      ,[maakunta]
      ,[ikar_l]
      ,[vakaos]
      ,[vtukia16perus]
      ,[vtukia16korotettu]
      ,[vtukia16ylin]
      ,[lkm]
	  ,[tietolahde]='2_26b_sopv_25'
FROM [TK_H9098_CSC].[dbo].[TK_K2_26b_sopv_25]
-- Suodatuksen voi poistaa kun aineisto ei sisällä enää tuplarivejä
WHERE luontipvm is not null

) as kaikkivuodet




GO


