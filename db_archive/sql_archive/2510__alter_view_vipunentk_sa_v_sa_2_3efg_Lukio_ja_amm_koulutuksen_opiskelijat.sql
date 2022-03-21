USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 17.10.2019 13:20:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









ALTER VIEW [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat] AS


-- truncate table vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat




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
	,tilvasmaak = cast(coalesce(nullif(kaikkivuodet.tilvasmaak , ''), '-1') as nvarchar(2))
	,alvv = cast(kaikkivuodet.alvv as nvarchar(4))	
	,aiopis = cast(coalesce(nullif(kaikkivuodet.aiopis , ''), '-1') as nvarchar(2))
	,ika2 = cast(coalesce(nullif(kaikkivuodet.ika2, ''), '-1') as nvarchar(2))
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
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,tietolahde = cast(kaikkivuodet.tietolahde as nvarchar(250))
	,rivinumero = cast(kaikkivuodet.rivinumero as nvarchar(10))
FROM (
/* Ei oteta historiatietoja mukaan koska vuosilta 2011-2012 ei ole dataa
--Historia-aineisto
SELECT
	  [tilv]
      ,[lahde] = 
		case
			when lahde = '1' then '21'
			when lahde = '2' and oppis = '2' then '35'
			when lahde = '2' and oppis = '1' then '34'
			else '-1'
		end
      ,[jarj] = ot.koulutuksen_jarjestajakoodi
      ,[opjarj]
      ,[koulk]
      ,kkieli = case [kkielir1] when 'fs' then 'fi' else kkielir1 end
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = asmaak
      ,[alvv]
      ,[aiopis] = null
      ,ika2 = --ikä kirjoihintulovuonna
		case  
			when ltrim([ika])='.' or alvv='9999' then 'XX' 
			else 
				case 
					when cast(ltrim([ika]) as int)-(cast(tilv as int)-cast(alvv as int))>=60 then '60'
					else cast(cast(ltrim([ika]) as int)-(cast(tilv as int)-cast(alvv as int)) as varchar)
				end
		end
      ,[lkm]
      ,[aikoul]
      ,[tutalv]
      ,[tutklaja]
      ,[tunim] = null
      ,[sutunim] = null
      ,[rutunim] = null
      ,[koohj] = null
      ,[sukoohj] = null
      ,[rukoohj] = null
      ,[tutktav]
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='8_2_Historia_opiskelijat'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_8_2_sopv_16] tk
left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot ot on ot.oppilaitos_avain=tk.tunn
where lahde in (1,2) and tilv<2013

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_14]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_14]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_14]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_15]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_15]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_15]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_16]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_16]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_16]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_17]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_17]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_17]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_18]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_18]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_18]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[olosyys]
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3e_sopv_19]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[tutktav] = NULL
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3f_sopv_19]

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
      ,[tilvasmaak]
      ,[alvv]
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
      ,[tutktav] = NULL
      ,[rahoitus]
      ,[tavoite]
      ,[olosyys]
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3g_sopv_19]
) kaikkivuodet



GO


USE [ANTERO]