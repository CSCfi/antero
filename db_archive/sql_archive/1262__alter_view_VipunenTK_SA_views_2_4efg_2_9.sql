USE [VipunenTK_SA]
GO
/****** Object:  View [dbo].[v_sa_2_9_Korkeakoulut_tutkinnot]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_9_Korkeakoulut_tutkinnot]
GO
/****** Object:  View [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat]
GO
/****** Object:  View [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat]
GO
/****** Object:  View [dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]
GO
/****** Object:  View [dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]
GO
/****** Object:  View [dbo].[v_sa_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_5_Lukiokoulutuksen_ainevalinnat]
GO
/****** Object:  View [dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]    Script Date: 23.2.2018 16:20:39 ******/
DROP VIEW [dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]
GO
/****** Object:  View [dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dbo].[v_sa_2_4efg_Lukio_ja_amm_koulutuksen_tutkinnot] AS


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
	,rahoitus = cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as nvarchar(2))
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

) kaikkivuodet





GO
/****** Object:  View [dbo].[v_sa_2_5_Lukiokoulutuksen_ainevalinnat]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[v_sa_2_5_Lukiokoulutuksen_ainevalinnat] AS
--Select * from v_sa_2_5_Lukiokoulutuksen_ainevalinnat
/*
Drop table VipunenTK_DW.[dbo].sa_2_5_Lukiokoulutuksen_ainevalinnat
Select * into VipunenTK_DW.[dbo].sa_2_5_Lukiokoulutuksen_ainevalinnat from v_sa_2_5_Lukiokoulutuksen_ainevalinnat

truncate table VipunenTK_DW.[dbo].sa_2_5_Lukiokoulutuksen_ainevalinnat
insert into VipunenTK_DW.[dbo].sa_2_5_Lukiokoulutuksen_ainevalinnat select * from v_sa_2_5_Lukiokoulutuksen_ainevalinnat
*/

SELECT
       [tilv] = Cast(tilv as nvarchar(4))
      ,[tunn] = Cast(tunn as nvarchar(5))
      ,[jarj] = Cast(jarj as nvarchar(10))
      ,[nukevy] = Nullif(Cast(nukevy as int), 0)
      ,[aikevy] = Nullif(Cast(aikevy as int), 0)
      ,[kev] = Nullif(Cast(kev as int), 0)
      ,[nukevyn] = Nullif(Cast(nukevyn as int), 0)
      ,[aikevyn] = Nullif(Cast(aikevyn as int), 0)
      ,[kevn] = Nullif(Cast(kevn as int), 0)
      ,[nukev1] = Nullif(Cast(nukev1 as int), 0)
      ,[nukev2] = Nullif(Cast(nukev2 as int), 0)
      ,[nukev3] = Nullif(Cast(nukev3 as int), 0)
      ,[nukev4] = Nullif(Cast(nukev4 as int), 0)
      ,[nukev] = Nullif(Cast(nukev as int), 0)
      ,[nukev1n] = Nullif(Cast(nukev1n as int), 0)
      ,[nukev2n] = Nullif(Cast(nukev2n as int), 0)
      ,[nukev3n] = Nullif(Cast(nukev3n as int), 0)
      ,[nukev4n] = Nullif(Cast(nukev4n as int), 0)
      ,[nukevn] = Nullif(Cast(nukevn as int), 0)
      ,[aikev1] = Nullif(Cast(aikev1 as int), 0)
      ,[aikev2] = Nullif(Cast(aikev2 as int), 0)
      ,[aikev3] = Nullif(Cast(aikev3 as int), 0)
      ,[aikev4] = Nullif(Cast(aikev4 as int), 0)
      ,[aikev] = Nullif(Cast(aikev as int), 0)
      ,[aikev1n] = Nullif(Cast(aikev1n as int), 0)
      ,[aikev2n] = Nullif(Cast(aikev2n as int), 0)
      ,[aikev3n] = Nullif(Cast(aikev3n as int), 0)
      ,[aikev4n] = Nullif(Cast(aikev4n as int), 0)
      ,[aikevn] = Nullif(Cast(aikevn as int), 0)
      ,[nuvary] = Nullif(Cast(nuvary as int), 0)
      ,[aivary] = Nullif(Cast(aivary as int), 0)
      ,[var] = Nullif(Cast(var as int), 0)
      ,[nuvaryn] = Nullif(Cast(nuvaryn as int), 0)
      ,[aivaryn] = Nullif(Cast(aivaryn as int), 0)
      ,[varn] = Nullif(Cast(varn as int), 0)
      ,[nuyks] = Nullif(Cast(nuyks as int), 0)
      ,[aiyks] = Nullif(Cast(aiyks as int), 0)
      ,[yksy] = Nullif(Cast(yksy as int), 0)
      ,[nuvar2] = Nullif(Cast(nuvar2 as int), 0)
      ,[nuvar25] = Nullif(Cast(nuvar25 as int), 0)
      ,[nuvar3] = Nullif(Cast(nuvar3 as int), 0)
      ,[nuvar35] = Nullif(Cast(nuvar35 as int), 0)
      ,[nuvar4] = Nullif(Cast(nuvar4 as int), 0)
      ,[nuvar45] = Nullif(Cast(nuvar45 as int), 0)
      ,[nuvar5] = Nullif(Cast(nuvar5 as int), 0)
      ,[nuvar] = Nullif(Cast(nuvar as int), 0)
      ,[nuvar2n] = Nullif(Cast(nuvar2n as int), 0)
      ,[nuvar25n] = Nullif(Cast(nuvar25n as int), 0)
      ,[nuvar3n] = Nullif(Cast(nuvar3n as int), 0)
      ,[nuvar35n] = Nullif(Cast(nuvar35n as int), 0)
      ,[nuvar4n] = Nullif(Cast(nuvar4n as int), 0)
      ,[nuvar45n] = Nullif(Cast(nuvar45n as int), 0)
      ,[nuvar5n] = Nullif(Cast(nuvar5n as int), 0)
      ,[nuvarn] = Nullif(Cast(nuvarn as int), 0)
      ,[aivar2] = Nullif(Cast(aivar2 as int), 0)
      ,[aivar25] = Nullif(Cast(aivar25 as int), 0)
      ,[aivar3] = Nullif(Cast(aivar3 as int), 0)
      ,[aivar35] = Nullif(Cast(aivar35 as int), 0)
      ,[aivar4] = Nullif(Cast(aivar4 as int), 0)
      ,[aivar45] = Nullif(Cast(aivar45 as int), 0)
      ,[aivar5] = Nullif(Cast(aivar5 as int), 0)
      ,[aivar] = Nullif(Cast(aivar as int), 0)
      ,[aivar2n] = Nullif(Cast(aivar2n as int), 0)
      ,[aivar25n] = Nullif(Cast(aivar25n as int), 0)
      ,[aivar3n] = Nullif(Cast(aivar3n as int), 0)
      ,[aivar35n] = Nullif(Cast(aivar35n as int), 0)
      ,[aivar4n] = Nullif(Cast(aivar4n as int), 0)
      ,[aivar45n] = Nullif(Cast(aivar45n as int), 0)
      ,[aivar5n] = Nullif(Cast(aivar5n as int), 0)
      ,[aivarn] = Nullif(Cast(aivarn as int), 0)
      ,[ev] = Nullif(Cast(ev as int), 0)
      ,[ort] = Nullif(Cast(ort as int), 0)
      ,[et] = Nullif(Cast(et as int), 0)
      ,[mu] = Nullif(Cast(mu as int), 0)
      ,[eos] = Nullif(Cast(eos as int), 0)
      ,[kay] = Nullif(Cast(kay as int), 0)
      ,[kieli1] = Nullif(Cast(kieli1 as int), 0)
      ,[kieli2] = Nullif(Cast(kieli2 as int), 0)
      ,[kieli3] = Nullif(Cast(kieli3 as int), 0)
      ,[kieli4] = Nullif(Cast(kieli4 as int), 0)
      ,[kieli5] = Nullif(Cast(kieli5 as int), 0)
      ,[kieli6] = Nullif(Cast(kieli6 as int), 0)
      ,[kieliy] = Nullif(Cast(kieliy as int), 0)
      ,[sv] = Nullif(Cast(sv as int), 0)
      ,[rv] = Nullif(Cast(rv as int), 0)
      ,[svrv] = Nullif(Cast(svrv as int), 0)
      ,[svnn] = Nullif(Cast(svnn as int), 0)
      ,[rvnn] = Nullif(Cast(rvnn as int), 0)
      ,[svrvn] = Nullif(Cast(svrvn as int), 0)
      ,[yaenm] = Nullif(Cast(yaenm as int), 0)
      ,[yyenm] = Nullif(Cast(yyenm as int), 0)
      ,[yen6m] = Nullif(Cast(yen6m as int), 0)
      ,[len6m] = Nullif(Cast(len6m as int), 0)
      ,[alen6m] = Nullif(Cast(alen6m as int), 0)
      ,[enmm] = Nullif(Cast(enmm as int), 0)
      ,[yaenn] = Nullif(Cast(yaenn as int), 0)
      ,[yyenn] = Nullif(Cast(yyenn as int), 0)
      ,[yen6n] = Nullif(Cast(yen6n as int), 0)
      ,[len6n] = Nullif(Cast(len6n as int), 0)
      ,[alen6n] = Nullif(Cast(alen6n as int), 0)
      ,[ennn] = Nullif(Cast(ennn as int), 0)
      ,[yarum] = Nullif(Cast(yarum as int), 0)
      ,[yyrum] = Nullif(Cast(yyrum as int), 0)
      ,[yru6m] = Nullif(Cast(yru6m as int), 0)
      ,[lru6m] = Nullif(Cast(lru6m as int), 0)
      ,[alru6m] = Nullif(Cast(alru6m as int), 0)
      ,[rumm] = Nullif(Cast(rumm as int), 0)
      ,[yarun] = Nullif(Cast(yarun as int), 0)
      ,[yyrun] = Nullif(Cast(yyrun as int), 0)
      ,[yru6n] = Nullif(Cast(yru6n as int), 0)
      ,[lru6n] = Nullif(Cast(lru6n as int), 0)
      ,[alru6n] = Nullif(Cast(alru6n as int), 0)
      ,[runn] = Nullif(Cast(runn as int), 0)
      ,[yasum] = Nullif(Cast(yasum as int), 0)
      ,[yysum] = Nullif(Cast(yysum as int), 0)
      ,[ysu6m] = Nullif(Cast(ysu6m as int), 0)
      ,[lsu6m] = Nullif(Cast(lsu6m as int), 0)
      ,[alsu6m] = Nullif(Cast(alsu6m as int), 0)
      ,[summ] = Nullif(Cast(summ as int), 0)
      ,[yasun] = Nullif(Cast(yasun as int), 0)
      ,[yysun] = Nullif(Cast(yysun as int), 0)
      ,[ysu6n] = Nullif(Cast(ysu6n as int), 0)
      ,[lsu6n] = Nullif(Cast(lsu6n as int), 0)
      ,[alsu6n] = Nullif(Cast(alsu6n as int), 0)
      ,[sunn] = Nullif(Cast(sunn as int), 0)
      ,[yaram] = Nullif(Cast(yaram as int), 0)
      ,[yyram] = Nullif(Cast(yyram as int), 0)
      ,[yra6m] = Nullif(Cast(yra6m as int), 0)
      ,[lra6m] = Nullif(Cast(lra6m as int), 0)
      ,[alra6m] = Nullif(Cast(alra6m as int), 0)
      ,[ramm] = Nullif(Cast(ramm as int), 0)
      ,[yaran] = Nullif(Cast(yaran as int), 0)
      ,[yyran] = Nullif(Cast(yyran as int), 0)
      ,[yra6n] = Nullif(Cast(yra6n as int), 0)
      ,[lra6n] = Nullif(Cast(lra6n as int), 0)
      ,[alra6n] = Nullif(Cast(alra6n as int), 0)
      ,[rann] = Nullif(Cast(rann as int), 0)
      ,[yasam] = Nullif(Cast(yasam as int), 0)
      ,[yysam] = Nullif(Cast(yysam as int), 0)
      ,[ysa6m] = Nullif(Cast(ysa6m as int), 0)
      ,[lsa6m] = Nullif(Cast(lsa6m as int), 0)
      ,[alsa6m] = Nullif(Cast(alsa6m as int), 0)
      ,[samm] = Nullif(Cast(samm as int), 0)
      ,[yasan] = Nullif(Cast(yasan as int), 0)
      ,[yysan] = Nullif(Cast(yysan as int), 0)
      ,[ysa6n] = Nullif(Cast(ysa6n as int), 0)
      ,[lsa6n] = Nullif(Cast(lsa6n as int), 0)
      ,[alsa6n] = Nullif(Cast(alsa6n as int), 0)
      ,[sann] = Nullif(Cast(sann as int), 0)
      ,[yavem] = Nullif(Cast(yavem as int), 0)
      ,[yyvem] = Nullif(Cast(yyvem as int), 0)
      ,[yve6m] = Nullif(Cast(yve6m as int), 0)
      ,[lve6m] = Nullif(Cast(lve6m as int), 0)
      ,[alve6m] = Nullif(Cast(alve6m as int), 0)
      ,[vemm] = Nullif(Cast(vemm as int), 0)
      ,[yaven] = Nullif(Cast(yaven as int), 0)
      ,[yyven] = Nullif(Cast(yyven as int), 0)
      ,[yve6n] = Nullif(Cast(yve6n as int), 0)
      ,[lve6n] = Nullif(Cast(lve6n as int), 0)
      ,[alve6n] = Nullif(Cast(alve6n as int), 0)
      ,[vennn] = Nullif(Cast(vennn as int), 0)
      ,[yasaam] = Nullif(Cast(yasaam as int), 0)
      ,[ysaa6m] = Nullif(Cast(ysaa6m as int), 0)
      ,[lsaa6m] = Nullif(Cast(lsaa6m as int), 0)
      ,[alsaa6m] = Nullif(Cast(alsaa6m as int), 0)
      ,[saamm] = Nullif(Cast(saamm as int), 0)
      ,[yasaan] = Nullif(Cast(yasaan as int), 0)
      ,[ysaa6n] = Nullif(Cast(ysaa6n as int), 0)
      ,[lsaa6n] = Nullif(Cast(lsaa6n as int), 0)
      ,[alsaa6n] = Nullif(Cast(alsaa6n as int), 0)
      ,[saann] = Nullif(Cast(saann as int), 0)
      ,[yalatm] = Nullif(Cast(yalatm as int), 0)
      ,[ylat6m] = Nullif(Cast(ylat6m as int), 0)
      ,[lla6m] = Nullif(Cast(lla6m as int), 0)
      ,[alla6m] = Nullif(Cast(alla6m as int), 0)
      ,[lamm] = Nullif(Cast(lamm as int), 0)
      ,[yalan] = Nullif(Cast(yalan as int), 0)
      ,[ylat6n] = Nullif(Cast(ylat6n as int), 0)
      ,[lla6n] = Nullif(Cast(lla6n as int), 0)
      ,[alla6n] = Nullif(Cast(alla6n as int), 0)
      ,[lann] = Nullif(Cast(lann as int), 0)
      ,[yaesm] = Nullif(Cast(yaesm as int), 0)
      ,[yes6m] = Nullif(Cast(yes6m as int), 0)
      ,[les6m] = Nullif(Cast(les6m as int), 0)
      ,[ales6m] = Nullif(Cast(ales6m as int), 0)
      ,[esmm] = Nullif(Cast(esmm as int), 0)
      ,[yaesn] = Nullif(Cast(yaesn as int), 0)
      ,[yes6n] = Nullif(Cast(yes6n as int), 0)
      ,[les6n] = Nullif(Cast(les6n as int), 0)
      ,[ales6n] = Nullif(Cast(ales6n as int), 0)
      ,[esnn] = Nullif(Cast(esnn as int), 0)
      ,[yaitm] = Nullif(Cast(yaitm as int), 0)
      ,[yit6m] = Nullif(Cast(yit6m as int), 0)
      ,[lit6m] = Nullif(Cast(lit6m as int), 0)
      ,[alit6m] = Nullif(Cast(alit6m as int), 0)
      ,[itmm] = Nullif(Cast(itmm as int), 0)
      ,[yaitn] = Nullif(Cast(yaitn as int), 0)
      ,[yit6n] = Nullif(Cast(yit6n as int), 0)
      ,[lit6n] = Nullif(Cast(lit6n as int), 0)
      ,[alit6n] = Nullif(Cast(alit6n as int), 0)
      ,[itnn] = Nullif(Cast(itnn as int), 0)
      ,[yamum] = Nullif(Cast(yamum as int), 0)
      ,[yymum] = Nullif(Cast(yymum as int), 0)
      ,[ymu6m] = Nullif(Cast(ymu6m as int), 0)
      ,[lmu6m] = Nullif(Cast(lmu6m as int), 0)
      ,[almu6m] = Nullif(Cast(almu6m as int), 0)
      ,[mumm] = Nullif(Cast(mumm as int), 0)
      ,[yamun] = Nullif(Cast(yamun as int), 0)
      ,[yymun] = Nullif(Cast(yymun as int), 0)
      ,[ymu6n] = Nullif(Cast(ymu6n as int), 0)
      ,[lmu6n] = Nullif(Cast(lmu6n as int), 0)
      ,[almu6n] = Nullif(Cast(almu6n as int), 0)
      ,[munn] = Nullif(Cast(munn as int), 0)
      ,[yyvam] = Nullif(Cast(yyvam as int), 0)
      ,[vamm] = Nullif(Cast(vamm as int), 0)
      ,[yyvan] = Nullif(Cast(yyvan as int), 0)
      ,[vann] = Nullif(Cast(vann as int), 0)
      ,[pmatm] = Nullif(Cast(pmatm as int), 0)
      ,[pmatn] = Nullif(Cast(pmatn as int), 0)
      ,[pmaty] = Nullif(Cast(pmaty as int), 0)
      ,[lmatm] = Nullif(Cast(lmatm as int), 0)
      ,[lmatn] = Nullif(Cast(lmatn as int), 0)
      ,[lmaty] = Nullif(Cast(lmaty as int), 0)
      ,[matm] = Nullif(Cast(matm as int), 0)
      ,[matn] = Nullif(Cast(matn as int), 0)
      ,[maty] = Nullif(Cast(maty as int), 0)
      ,[pma1m] = Nullif(Cast(pma1m as int), 0)
      ,[pma1n] = Nullif(Cast(pma1n as int), 0)
      ,[pma2m] = Nullif(Cast(pma2m as int), 0)
      ,[pma2n] = Nullif(Cast(pma2n as int), 0)
      ,[pma3m] = Nullif(Cast(pma3m as int), 0)
      ,[pma3n] = Nullif(Cast(pma3n as int), 0)
      ,[pma45m] = Nullif(Cast(pma45m as int), 0)
      ,[pma45n] = Nullif(Cast(pma45n as int), 0)
      ,[pma6m] = Nullif(Cast(pma6m as int), 0)
      ,[pma6n] = Nullif(Cast(pma6n as int), 0)
      ,[pma7m] = Nullif(Cast(pma7m as int), 0)
      ,[pma7n] = Nullif(Cast(pma7n as int), 0)
      ,[lma1m] = Nullif(Cast(lma1m as int), 0)
      ,[lma1n] = Nullif(Cast(lma1n as int), 0)
      ,[lma2m] = Nullif(Cast(lma2m as int), 0)
      ,[lma2n] = Nullif(Cast(lma2n as int), 0)
      ,[lma3m] = Nullif(Cast(lma3m as int), 0)
      ,[lma3n] = Nullif(Cast(lma3n as int), 0)
      ,[lma45m] = Nullif(Cast(lma45m as int), 0)
      ,[lma45n] = Nullif(Cast(lma45n as int), 0)
      ,[lma6m] = Nullif(Cast(lma6m as int), 0)
      ,[lma6n] = Nullif(Cast(lma6n as int), 0)
      ,[lma7m] = Nullif(Cast(lma7m as int), 0)
      ,[lma7n] = Nullif(Cast(lma7n as int), 0)
      ,[fy1m] = Nullif(Cast(fy1m as int), 0)
      ,[fy1n] = Nullif(Cast(fy1n as int), 0)
      ,[fy2m] = Nullif(Cast(fy2m as int), 0)
      ,[fy2n] = Nullif(Cast(fy2n as int), 0)
      ,[fy3m] = Nullif(Cast(fy3m as int), 0)
      ,[fy3n] = Nullif(Cast(fy3n as int), 0)
      ,[fy45m] = Nullif(Cast(fy45m as int), 0)
      ,[fy45n] = Nullif(Cast(fy45n as int), 0)
      ,[fy6m] = Nullif(Cast(fy6m as int), 0)
      ,[fy6n] = Nullif(Cast(fy6n as int), 0)
      ,[fy7m] = Nullif(Cast(fy7m as int), 0)
      ,[fy7n] = Nullif(Cast(fy7n as int), 0)
      ,[ke1m] = Nullif(Cast(ke1m as int), 0)
      ,[ke1n] = Nullif(Cast(ke1n as int), 0)
      ,[ke2m] = Nullif(Cast(ke2m as int), 0)
      ,[ke2n] = Nullif(Cast(ke2n as int), 0)
      ,[ke3m] = Nullif(Cast(ke3m as int), 0)
      ,[ke3n] = Nullif(Cast(ke3n as int), 0)
      ,[ke45m] = Nullif(Cast(ke45m as int), 0)
      ,[ke45n] = Nullif(Cast(ke45n as int), 0)
      ,[ke6m] = Nullif(Cast(ke6m as int), 0)
      ,[ke6n] = Nullif(Cast(ke6n as int), 0)
      ,[ke7m] = Nullif(Cast(ke7m as int), 0)
      ,[ke7n] = Nullif(Cast(ke7n as int), 0)
      ,[bi1m] = Nullif(Cast(bi1m as int), 0)
      ,[bi1n] = Nullif(Cast(bi1n as int), 0)
      ,[bi2m] = Nullif(Cast(bi2m as int), 0)
      ,[bi2n] = Nullif(Cast(bi2n as int), 0)
      ,[bi3m] = Nullif(Cast(bi3m as int), 0)
      ,[bi3n] = Nullif(Cast(bi3n as int), 0)
      ,[bi45m] = Nullif(Cast(bi45m as int), 0)
      ,[bi45n] = Nullif(Cast(bi45n as int), 0)
      ,[bi6m] = Nullif(Cast(bi6m as int), 0)
      ,[bi6n] = Nullif(Cast(bi6n as int), 0)
      ,[bi7m] = Nullif(Cast(bi7m as int), 0)
      ,[bi7n] = Nullif(Cast(bi7n as int), 0)
      ,[mt1m] = Nullif(Cast(mt1m as int), 0)
      ,[mt1n] = Nullif(Cast(mt1n as int), 0)
      ,[mt2m] = Nullif(Cast(mt2m as int), 0)
      ,[mt2n] = Nullif(Cast(mt2n as int), 0)
      ,[mt3m] = Nullif(Cast(mt3m as int), 0)
      ,[mt3n] = Nullif(Cast(mt3n as int), 0)
      ,[mt45m] = Nullif(Cast(mt45m as int), 0)
      ,[mt45n] = Nullif(Cast(mt45n as int), 0)
      ,[mt6m] = Nullif(Cast(mt6m as int), 0)
      ,[mt6n] = Nullif(Cast(mt6n as int), 0)
      ,[mt7m] = Nullif(Cast(mt7m as int), 0)
      ,[mt7n] = Nullif(Cast(mt7n as int), 0)
      ,[soma2m] = Nullif(Cast(soma2m as int), 0)
      ,[soma2n] = Nullif(Cast(soma2n as int), 0)
      ,[soma3m] = Nullif(Cast(soma3m as int), 0)
      ,[soma3n] = Nullif(Cast(soma3n as int), 0)
      ,[sofy2m] = Nullif(Cast(sofy2m as int), 0)
      ,[sofy2n] = Nullif(Cast(sofy2n as int), 0)
      ,[sofy3m] = Nullif(Cast(sofy3m as int), 0)
      ,[sofy3n] = Nullif(Cast(sofy3n as int), 0)
      ,[soke2m] = Nullif(Cast(soke2m as int), 0)
      ,[soke2n] = Nullif(Cast(soke2n as int), 0)
      ,[soke3m] = Nullif(Cast(soke3m as int), 0)
      ,[soke3n] = Nullif(Cast(soke3n as int), 0)
      ,[sobi2m] = Nullif(Cast(sobi2m as int), 0)
      ,[sobi2n] = Nullif(Cast(sobi2n as int), 0)
      ,[sobi3m] = Nullif(Cast(sobi3m as int), 0)
      ,[sobi3n] = Nullif(Cast(sobi3n as int), 0)
      ,[somt2m] = Nullif(Cast(somt2m as int), 0)
      ,[somt2n] = Nullif(Cast(somt2n as int), 0)
      ,[somt3m] = Nullif(Cast(somt3m as int), 0)
      ,[somt3n] = Nullif(Cast(somt3n as int), 0)
      ,[sotek2m] = Nullif(Cast(sotek2m as int), 0)
      ,[sotek2n] = Nullif(Cast(sotek2n as int), 0)
      ,[sotek3m] = Nullif(Cast(sotek3m as int), 0)
      ,[sotek3n] = Nullif(Cast(sotek3n as int), 0)
      ,[tietolahde] = Cast(tietolahde as nvarchar(250))
      ,[rivinumero] = Cast(rivinumero as int)
FROM (
SELECT [tilv]
      ,[tunn]
      ,[jarj]
      ,[nukevy]
      ,[aikevy]
      ,[kev]
      ,[nukevyn]
      ,[aikevyn]
      ,[kevn]
      ,[nukev1]
      ,[nukev2]
      ,[nukev3]
      ,[nukev4]
      ,[nukev]
      ,[nukev1n]
      ,[nukev2n]
      ,[nukev3n]
      ,[nukev4n]
      ,[nukevn]
      ,[aikev1]
      ,[aikev2]
      ,[aikev3]
      ,[aikev4]
      ,[aikev]
      ,[aikev1n]
      ,[aikev2n]
      ,[aikev3n]
      ,[aikev4n]
      ,[aikevn]
      ,[nuvary]
      ,[aivary]
      ,[var]
      ,[nuvaryn]
      ,[aivaryn]
      ,[varn]
      ,[nuyks]
      ,[aiyks]
      ,[yksy]
      ,[nuvar2]
      ,[nuvar25]
      ,[nuvar3]
      ,[nuvar35]
      ,[nuvar4]
      ,[nuvar45]
      ,[nuvar5]
      ,[nuvar]
      ,[nuvar2n]
      ,[nuvar25n]
      ,[nuvar3n]
      ,[nuvar35n]
      ,[nuvar4n]
      ,[nuvar45n]
      ,[nuvar5n]
      ,[nuvarn]
      ,[aivar2]
      ,[aivar25]
      ,[aivar3]
      ,[aivar35]
      ,[aivar4]
      ,[aivar45]
      ,[aivar5]
      ,[aivar]
      ,[aivar2n]
      ,[aivar25n]
      ,[aivar3n]
      ,[aivar35n]
      ,[aivar4n]
      ,[aivar45n]
      ,[aivar5n]
      ,[aivarn]
      ,[ev]
      ,[ort]
      ,[et]
      ,[mu]
      ,[eos]
      ,[kay]
      ,[kieli1]
      ,[kieli2]
      ,[kieli3]
      ,[kieli4]
      ,[kieli5]
      ,[kieli6]
      ,[kieliy]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[svnn]
      ,[rvnn]
      ,[svrvn]
      ,[yaenm]
      ,[yyenm]
      ,[yen6m]
      ,[len6m]
      ,[alen6m]
      ,[enmm]
      ,[yaenn]
      ,[yyenn]
      ,[yen6n]
      ,[len6n]
      ,[alen6n]
      ,[ennn]
      ,[yarum]
      ,[yyrum]
      ,[yru6m]
      ,[lru6m]
      ,[alru6m]
      ,[rumm]
      ,[yarun]
      ,[yyrun]
      ,[yru6n]
      ,[lru6n]
      ,[alru6n]
      ,[runn]
      ,[yasum]
      ,[yysum]
      ,[ysu6m]
      ,[lsu6m]
      ,[alsu6m]
      ,[summ]
      ,[yasun]
      ,[yysun]
      ,[ysu6n]
      ,[lsu6n]
      ,[alsu6n]
      ,[sunn]
      ,[yaram]
      ,[yyram]
      ,[yra6m]
      ,[lra6m]
      ,[alra6m]
      ,[ramm]
      ,[yaran]
      ,[yyran]
      ,[yra6n]
      ,[lra6n]
      ,[alra6n]
      ,[rann]
      ,[yasam]
      ,[yysam]
      ,[ysa6m]
      ,[lsa6m]
      ,[alsa6m]
      ,[samm]
      ,[yasan]
      ,[yysan]
      ,[ysa6n]
      ,[lsa6n]
      ,[alsa6n]
      ,[sann]
      ,[yavem]
      ,[yyvem]
      ,[yve6m]
      ,[lve6m]
      ,[alve6m]
      ,[vemm]
      ,[yaven]
      ,[yyven]
      ,[yve6n]
      ,[lve6n]
      ,[alve6n]
      ,[vennn]
      ,[yasaam]
      ,[ysaa6m]
      ,[lsaa6m]
      ,[alsaa6m]
      ,[saamm]
      ,[yasaan]
      ,[ysaa6n]
      ,[lsaa6n]
      ,[alsaa6n]
      ,[saann]
      ,[yalatm]
      ,[ylat6m]
      ,[lla6m]
      ,[alla6m]
      ,[lamm]
      ,[yalan]
      ,[ylat6n]
      ,[lla6n]
      ,[alla6n]
      ,[lann]
      ,[yaesm]
      ,[yes6m]
      ,[les6m]
      ,[ales6m]
      ,[esmm]
      ,[yaesn]
      ,[yes6n]
      ,[les6n]
      ,[ales6n]
      ,[esnn]
      ,[yaitm]
      ,[yit6m]
      ,[lit6m]
      ,[alit6m]
      ,[itmm]
      ,[yaitn]
      ,[yit6n]
      ,[lit6n]
      ,[alit6n]
      ,[itnn]
      ,[yamum]
      ,[yymum]
      ,[ymu6m]
      ,[lmu6m]
      ,[almu6m]
      ,[mumm]
      ,[yamun]
      ,[yymun]
      ,[ymu6n]
      ,[lmu6n]
      ,[almu6n]
      ,[munn]
      ,[yyvam]
      ,[vamm]
      ,[yyvan]
      ,[vann]
      ,[pmatm]
      ,[pmatn]
      ,[pmaty]
      ,[lmatm]
      ,[lmatn]
      ,[lmaty]
      ,[matm]
      ,[matn]
      ,[maty]
      ,[pma1m]
      ,[pma1n]
      ,[pma2m]
      ,[pma2n]
      ,[pma3m]
      ,[pma3n]
      ,[pma45m]
      ,[pma45n]
      ,[pma6m]
      ,[pma6n]
      ,[pma7m]
      ,[pma7n]
      ,[lma1m]
      ,[lma1n]
      ,[lma2m]
      ,[lma2n]
      ,[lma3m]
      ,[lma3n]
      ,[lma45m]
      ,[lma45n]
      ,[lma6m]
      ,[lma6n]
      ,[lma7m]
      ,[lma7n]
      ,[fy1m]
      ,[fy1n]
      ,[fy2m]
      ,[fy2n]
      ,[fy3m]
      ,[fy3n]
      ,[fy45m]
      ,[fy45n]
      ,[fy6m]
      ,[fy6n]
      ,[fy7m]
      ,[fy7n]
      ,[ke1m]
      ,[ke1n]
      ,[ke2m]
      ,[ke2n]
      ,[ke3m]
      ,[ke3n]
      ,[ke45m]
      ,[ke45n]
      ,[ke6m]
      ,[ke6n]
      ,[ke7m]
      ,[ke7n]
      ,[bi1m]
      ,[bi1n]
      ,[bi2m]
      ,[bi2n]
      ,[bi3m]
      ,[bi3n]
      ,[bi45m]
      ,[bi45n]
      ,[bi6m]
      ,[bi6n]
      ,[bi7m]
      ,[bi7n]
      ,[mt1m]
      ,[mt1n]
      ,[mt2m]
      ,[mt2n]
      ,[mt3m]
      ,[mt3n]
      ,[mt45m]
      ,[mt45n]
      ,[mt6m]
      ,[mt6n]
      ,[mt7m]
      ,[mt7n]
      ,[soma2m]
      ,[soma2n]
      ,[soma3m]
      ,[soma3n]
      ,[sofy2m]
      ,[sofy2n]
      ,[sofy3m]
      ,[sofy3n]
      ,[soke2m]
      ,[soke2n]
      ,[soke3m]
      ,[soke3n]
      ,[sobi2m]
      ,[sobi2n]
      ,[sobi3m]
      ,[sobi3n]
      ,[somt2m]
      ,[somt2n]
      ,[somt3m]
      ,[somt3n]
      ,[sotek2m]
      ,[sotek2n]
      ,[sotek3m]
      ,[sotek3n]
      ,[tietolahde]='2_5_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, tunn)
      --,[rivinumero]
  FROM [TK_H9098_CSC].[dbo].[TK_2_5_sopv_11]

  UNION ALL

SELECT
	   [tilv]
      ,[tunn]
      ,[jarj]
      ,[nukevy]
      ,[aikevy]
      ,[kev]
      ,[nukevyn]
      ,[aikevyn]
      ,[kevn]
      ,[nukev1]
      ,[nukev2]
      ,[nukev3]
      ,[nukev4]
      ,[nukev]
      ,[nukev1n]
      ,[nukev2n]
      ,[nukev3n]
      ,[nukev4n]
      ,[nukevn]
      ,[aikev1]
      ,[aikev2]
      ,[aikev3]
      ,[aikev4]
      ,[aikev]
      ,[aikev1n]
      ,[aikev2n]
      ,[aikev3n]
      ,[aikev4n]
      ,[aikevn]
      ,[nuvary]
      ,[aivary]
      ,[var]
      ,[nuvaryn]
      ,[aivaryn]
      ,[varn]
      ,[nuyks]
      ,[aiyks]
      ,[yksy]
      ,[nuvar2]
      ,[nuvar25]
      ,[nuvar3]
      ,[nuvar35]
      ,[nuvar4]
      ,[nuvar45]
      ,[nuvar5]
      ,[nuvar]
      ,[nuvar2n]
      ,[nuvar25n]
      ,[nuvar3n]
      ,[nuvar35n]
      ,[nuvar4n]
      ,[nuvar45n]
      ,[nuvar5n]
      ,[nuvarn]
      ,[aivar2]
      ,[aivar25]
      ,[aivar3]
      ,[aivar35]
      ,[aivar4]
      ,[aivar45]
      ,[aivar5]
      ,[aivar]
      ,[aivar2n]
      ,[aivar25n]
      ,[aivar3n]
      ,[aivar35n]
      ,[aivar4n]
      ,[aivar45n]
      ,[aivar5n]
      ,[aivarn]
      ,[ev]
      ,[ort]
      ,[et]
      ,[mu]
      ,[eos]
      ,[kay]
      ,[kieli1]
      ,[kieli2]
      ,[kieli3]
      ,[kieli4]
      ,[kieli5]
      ,[kieli6]
      ,[kieliy]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[svnn]
      ,[rvnn]
      ,[svrvn]
      ,[yaenm]
      ,[yyenm]
      ,[yen6m]
      ,[len6m]
      ,[alen6m]
      ,[enmm]
      ,[yaenn]
      ,[yyenn]
      ,[yen6n]
      ,[len6n]
      ,[alen6n]
      ,[ennn]
      ,[yarum]
      ,[yyrum]
      ,[yru6m]
      ,[lru6m]
      ,[alru6m]
      ,[rumm]
      ,[yarun]
      ,[yyrun]
      ,[yru6n]
      ,[lru6n]
      ,[alru6n]
      ,[runn]
      ,[yasum]
      ,[yysum]
      ,[ysu6m]
      ,[lsu6m]
      ,[alsu6m]
      ,[summ]
      ,[yasun]
      ,[yysun]
      ,[ysu6n]
      ,[lsu6n]
      ,[alsu6n]
      ,[sunn]
      ,[yaram]
      ,[yyram]
      ,[yra6m]
      ,[lra6m]
      ,[alra6m]
      ,[ramm]
      ,[yaran]
      ,[yyran]
      ,[yra6n]
      ,[lra6n]
      ,[alra6n]
      ,[rann]
      ,[yasam]
      ,[yysam]
      ,[ysa6m]
      ,[lsa6m]
      ,[alsa6m]
      ,[samm]
      ,[yasan]
      ,[yysan]
      ,[ysa6n]
      ,[lsa6n]
      ,[alsa6n]
      ,[sann]
      ,[yavem]
      ,[yyvem]
      ,[yve6m]
      ,[lve6m]
      ,[alve6m]
      ,[vemm]
      ,[yaven]
      ,[yyven]
      ,[yve6n]
      ,[lve6n]
      ,[alve6n]
      ,[vennn]
      ,[yasaam]
      ,[ysaa6m]
      ,[lsaa6m]
      ,[alsaa6m]
      ,[saamm]
      ,[yasaan]
      ,[ysaa6n]
      ,[lsaa6n]
      ,[alsaa6n]
      ,[saann]
      ,[yalatm]
      ,[ylat6m]
      ,[lla6m]
      ,[alla6m]
      ,[lamm]
      ,[yalan]
      ,[ylat6n]
      ,[lla6n]
      ,[alla6n]
      ,[lann]
      ,[yaesm]
      ,[yes6m]
      ,[les6m]
      ,[ales6m]
      ,[esmm]
      ,[yaesn]
      ,[yes6n]
      ,[les6n]
      ,[ales6n]
      ,[esnn]
      ,[yaitm]
      ,[yit6m]
      ,[lit6m]
      ,[alit6m]
      ,[itmm]
      ,[yaitn]
      ,[yit6n]
      ,[lit6n]
      ,[alit6n]
      ,[itnn]
      ,[yamum]
      ,[yymum]
      ,[ymu6m]
      ,[lmu6m]
      ,[almu6m]
      ,[mumm]
      ,[yamun]
      ,[yymun]
      ,[ymu6n]
      ,[lmu6n]
      ,[almu6n]
      ,[munn]
      ,[yyvam]
      ,[vamm]
      ,[yyvan]
      ,[vann]
      ,[pmatm]
      ,[pmatn]
      ,[pmaty]
      ,[lmatm]
      ,[lmatn]
      ,[lmaty]
      ,[matm]
      ,[matn]
      ,[maty]
      ,[pma1m]
      ,[pma1n]
      ,[pma2m]
      ,[pma2n]
      ,[pma3m]
      ,[pma3n]
      ,[pma45m]
      ,[pma45n]
      ,[pma6m]
      ,[pma6n]
      ,[pma7m]
      ,[pma7n]
      ,[lma1m]
      ,[lma1n]
      ,[lma2m]
      ,[lma2n]
      ,[lma3m]
      ,[lma3n]
      ,[lma45m]
      ,[lma45n]
      ,[lma6m]
      ,[lma6n]
      ,[lma7m]
      ,[lma7n]
      ,[fy1m]
      ,[fy1n]
      ,[fy2m]
      ,[fy2n]
      ,[fy3m]
      ,[fy3n]
      ,[fy45m]
      ,[fy45n]
      ,[fy6m]
      ,[fy6n]
      ,[fy7m]
      ,[fy7n]
      ,[ke1m]
      ,[ke1n]
      ,[ke2m]
      ,[ke2n]
      ,[ke3m]
      ,[ke3n]
      ,[ke45m]
      ,[ke45n]
      ,[ke6m]
      ,[ke6n]
      ,[ke7m]
      ,[ke7n]
      ,[bi1m]
      ,[bi1n]
      ,[bi2m]
      ,[bi2n]
      ,[bi3m]
      ,[bi3n]
      ,[bi45m]
      ,[bi45n]
      ,[bi6m]
      ,[bi6n]
      ,[bi7m]
      ,[bi7n]
      ,[mt1m]
      ,[mt1n]
      ,[mt2m]
      ,[mt2n]
      ,[mt3m]
      ,[mt3n]
      ,[mt45m]
      ,[mt45n]
      ,[mt6m]
      ,[mt6n]
      ,[mt7m]
      ,[mt7n]
      ,[soma2m]
      ,[soma2n]
      ,[soma3m]
      ,[soma3n]
      ,[sofy2m]
      ,[sofy2n]
      ,[sofy3m]
      ,[sofy3n]
      ,[soke2m]
      ,[soke2n]
      ,[soke3m]
      ,[soke3n]
      ,[sobi2m]
      ,[sobi2n]
      ,[sobi3m]
      ,[sobi3n]
      ,[somt2m]
      ,[somt2n]
      ,[somt3m]
      ,[somt3n]
      ,[sotek2m]
      ,[sotek2n]
      ,[sotek3m]
      ,[sotek3n]
      ,[tietolahde]='2_5_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, tunn)
      --,[rivinumero]
  FROM [TK_H9098_CSC].[dbo].[TK_2_5_sopv_12]
  
  UNION ALL

SELECT
	   [tilv]
      ,[tunn]
      ,[jarj]
      ,[nukevy]
      ,[aikevy]
      ,[kev]
      ,[nukevyn]
      ,[aikevyn]
      ,[kevn]
      ,[nukev1]
      ,[nukev2]
      ,[nukev3]
      ,[nukev4]
      ,[nukev]
      ,[nukev1n]
      ,[nukev2n]
      ,[nukev3n]
      ,[nukev4n]
      ,[nukevn]
      ,[aikev1]
      ,[aikev2]
      ,[aikev3]
      ,[aikev4]
      ,[aikev]
      ,[aikev1n]
      ,[aikev2n]
      ,[aikev3n]
      ,[aikev4n]
      ,[aikevn]
      ,[nuvary]
      ,[aivary]
      ,[var]
      ,[nuvaryn]
      ,[aivaryn]
      ,[varn]
      ,[nuyks]
      ,[aiyks]
      ,[yksy]
      ,[nuvar2]
      ,[nuvar25]
      ,[nuvar3]
      ,[nuvar35]
      ,[nuvar4]
      ,[nuvar45]
      ,[nuvar5]
      ,[nuvar]
      ,[nuvar2n]
      ,[nuvar25n]
      ,[nuvar3n]
      ,[nuvar35n]
      ,[nuvar4n]
      ,[nuvar45n]
      ,[nuvar5n]
      ,[nuvarn]
      ,[aivar2]
      ,[aivar25]
      ,[aivar3]
      ,[aivar35]
      ,[aivar4]
      ,[aivar45]
      ,[aivar5]
      ,[aivar]
      ,[aivar2n]
      ,[aivar25n]
      ,[aivar3n]
      ,[aivar35n]
      ,[aivar4n]
      ,[aivar45n]
      ,[aivar5n]
      ,[aivarn]
      ,[ev]
      ,[ort]
      ,[et]
      ,[mu]
      ,[eos]
      ,[kay]
      ,[kieli1]
      ,[kieli2]
      ,[kieli3]
      ,[kieli4]
      ,[kieli5]
      ,[kieli6]
      ,[kieliy]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[svnn]
      ,[rvnn]
      ,[svrvn]
      ,[yaenm]
      ,[yyenm]
      ,[yen6m]
      ,[len6m]
      ,[alen6m]
      ,[enmm]
      ,[yaenn]
      ,[yyenn]
      ,[yen6n]
      ,[len6n]
      ,[alen6n]
      ,[ennn]
      ,[yarum]
      ,[yyrum]
      ,[yru6m]
      ,[lru6m]
      ,[alru6m]
      ,[rumm]
      ,[yarun]
      ,[yyrun]
      ,[yru6n]
      ,[lru6n]
      ,[alru6n]
      ,[runn]
      ,[yasum]
      ,[yysum]
      ,[ysu6m]
      ,[lsu6m]
      ,[alsu6m]
      ,[summ]
      ,[yasun]
      ,[yysun]
      ,[ysu6n]
      ,[lsu6n]
      ,[alsu6n]
      ,[sunn]
      ,[yaram]
      ,[yyram]
      ,[yra6m]
      ,[lra6m]
      ,[alra6m]
      ,[ramm]
      ,[yaran]
      ,[yyran]
      ,[yra6n]
      ,[lra6n]
      ,[alra6n]
      ,[rann]
      ,[yasam]
      ,[yysam]
      ,[ysa6m]
      ,[lsa6m]
      ,[alsa6m]
      ,[samm]
      ,[yasan]
      ,[yysan]
      ,[ysa6n]
      ,[lsa6n]
      ,[alsa6n]
      ,[sann]
      ,[yavem]
      ,[yyvem]
      ,[yve6m]
      ,[lve6m]
      ,[alve6m]
      ,[vemm]
      ,[yaven]
      ,[yyven]
      ,[yve6n]
      ,[lve6n]
      ,[alve6n]
      ,[vennn]
      ,[yasaam]
      ,[ysaa6m]
      ,[lsaa6m]
      ,[alsaa6m]
      ,[saamm]
      ,[yasaan]
      ,[ysaa6n]
      ,[lsaa6n]
      ,[alsaa6n]
      ,[saann]
      ,[yalatm]
      ,[ylat6m]
      ,[lla6m]
      ,[alla6m]
      ,[lamm]
      ,[yalan]
      ,[ylat6n]
      ,[lla6n]
      ,[alla6n]
      ,[lann]
      ,[yaesm]
      ,[yes6m]
      ,[les6m]
      ,[ales6m]
      ,[esmm]
      ,[yaesn]
      ,[yes6n]
      ,[les6n]
      ,[ales6n]
      ,[esnn]
      ,[yaitm]
      ,[yit6m]
      ,[lit6m]
      ,[alit6m]
      ,[itmm]
      ,[yaitn]
      ,[yit6n]
      ,[lit6n]
      ,[alit6n]
      ,[itnn]
      ,[yamum]
      ,[yymum]
      ,[ymu6m]
      ,[lmu6m]
      ,[almu6m]
      ,[mumm]
      ,[yamun]
      ,[yymun]
      ,[ymu6n]
      ,[lmu6n]
      ,[almu6n]
      ,[munn]
      ,[yyvam]
      ,[vamm]
      ,[yyvan]
      ,[vann]
      ,[pmatm]
      ,[pmatn]
      ,[pmaty]
      ,[lmatm]
      ,[lmatn]
      ,[lmaty]
      ,[matm]
      ,[matn]
      ,[maty]
      ,[pma1m]
      ,[pma1n]
      ,[pma2m]
      ,[pma2n]
      ,[pma3m]
      ,[pma3n]
      ,[pma45m]
      ,[pma45n]
      ,[pma6m]
      ,[pma6n]
      ,[pma7m]
      ,[pma7n]
      ,[lma1m]
      ,[lma1n]
      ,[lma2m]
      ,[lma2n]
      ,[lma3m]
      ,[lma3n]
      ,[lma45m]
      ,[lma45n]
      ,[lma6m]
      ,[lma6n]
      ,[lma7m]
      ,[lma7n]
      ,[fy1m]
      ,[fy1n]
      ,[fy2m]
      ,[fy2n]
      ,[fy3m]
      ,[fy3n]
      ,[fy45m]
      ,[fy45n]
      ,[fy6m]
      ,[fy6n]
      ,[fy7m]
      ,[fy7n]
      ,[ke1m]
      ,[ke1n]
      ,[ke2m]
      ,[ke2n]
      ,[ke3m]
      ,[ke3n]
      ,[ke45m]
      ,[ke45n]
      ,[ke6m]
      ,[ke6n]
      ,[ke7m]
      ,[ke7n]
      ,[bi1m]
      ,[bi1n]
      ,[bi2m]
      ,[bi2n]
      ,[bi3m]
      ,[bi3n]
      ,[bi45m]
      ,[bi45n]
      ,[bi6m]
      ,[bi6n]
      ,[bi7m]
      ,[bi7n]
      ,[mt1m]
      ,[mt1n]
      ,[mt2m]
      ,[mt2n]
      ,[mt3m]
      ,[mt3n]
      ,[mt45m]
      ,[mt45n]
      ,[mt6m]
      ,[mt6n]
      ,[mt7m]
      ,[mt7n]
      ,[soma2m]
      ,[soma2n]
      ,[soma3m]
      ,[soma3n]
      ,[sofy2m]
      ,[sofy2n]
      ,[sofy3m]
      ,[sofy3n]
      ,[soke2m]
      ,[soke2n]
      ,[soke3m]
      ,[soke3n]
      ,[sobi2m]
      ,[sobi2n]
      ,[sobi3m]
      ,[sobi3n]
      ,[somt2m]
      ,[somt2n]
      ,[somt3m]
      ,[somt3n]
      ,[sotek2m]
      ,[sotek2n]
      ,[sotek3m]
      ,[sotek3n]
      ,[tietolahde]='2_5_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, tunn)
      --,[rivinumero]
  FROM [TK_H9098_CSC].[dbo].[TK_2_5_sopv_14]
  
  UNION ALL

SELECT
	   [tilv]
      ,[tunn]
      ,[jarj]
      ,[nukevy]
      ,[aikevy]
      ,[kev]
      ,[nukevyn]
      ,[aikevyn]
      ,[kevn]
      ,[nukev1]
      ,[nukev2]
      ,[nukev3]
      ,[nukev4]
      ,[nukev]
      ,[nukev1n]
      ,[nukev2n]
      ,[nukev3n]
      ,[nukev4n]
      ,[nukevn]
      ,[aikev1]
      ,[aikev2]
      ,[aikev3]
      ,[aikev4]
      ,[aikev]
      ,[aikev1n]
      ,[aikev2n]
      ,[aikev3n]
      ,[aikev4n]
      ,[aikevn]
      ,[nuvary]
      ,[aivary]
      ,[var]
      ,[nuvaryn]
      ,[aivaryn]
      ,[varn]
      ,[nuyks]
      ,[aiyks]
      ,[yksy]
      ,[nuvar2]
      ,[nuvar25]
      ,[nuvar3]
      ,[nuvar35]
      ,[nuvar4]
      ,[nuvar45]
      ,[nuvar5]
      ,[nuvar]
      ,[nuvar2n]
      ,[nuvar25n]
      ,[nuvar3n]
      ,[nuvar35n]
      ,[nuvar4n]
      ,[nuvar45n]
      ,[nuvar5n]
      ,[nuvarn]
      ,[aivar2]
      ,[aivar25]
      ,[aivar3]
      ,[aivar35]
      ,[aivar4]
      ,[aivar45]
      ,[aivar5]
      ,[aivar]
      ,[aivar2n]
      ,[aivar25n]
      ,[aivar3n]
      ,[aivar35n]
      ,[aivar4n]
      ,[aivar45n]
      ,[aivar5n]
      ,[aivarn]
      ,[ev]
      ,[ort]
      ,[et]
      ,[mu]
      ,[eos]
      ,[kay]
      ,[kieli1]
      ,[kieli2]
      ,[kieli3]
      ,[kieli4]
      ,[kieli5]
      ,[kieli6]
      ,[kieliy]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[svnn]
      ,[rvnn]
      ,[svrvn]
      ,[yaenm]
      ,[yyenm]
      ,[yen6m]
      ,[len6m]
      ,[alen6m]
      ,[enmm]
      ,[yaenn]
      ,[yyenn]
      ,[yen6n]
      ,[len6n]
      ,[alen6n]
      ,[ennn]
      ,[yarum]
      ,[yyrum]
      ,[yru6m]
      ,[lru6m]
      ,[alru6m]
      ,[rumm]
      ,[yarun]
      ,[yyrun]
      ,[yru6n]
      ,[lru6n]
      ,[alru6n]
      ,[runn]
      ,[yasum]
      ,[yysum]
      ,[ysu6m]
      ,[lsu6m]
      ,[alsu6m]
      ,[summ]
      ,[yasun]
      ,[yysun]
      ,[ysu6n]
      ,[lsu6n]
      ,[alsu6n]
      ,[sunn]
      ,[yaram]
      ,[yyram]
      ,[yra6m]
      ,[lra6m]
      ,[alra6m]
      ,[ramm]
      ,[yaran]
      ,[yyran]
      ,[yra6n]
      ,[lra6n]
      ,[alra6n]
      ,[rann]
      ,[yasam]
      ,[yysam]
      ,[ysa6m]
      ,[lsa6m]
      ,[alsa6m]
      ,[samm]
      ,[yasan]
      ,[yysan]
      ,[ysa6n]
      ,[lsa6n]
      ,[alsa6n]
      ,[sann]
      ,[yavem]
      ,[yyvem]
      ,[yve6m]
      ,[lve6m]
      ,[alve6m]
      ,[vemm]
      ,[yaven]
      ,[yyven]
      ,[yve6n]
      ,[lve6n]
      ,[alve6n]
      ,[vennn]
      ,[yasaam]
      ,[ysaa6m]
      ,[lsaa6m]
      ,[alsaa6m]
      ,[saamm]
      ,[yasaan]
      ,[ysaa6n]
      ,[lsaa6n]
      ,[alsaa6n]
      ,[saann]
      ,[yalatm]
      ,[ylat6m]
      ,[lla6m]
      ,[alla6m]
      ,[lamm]
      ,[yalan]
      ,[ylat6n]
      ,[lla6n]
      ,[alla6n]
      ,[lann]
      ,[yaesm]
      ,[yes6m]
      ,[les6m]
      ,[ales6m]
      ,[esmm]
      ,[yaesn]
      ,[yes6n]
      ,[les6n]
      ,[ales6n]
      ,[esnn]
      ,[yaitm]
      ,[yit6m]
      ,[lit6m]
      ,[alit6m]
      ,[itmm]
      ,[yaitn]
      ,[yit6n]
      ,[lit6n]
      ,[alit6n]
      ,[itnn]
      ,[yamum]
      ,[yymum]
      ,[ymu6m]
      ,[lmu6m]
      ,[almu6m]
      ,[mumm]
      ,[yamun]
      ,[yymun]
      ,[ymu6n]
      ,[lmu6n]
      ,[almu6n]
      ,[munn]
      ,[yyvam]
      ,[vamm]
      ,[yyvan]
      ,[vann]
      ,[pmatm]
      ,[pmatn]
      ,[pmaty]
      ,[lmatm]
      ,[lmatn]
      ,[lmaty]
      ,[matm]
      ,[matn]
      ,[maty]
      ,[pma1m]
      ,[pma1n]
      ,[pma2m]
      ,[pma2n]
      ,[pma3m]
      ,[pma3n]
      ,[pma45m]
      ,[pma45n]
      ,[pma6m]
      ,[pma6n]
      ,[pma7m]
      ,[pma7n]
      ,[lma1m]
      ,[lma1n]
      ,[lma2m]
      ,[lma2n]
      ,[lma3m]
      ,[lma3n]
      ,[lma45m]
      ,[lma45n]
      ,[lma6m]
      ,[lma6n]
      ,[lma7m]
      ,[lma7n]
      ,[fy1m]
      ,[fy1n]
      ,[fy2m]
      ,[fy2n]
      ,[fy3m]
      ,[fy3n]
      ,[fy45m]
      ,[fy45n]
      ,[fy6m]
      ,[fy6n]
      ,[fy7m]
      ,[fy7n]
      ,[ke1m]
      ,[ke1n]
      ,[ke2m]
      ,[ke2n]
      ,[ke3m]
      ,[ke3n]
      ,[ke45m]
      ,[ke45n]
      ,[ke6m]
      ,[ke6n]
      ,[ke7m]
      ,[ke7n]
      ,[bi1m]
      ,[bi1n]
      ,[bi2m]
      ,[bi2n]
      ,[bi3m]
      ,[bi3n]
      ,[bi45m]
      ,[bi45n]
      ,[bi6m]
      ,[bi6n]
      ,[bi7m]
      ,[bi7n]
      ,[mt1m]
      ,[mt1n]
      ,[mt2m]
      ,[mt2n]
      ,[mt3m]
      ,[mt3n]
      ,[mt45m]
      ,[mt45n]
      ,[mt6m]
      ,[mt6n]
      ,[mt7m]
      ,[mt7n]
      ,[soma2m]
      ,[soma2n]
      ,[soma3m]
      ,[soma3n]
      ,[sofy2m]
      ,[sofy2n]
      ,[sofy3m]
      ,[sofy3n]
      ,[soke2m]
      ,[soke2n]
      ,[soke3m]
      ,[soke3n]
      ,[sobi2m]
      ,[sobi2n]
      ,[sobi3m]
      ,[sobi3n]
      ,[somt2m]
      ,[somt2n]
      ,[somt3m]
      ,[somt3n]
      ,[sotek2m]
      ,[sotek2n]
      ,[sotek3m]
      ,[sotek3n]
      ,[tietolahde]='2_5_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, tunn)
      --,[rivinumero]
  FROM [TK_H9098_CSC].[dbo].[TK_2_5_sopv_16]
    UNION ALL

SELECT
	   [tilv]
      ,[tunn]
      ,[jarj]
      ,[nukevy]
      ,[aikevy]
      ,[kev]
      ,[nukevyn]
      ,[aikevyn]
      ,[kevn]
      ,[nukev1]
      ,[nukev2]
      ,[nukev3]
      ,[nukev4]
      ,[nukev]
      ,[nukev1n]
      ,[nukev2n]
      ,[nukev3n]
      ,[nukev4n]
      ,[nukevn]
      ,[aikev1]
      ,[aikev2]
      ,[aikev3]
      ,[aikev4]
      ,[aikev]
      ,[aikev1n]
      ,[aikev2n]
      ,[aikev3n]
      ,[aikev4n]
      ,[aikevn]
      ,[nuvary]
      ,[aivary]
      ,[var]
      ,[nuvaryn]
      ,[aivaryn]
      ,[varn]
      ,[nuyks]
      ,[aiyks]
      ,[yksy]
      ,[nuvar2]
      ,[nuvar25]
      ,[nuvar3]
      ,[nuvar35]
      ,[nuvar4]
      ,[nuvar45]
      ,[nuvar5]
      ,[nuvar]
      ,[nuvar2n]
      ,[nuvar25n]
      ,[nuvar3n]
      ,[nuvar35n]
      ,[nuvar4n]
      ,[nuvar45n]
      ,[nuvar5n]
      ,[nuvarn]
      ,[aivar2]
      ,[aivar25]
      ,[aivar3]
      ,[aivar35]
      ,[aivar4]
      ,[aivar45]
      ,[aivar5]
      ,[aivar]
      ,[aivar2n]
      ,[aivar25n]
      ,[aivar3n]
      ,[aivar35n]
      ,[aivar4n]
      ,[aivar45n]
      ,[aivar5n]
      ,[aivarn]
      ,[ev]
      ,[ort]
      ,[et]
      ,[mu]
      ,[eos]
      ,[kay]
      ,[kieli1]
      ,[kieli2]
      ,[kieli3]
      ,[kieli4]
      ,[kieli5]
      ,[kieli6]
      ,[kieliy]
      ,[sv]
      ,[rv]
      ,[svrv]
      ,[svnn]
      ,[rvnn]
      ,[svrvn]
      ,[yaenm]
      ,[yyenm]
      ,[yen6m]
      ,[len6m]
      ,[alen6m]
      ,[enmm]
      ,[yaenn]
      ,[yyenn]
      ,[yen6n]
      ,[len6n]
      ,[alen6n]
      ,[ennn]
      ,[yarum]
      ,[yyrum]
      ,[yru6m]
      ,[lru6m]
      ,[alru6m]
      ,[rumm]
      ,[yarun]
      ,[yyrun]
      ,[yru6n]
      ,[lru6n]
      ,[alru6n]
      ,[runn]
      ,[yasum]
      ,[yysum]
      ,[ysu6m]
      ,[lsu6m]
      ,[alsu6m]
      ,[summ]
      ,[yasun]
      ,[yysun]
      ,[ysu6n]
      ,[lsu6n]
      ,[alsu6n]
      ,[sunn]
      ,[yaram]
      ,[yyram]
      ,[yra6m]
      ,[lra6m]
      ,[alra6m]
      ,[ramm]
      ,[yaran]
      ,[yyran]
      ,[yra6n]
      ,[lra6n]
      ,[alra6n]
      ,[rann]
      ,[yasam]
      ,[yysam]
      ,[ysa6m]
      ,[lsa6m]
      ,[alsa6m]
      ,[samm]
      ,[yasan]
      ,[yysan]
      ,[ysa6n]
      ,[lsa6n]
      ,[alsa6n]
      ,[sann]
      ,[yavem]
      ,[yyvem]
      ,[yve6m]
      ,[lve6m]
      ,[alve6m]
      ,[vemm]
      ,[yaven]
      ,[yyven]
      ,[yve6n]
      ,[lve6n]
      ,[alve6n]
      ,[vennn]
      ,[yasaam]
      ,[ysaa6m]
      ,[lsaa6m]
      ,[alsaa6m]
      ,[saamm]
      ,[yasaan]
      ,[ysaa6n]
      ,[lsaa6n]
      ,[alsaa6n]
      ,[saann]
      ,[yalatm]
      ,[ylat6m]
      ,[lla6m]
      ,[alla6m]
      ,[lamm]
      ,[yalan]
      ,[ylat6n]
      ,[lla6n]
      ,[alla6n]
      ,[lann]
      ,[yaesm]
      ,[yes6m]
      ,[les6m]
      ,[ales6m]
      ,[esmm]
      ,[yaesn]
      ,[yes6n]
      ,[les6n]
      ,[ales6n]
      ,[esnn]
      ,[yaitm]
      ,[yit6m]
      ,[lit6m]
      ,[alit6m]
      ,[itmm]
      ,[yaitn]
      ,[yit6n]
      ,[lit6n]
      ,[alit6n]
      ,[itnn]
      ,[yamum]
      ,[yymum]
      ,[ymu6m]
      ,[lmu6m]
      ,[almu6m]
      ,[mumm]
      ,[yamun]
      ,[yymun]
      ,[ymu6n]
      ,[lmu6n]
      ,[almu6n]
      ,[munn]
      ,[yyvam]
      ,[vamm]
      ,[yyvan]
      ,[vann]
      ,[pmatm]
      ,[pmatn]
      ,[pmaty]
      ,[lmatm]
      ,[lmatn]
      ,[lmaty]
      ,[matm]
      ,[matn]
      ,[maty]
      ,[pma1m]
      ,[pma1n]
      ,[pma2m]
      ,[pma2n]
      ,[pma3m]
      ,[pma3n]
      ,[pma45m]
      ,[pma45n]
      ,[pma6m]
      ,[pma6n]
      ,[pma7m]
      ,[pma7n]
      ,[lma1m]
      ,[lma1n]
      ,[lma2m]
      ,[lma2n]
      ,[lma3m]
      ,[lma3n]
      ,[lma45m]
      ,[lma45n]
      ,[lma6m]
      ,[lma6n]
      ,[lma7m]
      ,[lma7n]
      ,[fy1m]
      ,[fy1n]
      ,[fy2m]
      ,[fy2n]
      ,[fy3m]
      ,[fy3n]
      ,[fy45m]
      ,[fy45n]
      ,[fy6m]
      ,[fy6n]
      ,[fy7m]
      ,[fy7n]
      ,[ke1m]
      ,[ke1n]
      ,[ke2m]
      ,[ke2n]
      ,[ke3m]
      ,[ke3n]
      ,[ke45m]
      ,[ke45n]
      ,[ke6m]
      ,[ke6n]
      ,[ke7m]
      ,[ke7n]
      ,[bi1m]
      ,[bi1n]
      ,[bi2m]
      ,[bi2n]
      ,[bi3m]
      ,[bi3n]
      ,[bi45m]
      ,[bi45n]
      ,[bi6m]
      ,[bi6n]
      ,[bi7m]
      ,[bi7n]
      ,[mt1m]
      ,[mt1n]
      ,[mt2m]
      ,[mt2n]
      ,[mt3m]
      ,[mt3n]
      ,[mt45m]
      ,[mt45n]
      ,[mt6m]
      ,[mt6n]
      ,[mt7m]
      ,[mt7n]
      ,[soma2m]
      ,[soma2n]
      ,[soma3m]
      ,[soma3n]
      ,[sofy2m]
      ,[sofy2n]
      ,[sofy3m]
      ,[sofy3n]
      ,[soke2m]
      ,[soke2n]
      ,[soke3m]
      ,[soke3n]
      ,[sobi2m]
      ,[sobi2n]
      ,[sobi3m]
      ,[sobi3n]
      ,[somt2m]
      ,[somt2n]
      ,[somt3m]
      ,[somt3n]
      ,[sotek2m]
      ,[sotek2n]
      ,[sotek3m]
      ,[sotek3n]
      ,[tietolahde]='2_5_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv, tunn)
      --,[rivinumero]
  FROM [TK_H9098_CSC].[dbo].[TK_2_5_sopv_18]
  ) Aineistot



GO
/****** Object:  View [dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v_sa_2_6_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''), '-1') as nvarchar(2))
      ,[perusjoukko] = CAST(COALESCE(NULLIF(perusjoukko, ''), '-1') as nvarchar(2))
      ,[koulk] = CAST(COALESCE(NULLIF(koulk, ''), '-1') as nvarchar(6))
      ,[tutklaja] = CAST(COALESCE(NULLIF(tutklaja , ''), '-1') as nvarchar(2))
      ,[tutktav] = CAST(COALESCE(NULLIF(tutktav , ''), '-1') as nvarchar(2))
      ,[kkieli] = CAST(COALESCE(NULLIF(kkieli , ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[knuts2u] = CAST(COALESCE(NULLIF(knuts2u , ''), '-1') as nvarchar(2))
      ,[kkunryh] = CAST(COALESCE(NULLIF(kkunryh , ''), '-1') as nvarchar(2))
      ,[kely] = CAST(COALESCE(NULLIF(kely , ''), '-1') as nvarchar(2))
      ,[kavi] = CAST(COALESCE(NULLIF(kavi , ''), '-1') as nvarchar(2))
      ,[sp] = CAST(COALESCE(NULLIF(sp , ''), '-1') as nvarchar(2))
      ,[aikielir1] = CAST(COALESCE(NULLIF(aikielir1 , ''), '-1') as nvarchar(2))
      ,[kansalr2] = CAST(COALESCE(NULLIF(kansalr2 , ''), '-1') as nvarchar(2))
      ,[alvv] = CAST(alvv as nvarchar(4))
      ,[allk] = CAST(allk as nvarchar(1))
      ,[olotamm] = CAST(olotamm as nvarchar(1))
      ,[olosyys] = CAST(olosyys as nvarchar(1))
      ,[aiopis] = CAST(COALESCE(NULLIF(aiopis , ''), '-1') as nvarchar(2))
      ,[erper] = CAST(COALESCE(NULLIF(erper , ''), '-1') as nvarchar(2))
      ,[erryh] = CAST(COALESCE(NULLIF(erryh , ''), '-1') as nvarchar(2))
      ,[ammos] = CAST(ammos as int)
      ,[opintokok] = CAST(opintokok as int)
      ,[lkm] = CAST(lkm as int)
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_11'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_11]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_12'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_13'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_14'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_15'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos]
      ,[opintokok]
      ,[lkm]
	  ,tietolahde = '2_6_sopv_16'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_16]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper]
      ,[erryh]
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_17'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_17]

UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[knuts2u]
      ,[kkunryh]
      ,[kely]
      ,[kavi]
      ,[sp]
      ,[aikielir1]
      ,[kansalr2]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[aiopis]
      ,[erper] = NULL
      ,[erryh]
      ,[ammos] = NULL
      ,[opintokok] = NULL
      ,[lkm]
	  ,tietolahde = '2_6_sopv_18'
FROM [TK_H9098_CSC].[dbo].[TK_2_6_sopv_18]


) kaikkivuodet





GO
/****** Object:  View [dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[v_sa_2_7_ammatillisen_koulutuksen_erityisopetuksen_opiskelijat_ja_tutkinnon_suorittaneet_jarjestajittain] AS
SELECT [tilv] = CAST(tilv as nvarchar(4))
      ,[lahde] = CAST(COALESCE(NULLIF(lahde , ''), '-1') as nvarchar(2))
      ,[perusjoukko] = CAST(COALESCE(NULLIF(perusjoukko, ''), '-1') as nvarchar(2))
      ,[tunn] = CAST(COALESCE(NULLIF(tunn, ''), '-1') as nvarchar(5))
      ,[jarj] = CAST(COALESCE(NULLIF(jarj, ''), '-1') as nvarchar(10))
      ,[opjarj] = CAST(COALESCE(NULLIF(opjarj, ''), '-1') as nvarchar(10))
      ,[koulk] = CAST(COALESCE(NULLIF(koulk, ''), '-1') as nvarchar(6))
      ,[tutklaja] = CAST(COALESCE(NULLIF(tutklaja, ''), '-1') as nvarchar(2))
      ,[tutktav] = CAST(COALESCE(NULLIF(tutktav, ''), '-1') as nvarchar(2))
      ,[kkieli] = CAST(COALESCE(NULLIF(kkieli, ''), '-1') as nvarchar(2))
      ,[kmaak] = CAST(COALESCE(NULLIF((SELECT [maakunta_koodi_nykytila] FROM [VipunenTK_lisatiedot].[dbo].[alueluokitus_maakunta_korjaus] WHERE [maakunta_koodi] = kmaak), ''), NULLIF(kmaak , ''), '-1') as nvarchar(2))
      ,[lkm] = CAST(lkm as int)
      ,[tunn_opisk] = CAST(COALESCE(NULLIF(tunn_opisk, ''), '-1') as nvarchar(5))
      ,[jarj_opisk] = CAST(COALESCE(NULLIF(jarj_opisk, ''), '-1') as nvarchar(10))
      ,[olosyys] = CAST(olosyys as nvarchar(1))
	  ,tietolahde
FROM
(SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,NULL AS [tunn_opisk]
      ,NULL AS [jarj_opisk]
      ,9 AS [olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_12'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_12]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,NULL AS [tunn_opisk]
      ,NULL AS [jarj_opisk]
      ,9 AS [olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_13'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_13]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,NULL AS [tunn_opisk]
      ,NULL AS [jarj_opisk]
      ,9 AS [olosyys]
      ,NULL AS [luontipvm]
	  ,tietolahde = '2_7_2012_sopv_14'
  FROM [VipunenTK_SA].[dbo].[TK_2_7_2012_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_14'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_14]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_15'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_15]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_16'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_16]
UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_17'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_17]

  UNION ALL
SELECT [tilv]
      ,[lahde]
      ,[perusjoukko]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[koulk]
      ,[tutklaja]
      ,[tutktav]
      ,[kkieli]
      ,[kmaak]
      ,[lkm]
      ,[tunn_opisk]
      ,[jarj_opisk]
      ,[olosyys]
      ,[luontipvm]
	  ,tietolahde = '2_7_sopv_18'
  FROM [TK_H9098_CSC].[dbo].[TK_2_7_sopv_18]
  
 ) kaikkivuodet







GO
/****** Object:  View [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v_sa_2_8_Korkeakoulut_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_8_Korkeakoulut_opiskelijat
-- insert into vipunentk_dw..sa_2_8_Korkeakoulut_opiskelijat select * from v_sa_2_8_Korkeakoulut_opiskelijat


select
	tilv = cast(kaikkivuodet.tilv as varchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as varchar(1))
	,lahde = cast(kaikkivuodet.lahde as varchar(2))
	,tunn = cast(kaikkivuodet.tunn as varchar(5))
	,jarj = cast(kaikkivuodet.jarj as varchar(10))
	,koulk = cast(kaikkivuodet.koulk as varchar(6))
	,kkun = cast(kaikkivuodet.kkun as varchar(3))
	,sp = cast(kaikkivuodet.sp as varchar(1))
	,aikielir1x = cast(kaikkivuodet.aikielir1x as varchar(2))
	,syntv = cast(kaikkivuodet.syntv as varchar(4))
	,tilvaskun = cast(kaikkivuodet.tilvaskun as varchar(6))
	,tilvaskunx = cast(kaikkivuodet.tilvaskunx as varchar(3))
	,tilvaskun2x = cast(kaikkivuodet.tilvaskun2x as varchar(3))
	,kansalr2 = cast(kaikkivuodet.kansalr2 as varchar(1))
	,alvv = cast(kaikkivuodet.alvv as varchar(4))
	,allk = cast(kaikkivuodet.allk as varchar(1))
	,olotamm = cast(kaikkivuodet.olotamm as varchar(1))
	,olosyys = cast(kaikkivuodet.olosyys as varchar(1))
	,rahlahde = cast(kaikkivuodet.rahlahde as varchar(1))
	,fte = cast(kaikkivuodet.fte as varchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as varchar(4))
	,alvv_kksek_lasna = cast(kaikkivuodet.alvv_kksek_lasna as varchar(4))
	,alvv_sek = cast(kaikkivuodet.alvv_sek as varchar(4))
	,alvv_sek_lasna = cast(kaikkivuodet.alvv_sek_lasna as varchar(4))
	,alvv_kk = cast(kaikkivuodet.alvv_kk as varchar(4))
	,alvv_kk_lasna = cast(kaikkivuodet.alvv_kk_lasna as varchar(4))
	,alvv_opa = cast(kaikkivuodet.alvv_opa as varchar(4))
	,alvv_opa_lasna = cast(kaikkivuodet.alvv_opa_lasna as varchar(4))
	,lkm = cast(kaikkivuodet.lkm as int)
	,opyht0 = cast(kaikkivuodet.opyht0 as int)
	,opyht14 = cast(kaikkivuodet.opyht14 as int)
	,opyht29 = cast(kaikkivuodet.opyht29 as int)
	,opyht44 = cast(kaikkivuodet.opyht44 as int)
	,opyht59 = cast(kaikkivuodet.opyht59 as int)
	,opyht74 = cast(kaikkivuodet.opyht74 as int)
	,opyht89 = cast(kaikkivuodet.opyht89 as int)
	,opyht104 = cast(kaikkivuodet.opyht104 as int)
	,opyht119 = cast(kaikkivuodet.opyht119 as int)
	,opyht120 = cast(kaikkivuodet.opyht120 as int)
	,op55 = cast(kaikkivuodet.op55 as varchar(1))
	,opes = cast(kaikkivuodet.opes as int)
	,opek = cast(kaikkivuodet.opek as int)
	,opker = cast(kaikkivuodet.opker as int)
	,tutkamk = cast(kaikkivuodet.tutkamk as varchar(3))
	,tunimamk = cast(kaikkivuodet.tunimamk as nvarchar(60))
	,koamk = cast(kaikkivuodet.koamk as varchar(4))
	,konimamk = cast(kaikkivuodet.konimamk as nvarchar(60))
	,suun_v = cast(kaikkivuodet.suun_v as varchar(5))
	,svnim = cast(kaikkivuodet.svnim as nvarchar(40))
	,koultyp = cast(kaikkivuodet.koultyp as varchar(1))
	,kkieli = cast(kaikkivuodet.kkieli as varchar(2))
	,lasnalk = cast(kaikkivuodet.lasnalk as int)
	,poissalk = cast(kaikkivuodet.poissalk as int)
	,oplaaj = cast(kaikkivuodet.oplaaj as int)
	,kirtu1v = cast(kaikkivuodet.kirtu1v as varchar(4))
	,kirtu1k = cast(kaikkivuodet.kirtu1k as varchar(1))
	,ensisop = cast(kaikkivuodet.ensisop as varchar(1))
	,tilmaa = cast(kaikkivuodet.tilmaa as varchar(1))
	,tutkyo = cast(kaikkivuodet.tutkyo as varchar(3))
	,tunimyo = cast(kaikkivuodet.tunimyo as nvarchar(40))
	,koyo = cast(kaikkivuodet.koyo as varchar(4))
	,konimyo = cast(kaikkivuodet.konimyo as nvarchar(50))
	,paine = cast(kaikkivuodet.paine as varchar(4))
	,painenim = cast(kaikkivuodet.painenim as nvarchar(60))
	,kk = cast(kaikkivuodet.kk as varchar(2))
	,tdk = cast(kaikkivuodet.tdk as varchar(2))
	,fuksi = cast(kaikkivuodet.fuksi as varchar(1))
	,opoikv = cast(kaikkivuodet.opoikv as varchar(4))
	,om = cast(kaikkivuodet.om as varchar(1))
	,opkelp = cast(kaikkivuodet.opkelp as varchar(1))
	,avo = cast(kaikkivuodet.avo as varchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as varchar(10))
FROM (

--Historia-aineisto
SELECT
	tilv
	, aineisto = 'L'
	, lahde =
		case 
			when lahde = 3 then 41
			when lahde = 4 then 51
			else -1
		end
	, tunn
	, jarj = op.koulutuksen_jarjestajakoodi
	, koulk
	, kkun
	, sp
	, aikielir1x = aikielir1
	, syntv = CASE WHEN LTRIM(ika) in ('.','') then null else cast(tilv as int)-cast(LTRIM(ika) as int) end
	, tilvaskun = case when asmaak is null or asmaak=99 then null else 'MAAK'+asmaak end
	, tilvaskunx = null
	, tilvaskun2x = null
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde = null
	, fte
	, alvv_kksek = null
	, alvv_kksek_lasna = null
	, alvv_sek = null
	, alvv_sek_lasna = null
	, alvv_kk = null
	, alvv_kk_lasna = null
	, alvv_opa = null
	, alvv_opa_lasna = null
	, lkm
	, opyht0 = null
	, opyht14 = null
	, opyht29 = null
	, opyht44 = null
	, opyht59 = null
	, opyht74 = null
	, opyht89 = null
	, opyht104 = null
	, opyht119 = null
	, opyht120 = null
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk = null
	, tunimamk = null
	, koamk = null
	, konimamk = null
	, suun_v = null
	, svnim = null
	, koultyp
	, kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	, lasnalk = null
	, poissalk = null
	, oplaaj = null
	, kirtu1v = null
	, kirtu1k = null
	, ensisop = null
	, tilmaa = null
	, tutkyo = null
	, tunimyo = null
	, koyo = null
	, konimyo = null
	, paine = null
	, painenim = null
	, kk = null
	, tdk = null
	, fuksi = null
	, opoikv = null
	, om = null
	, opkelp = null
	, avo = null
	,[tietolahde]='8_2_Historia'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.tunn
WHERE lahde in (3,4) and tilv<2010

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8a_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8a_sopv_11]
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_11]
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, null as op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8c_sopv_11'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8c_sopv_11]
/* 2.8d v2011? */
/* 2.8a v2012? */
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_12]
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8c_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8c_sopv_12]
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55 -- uusi 2012
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8d_sopv_12'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8d_sopv_12]
/* 2.8a v2013? */
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_13]
UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8c_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8c_sopv_13]
/* 2.8d v2013? */

UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8d_sopv_13'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8d_sopv_13]

UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8b_sopv_14]

UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8d_sopv_14'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_8d_sopv_14]


UNION ALL
SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_15'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_15]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_16'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_16]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_17'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_17]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk
	, tunimamk
	, koamk
	, konimamk
	, suun_v
	, svnim
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo
	, tunimyo
	, koyo
	, konimyo
	, paine
	, painenim
	, kk
	, tdk
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='2_8b_sopv_18'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM TK_H9098_CSC.[dbo].[TK_2_8b_sopv_18]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk = null
	, tunimamk = null
	, koamk = null
	, konimamk = null
	, suun_v = null
	, svnim = null
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo = null
	, tunimyo = null
	, koyo = null
	, konimyo = null
	, paine = null
	, painenim = null
	, kk
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='virta_csv'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM VipunenTK_SA.[dbo].[tkOPISK2017OKMEnnakko_AMK]

UNION ALL

SELECT
	tilv
	, aineisto
	, lahde
	, tunn
	, jarj
	, koulk
	, kkun
	, sp
	, aikielir1x
	, syntv
	, tilvaskun
	, tilvaskunx
	, tilvaskun2x
	, kansalr2
	, alvv
	, allk
	, olotamm
	, olosyys
	, rahlahde
	, fte
	, alvv_kksek
	, alvv_kksek_lasna
	, alvv_sek
	, alvv_sek_lasna
	, alvv_kk
	, alvv_kk_lasna
	, alvv_opa
	, alvv_opa_lasna
	, lkm
	, opyht0
	, opyht14
	, opyht29
	, opyht44
	, opyht59
	, opyht74
	, opyht89
	, opyht104
	, opyht119
	, opyht120
	, op55
	, opes
	, opek
	, opker
	, tutkamk = null 
	, tunimamk = null 
	, koamk = null 
	, konimamk = null 
	, suun_v = null 
	, svnim = null
	, koultyp
	, kkieli
	, lasnalk
	, poissalk
	, oplaaj
	, kirtu1v
	, kirtu1k
	, ensisop
	, NULL AS tilmaa
	, tutkyo = null 
	, tunimyo = null 
	, koyo = null 
	, konimyo = null 
	, paine = null
	, painenim = null 
	, kk
	, tdk = null
	, fuksi
	, opoikv
	, om
	, opkelp
	, avo
	,[tietolahde]='virta_csv'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM VipunenTK_SA.[dbo].[tkOPISK2017OKMEnnakko_YO]

) kaikkivuodet







GO
/****** Object:  View [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [dbo].[v_sa_2_8e_Korkeakoulut_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat
-- insert into vipunentk_dw..sa_2_8e_Korkeakoulut_opiskelijat select * from v_sa_2_8e_Korkeakoulut_opiskelijat
-- select * into vipunentk_dw.dbo.sa_2_8e_Korkeakoulut_opiskelijat from v_sa_2_8e_Korkeakoulut_opiskelijat

SELECT
	 tilv = cast(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as nvarchar(1))
	,lahde = cast(kaikkivuodet.lahde as nvarchar(2))
	,tunn = cast(kaikkivuodet.tunn as nvarchar(5))
	,jarj = cast(kaikkivuodet.jarj as nvarchar(10))
	,koulk = cast(kaikkivuodet.koulk as nvarchar(6))
	,koultyp = cast(kaikkivuodet.koultyp as nvarchar(1))
	,sp = cast(kaikkivuodet.sp as nvarchar(1))
	,aikielir1 = cast(kaikkivuodet.aikielir1x as nvarchar(2))
	,syntv = cast(kaikkivuodet.syntv as nvarchar(4))
	,synkk = cast(kaikkivuodet.synkk as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))
	,allk = cast(kaikkivuodet.allk as nvarchar(1))
	,olotamm = cast(kaikkivuodet.olotamm as nvarchar(1))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,kkieli = cast(kaikkivuodet.kkieli as nvarchar(2))
	,ltop = cast(kaikkivuodet.ltop as nvarchar(1))
    ,laak = cast(kaikkivuodet.laak as nvarchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as nvarchar(4))
    ,kansalr2 = cast(kaikkivuodet.kansalr2 as nvarchar(1))
    ,opoikv = cast(kaikkivuodet.opoikv as nvarchar(4))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

	SELECT
	   [tilv]
      ,[aineisto]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
      ,[sp]
      ,[aikielir1x]
      ,[syntv]
      ,[synkk]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,[alvv_kksek]
      ,[kansalr2]
      ,[opoikv]
	  ,[tietolahde]='2_8e_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_17]

UNION ALL

	SELECT
	   [tilv]
      ,[aineisto]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[koulk]
      ,[sp]
      ,[aikielir1x]
      ,[syntv]
      ,[synkk]
      ,[alvv]
      ,[allk]
      ,[olotamm]
      ,[olosyys]
      ,[koultyp]
      ,[kkieli]
      ,[ltop]
      ,[laak]
      ,[lkm]
      ,[luontipvm]
      ,[alvv_kksek]
      ,[kansalr2]
      ,[opoikv]
	  ,[tietolahde]='2_8e_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_8e_sopv_18]


) as kaikkivuodet








GO
/****** Object:  View [dbo].[v_sa_2_9_Korkeakoulut_tutkinnot]    Script Date: 23.2.2018 16:20:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[v_sa_2_9_Korkeakoulut_tutkinnot] AS

-- truncate table vipunentk_dw sa_2_9_Korkeakoulut_tutkinnot
-- insert into vipunentk_dw sa_2_9_Korkeakoulut_tutkinnot select * from v_sa_2_9_Korkeakoulut_tutkinnot


SELECT
	 tilv = cast(kaikkivuodet.tilv as varchar(4))
	,tilv_date = cast(kaikkivuodet.tilv+'0101' as date)
	,aineisto = cast(kaikkivuodet.aineisto as varchar(1))
	,lahde = cast(kaikkivuodet.lahde as varchar(2))
	,tunn = cast(kaikkivuodet.tunn as varchar(5))
	,jarj = cast(kaikkivuodet.jarj as varchar(10))
	,koulk = cast(kaikkivuodet.koulk as varchar(6))
	,opm95opa = cast(kaikkivuodet.opm95opa as varchar(2))
	,kkun = cast(kaikkivuodet.kkun as varchar(3))
	,sp = cast(kaikkivuodet.sp as varchar(1))
	,aikielir1x = cast(kaikkivuodet.aikielir1x as varchar(2))
	,syntv = cast(coalesce(nullif(kaikkivuodet.syntv,''),'9999') as varchar(4))
	,tilvaskun = cast(kaikkivuodet.tilvaskun as varchar(3))
	,tilvaskunx = cast(kaikkivuodet.tilvaskunx as varchar(3))
	,kansalr2 = cast(kaikkivuodet.kansalr2 as varchar(1))
	,alvv = cast(kaikkivuodet.alvv as varchar(4))
	,allk = cast(kaikkivuodet.allk as varchar(1))
	,suorv = cast(kaikkivuodet.suorv as varchar(4))
	,suorlk = cast(kaikkivuodet.suorlk as varchar(1))
	,rahlahde = cast(kaikkivuodet.rahlahde as varchar(1))
	,alvv_kksek = cast(kaikkivuodet.alvv_kksek as varchar(4))
	,alvv_kksek_lasna = cast(kaikkivuodet.alvv_kksek_lasna as varchar(4))
	,alvv_sek = cast(kaikkivuodet.alvv_sek as varchar(4))
	,alvv_sek_lasna = cast(kaikkivuodet.alvv_sek_lasna as varchar(4))
	,alvv_kk = cast(kaikkivuodet.alvv_kk as varchar(4))
	,alvv_kk_lasna = cast(kaikkivuodet.alvv_kk_lasna as varchar(4))
	,alvv_opa = cast(kaikkivuodet.alvv_opa as varchar(4))
	,alvv_opa_lasna = cast(kaikkivuodet.alvv_opa_lasna as varchar(4))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutkamk = cast(kaikkivuodet.tutkamk as varchar(3))
	,tunimamk = cast(kaikkivuodet.tunimamk as varchar(60))
	,koamk = cast(kaikkivuodet.koamk as varchar(4))
	,konimamk = cast(kaikkivuodet.konimamk as varchar(60))
	,suun_v = cast(kaikkivuodet.suun_v as varchar(5))
	,svnim = cast(kaikkivuodet.svnim as varchar(60))
	,koultyp = cast(kaikkivuodet.koultyp as varchar(1))
	,kkieli = cast(kaikkivuodet.kkieli as varchar(2))
	,lasnalk = cast(kaikkivuodet.lasnalk as int)
	,poissalk = cast(kaikkivuodet.poissalk as int)
	,oplaaj = cast(kaikkivuodet.oplaaj as int)
	,kirtu1v = cast(kaikkivuodet.kirtu1v as varchar(4))
	,kirtu1k = cast(kaikkivuodet.kirtu1k as varchar(1))
	,opyhtamk = cast(kaikkivuodet.opyhtamk as int)
	,opylamamk = cast(kaikkivuodet.opylamamk as int)
	,opmuuamk = cast(kaikkivuodet.opmuuamk as int)
	,opoamk = cast(kaikkivuodet.opoamk as int)
	,opmamk = cast(kaikkivuodet.opmamk as int)
	,opyliopamk = cast(kaikkivuodet.opyliopamk as int)
	,opulkomamk = cast(kaikkivuodet.opulkomamk as int)
	,tilmaa = cast(kaikkivuodet.tilmaa as varchar(1))
	,tutkyo = cast(kaikkivuodet.tutkyo as varchar(3))
	,tunimyo = cast(kaikkivuodet.tunimyo as varchar(60))
	,koyo = cast(kaikkivuodet.koyo as varchar(4))
	,konim = cast(kaikkivuodet.konimyo as varchar(60))
	,paine = cast(kaikkivuodet.paine as varchar(4))
	,painenim = cast(kaikkivuodet.painenim as varchar(60))
	,tdk = cast(kaikkivuodet.tdk as varchar(2))
	,om = cast(kaikkivuodet.om as varchar(1))
	,opkelp = cast(kaikkivuodet.opkelp as varchar(1))
	,opyhtyo = cast(kaikkivuodet.opyhtyo as int)
	,opulkyo = cast(kaikkivuodet.opulkyo as int)
	,opmuuyo = cast(kaikkivuodet.opmuuyo as int)
	,opoylio = cast(kaikkivuodet.opoylio as int)
	,opaylio = cast(kaikkivuodet.opaylio as int)
	,opmylio = cast(kaikkivuodet.opmylio as int)
	,opamkyo = cast(kaikkivuodet.opamkyo as int)
	,ltop = cast(kaikkivuodet.opamkyo as int)
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(50))
	,rivinumero = cast(kaikkivuodet.rivinumero as int)
FROM (

--Historia-aineisto
	SELECT
	 tilv = left(suoraika,4)
	,aineisto = 'L'
	,lahde =
	case 
			when lahde = 3 then 42
			when lahde = 4 then 52
			else -1
		end
	,tunn = oltunnus
	,jarj = op.koulutuksen_jarjestajakoodi
	,koulk
	,opm95opa = null
	,kkun
	,sp
	,aikielir1x = aikielir1
	,syntv = case syntv when '19XX' then null else syntv end
	,tilvaskun = askun
	,tilvaskunx = null
	,kansalr2
	,alvv = case alvv when 'BBBB' then null else alvv end
	,allk
	,suorv = left(suoraika,4)
	,suorlk = null
	,rahlahde = null
	,alvv_kksek = null
	,alvv_kksek_lasna = null
	,alvv_sek = null
	,alvv_sek_lasna = null
	,alvv_kk = null
	,alvv_kk_lasna = null
	,alvv_opa = null
	,alvv_opa_lasna = null
	,lkm
	,tutkamk = null
	,tunimamk = null
	,koamk = null
	,konimamk = null
	,suun_v = null
	,svnim = null
	,koultyp = null
	,kkieli = case kkielir1 when 'fs' then 'fi' else kkielir1 end
	,lasnalk = null
	,poissalk = null
	,oplaaj = null
	,kirtu1v = null
	,kirtu1k = null
	,opyhtamk = null
	,opylamamk = null
	,opmuuamk = null
	,opoamk = null
	,opmamk = null
	,opyliopamk = null
	,opulkomamk = null
	,tilmaa = null
	,tutkyo = null
	,tunimyo = null
	,koyo = null
	,konimyo = null
	,paine = null
	,painenim = null
	,tdk = null
	,om = null
	,opkelp = null
	,opyhtyo = null
	,opulkyo = null
	,opmuuyo = null
	,opoylio = null
	,opaylio = null
	,opmylio = null
	,opamkyo = null
	,ltop = NULL
	,[tietolahde]='8_1_historia'
    ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_8_1_sopv_16] tk
LEFT JOIN VipunenTK.dbo.d_oppilaitoksen_taustatiedot op on op.oppilaitos_avain=tk.oltunnus
where lahde in (3,4) and left(suoraika,4)<2010

UNION ALL

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9a_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_11]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9b_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_11]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9c_sopv_11'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_11]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9a_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_12]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9b_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_12]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9c_sopv_12'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_12]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9a_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_13]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9b_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_13]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop = NULL
	,[tietolahde]='2_9c_sopv_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_13]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9a_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9a_sopv_14]
UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9b_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9b_sopv_14]

UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9c_sopv_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_14] -- siirtokannan taulusta puuttuu 20k riviä

UNION ALL SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,tutkamk
	,tunimamk
	,koamk
	,konimamk
	,suun_v
	,svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,tilmaa
	,tutkyo
	,tunimyo
	,koyo
	,konimyo
	,paine
	,painenim
	,tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9c_sopv_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_15] 

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9c_sopv_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_16]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9c_sopv_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_17]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9c_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM [TK_H9098_CSC].[dbo].[TK_2_9c_sopv_18]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9b_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM VipunenTK_SA.[dbo].[tktutk2017OKMEnnakko_AMK]

UNION ALL 

SELECT
	 tilv
	,aineisto
	,lahde
	,tunn
	,jarj
	,koulk
	,NULL AS opm95opa
	,kkun
	,sp
	,aikielir1x
	,syntv
	,tilvaskun
	,tilvaskunx
	,kansalr2
	,alvv
	,allk
	,suorv
	,suorlk
	,rahlahde
	,alvv_kksek
	,alvv_kksek_lasna
	,alvv_sek
	,alvv_sek_lasna
	,alvv_kk
	,alvv_kk_lasna
	,alvv_opa
	,alvv_opa_lasna
	,lkm
	,NULL AS tutkamk
	,NULL AS tunimamk
	,NULL AS koamk
	,NULL AS konimamk
	,NULL AS suun_v
	,NULL AS svnim
	,koultyp
	,kkieli
	,lasnalk
	,poissalk
	,oplaaj
	,kirtu1v
	,kirtu1k
	,opyhtamk
	,opylamamk
	,opmuuamk
	,opoamk
	,opmamk
	,opyliopamk
	,opulkomamk
	,NULL AS tilmaa
	,NULL AS tutkyo
	,NULL AS tunimyo
	,NULL AS koyo
	,NULL AS konimyo
	,NULL AS paine
	,NULL AS painenim
	,NULL AS tdk
	,om
	,opkelp
	,opyhtyo
	,opulkyo
	,opmuuyo
	,opoylio
	,opaylio
	,opmylio
	,opamkyo
	,ltop
	,[tietolahde]='2_9a_sopv_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
FROM VipunenTK_SA.[dbo].[tktutk2017OKMEnnakko_YO]

) as kaikkivuodet






GO

USE ANTERO