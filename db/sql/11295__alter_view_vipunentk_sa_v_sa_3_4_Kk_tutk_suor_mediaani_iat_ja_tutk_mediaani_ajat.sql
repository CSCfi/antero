USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat]    Script Date: 16.10.2025 9.59.19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat] AS

-- truncate table vipunentk_dw..sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat
-- insert into vipunentk_dw..sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat select * from v_sa_3_4_Kk_tutk_suor_mediaani_iat_ja_tutk_mediaani_ajat

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,koultyp = cast(kaikkivuodet.koultyp as nvarchar(1))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1 as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,alvv_kk = cast(kaikkivuodet.alvv_kk as nvarchar(4))
	,allk_kk = cast(kaikkivuodet.allk_kk as nvarchar(1))
	,suorv = cast(kaikkivuodet.suorv as nvarchar(4))
	,suorkk = cast(kaikkivuodet.suorkk as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else alvv end --opoikv sopv17 lähtien
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else allk end --opoikv sopv17 lähtien
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_11] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else alvv end --opoikv sopv17 lähtien
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else allk end --opoikv sopv17 lähtien
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_12] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else alvv end --opoikv sopv17 lähtien
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else allk end --opoikv sopv17 lähtien
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_13] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else alvv end --opoikv sopv17 lähtien
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else allk end --opoikv sopv17 lähtien
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_14] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else alvv end --opoikv sopv17 lähtien
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else allk end --opoikv sopv17 lähtien
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_15] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else alvv end --opoikv sopv17 lähtien
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then null else allk end --opoikv sopv17 lähtien
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_16] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv) --select distinct allk
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_17] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_3_4_sopv_18] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_19'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_19] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_20'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_20] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_21'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_21] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_22'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_22] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	--,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoiklk else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_23'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_23] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	--,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoiklk else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_24'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_24] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk

UNION ALL 	

SELECT
	 tilv
	,lahde
	,tunn
	,jarj
	,koulk
	,koultyp
	,sp
	,aikielir1
	,syntv
	,synkk
	,alvv = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoikv else alvv end
	--,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then '2' else allk end
	,allk = case when d.Koulutusaste_taso2_koodi in ('81','82') then opoiklk else allk end
	,alvv_kk
	,allk_kk
	,suorv
	,suorkk
	,lkm
	,[tietolahde]='3_4_sopv_25'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K3_4_sopv_25] t
left join VipunenTK.dbo.d_koulutusluokitus d on d.koulutusluokitus_avain = t.koulk


) as kaikkivuodet




GO


