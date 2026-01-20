USE [VipunenTK_SA]
GO

/****** Object:  View [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat]    Script Date: 23.6.2025 12.19.03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO










ALTER VIEW [dbo].[v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat] AS

-- truncate table vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat
-- insert into vipunentk_dw..sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat select * from v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat

-- drop table vipunentk_dw.dbo.sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat
-- select * into vipunentk_dw.dbo.sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat from v_sa_2_3efg_Lukio_ja_amm_koulutuksen_opiskelijat

SELECT
	tilv = CAST(kaikkivuodet.tilv as nvarchar(4))
	,tilv_date = Cast(kaikkivuodet.tilv+'0101' as date)
	,lahde = cast(coalesce(nullif(kaikkivuodet.lahde , ''), '-1') as nvarchar(2))
	,jarj = cast(coalesce(nullif(kaikkivuodet.jarj, ''), '-1') as nvarchar(10))
	,opjarj = cast(coalesce(nullif(kaikkivuodet.opjarj, ''), '-1')  as nvarchar(10))
	,kkieli = cast(coalesce(nullif(kaikkivuodet.kkieli , ''), '-1') as nvarchar(2))
	,koulk = cast(coalesce(nullif(kaikkivuodet.koulk , ''), '-1') as nvarchar(6))
	,kkun = cast(coalesce(nullif(kaikkivuodet.kkun , ''), '-1') as nvarchar(3))
	--Huom. tilv21 alkaen aineiston (2, 3) <-> d_hallinnonala2 (3, 2):
	,ophal = cast(
		case 
			--lukio
			when lahde < 30 then 
				case 
					when coalesce(coalesce(d.koulutuksen_jarjestajan_korvaavakoodi,d.koulutuksen_jarjestajakoodi), '') = '0145076-7' --'Ålands Landskapsregering'
					then '3' --Muiden hallinnonalojen alainen koulutus
					else '1' --Opetushallinto, pl. työvoimakoulutus
				end
			--amm
			when ophal = '1' then '1'
			when ophal = '3' then '2' --Opetushallinto, työvoimakoulutus
			when ophal = '2' 
				and tilv < 2021
				and (
					rahoitus = '10'
					or (
						coalesce(tunn, '') not in ('90018', '30049') --'Pohjois-Kalotin koulutuskeskus
						and coalesce(coalesce(d.koulutuksen_jarjestajan_korvaavakoodi, d.koulutuksen_jarjestajakoodi), '') not in (
							'0145076-7', '2153105-4', '150622-3', '0909306-3' --'Ålands Landskapsregering','Poliisiammattikorkeakoulu','Rikosseuraamusalan Koulutuskeskus','Pelastusopisto'
						)
					)
				)
				then '2'
			when ophal = '2' then '3'
			else '-1'
		end 
		as nvarchar(2)
	)
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
	,rahoitus = cast(cast(coalesce(nullif(kaikkivuodet.rahoitus , ''), '-1') as int) as nvarchar(2))
	,tavoite =  cast(coalesce(nullif(kaikkivuodet.tavoite,''),'-1')  as nvarchar(2))   -- HUOM! tässä aineistossa tulkitaan tyhjät tutkinnon tavoitteet tarkoituksella arvoon "1 - koko tutkinnon suorittaminen" kuutiomääritelmän mukaan -- Lasse
	,olosyys = cast(kaikkivuodet.olosyys as nvarchar(1))
	,koso = cast(kaikkivuodet.koso as nvarchar(1))
	,opso = cast(kaikkivuodet.opso as nvarchar(1))
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
      ,[jarj], tunn = null = ot.koulutuksen_jarjestajakoodi
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
	  ,koso = null
	  ,opso = null
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
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_14'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_14]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_15'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_15]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_16'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_16]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_17'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_17]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3e_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3f_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_18'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_2_3g_sopv_18]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3e_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3e_sopv_19]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3f_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3f_sopv_19]

union all

SELECT
	   [tilv]
      ,[lahde]
      ,[jarj], tunn = null
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
	  ,koso = null
	  ,opso = null
	  ,[tietolahde]='2_3g_Lukio_ja_amm_koulutuksen_opiskelijat_19'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY tilv)
from [TK_H9098_CSC].[dbo].[TK_K2_3g_sopv_19]

union all

--tiedot aineistosta K2.4h tilastovuodesta 2019 alkaen
SELECT
	   f.[tilv]
      ,[lahde]
      ,[jarj], tunn
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = d.maakunta
      ,[alvv]
      ,[aiopis]
      ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
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
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2019_sopv_21] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_7_sopv_20 d on d.kunta = tilvaskun

UNION ALL

SELECT
	   f.[tilv]
      ,[lahde]
      ,[jarj], tunn
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = d.maakunta
      ,[alvv]
      ,[aiopis]
      ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
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
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_21'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_2020_sopv_21] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_7_sopv_21 d on d.kunta = tilvaskun

UNION ALL

SELECT
	   f.[tilv]
      ,[lahde]
      ,[jarj], tunn
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = d.maakunta
      ,[alvv]
      ,[aiopis]
      ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
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
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_22'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_22] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_7_sopv_22 d on d.kunta = tilvaskun --päivitä vuosi kaikkiin: tietolahde, f, d

UNION ALL

SELECT
	   f.[tilv]
      ,[lahde]
      ,[jarj], tunn
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = d.maakunta
      ,[alvv]
      ,[aiopis]
      ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
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
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_23'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_23] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_7_sopv_23 d on d.kunta = tilvaskun --päivitä vuosi kaikkiin: tietolahde, f, d

UNION ALL

SELECT
	   f.[tilv]
      ,[lahde]
      ,[jarj], tunn
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = d.maakunta
      ,[alvv]
      ,[aiopis]
      ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
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
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_24'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_24] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_7_sopv_24 d on d.kunta = tilvaskun --päivitä vuosi kaikkiin: tietolahde, f, d

UNION ALL

SELECT
	   f.[tilv]
      ,[lahde]
      ,[jarj], tunn
      ,[opjarj] = jarj
      ,[koulk]
      ,[kkieli]
      ,[kkun]
      ,[ophal]
      ,[sp]
      ,[aikielir1]
      ,[tilvasmaak] = d.maakunta
      ,[alvv]
      ,[aiopis]
      ,[ika2] = case 
					when cast(alvv as int) - cast(syntv as int) between 15 and 59 then cast(cast(alvv as int) - cast(syntv as int) as nvarchar(2))
					when cast(alvv as int) - cast(syntv as int) between 60 and 110 then '60'
				end 
      ,[lkm]
      ,[aikoul]
      ,[tutalv] = NULL
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
      ,[olosyys]
	  ,koso
	  ,opso
	  ,[tietolahde]='K2_4h_sopv_25'
      ,[rivinumero] = ROW_NUMBER() OVER(ORDER BY f.tilv)
FROM [TK_H9098_CSC].[dbo].[TK_K2_4h_sopv_25] f
LEFT JOIN TK_H9098_CSC.dbo.TK_6_7_sopv_25 d on d.kunta = tilvaskun --päivitä vuosi kaikkiin: tietolahde, f, d


) kaikkivuodet

left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d on d.oppilaitos_avain = coalesce(nullif(coalesce(nullif(jarj, ''), opjarj), ''), '-1')


GO


