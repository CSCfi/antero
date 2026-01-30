USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]    Script Date: 23.1.2026 10.54.28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











--HUOM! Sisältää aineistot 1.21, 1.22, 1.21b ja 1.22b.

--drop table VipunenTK_DW.dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat
--select * into VipunenTK_DW.dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat from [dbo].[v_sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]
--truncate table VipunenTK_DW.dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat
--insert VipunenTK_DW.dbo.sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat select * from [dbo].[v_sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat]


ALTER VIEW [dbo].[v_sa_1_21_1_22_Jatkuva_oppiminen_uudet_opiskelijat] AS

SELECT
	 [tilv] = cast(kaikkivuodet.[tilv] as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.[tilv]+'0101' as date)
	,[lahde] = cast(coalesce(nullif(kaikkivuodet.[lahde],''),'-1') as nvarchar(2))
	,[sp] = cast(coalesce(nullif(kaikkivuodet.[sp],''),'-1') as nvarchar(2))
	,[ikar8] = cast(coalesce(nullif(kaikkivuodet.[ikar8],''),'-1') as nvarchar(2))
	,[syntyp2] = cast(coalesce(nullif(kaikkivuodet.[syntyp2],''),'-1') as nvarchar(2))
	,[ptoim1r6e] = cast(coalesce(nullif(kaikkivuodet.[ptoim1r6e],''),'-1') as nvarchar(2))
	,[tol2008_1_v2] = cast(coalesce(nullif(kaikkivuodet.[tol2008_1_v2],''),'-1') as nvarchar(2))
	,[sosee] = cast(coalesce(nullif(kaikkivuodet.[sosee],''),'-1') as nvarchar(2))
	,[pientul] = cast(coalesce(nullif(kaikkivuodet.[pientul],''),'-1') as nvarchar(2))
    ,[tilvaskunsuuraluer2] = cast(coalesce(nullif(kaikkivuodet.[tilvaskunsuuraluer2],''),'-1') as nvarchar(2))
    ,[tilvaskunryh] = cast(coalesce(nullif(kaikkivuodet.[tilvaskunryh],''),'-1') as nvarchar(2))
	,[eitutkjoht] = cast(coalesce(nullif(kaikkivuodet.[eitutkjoht],''),'-1') as nvarchar(2))
	,[tavoite] = cast(coalesce(nullif(kaikkivuodet.[tavoite],''),'-1') as nvarchar(2))
	,[tyov] = cast(coalesce(nullif(kaikkivuodet.[tyov],''),'-1') as nvarchar(2))
	,[kaste_t2_3] = cast(coalesce(nullif(kaikkivuodet.[kaste_t2_3],''),'-1') as nvarchar(2))
	,[iscfi2013] = cast(coalesce(nullif(kaikkivuodet.[iscfi2013],''),'-1') as nvarchar(4))
	,[aikyo] = cast(coalesce(nullif(kaikkivuodet.[aikyo],''),'-1') as nvarchar(2))
	,[suorvyo] = cast(nullif(kaikkivuodet.[suorvyo],'') as nvarchar(4))
	,[aikpt] = cast(coalesce(nullif(kaikkivuodet.[aikpt],''),'-1') as nvarchar(2))
	,[suorvpt] = cast(nullif(kaikkivuodet.[suorvpt],'') as nvarchar(4))
	,[aikateat] = cast(coalesce(nullif(kaikkivuodet.[aikateat],''),'-1') as nvarchar(2))
	,[suorvateat] = cast(nullif(kaikkivuodet.[suorvateat],'') as nvarchar(4))
	,[aikamk] = cast(coalesce(nullif(kaikkivuodet.[aikamk],''),'-1') as nvarchar(2))
	,[suorvamk] = cast(nullif(kaikkivuodet.[suorvamk],'') as nvarchar(4))
	,[aikylamk] = cast(coalesce(nullif(kaikkivuodet.[aikylamk],''),'-1') as nvarchar(2))
	,[suorvylamk] = cast(nullif(kaikkivuodet.[suorvylamk],'') as nvarchar(4))
	,[aikalkk] = cast(coalesce(nullif(kaikkivuodet.[aikalkk],''),'-1') as nvarchar(2))
	,[suorvalkk] = cast(nullif(kaikkivuodet.[suorvalkk],'') as nvarchar(4))
	,[aikylkk] = cast(coalesce(nullif(kaikkivuodet.[aikylkk],''),'-1') as nvarchar(2))
	,[suorvylkk] = cast(nullif(kaikkivuodet.[suorvylkk],'') as nvarchar(4))
	,[lkm] = cast(kaikkivuodet.[lkm] as int)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(50))
	
FROM (

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_22_2017]

	UNION ALL
	
	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_22_2017]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_22_2018]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_22_2018]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_22_2019]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_22_2019]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_22_2020]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat]
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.22' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22_sopv_22_2020]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_22_2020]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.22b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22b_sopv_22_2020]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_22_2021]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat]
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.22' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22_sopv_22_2021]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_22_2021]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.22b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22b_sopv_22_2021]

    UNION ALL

    SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_23]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat]
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.22' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22_sopv_23]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_23]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.22b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22b_sopv_23]
  
    UNION ALL

    SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_24]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat]
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.22' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22_sopv_24]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.21b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21b_sopv_24]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2] = null
      ,[tilvaskunryh] = null
      ,[syntyp2] = null
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo] = null
	  ,[aikpt]
	  ,[suorvpt] = null
	  ,[aikateat]
	  ,[suorvateat] = null
      ,[aikamk]
      ,[suorvamk] = null
      ,[aikylamk]
      ,[suorvylamk] = null
      ,[aikalkk]
      ,[suorvalkk] = null
      ,[aikylkk]
      ,[suorvylkk] = null
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul]
	  ,[tol2008_1_v2]
	  ,[aineisto] = '1.22b' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22b_sopv_24]

	-- sopv25: alkuvuonna vain 1.21 ja 1.22. Kessällä b-aineistot

    UNION ALL

    SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3]
      ,[iscfi2013]
	  ,[eitutkjoht] = null
      ,[tyov]
      ,[tavoite]
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat] 
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.21' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_21_sopv_25]

	UNION ALL

	SELECT [tilv]
      ,[lahde]
      ,[ikar8]
      ,[sp]
      ,[tilvaskunsuuraluer2]
      ,[tilvaskunryh]
      ,[syntyp2]
      ,[kaste_t2_3] = null
      ,[iscfi2013] = null
	  ,[eitutkjoht]
      ,[tyov]
      ,[tavoite] = null
      ,[aikyo]
      ,[suorvyo]
	  ,[aikpt]
	  ,[suorvpt]
	  ,[aikateat]
	  ,[suorvateat]
      ,[aikamk]
      ,[suorvamk]
      ,[aikylamk]
      ,[suorvylamk]
      ,[aikalkk]
      ,[suorvalkk]
      ,[aikylkk]
      ,[suorvylkk]
      ,[ptoim1r6e]
      ,[sosee]
      ,[lkm]
	  ,[pientul] = null
	  ,[tol2008_1_v2] = null
	  ,[aineisto] = '1.22' --käytetään piilosuodattimena
      ,[luontipvm]
	FROM [TK_H9098_CSC].[dbo].[TK_K1_22_sopv_25]

	--HUOM! Sisältää aineistot 1.21, 1.22, 1.21b ja 1.22b.

) as kaikkivuodet




GO


