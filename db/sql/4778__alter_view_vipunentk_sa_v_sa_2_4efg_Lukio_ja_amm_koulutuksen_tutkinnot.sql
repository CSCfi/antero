USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]    Script Date: 19.8.2021 0:07:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot] AS

-- truncate table vipunentk_dw.dbo.sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot
-- insert into vipunentk_dw.dbo.sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot select * from vipunentk_sa.[dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]
-- select * into vipunentk_dw.dbo.sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot from vipunentk_sa.[dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]

SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk , ''), '-1') as nvarchar(6))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	,ophal = cast(coalesce(nullif(kaikkivuodet.ophal , ''), '-1') as nvarchar(2))
	,sp = cast(coalesce(nullif(kaikkivuodet.sp , ''), '-1') as nvarchar(2))
	,aikielir1 = cast(coalesce(nullif(kaikkivuodet.aikielir1 , ''), '-1') as nvarchar(2))
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis , ''), '-1') as nvarchar(2))
	,koso = cast(kaikkivuodet.koso as nvarchar(1))
	,opso = cast(kaikkivuodet.opso as nvarchar(1))
	,ika2 = cast(coalesce(nullif(kaikkivuodet.ika2, ''), '-1') as nvarchar(15))
	,lkm = cast(kaikkivuodet.lkm as int)
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutalv = cast(coalesce(nullif(kaikkivuodet.tutalv , ''), '-1') as nvarchar(4))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tunim = cast(coalesce(nullif(kaikkivuodet.tunim , ''), '-1') as nvarchar(255))
	,sutunim = cast(coalesce(nullif(kaikkivuodet.sutunim , ''), '-1') as nvarchar(255))
	,rutunim = cast(coalesce(nullif(kaikkivuodet.rutunim , ''), '-1') as nvarchar(255))
	,koohj = cast(coalesce(nullif(kaikkivuodet.koohj , ''), '-1') as nvarchar(100))
	,sukoohj = cast(coalesce(nullif(kaikkivuodet.sukoohj , ''), '-1') as nvarchar(100))
	,rukoohj = cast(coalesce(nullif(kaikkivuodet.rukoohj , ''), '-1') as nvarchar(100))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,rahoitus = cast(cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as int) as nvarchar(2))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'-1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,tutalk =  cast(coalesce(nullif(kaikkivuodet.tutalk,''),'-1')  as nvarchar(2))
	,hyvennen =  cast(kaikkivuodet.hyvennen AS int)
	,hyvaik =  cast(kaikkivuodet.hyvaik AS int)
	,suorkouaik =  cast(kaikkivuodet.suorkouaik AS int)
	,ovyht =  cast(kaikkivuodet.ovyht AS int)
	,tyop =  cast(kaikkivuodet.tyop AS int)
	,ammos =  cast(kaikkivuodet.ammos AS int)
	,opintokok =  cast(kaikkivuodet.opintokok AS int)
	,vayla =  cast(coalesce(nullif(kaikkivuodet.vayla,''),'-1')  as nvarchar(2))
	,toteuma_tutk =  cast(coalesce(nullif(kaikkivuodet.toteuma_tutk,''),'-1')  as nvarchar(2))
	,suorosat =  cast(kaikkivuodet.suorosat AS int)
	,jarj_opisk =  cast(coalesce(nullif(kaikkivuodet.jarj_opisk,''),'-1')  as nvarchar(10))
	,kkun_opisk =  cast(coalesce(nullif(kaikkivuodet.kkun_opisk,''),'-1')  as nvarchar(3))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (
/*
--Historia-aineisto
SELECT
	  [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='8_1_Historia_tutkinnot'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].TK_8_1_sopv_16

UNION ALL
*/
SELECT
	  [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4e_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4e_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4f_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4f_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4g_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4e_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4e_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4f_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4f_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4g_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4e_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4e_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4f_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4f_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen]
	  ,[hyvaik]
	  ,[suorkouaik]
	  ,[ovyht]
	  ,[tyop]
	  ,[ammos]
	  ,[opintokok]
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4g_sopv_16]


union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4e_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4e_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4f_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4f_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4g_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4e_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4e_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4f_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4f_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_4g_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav] = NULL
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4e_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4e_sopv_19]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav] = NULL
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4f_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4f_sopv_19]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim]
      ,[sutunim]
      ,[rutunim]
      ,[koohj]
      ,[sukoohj]
      ,[rukoohj]
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk]
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla]
	  ,[toteuma_tutk]
	  ,[suorosat]
	  ,[jarj_opisk]
	  ,[kkun_opisk]
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_4g_sopv_19]

union all

--e ja f aineistosta K2.4h tilastovuodesta 2019 alkaen
SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso
	  ,opso
	  ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = alvv --ikälaskentaa varten
      ,[tutklaja]
      ,[tunim]
      ,[sutunim] = NULL
      ,[rutunim] = NULL
      ,[koohj]
      ,[sukoohj] = NULL
      ,[rukoohj] = NULL
      ,[tutktav] = NULL
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk] = allk 
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla] = NULL
	  ,[toteuma_tutk]
	  ,[suorosat] = NULL
	  ,[jarj_opisk] 
	  ,[kkun_opisk] 
	  ,[tietolahde]='K2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2019_sopv_21]
WHERE toteuma_tutk is not null
UNION ALL
SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj] = NULL
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal] = NULL
      ,[sp]
      ,[aikielir1]
      ,[aiopis] = NULL
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
      ,[tutklaja] = NULL
      ,[tunim] = NULL
      ,[sutunim] = NULL
      ,[rutunim] = NULL
      ,[koohj] = NULL
      ,[sukoohj] = NULL
      ,[rukoohj] = NULL
      ,[tutktav] = NULL
      ,[rahoitus] = NULL
      ,[tavoite] = NULL
	  ,[tutalk] = NULL
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla] = NULL
	  ,[toteuma_tutk] = NULL
	  ,[suorosat] = NULL
	  ,[jarj_opisk] = NULL
	  ,[kkun_opisk] = NULL
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_20'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4g_sopv_20]

UNION ALL

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[aiopis]
      ,koso
	  ,opso
	  ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = alvv --ikälaskentaa varten
      ,[tutklaja]
      ,[tunim]
      ,[sutunim] = NULL
      ,[rutunim] = NULL
      ,[koohj]
      ,[sukoohj] = NULL
      ,[rukoohj] = NULL
      ,[tutktav] = NULL
      ,[rahoitus]
      ,[tavoite]
	  ,[tutalk] = allk
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla] = NULL
	  ,[toteuma_tutk]
	  ,[suorosat] = NULL
	  ,[jarj_opisk] 
	  ,[kkun_opisk] 
	  ,[tietolahde]='K2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2020_sopv_21]
WHERE toteuma_tutk is not null
UNION ALL
SELECT
	   [tilv]
      ,[lahde]
      ,[jarj]
      ,[opjarj] = NULL
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal] = NULL
      ,[sp]
      ,[aikielir1]
      ,[aiopis] = NULL
      ,koso = null
	  ,opso = null
	  ,[ika2]
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
      ,[tutklaja] = NULL
      ,[tunim] = NULL
      ,[sutunim] = NULL
      ,[rutunim] = NULL
      ,[koohj] = NULL
      ,[sukoohj] = NULL
      ,[rukoohj] = NULL
      ,[tutktav] = NULL
      ,[rahoitus] = NULL
      ,[tavoite] = NULL
	  ,[tutalk] = NULL
	  ,[hyvennen] = NULL
	  ,[hyvaik] = NULL
	  ,[suorkouaik] = NULL
	  ,[ovyht] = NULL
	  ,[tyop] = NULL
	  ,[ammos] = NULL
	  ,[opintokok] = NULL
	  ,[vayla] = NULL
	  ,[toteuma_tutk] = NULL
	  ,[suorosat] = NULL
	  ,[jarj_opisk] = NULL
	  ,[kkun_opisk] = NULL
	  ,[tietolahde]='2_4g_Lukio_ja_amm_koulutuksen_opiskelijat_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4g_sopv_21]

) kaikkivuodet


GO


