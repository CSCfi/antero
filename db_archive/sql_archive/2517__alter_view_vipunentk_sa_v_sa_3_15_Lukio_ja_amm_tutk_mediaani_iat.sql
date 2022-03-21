USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat]    Script Date: 17.10.2019 13:11:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat] AS

-- truncate table vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat
-- insert into vipunentk_dw..sa_3_15_Lukio_ja_amm_tutk_mediaani_iat select * from v_sa_3_15_Lukio_ja_amm_tutk_mediaani_iat


SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = CASE WHEN lahde = 34 and tunn = '' THEN cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
			ELSE cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
			END   -- Ohjataan oppisopimuskoulutuksen lähteellä opjarj-muuttujan avain tyhjien arvojen tilalle - Lasse 26.5.2014

--	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,opjarj = cast(kaikkivuodet.opjarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,suorkk = cast(kaikkivuodet.suorkk as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutk = cast(kaikkivuodet.tutk as int)
	,tutklaja = cast(kaikkivuodet.tutklaja as nvarchar(1))
	,tutktav = cast(kaikkivuodet.tutktav as nvarchar(1))
	,ophal = 
		CASE
			WHEN lahde = 22 THEN '1'
			WHEN lahde = 23 THEN '1'    -- 13.5.2015 LR, Kansainväliset ylioppilastutkinnot ja gymnasieexamen, ohjattu opetushallinnon alaiseksi koulutukseksi
			ELSE cast(kaikkivuodet.ophal as nvarchar(1))
		END
	,aikoul = cast(kaikkivuodet.aikoul as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_12]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_13]
UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_2012_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_2012_sopv_14]

UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_2013_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_2013_sopv_14]

UNION ALL SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_15]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_16]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_17]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_15_sopv_18]

UNION ALL 

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,opjarj
	,koulk
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv
	,allk
	,suorv
	,suorkk
	,lkm
	,tutk
	,tutklaja
	,tutktav = NULL
	,ophal
	,aikoul
	,[tietolahde]='3_15_sopv_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_15_sopv_19]

) as kaikkivuodet





GO


USE [ANTERO]