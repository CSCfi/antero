USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 1.10.2019 23:00:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








ALTER VIEW [dbo].[v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat] AS


-- truncate table vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3h_Lukio_ja_amm_koulutuksen_opiskelijat


SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,tunn = cast(coalesce(nullif(kaikkivuodet.tunn , ''), '-1') as nvarchar(5))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,opmast = cast(coalesce(nullif(kaikkivuodet.opmast , ''), '-1') as nvarchar(6))
	,kaste_t2 = cast(coalesce(nullif(kaikkivuodet.kaste_t2 , ''), '-1') as nvarchar(6))
	,opmala = cast(coalesce(nullif(kaikkivuodet.opmala , ''), '-1') as nvarchar(6))
	,iscfibroad2013 = cast(coalesce(nullif(kaikkivuodet.iscfibroad2013 , ''), '-1') as nvarchar(6))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	,ophal = cast(coalesce(nullif(kaikkivuodet.ophal , ''), '-1') as nvarchar(2))
	,tilvaskun = cast(coalesce(nullif(kaikkivuodet.tilvaskun , ''), '-1') as nvarchar(3))
	,tilvaskunx = cast(coalesce(nullif(kaikkivuodet.tilvaskunx , ''), '-1') as nvarchar(3))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))	
	,kirikar1 = cast(coalesce(nullif(kaikkivuodet.kirikar1 , ''), '-1') as nvarchar(2))
	,lkm = cast(kaikkivuodet.lkm as int)
	,tutklajl = cast(coalesce(nullif(kaikkivuodet.tutklajl , ''), '-1') as nvarchar(2))
	,aikoul = cast(coalesce(nullif(kaikkivuodet.aikoul , ''), '-1') as nvarchar(2))
	,tutklaja = cast(coalesce(nullif(kaikkivuodet.tutklaja , ''), '-1') as nvarchar(2))
	,tutktav = cast(coalesce(nullif(kaikkivuodet.tutktav , ''), '-1') as nvarchar(2))
	,tyov = cast(coalesce(nullif(kaikkivuodet.tyov , ''), '-1') as nvarchar(2))
	,rahoitus = cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as nvarchar(2))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,yrit = cast(coalesce(nullif(kaikkivuodet.yrit , ''), '-1') as nvarchar(2))
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (
SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
	  ,[kaste_t2] 
      ,[opmala]
	  ,[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_13'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_2013_sopv_15_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
	  ,[kaste_t2] 
      ,[opmala]
	  ,[iscfibroad2013] 
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_2014_sopv_15_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
	  ,[kaste_t2]
      ,[opmala]
	  ,[iscfibroad2013] 
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_16_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast]
	  ,[kaste_t2] 
      ,[opmala]
	  ,[iscfibroad2013] 
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_17_H]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit]
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3h_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[tunn]
      ,[jarj]
      ,[opjarj]
      ,[opmast] = NULL
	  ,[kaste_t2]
      ,[opmala] = NULL
	  ,[iscfibroad2013]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[tilvaskun]
      ,[tilvaskunx]
      ,[alvv]
      ,[kirikar1]
      ,[lkm]
      ,[tutklajl]
      ,[aikoul]
      ,[tutklaja]
      ,[tutktav]
      ,[tyov]
      ,[rahoitus]
      ,[tavoite]
      ,[yrit] = NULL
      ,[olosyys]
	  ,[tietolahde]='2_3h_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3h_sopv_19]

) kaikkivuodet








GO


USE [ANTERO]